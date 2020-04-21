/************************************
	service : 다양한 서비스를 제공(로그인, 회원가입)
**************************************/
angular.module("managerApp").service("mgService", ["$http", "$q", function($http, $q){
	this.login = function(uri, no, pwd){
		var deferred = $q.defer();
		$http({
			method: 'POST',
			url: uri,
			data: $.param({
				mgrNo: no,
				mgrPwd: pwd
			}),
			headers: {
				   'Content-Type': "application/x-www-form-urlencoded; charset=utf-8"
			}
		}).then(function successCallback(response) {
			// ajax 성공
			deferred.resolve(response.data);
		}, function errorCallback(response) {
			console.log("ajax login error")
		});
		return deferred.promise;
	}
	
	this.join = function(uri, no, pwd, rpwd, name, code){
		var deferred = $q.defer();
		$http({
			method: 'POST',
			url: uri,
			data: $.param({
				mgrNo: no,
				mgrPwd: pwd,
				mgrRPwd: rpwd,
				mgrName: name,
				mgrCode: code
			}),
			headers: {
				   'Content-Type': "application/x-www-form-urlencoded; charset=UTF-8"
			}
		}).then(function successCallback(response) {
			// ajax 성공
			deferred.resolve(response.data);
		}, function errorCallback(response) {
			console.log("ajax join error")
		});
		return deferred.promise;
	}
	
	this.change = function(uri, t, vs, k){
		var r = "";
		
		// 전달받은 vs 배열객체를 ';'로 구분한 스트링 객체로 변환하여 r에 저장
		for(v of vs){
			r += v +";"
		}
		var rk = "";
		
		// k값을 분석하여 숫자로 변환
		switch(k){
		case "nomal": rk=1; break;
		case "manager": rk=7; break;
		case "dormancy": rk=0; break;
		case "suspended": rk=9; break;
		}
		
		var deferred = $q.defer();
		$http({
			method: 'POST',
			url: uri,
			data: $.param({
				type: t,
				value: r,
				key: rk
			}),
			headers: {
				'Content-Type': "application/x-www-form-urlencoded; charset=utf-8"
			}
		}).then(function successCallback(response) {
			// ajax 성공
			deferred.resolve(response.data);
		}, function errorCallback(response) {
			console.log("error : change data");
		});
		
		return deferred.promise;
	}
	
	
	this.changeDiv = function(uri, t, func, d, f, s){
		var deferred = $q.defer();
		$http({
			method: 'POST',
			url: uri,
			data: $.param({
				type: t,
				func: func,
				div: d,
				feature: f,
				size: s
			}),
			headers: {
				'Content-Type': "application/x-www-form-urlencoded; charset=utf-8"
			}
		}).then(function successCallback(response) {
			// ajax 성공
			deferred.resolve(response.data);
		}, function errorCallback(response) {
			console.log("error : change div");
		});
		
		return deferred.promise;
	}
	
	this.inputProduct = function(uri, t, s, a){
		var deferred = $q.defer();
		$http({
			method: 'POST',
			url: uri,
			data: $.param({
				type: t,
				serial: s,
				amount: a
			}),
			headers: {
				'Content-Type': "application/x-www-form-urlencoded; charset=utf-8"
			}
		}).then(function successCallback(response) {
			// ajax 성공
			deferred.resolve(response.data);
		}, function errorCallback(response) {
			console.log("error : change div");
		});
		
		return deferred.promise;
	}
	
	this.changeProduct = function(uri, t, func, s, d, n, o, s, p){
		var deferred = $q.defer();
		var info = {};
		switch(func){
		case "add":
			info = {
				type: t,
				func: func,
				serial: s,
				div: d,
				name: n,
				origin: o,
				size: s,
				price: p
			}
			break;
		case "modify":
			info = {
				type: t,
				func: func,
				serial: s,
				name: n,
				origin: o,
				size: s,
				price: p
			}
			break;
		case "delete":
			info = {
				type: t,
				func: func,
				serial: s,
			}
			break;
		}
		$http({
			method: 'POST',
			url: uri,
			data: $.param(info),
			headers: {
				'Content-Type': "application/x-www-form-urlencoded; charset=utf-8"
			}
		}).then(function successCallback(response) {
			// ajax 성공
			deferred.resolve(response.data);
		}, function errorCallback(response) {
			console.log("error : change product");
		});
		
		return deferred.promise;
	}
	
	
	
	//**********************************************
	this.pageUpdate = function(){
		var r = "";
		
		var deferred = $q.defer();
		$http({
			method: 'POST',
			url: uri,
			data: $.param({
				type: t,
				value: r,
				key: rk
			}),
			headers: {
				'Content-Type': "application/x-www-form-urlencoded; charset=utf-8"
			}
		}).then(function successCallback(response) {
			// ajax 성공
			deferred.resolve(response.data);
		}, function errorCallback(response) {
			console.log("error : change data");
		});
		
		return deferred.promise;
	}
	
	
	this.batch = function(uri, t, on){
		var deferred = $q.defer();
		$http({
			method: 'POST',
			url: uri,
			data: $.param({
				type: t,
				orderNo: on,
			}),
			headers: {
				'Content-Type': "application/x-www-form-urlencoded; charset=utf-8"
			}
		}).then(function successCallback(response) {
			// ajax 성공
			deferred.resolve(response.data);
		}, function errorCallback(response) {
			console.log("error : change data");
		});
		
		return deferred.promise;
	}
	
}]);
/************************************
	notice service
**************************************/
angular.module("managerApp").factory("noticeDataFactory", ["$http", function($http){
		return[{
			e_no: "",
			comment: "",
			date: ""
		}]
}]);
/*********************************************************************************************************/
/************************************
	Data factory
**************************************/
angular.module("managerApp").factory("dataFactory", ["$http", "$q", "uriConfig", function($http, $q, uriConfig){
	return {
		get: function(t){
			var deferred = $q.defer();
			
			$http({
				method: 'POST',
				url: uriConfig.getData,
				data: $.param({
					type: t
				}),
				headers: {
					'Content-Type': "application/x-www-form-urlencoded; charset=utf-8"
				}
			}).then(function successCallback(response) {
				// ajax 성공
				deferred.resolve(response.data);
			}, function errorCallback(response) {
				console.log("error : get data user");
			});
			
			return deferred.promise;
		},
		getChart: function(t, v){
			var deferred = $q.defer();
			
			$http({
				method: 'POST',
				url: uriConfig.getData,
				data: $.param({
					type: t,
					value: v
				}),
				headers: {
					'Content-Type': "application/x-www-form-urlencoded; charset=utf-8"
				}
			}).then(function successCallback(response) {
				// ajax 성공
				deferred.resolve(response.data);
			}, function errorCallback(response) {
				console.log("error : get data");
			});
			
			return deferred.promise;
		},
		getOption: function(t, s, e, op){
			var deferred = $q.defer();
			
			$http({
				method: 'POST',
				url: uriConfig.getData,
				data: $.param({
					type: t,
					start: s,
					end: e,
					option: op
				}),
				headers: {
					'Content-Type': "application/x-www-form-urlencoded; charset=utf-8"
				}
			}).then(function successCallback(response) {
				// ajax 성공
				deferred.resolve(response.data);
			}, function errorCallback(response) {
				console.log("error : get data");
			});
			return deferred.promise;
		},getBatch: function(t, n){
			var deferred = $q.defer();
			
			$http({
				method: 'POST',
				url: uriConfig.getData,
				data: $.param({
					type: t,
					no: n
				}),
				headers: {
					'Content-Type': "application/x-www-form-urlencoded; charset=utf-8"
				}
			}).then(function successCallback(response) {
				// ajax 성공
				deferred.resolve(response.data);
			}, function errorCallback(response) {
				console.log("error : get data");
			});
			return deferred.promise;
		}
	}
}]);