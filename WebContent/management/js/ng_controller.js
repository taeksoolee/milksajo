/*******************************
    main ctrl
*******************************/
angular.module("managerApp").controller("MainCtrl", ["$scope", "$http", "$timeout", "uriConfig", "messageConfig", "viewControlConfig", "mgService", "dataFactory", "noticeDataFactory", function($scope, $http, $timeout, uriConfig, messageConfig, viewControlConfig, mgService, dataFactory, noticeDataFactory){
	//message를 관리하는 객체
	$scope.messages = messageConfig;
	
	// 모듈의 view를 컨트롤하는 객체
	$scope.viewControl = viewControlConfig;
	
	// notice 모달의 순번 & notice List
	$scope.notice_index = [1, 2, 3, 4, 5];
	$scope.notice = noticeDataFactory;
	$scope.selectNoticePage = 1;
		
	$scope.left = function(){
		if($scope.selectNoticePage != 1){
			$scope.selectNoticePage--;
		}
	}
	
// content-table의 갯수를 관리하는 태그
	$scope.tableUserLimit = 10;
	$scope.tableProductLimit = 10;
	$scope.tableBoardLimit = 10;
	$scope.tableOrderLimit = 10;
	$scope.tablePageLimit = 10;
	
	$scope.downList = function(t){
//		t += 10;
		switch (t) {
		case "user":
			$scope.tableUserLimit += 10;
			break;
		case "product":
			$scope.tableProductLimit += 10;
			break;
		case "board":
			$scope.tableBoardLimit += 10;
			break;
		case "order":
			$scope.tableOrderLimit += 10;
			break;
		case "page":
			$scope.tablePageLimit += 10;
			break;
		}
	}
	
// user : function for selecting search target
	$scope.userModelCount = 0;
	$scope.userModel = ["id", "name", "age", "birthday", "tel", "email", "joindate", "lastlogin", "status"];
	$scope.userSearch = {};
	$scope.selectUserModel = $scope.userModel[$scope.userModelCount];
	
	$scope.changeUserSearchModel = function(){
		if($scope.userModelCount == $scope.userModel.length-1){
			$scope.userModelCount = 0;
		}else{
			$scope.userModelCount++;
		}
		$scope.selectUserModel = $scope.userModel[$scope.userModelCount];
	}
	
// product : function for selecting search target
	$scope.productModelCount = 0;
	$scope.productModel = ["serial", "div", "name", "origin", "size", "price", "amount", "sales"];
	$scope.productSearch = {};
	$scope.selectProductModel = $scope.productModel[$scope.productModelCount];
	
	$scope.changeProductSearchModel = function(){
		if($scope.productModelCount == $scope.productModel.length-1){
			$scope.productModelCount = 0;
			console.log($scope.selectProductModel);
		}else{
			$scope.productModelCount++;
		}
		$scope.selectProductModel = $scope.productModel[$scope.productModelCount];
	}
	
// board : function for selecting search target
	$scope.boardModelCount = 0;
	$scope.boardModel = ["id", "regDate", "ip", "title", "state", "content"];
	$scope.boardSearch = {};
	$scope.selectBoardModel = $scope.boardModel[$scope.boardModelCount];
	$scope.changeBoardSearchModel = function(){
		if($scope.boardModelCount == $scope.boardModel.length-1){
			$scope.boardModelCount = 0;
			$scope.selectBoardModel = $scope.boardModel[$scope.boardModelCount];
		}else{
			$scope.boardModelCount++;
			$scope.selectBoardModel = $scope.boardModel[$scope.boardModelCount];
		}
	}
	
// order : function for selecting search target
	$scope.orderModelCount = 0;
	$scope.orderModel = ["no", "serial", "amount", "price", "deposit", "refund", "state", "user"];
	$scope.orderSearch = {};
	$scope.selectOrderModel = $scope.orderModel[$scope.orderModelCount];
	$scope.changeOrderSearchModel = function(){
		if($scope.orderModelCount == $scope.orderModel.length-1){
			$scope.orderModelCount = 0;
			$scope.selectOrderModel = $scope.orderModel[$scope.orderModelCount];
		}else{
			$scope.orderModelCount++;
			$scope.selectOrderModel = $scope.orderModel[$scope.orderModelCount];
		}
	}
//page : function for selecting search target
	$scope.pageModelCount = 0;
	$scope.pageModel = ["pageNo", "serial", "admin"];
	$scope.pageSearch = {};
	$scope.selectPageModel = $scope.pageModel[$scope.pageModelCount];
	$scope.changePageSearchModel = function(){
		if($scope.pageModelCount == $scope.pageModel.length-1){
			$scope.pageModelCount = 0;
			$scope.selectPageModel = $scope.pageModel[$scope.pageModelCount];
		}else{
			$scope.pageModelCount++;
			$scope.selectPageModel = $scope.pageModel[$scope.pageModelCount];
		}
	}
	
// function etc...
	//login
	$scope.login = function(){
		mgService.login(uriConfig.login, loginForm.mgrNo.value, loginForm.mgrPwd.value).then(function(data){
			if(data == "true"){ //success
				console.log("login sucess");
				location.href = "#/home";
				$scope.viewControl.darkSpace.value = false;
				$scope.viewControl.formLogin.value = false;
				$scope.mgrNo = "";
				$scope.mgrPwd = "";
			}else{
				console.log("login fail");
				loginForm.mgrPwd.value = "";
				$scope.loginForm.mgrPwd.$error = {required: true}
				$scope.showErrorBar("login error : check your information");
				loginForm.mgrPwd.focus();
			}
		})
	}
	// join funcion
	$scope.join = function(){
		mgService.join(uriConfig.join, joinForm.mgrNo.value, joinForm.mgrPwd.value, joinForm.mgrRPwd.value, joinForm.mgrName.value, joinForm.mgrCode.value).then(function(data){
			if(data == "true"){ //success
				console.log("join");
				$scope.showAlertBar("your sign in success. welcome");
				$scope.joinReset();
				$scope.viewControl.formJoin.value = false;
				$scope.viewControl.formJoin.value = false;
			}else{
				console.log("error")
				joinForm.mgrPwd.value = "";
				joinForm.mgrRPwd.value = "";
				$scope.joinForm.mgrPwd.$error = {required: true}
				$scope.joinForm.mgrRPwd.$error = {required: true}
				$scope.showErrorBar("code error");
				joinForm.mgrPwd.focus();
			}
		}).error(function() {
			console.log("error")
			joinForm.mgrPwd.value = "";
			joinForm.mgrRPwd.value = "";
			$scope.joinForm.mgrPwd.$error = {required: true}
			$scope.joinForm.mgrRPwd.$error = {required: true}
			$scope.showErrorBar("!!!!!!!ajax error!!!!!!!!");
		});
	}
	// 일치하는 아이디가 있는지 확인
	$scope.isExist = function(target){
		$http({
			method: 'POST',
			url: uriConfig.checkId,
			data: $.param({
				mgrNo: target
			}),
			headers: {
				   'Content-Type': "application/x-www-form-urlencoded; charset=utf-8"
			}
		}).then(function successCallback(response) {
			if(response.data == "true"){
				$scope.exist = true;
			}else{
				$scope.exist = false;
			}
		}, function errorCallback(response) {
			// called asynchronously if an error occurs
			// or server returns response with an error status.
			console.log("error")
		});
	}
	// join form에서 비밀번호를 확인하는 메소드
	$scope.compare = function (repassword) {
        $scope.isconfirm = $scope.mgrPwdJoin == repassword ? true : false;
    }
	
	$scope.joinReset = function(){
		joinForm.mgrNo.value = "";
		joinForm.mgrPwd.value = "";
		joinForm.mgrRPwd.value = "";
		joinForm.mgrName.value = "";
		joinForm.mgrCode.value = "";
		$scope.joinForm.mgrNo.$error = {required: true}
		$scope.joinForm.mgrPwd.$error = {required: true}
		$scope.joinForm.mgrRPwd.$error = {required: true}
		$scope.joinForm.mgrName.$error = {required: true}
		$scope.joinForm.mgrCode.$error = {required: true}
	}
	
	//orderBy sort setting
	$scope.reverseOrder = true;
	$scope.sortField = 'developer';
	$scope.sortBy = function(sortField) {
	  $scope.reverseOrder = ($scope.sortField === sortField) ? !$scope.reverseOrder : false;
	  $scope.sortField = sortField;
	};
	
	// focus to top
	$scope.toTop = function(){
		window.scrollTo(0, 0);
	}
	
	// focus to bottom
	$scope.toBottom = function(){
		console.log(pageXOffset);
		console.log(pageYOffset);
	}
	
	//function logout
	$scope.navReset = function(){
		//control nav
		var as = document.getElementsByTagName("a");
		for(var a of as){
			a.className = "nav-link";
		}
		document.getElementById("home-tab").classList.add("active");
		
		//show loginForm
		$scope.viewControl.darkSpace.value = true;
		$scope.viewControl.formLogin.value = true;
	}
	
	$scope.logout = function(){
		if(confirm("Do you want logout?")){
			$scope.navReset(); // test
			$http({
				method: 'POST',
				url: uriConfig.logout,
			}).then(function successCallback(response) {
				$scope.navReset();
				console.log("success logout");
			}, function errorCallback(response) {
				// called asynchronously if an error occurs
				// or server returns response with an error status.
				console.log("error")
			});
		}else{
			document.getElementById("logout").href = location.hash;
		}
	}
	
	//reset tableLimit
	$scope.resetTableLimit = function(){
		$scope.tableLimit = 10;
	}
	
	//error bar control
	$scope.showErrorBar = function(msg){
		$scope.messages.error = msg;
		$scope.viewControl.errorBar.value = true;
		$timeout(function(){
			console.log("error...");
			$scope.viewControl.errorBar.value = false;
		}, 3000);
	}
	
	//alert bar control
	$scope.showAlertBar = function(msg){
		$scope.messages.alert = msg;
		$scope.viewControl.alertBar.value = true;
		$timeout(function(){
			$scope.viewControl.alertBar.value = false;
		}, 3000);
	}
//functions for form
	//into join
	$scope.openJoinForm = function(){
		loginForm.mgrNo.value = "";
		loginForm.mgrPwd.value = "";
		$scope.loginForm.mgrNo.$error = {required: true}
		$scope.loginForm.mgrPwd.$error = {required: true}
		$scope.viewControl.formJoin.value = true;
		event.stopPropagation();
	}
	//exit join
	$scope.closeJoinForm = function(){
		$scope.joinReset();
		$scope.viewControl.formJoin.value = false;
	}
	
	//into notice
	$scope.openNoticeForm = function(){
		$scope.viewControl.darkSpace.value = true;
		$scope.viewControl.formNotice.value = true;
		event.stopPropagation();
		event.preventDefault();
		console.log("notice 업데이트");
	}
	//exit notice
	$scope.closeNoticeForm = function(){
		$scope.viewControl.darkSpace.value = false;
		$scope.viewControl.formNotice.value = false;
	}
	
	//into menual
	$scope.openMenualForm = function(){
		$scope.viewControl.darkSpace.value = true;
		$scope.viewControl.formMenual.value = true;
		console.log("open menual form");
		event.stopPropagation();
		event.preventDefault();
	}
	//exit menual
	$scope.closeMenualForm = function(){
		$scope.viewControl.darkSpace.value = false;
		$scope.viewControl.formMenual.value = false;
	}
// refresh function
	$scope.dataRefresh = function(t){		
			// 초기화하는 클래스 : 
			console.log(t + " refresh");
			switch (t) {
			case "user":
				dataFactory.get("user").then(function(data){
					$scope.users = data;
					console.log($scope.users);
				})
				
				$scope.userModelCount = 0;
				$scope.selectUserModel = $scope.userModel[0];
				$scope.tableUserLimit = 10;
				$scope.userSearch = {};
				
				break;
			case "product":
				dataFactory.get("product").then(function(data){
					$scope.products = data;
				})
				$scope.productModelCount = 0;
				$scope.selectProductModel = $scope.productModel[0];
				$scope.tableProductLimit = 10;
				$scope.productSearch = {};
				break;
			case "board":
				dataFactory.get("board").then(function(data){
					$scope.board = data;
				})
				$scope.boardModelCount = 0;
				$scope.selectBoardModel = $scope.boardModel[0];
				$scope.tableBoardLimit = 10;
				$scope.boardSearch = {};
				break;
			case "order":
				dataFactory.get("order").then(function(data){
					$scope.orders = data;
				})
				$scope.orderModelCount = 0;
				$scope.selectOrderModel = $scope.orderModel[0];
				$scope.tableOrderLimit = 10;
				$scope.orderSearch = {};
				break;
			case "page":
				dataFactory.get("page").then(function(data){
					$scope.pages = data;
				})
				$scope.pageModelCount = 0;
				$scope.selectPageModel = $scope.pageModel[0];
				$scope.tablePageLimit = 10;
				$scope.pageSearch = {};
				break;
			}
			// 내린것들 최소화
			$scope.tableLimit = 10;
			
			//검색기록 초기화
	}
}]);



