define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
	alert(1)
	var brand = $("#").val();

	alert(1)
	console.log(brand)
	$("brand").change(function(){
		$.ajax({
	        type: "get",
	        contentType: "json",
	        url: "update/recommend/car/model",
	        data: {brand:brand},
	        success: function (date) {
	        	console.log(date);
	            var op = "";
	            for (var i = 0; i < result.car.length; i++) {
	                op += '<option value=' + result.car[i].provinceID + '>';
	                op += result.d[i].provincename;
	                op += '</option>';
	            }
	            $("#seprovince").append(op);
	        }
	    })

		});
    function saveFun(){
    	$form=$('#editForm');
    }
	$('#saveBtn').bind("click",saveFun);
	
});

