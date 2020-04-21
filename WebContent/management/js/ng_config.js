/***************************
    page status
 ***************************/
angular.module("managerApp").constant("pageStatus" ,{
    
});

/***************************
    uri 정보
 ***************************/
angular.module("managerApp").constant("uriConfig" ,{
	getData: "/milk/getdatamg",
	changeData: "/milk/changedatamg",
    login: "/milk/loginmg",
    logout: "/milk/logoutmg",
    join: "/milk/joinmg",
    checkId: "/milk/checkid"
});

/***************************
    메세지 정보
 ***************************/
angular.module("managerApp").constant("messageConfig" ,{
    error: "",
    alert: "",
});
/***************************
    view의 상태정보를 저장하는 서비스
 ***************************/
angular.module("managerApp").constant("viewControlConfig" ,{
    darkSpace: 		{ value: true }, // default : true
    formLogin: 		{ value: true }, // default : true
    formJoin: 		{ value: false },
    formNotice:		{ value: false },
    formMenual:		{ value: false },
    rangeSearch:	{ value: false }, // user : 범위 검색을 위한 모달 컨트롤러
    addProductForm:	{ value: false }, // product
    addDivForm:		{ value: false }, // product
    inputForm:		{ value: false }, // product
    baordContent:	{ value: false }, 
    batchSearch:	{ value: false }, // order : 범위 검색을 위한 모달 컨트롤러
    image:			{ value: false }, // page : 이미지를 저장을 위한 모달 컨트롤러
    addPage:		{ value: false }, // page : 페이지를 추가하는 모달 컨트롤러
    errorBar:  		{ value: false },
    alertBar:  		{ value: false }
});