/*********************************************************************************************************************************************************/
/*******************************
	home ctrl
*******************************/
angular.module("managerApp").controller("HomeCtrl", ["$scope", "$http", "uriConfig", "dataFactory", function($scope, $http, uriConfig, dataFactory){
	// 시작할때 input date를 현재날짜로 변경하는 메소드
	var year = new Date().getYear()+1900;
	var month = new Date().getMonth()+1;
	var day = new Date().getDate();
	var now = year+'-'+month+'-'+day;
	$scope.chartDate = new Date(now);
	$scope.chartData = [];
	
	// 현재 입력된 날짜를 yyyyMMdd 형식으로 바꾸어 반환하는 함수
	$scope.changeChartDate = function(){
		if($scope.chartDate == null) return '19990101';
    	var year = $scope.chartDate.getYear()+1900;
    	var month = $scope.chartDate.getMonth()+1;
    	if(month < 10){
    		month = '0' + month; 
    	}
    	var day = $scope.chartDate.getDate();
    	if(day < 10){
    		day = '0' + day;
    	}
    	
    	var now = ''+year+month+day;
    	return now;
    }
	
	// input date가 바뀌때마다 차트를 변경하는 함수(ajax)
	$scope.updateChart = function(){
		$scope.chartData = [];
		dataFactory.getChart("pieChart", $scope.changeChartDate()).then(function(data){
			$scope.chartData = data;
			
			google.charts.load('current', {'packages':['corechart']});
			
			google.charts.setOnLoadCallback(drawChart);
			
		    function drawChart() {
		      var pieChart = document.getElementById('piechart')
			  var chart = new google.visualization.PieChart(pieChart);
			  
			  
	    	  var options = {
			        //title: "BEST PRODUCT !",
			        titleTextStyle: {fontSize: 30},
			        width: pieChart.clientWidth*1.2,
			        chartArea: {top: 150}
			  };
		    	
		      if($scope.chartData.length != 0){
		    	  d = $scope.chartData;
		      }else{
		    	  d = [["none", 1]];
		      }
		      
		      d.unshift(["product","amount"]);
		      
		      // 데이터 삽입
		      var data = google.visualization.arrayToDataTable(d);
		      chart.draw(data, options);
		    }
		})
	}
	
	// 최초 업데이트 실행
	$scope.updateChart();
	
	
	window.addEventListener('resize', function(){
		$scope.updateChart();
	});
}]);

