const app = angular.module("shopping-cart-app", ["angularUtils.directives.dirPagination"]);

app.config([ '$httpProvider',   function($httpProvider) {
  $httpProvider.interceptors.push('ApiInterceptor');
} ]);

app.service('ApiInterceptor', [function() {
  var service = this;
  service.request = function(config) {
      config.headers['Content-Type']= 'application/json';
      config.headers['Token']= 'f805f85a-5739-11ed-9ad7-269dd9db11fd';
      return config;
  };
}]);

app.filter('between', function (){
	return function (input, min, max){
		let array =[];
		for (let i = 0; i < input.length; i++) {
			if(input[i].price >= min && input[i].price <= max){
				array.push(input[i])
			}
		}
		
		return array;
	}
	
})

app.controller("shopping-cart-ctrl", function($scope, $http) {
// alert("TT")
	$scope.cart = {
		items: [],

		add(id) {		 
			var item = this.items.find(item => item.id == id)
			if (item) {
				item.qty++;
				this.saveToLocalStorage();
			} else {
				$http.get(`/rest/products/${id}`).then(resp => {
					resp.data.qty = 1;
					this.items.push(resp.data);
					this.saveToLocalStorage();
				});
			}
		},
		
		addsale(id,percentage) {		 
			var item = this.items.find(item => item.id == id)
			var x = (100-percentage)/100
			if (item) {
				item.qty++;
				this.saveToLocalStorage();
			} else {
				$http.get(`/rest/products/${id}`).then(resp => {
					resp.data.qty = 1;
					resp.data.price = resp.data.price * x;
					this.items.push(resp.data);
					console.log(resp.data);
					this.saveToLocalStorage();
				});
			}
		},
		addtt(url) {		 
			alert(url)
		},
		
		message() {
			alert("Đơn hàng của bạn đã được xác nhận hiện không thể hủy đơn")
		},

		remove(id) {
			var index = this.items.findIndex(item => item.id = id);
			this.items.splice(index, 1);
			this.saveToLocalStorage();
		},

		clear() {
			this.items = [];
			this.saveToLocalStorage();
		},

		amt_of(item) { },

		get count() {
			return this.items.map(item => item.qty).reduce((total, qty) => total += qty, 0);
		},

		get amount() {
			return this.items.map(item => item.qty * item.price).reduce((total, qty) => total += qty, 0);
		},

		saveToLocalStorage() {
			var json = JSON.stringify(angular.copy(this.items));
			localStorage.setItem("cart", json);
		},

		loadFromLocalStorage() {
			var json = localStorage.getItem("cart");
			this.items = json ? JSON.parse(json) : [];
		}
	};

	$scope.cart.loadFromLocalStorage();

	
	
	// xoa don hang
	$scope.delete = function(id){
		$http.delete(`/rest/orders/${id}`).then(resp => {
			let i = $scope.cart.items.findIndex(o => o.id == id);
			$scope.cart.items.splice(i,1);
			location.href = "/order/list";
			alert("Hủy đơn thành công")
		}).catch(err => {
			alert("Lỗi")
			console.log(err);
		});
		 
	}
	
	// lấy thông tin user
	$scope.user = {};
	function load_user(){
		var username =  $("#username").text()
		console.log(username);
		$http.get(`/rest/account/${username}`).then(resp => {
			$scope.user = resp.data;
			//console.log(resp.data);
//			$scope.order.phoneNumber = resp.data.phoneNumber;
//			$scope.order.fullname = resp.data.fullname;
			$scope.order.address = resp.data.address;
			
			$scope.account.phoneNumber = resp.data.phoneNumber;
			$scope.account.fullname = resp.data.fullname;
			$scope.account.address = resp.data.address;
		}).catch(error => {
			console.log(error);
		});
	}
	load_user();
	
	// dang ky
	$scope.account = {
			username:"",
			password:"",
			fullname:"",
			phoneNumber:"",
			email:"",
			photo:"",
			address:"",
			isDeleted:true,
		create(){
				var confirmpassword = $("#confirm-password").val()
				//console.log(confirmpassword + " " + $scope.account.password)
				
				if($scope.account.password == confirmpassword){
					// alert("thang dep zai")
					var account = angular.copy(this);
					$http.post("/rest/account", account).then(resp => {
						alert("Đăng ký thành công!");
						location.href = "/security/login/form";
					}).catch(error => {
						alert("Đăng ký lỗi!");
						console.log(error);
					});
				}else{
					alert("Mật khẩu không khớp")
				}
		},
	
		// doimk
		changepass(){
			var passhientai = $("#passhientai").val()
			var passnew = $("#passnew").val()
			var confirm = $("#confirm").val()			
			var password = $("#password").text()
		// console.log(confirm + " " + password + " " + passhientai + " "
		// +passnew)
		if(password == passhientai){
			if(passnew == confirm){
				// alert("thang dep zai")
				var account = angular.copy($scope.user);
				account.password = passnew;
				$http.put("/rest/account", account).then(resp => {
					alert("Đổi mật khẩu thành công!");
					 location.href = "/security/account_detail";
				}).catch(error => {
					alert("Lỗi!");
					console.log(error);
				});
			}else{
				alert("Mật khẩu không khớp")
			}
		}else{
			alert("Sai mật khẩu")
		}
	  },
	  
	  
	  updateAccount(){
		  var account = angular.copy($scope.user);
		  
		  var phone = $("#phoneNumber ").val();
		  var fullname = $("#fullname").val();
		  
		  account.phoneNumber = phone,
		  account.fullname = fullname,
		  account.address= 
				$scope.client.to_address +". "
				+ $scope.itemWard.w.WardName + ", "
				+ $scope.itemDistrict.d.DistrictName + ", "
				+  $scope.itemProvince.p.ProvinceName ;
		  
		  $http.put("/rest/account", account).then(resp => {
				alert("Cập nhật thành công!");
				//console.log(account);
				location.href = "/security/account_detail";
			}).catch(error => {
				alert("Lỗi!");
				console.log(error);
			});
	  }
	  
	}
	
	$scope.client = {
			
	}
	
	$scope.check = function(){
		$scope.client.to_province_name = $scope.itemProvince.p.ProvinceName,	
		$scope.client.to_district_name = $scope.itemDistrict.d.DistrictName,
		$scope.client.to_ward_name = $scope.itemWard.w.WardName,
		
		console.log($scope.client)
	}
	
    
	let urlProvince = "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province";
	  $scope.itemProvince = {}
	  $http.get(urlProvince).then(resp => {
	    $scope.province = resp.data;

	  }).catch(error => {
	    console.log(error);
	  });

	let urlDistrict = "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district";
	  $scope.district = [];
	  $scope.itemDistrict = {}
	  $scope.changeDistrict = function () {
	    $scope.district = [];

	    $http.post(urlDistrict, { "province_id": $scope.itemProvince.p.ProvinceID }).then(resp => {
	      $scope.district = resp.data;

	    }).catch(error => {
	      console.log(error);
	    });
	  }

	  $scope.ward = [];
	  $scope.itemWard = {};
	  let urlWard = "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id"
	  $scope.changeWard = function () {
	    $scope.ward = [];

	    $http.post(urlWard, { "district_id": $scope.itemDistrict.d.DistrictID }).then(resp => {
	      $scope.ward = resp.data;

	    }).catch(error => {
	      console.log(error);
	    });
	  }
	
 // dat hang
	$scope.order = {
		account: { username: $("#username").text()},
		createDate: new Date(),
		address:"",
		orderStatus:"Chưa xác nhận",
		//fullname:"",
		note:"",
		//phoneNumber:"",
		get orderDetails() {
			return $scope.cart.items.map(item => {
				return {
					product: { id: item.id },
					price: item.price,
					quantity: item.qty
				}
			});
		},
		purchase() {
			var order = angular.copy(this);
			order.address= 
						$scope.client.to_address +". "
						+ $scope.itemWard.w.WardName + ", "
						+ $scope.itemDistrict.d.DistrictName + ", "
						+ $scope.itemProvince.p.ProvinceName + ", ";
						
				// order.phoneNumber = $scope.client.to_phone;
				// order.fullname = $scope.client.to_name;
			console.log(order);
			// thực hiện đặt hàng
			$http.post("/rest/orders", order).then(resp => {
				alert("Đặt hàng thành công!");
				// $scope.cart.clear();
				location.href = "/order/detail/" + resp.data.id;
			}).catch(error => {
				alert("Đặt hàng lỗi!");
				console.log(error);
			});

		}
		
		
	}
	
	
	
	// Danh gia san pham
	$scope.rating = {	
		account: "",
		evalution:"",
		comment:"",
		product:"",
		status: false,
		createDate: new Date(),
		
		numberstart(numberstart) {
			$scope.numberstart = numberstart;
		},
	
		addstart() {
			let Url = window.location.pathname.split("/");
			let pid = Url[Url.length-1];
			var cmt = $("#comment").val();
			
			var rating = angular.copy(this);
			rating.account = { username: $("#username").text()};
			rating.evalution = $scope.numberstart;
			rating.product = {id:pid*1};
			rating.comment = cmt;
			
			//console.log(rating);

			$http.get(`/rest/rating/${rating.account.username}/${rating.product.id}`).then(resp =>{
				console.log(resp.data)
				if(resp.data == true){
					$http.post("/rest/rating",rating).then(resp => {
						alert("Đánh giá đã được gửi! Chờ quản trị viên xét duyệt");
						console.log(rating);
						// $scope.cart.clear();
						location.href = "/product/detail/" + rating.product.id;
					}).catch(error => {
						alert("Lỗi!");
						console.log(error);
					});
				}else{
					alert("Bạn không thể đánh giá vì chưa mua sản phẩm n");
				}
			}).catch(error => {
				alert("Lỗi!");
				console.log(error);
			});
		}
	}
	
	//carousel nhieu anh
	$scope.selectImage = function(url){
		document.getElementById("changeImage").src="/assets/images/"+url;
	}
 
	// sms quen pass
	//$scope.code_phone = 0;
	$scope.sms = function(){
		var sdt = $("#sdt").val();
		var code = Math.floor(Math.random() * 10000);
		sessionStorage.setItem("key_codephone", code);
		$scope.code_phone = code
		alert("vao");
		$http.get(`/rest/account/sdt/${sdt}`).then(resp =>{	
			//console.log(resp.data.phoneNumber);
			$scope.phone = resp.data.phoneNumber;
			if($scope.phone != undefined){
				let newphone = "+84" + $scope.phone.substring(1);
				alert(code);
				sessionStorage.setItem("key_sdt", $scope.phone);
				$http.post(`/sms`,{to:newphone,message:code}).then(resp =>{	
					alert(code);
					location.href = "/phone/form";
				}).catch(error => {
					console.log(error);
				});
			}else{
				alert("Số điện thoại không tồn tại");
			}
		}).catch(error => {
			console.log(error);
		});
	}
	
	$scope.checkcode = function() {
		let code_sdt = $("#code_sdt").val();
		let key_codephone = sessionStorage.getItem("key_codephone");
		
		//alert(key_codephone + "-" + code_sdt );
		if(key_codephone == code_sdt){
			alert("Thành công");
			location.href = "/matkhaumoi/form";
		}else{
			alert("Mã code không đúng");
		}
	}
	
	$scope.forgotpass = function() {
		let sdt = sessionStorage.getItem("key_sdt")
		$http.get(`/rest/account/sdt/${sdt}`).then(resp =>{	
			$scope.ac = resp.data
			//console.log($scope.ac);
		}).catch(error => {
			console.log(error);
		});
		var passnew = $("#passnew").val()
		var confirm = $("#confirm").val()			

		if(passnew == confirm){
			// alert("thang dep zai")
			var account = angular.copy($scope.ac);
			account.password = passnew;
			$http.put("/rest/account", account).then(resp => {
				alert("Đổi mật khẩu thành công!");
				location.href = "/security/login/form";
			}).catch(error => {
				alert("Lỗi!");
				console.log(error);
			});
		}else{
			alert("Mật khẩu không khớp")
		}
  }
	
	
	// list_product 
	$scope.products = [];
	$scope.brands = [];
	
	$scope.loadProduct = function(id){
		localStorage.setItem('idCate', id);
		$http.get(`/rest/productsByCateId/${id}`).then(resp => {
			$scope.products = resp.data;
			console.log($scope.products);
		}).catch(error => {
			console.log(error);
		});
		
		$http.get(`/rest/brandName/${id}`).then(resp => {
			$scope.brands = resp.data;
			
		}).catch(error => {
			console.log(error);
		});
		
		
	}
	$scope.getPrice = function (){
		let price = document.getElementById("price").innerHTML;
		let splitStr = price.split("-")
		let min = splitStr[0].trim().substring(0, splitStr[0].length - 3);
		let max = splitStr[1].trim().substring(0, splitStr[1].length - 3);
		

		$scope.min = min
		$scope.max = max
		
		console.log($scope.min + " " + $scope.max);
	}
	$scope.min = 0
	$scope.max = 100000000
	
	let id_cate = localStorage.getItem('idCate');
	$scope.loadProduct(id_cate);
	
	
	$scope.choseBrand = function(id){
		$scope.idC = id;
	}
	
	$scope.pri ="";
	$scope.sxTdenC = function(){
		$scope.pri = "'price'"
			console.log($scope.pri);
	}
	
	console.log($scope.pri);
	
	$scope.sxCdenT = function(){
		$scope.pri = "-'price'"
		console.log($scope.pri);
	}
	
	
});

