app.config(['$httpProvider', function($httpProvider) {
	$httpProvider.interceptors.push('ApiInterceptor');
}]);

app.service('ApiInterceptor', [function() {
	var service = this;
	service.request = function(config) {
		//config.headers['Content-Type'] = 'application/json';
		//config.headers['Token'] = 'f805f85a-5739-11ed-9ad7-269dd9db11fd';
		return config;
	};
}]);

app.controller("order-ctrl", function($scope, $http) {
	$scope.listOrder = [];
	$scope.order = {};

	function load() {

		$http.get("/rest/order").then(resp => {
			//resp.data.orderStatus = "Đã xác nhận"
			$scope.listOrder = resp.data;
		})
	}

	load();

	$scope.linkDetail = function(id) {
		window.location = `#!detail/${id}`
	}

	////////////////////////////////////
	function loadAddressFrom (){
		let addressFrom = localStorage.getItem("address");
		let arrAddressFrom = addressFrom.split(",");
		let provinceItemId = arrAddressFrom[2].split(":")[1];
		let districtItemId = arrAddressFrom[1].split(":")[1]
		let wardItemId = arrAddressFrom[0].split(":")[1]
		let addressItem =  arrAddressFrom[3]
		
		let addressFromItem = {
			province: provinceItemId,
			district: districtItemId,
			ward: wardItemId,
			address: addressItem
		}
		return addressFromItem;
	}
	
	 function loadAddressTo (address){
		let arrAddressTo = address.split(".");
		let arrAddressTo1 = arrAddressTo[1].split(",");
		let addressItem = arrAddressTo[0];
		
		let addressToItem = {
			province: arrAddressTo1[2],
			district: arrAddressTo1[1],
			ward: arrAddressTo1[0],
			address: addressItem
		}
		
		return addressToItem;
	}
	
	function Detail (name, idPrduct, quantity, price, cateName){
		this.name = name;
		this.code = `${idPrduct}`;
		this.quantity = quantity;
		this.price = price;
		this.length = 12;
		this.width = 12;
		this.height = 12;
		this.category = cateName
		
	}
	
	function itemDetail(id){
		const arrDetail = [];
		$http.get(`/rest/getOrderDetail/${id}`).then(resp => {
		 	resp.data.forEach((item) => {
  				let detail = new Detail(item.product.name, item.product.id, 
  								item.quantity, item.price, {level3: item.product.category.name});
  				arrDetail.push(detail);
			});
			
		});
		return arrDetail;
	}
	
	$scope.xacNhan = function(order) {
		let addressFrom = loadAddressFrom();
		
		$scope.order = angular.copy(order);
		$scope.order.orderStatus = "Đã giao";

		let addressTo = loadAddressTo(order.address);
		let arrDetail = itemDetail(order.id)
		//console.log(arrDetail)
		dataOrder(order, addressFrom, addressTo, arrDetail);
		
		$scope.createHD ();
		$http.put("/rest/orderUpdate", $scope.order).then(resp => {
			let i = $scope.listOrder.findIndex(o => o.id = order.id);
			$scope.listOrder[i].orderStatus = "Đã giao";
			alert("Đã cập nhật")
		});
		
	}

	function dataOrder(order, addressFrom, addressTo, arrDetail) {
		$scope.GHN = {
			"payment_type_id": 2,
			"note": order.note,// order.note
			"from_name": "Tin", // account.fullname
			"from_phone": "0909999999", // account.phoneNumber
			"from_address": addressFrom.address,
			"from_ward_name": addressFrom.ward,
			"from_district_name": addressFrom.district,
			"from_province_name": addressFrom.province,
			"required_note": "CHOXEMHANGKHONGTHU",
			"return_name": "Tin",
			"return_phone": "0909999999",
			"return_address": addressFrom.address,
			"return_ward_name": addressFrom.ward,
			"return_district_name": addressFrom.district,
			"return_province_name": addressFrom.province,
			"client_order_code": "",
			"to_name": order.account.fullname, // order.account 
			"to_phone": order.account.phoneNumber,
			"to_address": addressTo.address,
			"to_ward_name": addressTo.ward,
			"to_district_name": addressTo.district,
			"to_province_name": addressTo.province,
			"cod_amount": 10000000,
			"content": "Theo New York Times",
			"weight": 30000,
			"length": 150,
			"width": 150,
			"height": 150,
			"pick_station_id": null,
			"deliver_station_id": null,
			"insurance_value": 5000000,
			"service_id": 0,
			"service_type_id": 2,
			"coupon": null,
			"pick_shift": null,
			"pickup_time": null,
			"items": arrDetail
		}
	}

	$scope.createHD = function() {
		let urlProvince = "https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/create";
		$scope.itemProvince = {}
		console.log($scope.GHN)
		$http.post(urlProvince, $scope.GHN, {

		headers: { 'Content-Type': 'application/json' },
		headers: { 'Token': 'f805f85a-5739-11ed-9ad7-269dd9db11fd' }
	}).then(resp => {
			console.log(resp.data)
			alert("ok")
		}).catch(error => {
			console.log(error);
		});
		
	}



})