/*******************************
    user ctrl
*******************************/
angular.module("managerApp").controller("UserCtrl", ["$scope", "$http", "uriConfig", "dataFactory", "mgService", function($scope, $http, uriConfig, dataFactory, mgService){
	$scope.users = [];
	/*{
		id:"",
		name:"",
		age: "",
		tel: "",
		email: "",
		addr: "",
		status: "",
		joindate: "",
		lastlogin: "",
		birthday: ""
	}*/
	dataFactory.get("user").then(function(data){
		$scope.users = data;
		//console.log($scope.users);
	})
	
	//into range-search
	$scope.openRangeSearchForm = function(){
		$scope.viewControl.darkSpace.value = true;
		$scope.viewControl.rangeSearch.value = true;
		console.log("open range-search form");
	}
	//exit range-search
	$scope.closeRangeSearchForm = function(){
		$scope.viewControl.darkSpace.value = false;
		$scope.viewControl.rangeSearch.value = false;
	}	
	
	// 선택상자관련 이벤트를 저장
	// 체크박스가 선택된 id 정보를 담는 객체
	$scope.userChoiceId = [];
	
	// 한개의 선택상자가 클릭되었을때 처리하는 메소드
	$scope.choice = function(id, t){
		console.log(t.checked);
		if(t.checked == true){
			$scope.userChoiceId.push(id);
			console.log("saved "+$scope.userChoiceId);
		}else{
			for(let i = 0; i < $scope.userChoiceId.length; i++){
				if($scope.userChoiceId[i] == id){
					$scope.userChoiceId.splice(i, 1);
				}
			}
			console.log($scope.userChoiceId);
		}
	}
	
// 최상단 선택상자를 선택했을때 처리하는 메소드
	$scope.choiceAll = function(t){
		switch (t) {
		// user-table 전부 체크 처리
		case "user":
			var inputs = document.getElementById("user-table").querySelectorAll('input[type="checkbox"]');
			$scope.userChoiceId = [];
			// 초기화
			if(inputs[0].checked == true){
				for(let i = 1; i < inputs.length; i++){
					inputs[i].checked = false;
				}
				for(let i = 1; i < inputs.length; i++){
					inputs[i].click();
				}
			}else{
				for(let i = 1; i < inputs.length; i++){
					inputs[i].checked = true;
				}
				for(let i = 1; i < inputs.length; i++){
					inputs[i].click();
				}
			}
			console.log($scope.userChoiceId);
			break;
		}
	}
	
	// 상태를 변화하는 메소드
	$scope.changeStatus = function(){
		console.log($scope.userChoiceId);
		console.log($scope.selectedStatuse);
		// user status 상태를 변경
		
		mgService.change(uriConfig.changeData , "userStatusChange", $scope.userChoiceId, $scope.selectedStatuse).then(function(data){
			$scope.showAlertBar("modify row : "+data);
			$scope.users = [];
			// user를 업데이트
			dataFactory.get("user").then(function(data){
				$scope.users = data;
				//console.log($scope.users);
				$scope.closeRangeSearchForm();
			})
			$scope.userChoiceId = [];
			document.getElementById("user-table").querySelectorAll('input[type="checkbox"]')[0].checked = false;
		})
	}
//-------------------------------------------------------		
	$scope.startDate = new Date();
	$scope.endDate = new Date();

	// 범위검색을 실행하는 함수
	$scope.birthDaySearch = function(){
		var start = $scope.calcDate($scope.startDate);
		var end = $scope.calcDate($scope.endDate);
		
		dataFactory.getOption("userOption", start, end, "b").then(function(data){
			$scope.users = data;
			$scope.closeRangeSearchForm();
			console.log($scope.users);
		})
	}
	
	// 범위검색을 실행하는 함수
	$scope.joinDateSearch = function(){
		var start = $scope.calcDate($scope.startDate);
		var end = $scope.calcDate($scope.endDate);
		
		dataFactory.getOption("userOption", start, end, "j").then(function(data){
			$scope.users = data;
			$scope.closeRangeSearchForm();
		})
	}

	
	// 범위검색을 실행하는 함수
	$scope.lastLoginSearch = function(){
		var start = $scope.calcDate($scope.startDate);
		var end = $scope.calcDate($scope.endDate);
		
		dataFactory.getOption("userOption", start, end, "l").then(function(data){
			$scope.users = data;
			$scope.closeRangeSearchForm();
		})
	};
//-------------------------------------------------------
	
	
	// 날짜를 계산하는 함수
	$scope.calcDate = function(d){
		return d.getYear()+1900+"-"+(d.getMonth()+1)+"-"+d.getDate();
	};
	
	
}]);

