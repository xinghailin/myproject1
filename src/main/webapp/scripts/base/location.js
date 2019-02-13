
function cityQueryByParent(obj,cityObj,childObj){
	var parentId = $(obj).val();
	var globe_context_id = $('#globe_context_id').val() ;
	$.ajax({
		type : "GET",
		url : globe_context_id+"/cif/location/city/query.json",
		dataType : "json",
		data : {"parentId":parentId},
		async : false,
		success : function(response) {
			if (response.status) {
				var cityList = response.data ;
				$("#"+cityObj+" option").remove();
				$("#"+childObj+" option").remove();
				$("#"+cityObj).append("<option value=''>--请选中--</option>");
				$("#"+childObj).append("<option value=''>--请选中--</option>");
				var isSelected = "" ;
				for(var i=0;i<cityList.length;i++){
					if(cityList[i].name=='上海市')
						isSelected = "selected" ;
 					$("#"+cityObj).append("<option  "+isSelected+" value='"+cityList[i].id+"'>"+cityList[i].name+"</option>");
				}
			} else {
				alert(response.message);
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert('服务器出现异常!');
		}
	});
}


function districtQueryByParent(obj,childObj){
	var parentId = $(obj).val();
	var globe_context_id = $('#globe_context_id').val() ;
	$.ajax({
		type : "GET",
		url : globe_context_id+"/cif/location/district/query.json",
		dataType : "json",
		data : {"parentId":parentId},
		async : false,
		success : function(response) {
			if (response.status) {
				var childList = response.data ;
				$("#"+childObj+" option").remove();
				$("#"+childObj).append("<option value=''>--请选中--</option>");
				for(var i=0;i<childList.length;i++){
					$("#"+childObj).append("<option  value='"+childList[i].id+"'>"+childList[i].name+"</option>");
				}
			} else {
				alert(response.message);
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert('服务器出现异常!');
		}
	});
}