app.controller("account-ctrl", function ($scope, $http) {
	$scope.accounts = [];
	$scope.form = {
		photo: 'no_img.png',
		isDeleted: false
	};
	
	$scope.load = function(){
		$http.get("/ad/rest/account").then(resp => {
			$scope.accounts = resp.data;	
		})
	}
	
	$scope.load();
	
	$scope.save = function(valid){
		if(valid){
			let item = angular.copy($scope.form);
			$http.post("/ad/rest/account", item).then(resp => {
				$scope.accounts.push(resp.data);
				alert("Thêm mới tài khoản thành công!");
				$scope.clear();
			}).catch(err => {
				alert("Lỗi thêm mới tài khoản!");
				console.log(err);
			});
		}else alert("Hãy điền đủ thông tin!");
	}
	
	$scope.update = function(){
		let item = angular.copy($scope.form);
		$http.put("/ad/rest/account", item).then(resp => {
			let i = $scope.accounts.findIndex(a => a.username == item.username);
			$scope.accounts[i] = item;
			alert("Cập nhật tài khoản thành công!");
		}).catch(err => {
			alert("Lỗi cập nhật tài khoản!");
			console.log(err);
		});
		
	}
	
	$scope.changeIsDel = function (a) {
		let item = angular.copy(a);
		if(item.isDeleted){
			item.isDeleted = false;
		}else {
			item.isDeleted = true;
		}
		
		$http.put("/ad/rest/account", item).then(resp => {
			let i = $scope.accounts.findIndex(a => a.username == item.username);
			$scope.accounts[i] = item;
			alert("Cập nhật tài khoản thành công!");
		}).catch(err => {
			alert("Lỗi cập nhật tài khoản!");
			console.log(err);
		});
	}
	
	$scope.edit = function (a){
		$('#username').attr('readonly', true);
		$scope.form = angular.copy(a);
	}
	
	
	$scope.clear = function () {
		$scope.form = {
			photo: 'no_img.png',
			isDeleted: false
		};
		
		$('#username').attr('readonly', false);
	}
	
	$scope.changeImage = function (files){
		//console.log(files)
		var data = new FormData();
		data.append("file", files[0]);
        $http.post("/rest/upload/ImageA", data, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        }).then(resp => {
			$scope.form.photo = resp.data.name;
			console.log($scope.form.photo);
        }).catch(error => {
            alert("Lỗi upload hình ảnh");
            console.log("Error ", error);
        });
        
	}
})