/*******************************
    product ctrl
*******************************/
angular.module("managerApp").controller("ProductCtrl", ["$scope", "$http", "uriConfig", "dataFactory", "mgService", function($scope, $http, uriConfig, dataFactory, mgService){
	$scope.products = [];
	/*{
		serial:"",
		div:"",
		name: "",
		origin: "",
		size: "",
		price: "",
		amount: "",
		sales: ""
	}*/
	dataFactory.get("product").then(function(data){
		$scope.products = data;
		//console.log($scope.products);
	})
//input----------------------------------------------------------
	// 제품선택관렬 객체 생성
	$scope.selectedProduct = {};
	dataFactory.get("product").then(function(data){
		$scope.productOption = data;
	});
	
	$scope.changeData = function(){
		$scope.selected = JSON.parse($scope.selectedProduct);
	}
	
	$scope.inputProduct = function(){
		mgService.inputProduct(uriConfig.changeData, "inputProduct" , (JSON.parse($scope.selectedProduct)).serial , $scope.inputAmount).then(function(data){
			$scope.showAlertBar(data+"개 입력완료");
		})
		$scope.closeInputForm();
	}
	
	//into input-form
	$scope.openInputForm = function(){
		$scope.viewControl.darkSpace.value = true;
		$scope.viewControl.inputForm.value = true;
		console.log("open input form");
	}
	//exit input-form
	$scope.closeInputForm = function(){
		$scope.viewControl.darkSpace.value = false;
		$scope.viewControl.inputForm.value = false;
	}
	
//div에 관련된 처리-------------------------------------------------
	$scope.selectedDivision = 
	dataFactory.get("productDivision").then(function(data){
		// 데이터 저장
		$scope.productDivision = data;
		//console.log($scope.productDivision);
	})
	
	$scope.changeDiv = function(){
		$scope.selectedDiv = JSON.parse($scope.selectedDivision);
	}
	
	//into add-div-form
	$scope.openAddDivForm = function(){
		$scope.viewControl.darkSpace.value = true;
		$scope.viewControl.addDivForm.value = true;
		console.log("open input form");
	}
	
	//exit add-div-form
	$scope.closeAddDivForm = function(){
		$scope.viewControl.darkSpace.value = false;
		$scope.viewControl.addDivForm.value = false;
	}
	
	$scope.inputDiv = function(){
		// 추가 서비스제공 받음
		mgService.changeDiv(uriConfig.changeData, "div" , "add", $scope.division.div, $scope.division.feature, $scope.division.size).then(function(data){
			$scope.showAlertBar("구분 입력 완료");
		})
		$scope.closeAddDivForm();
	}
	
	$scope.modifyDiv = function(){
		// 수정 서비스제공 받음
		mgService.changeDiv(uriConfig.changeData, "div" , "modify", $scope.selectedDiv.div, $scope.selectedDiv.feature, $scope.selectedDiv.size).then(function(data){
			$scope.showAlertBar("구분 수정 완료");
		})
		$scope.closeAddDivForm();
	}
	
	$scope.deleteDiv = function(){
		// 삭제 서비스제공 받음
		mgService.changeDiv(uriConfig.changeData, "div" , "delte", $scope.selectedDiv.div, $scope.selectedDiv.feature, $scope.selectedDiv.size).then(function(data){
			$scope.showAlertBar("구분 삭제 완료");
		})
		$scope.closeAddDivForm();
	}
//------------------------------------------------------------
	//into add-form
	$scope.openAddForm = function(){
		$scope.viewControl.darkSpace.value = true;
		$scope.viewControl.addProductForm.value = true;
		console.log("open input form");
	}
	//exit add-form
	$scope.closeAddForm = function(){
		$scope.viewControl.darkSpace.value = false;
		$scope.viewControl.addProductForm.value = false;
	}
	
	$scope.addProduct = function(){
		mgService.changeProduct(uriConfig.changeData, "changeProduct", "add" , $scope.addProduct.serial, $scope.addProduct.div, $scope.addProduct.name, $scope.addProduct.origin, $scope.addProduct.size).then(function(data){
			$scope.showAlertBar(date + " 추가완료");
		})
		$scope.closeAddForm();
	}
	
	$scope.modifyProduct = function(){
		mgService.changeProduct(uriConfig.changeData, "changeProduct", "modify" , $scope.selected.serial, "", $scope.selected.name, $scope.selected.origin, $scope.selected.size).then(function(data){
			$scope.showAlertBar(date + " 수정완료");
		})
		$scope.closeAddForm();
	}
	
	
	
}]);

