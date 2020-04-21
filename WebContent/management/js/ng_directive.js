/*******************************
    structure directive
*******************************/
angular.module("managerApp").directive('mgrHeader', function(){
    return{
        templateUrl: "header.tpl.html"
    }
})
angular.module("managerApp").directive('mgrContents', function(){
    return{
        templateUrl: "content_nav.tpl.html"
    }
})

angular.module("managerApp").directive('mgrFooter', function(){
    return{
        templateUrl: "footer.tpl.html"
    }
})

/*******************************
    directive for form
*******************************/
angular.module("managerApp").directive('mgrLogin', function(){
    return{
        templateUrl: "form_login.tpl.html"
    }
})

angular.module("managerApp").directive('mgrJoin', function(){
    return{
        templateUrl: "form_join.tpl.html"
    }
})

angular.module("managerApp").directive('mgrNotice', function(){
    return{
        templateUrl: "form_notice.tpl.html"
    }
})

angular.module("managerApp").directive('mgrMenual', function(){
    return{
        templateUrl: "form_menual.tpl.html"
    }
})

angular.module("managerApp").directive('rangeSearch', function(){
    return{
        templateUrl: "form_range_search.tpl.html"
    }
})

angular.module("managerApp").directive('batchSearch', function(){
    return{
        templateUrl: "form_batch_search.tpl.html"
    }
})

angular.module("managerApp").directive('imageForm', function(){
    return{
        templateUrl: "form_image.tpl.html",
        
        link: function (scope, element, attributes) {
        	// 이미지를 선택하면 로드되는 기능 구현
        	var file = document.getElementById('selectedImageTag');
        	file.onchange = function(e) {
        		var img = document.getElementById("selectedImg");
        	    var fileReader = new FileReader();
        	    fileReader.readAsDataURL(e.target.files[0]);
        	    fileReader.onload = function(e) { 
        		    img.src = e.target.result;
        	    }
        	}
        }
    }
})

//제품을 추가
angular.module("managerApp").directive('addDiv', function(){
    return{
        templateUrl: "form_add_div.tpl.html"
    }
})

angular.module("managerApp").directive('addForm', function(){
    return{
        templateUrl: "form_add_product.tpl.html"
    }
})

angular.module("managerApp").directive('inputForm', function(){
    return{
        templateUrl: "form_input_product.tpl.html"
    }
})

angular.module("managerApp").directive('boardContent', function(){
    return{
        templateUrl: "form_board_content.tpl.html"
    }
})