/*******************************
	board ctrl
*******************************/
angular.module("managerApp").controller("BoardCtrl", ["$scope", "$http", "dataFactory", "mgService", function($scope, $http, dataFactory, mgService){
	$scope.board = [];
	/*{
		id:"",
		title:"",
		regDate: "",
		readCount: "",
		content: "",
		ip: "",
		state: "",
	}*/
	
	dataFactory.get("board").then(function(data){
		$scope.board = data;
		//console.log($scope.board);
	})
	
	$scope.boardContents = "";
	
	//into board-content form
	$scope.openBoardContentForm = function(c){
		$scope.viewControl.darkSpace.value = true;
		$scope.viewControl.baordContent.value = true;
		$scope.boardContents = c;
		console.log("open input form");
	}
	
	//exit board-content form
	$scope.closeBoardContentForm = function(){
		$scope.viewControl.darkSpace.value = false;
		$scope.viewControl.baordContent.value = false;
	}
}]);

/*******************************
    order ctrl
*******************************/
angular.module("managerApp").controller("OrderCtrl", ["$scope", "$http", "uriConfig", "dataFactory", "mgService", function($scope, $http, uriConfig, dataFactory, mgService){
	$scope.orders = [];
	/*{
		no:"",
		serial:"",
		amount: "",
		price: "",
		deposit: "",
		refund: "",
		state: "",
		user: "",
	}*/
	dataFactory.get("order").then(function(data){
		$scope.orders = data;
		//console.log($scope.orders);
	})
	
	//into batch-search
	$scope.openBatchSearchForm = function(){
		$scope.viewControl.darkSpace.value = true;
		$scope.viewControl.batchSearch.value = true;
		console.log("open batch form");
	}
	
	//exit batch-search
	$scope.closeBatchSearchForm = function(){
		$scope.viewControl.darkSpace.value = false;
		$scope.viewControl.batchSearch.value = false;
	}
	
	// 일괄처리에 필요한 선택을 위한 변수 / serial, amount, price
	$scope.selectBatch = 1;
	$scope.selectOrder = [];
	$scope.showOrder = [];
	$scope.selectOrderTotalPrice = 0;
	$scope.start = 1;
	$scope.end = 5;
	
	// 검색기능
	$scope.changeBoardSearchModel = function(){
		dataFactory.getBatch("batchOrder", $scope.batchSearch).then(function(data){
			$scope.selectOrder = data;
			//console.log($scope.orders);
			$scope.showOrder = [];
			for(let i = $scope.start-1; i <= $scope.end-1; i++){
				if($scope.selectOrder[i] != undefined){
					$scope.showOrder.push($scope.selectOrder[i]);
				}
			}
			
			$scope.selectOrderTotalPrice = 0;
			for(order of $scope.showOrder){
				$scope.selectOrderTotalPrice += parseInt(order.price.substr(1).replace(",",""))
			}
			
			//totalBatch
			
			$scope.totalBatch = parseInt(data.length/5); 
		})
	}
	
	//start((x-1)*5)+1 //end (x*5) 
	
	// 이전 페이지
	$scope.prevBatch = 0;
	$scope.nextBatch = 2;
	$scope.batchPrevMove = function(){
		if($scope.prevBatch > 0){
			$scope.selectBatch--;
			$scope.start = (($scope.selectBatch-1)*5)+1; 
			$scope.end = (($scope.selectBatch-1)*5)+1; 
			
			changeBoardSearchModel();
		}else{
			$scope.showErrorBar("처음 페이지 입니다.")
		}
	}
	
	$scope.batchNextMove = function(){
		if($scope.nextBatch < $scope.totalBatch){
			$scope.selectBatch--;
			$scope.start = (($scope.selectBatch-1)*5)+1; 
			$scope.end = (($scope.selectBatch-1)*5)+1; 
			
			changeBoardSearchModel();
		}else{
			$scope.showErrorBar("마지막 페이지 입니다.")
		}
	}
	
	$scope.batchEvent = function(on){
		mgService.batch(uriConfig.changeData, "batch", on).then(function(data){
			$scope.showAlertBar(data+" 행 처리완료");
		})
		$scope.closeBatchSearchForm();
	}
	
}]);

/*******************************
	page ctrl
*******************************/
angular.module("managerApp").controller("PageCtrl", ["$scope", "$http", "dataFactory", function($scope, $http, dataFactory){
	$scope.pages = []
	/*{
		pageNo:"",
		serial:"",
		mainImage: "",
		admin: "",
	}*/
	
	dataFactory.get("page").then(function(data){
		$scope.pages = data;
		//console.log($scope.pages);
	})
	
	//---------------------------------------------------
	//
	$scope.selectedProduct = {};
	dataFactory.get("product").then(function(data){
		$scope.productOption = data;
	});
	
	//into image setting
	$scope.openImageForm = function(){
		$scope.viewControl.darkSpace.value = true;
		$scope.viewControl.image.value = true;
		console.log("open image form");
	}
	//exit image setting
	$scope.closeImageForm = function(){
		$scope.viewControl.darkSpace.value = false;
		$scope.viewControl.image.value = false;
	}
	
	$scope.changeData = function(){
		$scope.selected = JSON.parse($scope.selectedProduct);
	}
}]);

// 로그인 관련 기능 컨트롤러
angular.module("managerApp").controller("LoginCtrl", ["$scope", function($scope){
	// 같은 브라우저 창에서 로그인 세션으로 로그인 유지하는 기능
	$scope.viewControl.darkSpace.value = false;
	$scope.viewControl.formLogin.value = false;
}]);