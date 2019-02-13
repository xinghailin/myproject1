/**
 *  添加产品通用js
 */
$(function(){
	loadProvinces();//加载覆盖区域下拉列表
	getStyles();   //加载产品风格
	loadProductTypes(); //加载产品类型
	
	$('#productFirstTypes').bind('change', queryProductChildTypes2);//查询二级菜单
	$("#overlayArea").bind("focus",overlayArea);
	
	
})

//加载省
    function loadProvinces(){
    	var provincesQueryUrl =$('#provincesQueryUrl').val();
    	$.ajax(provincesQueryUrl, {
			type : 'POST', 
			dataType : 'json'
		}).done(function(response) {
			if (response.status>0) {
			var  dataList = response.result;
			var  $provinces =$("#HBox");
				for (var i = 0; i < dataList.length; i++) {
					$provinces.append("<input type='checkbox' name='provin' style='width:40px' value='" + dataList[i].name+ "'>"+dataList[i].name +"<br/>" );
				}
				$provinces.append("<input type='submit' value='确认 'style='margin-left:55px;color:red' id='addProvince' />")
				
			}
			$("#addProvince").bind("click",addP); //覆盖区域 添加数据
		})
    }


//查询风格下拉框
function getStyles(){
	var getStylesUrl=$("#getStyles").val();
	$.ajax(getStylesUrl, {
		type : 'GET', 
		dataType : 'json',
		data:{}
	}).done(function(response) {
		if (response.status>0) {
		var  dataList = response.result;
		var  $style =$("#style");
			$style.find('option').remove();
			$style.append("<option value=''>--选择风格--</option>");
			for (var i = 0; i < dataList.length; i++) {
				$style.append("<option value='" + dataList[i].id+ "'>"+ dataList[i].value+ "</option>");
			}
		}
	})
}
	//产品类型
    function loadProductTypes(){
    	var productTypeUrl =$('#productTypeUrl').val()+"?lv=0";   //查询级别为0的 产品列表
    	$.ajax(productTypeUrl, {
			type : 'GET', 
			dataType : 'json'
		}).done(function(response) {
			if (response.status>0) {
			var  dataList = response.result;
			var  $provinces =$("#productTypes");
				 $provinces.find('option').remove();
				 $provinces.append("<option value=''>--产品分类--</option>");
				for (var i = 0; i < dataList.length; i++) {
					$provinces.append("<option value='" + dataList[i].id+ "'>"+ dataList[i].categoryName+ "</option>");
				}
				
				var type = $("#type").val();
				$provinces.find("option[value="+type+"]").attr("selected",true);    //默认家具选中
				//加载二级菜单
				queryProductChildTypes();
			}
		})
    }
    
    //根据产品类别查询二级菜单
    function queryProductChildTypes(){
    	var productChildTypeUrl=$("#productChildTypeUrl").val();
    	var  prentId=$('#productTypes').val();  //父Id
    	$.ajax(productChildTypeUrl, {
			type : 'GET', 
			dataType : 'json',
			data:{parentId:prentId}
		}).done(function(response) {
			if (response.status>0) {
			var  dataList = response.result;
			var  $cities =$("#productFirstTypes");
				 $cities.find('option').remove();
				 $cities.append("<option value=''>--1级分类--</option>");
				for (var i = 0; i < dataList.length; i++) {
					$cities.append("<option value='" + dataList[i].id+ "'>"+ dataList[i].categoryName+ "</option>");
				}
			}
		})
    }
    
  //根据产品类别查询三级级菜单
    function queryProductChildTypes2(){
    	var productChildTypeUrl=$("#productChildTypeUrl").val();
    	var  prentId=$('#productFirstTypes').val();  //父Id
    	$.ajax(productChildTypeUrl, {
			type : 'GET', 
			dataType : 'json',
			data:{parentId:prentId}
		}).done(function(response) {
			if (response.status>0) {
			var  dataList = response.result;
			var  $cities =$("#productSecondTypes");
				 $cities.find('option').remove();
				 $cities.append("<option value=''>--2级分类--</option>");
				for (var i = 0; i < dataList.length; i++) {
					$cities.append("<option value='" + dataList[i].id+ "'>"+ dataList[i].categoryName+ "</option>");
				}
			}
		})
    }
	
    // 将选中的值 放入的 覆盖区域输入框
    function addP(){
    	var result = addOverlayArea();
    	$("#overlayArea").val(result);
    	$el.hDialog('close',{box:'#HBox'})
    }

    //根据选中的复选框 添加到覆盖区域输入框
    function addOverlayArea(){
    	  var result = '';
    	    $("input[name='provin']:checked").each(function(){
    	    	result += this.value + ',';
    	    })	
    	    return result;
    }
    
    function overlayArea(){
    	var $el = $('.dialog');
    	$el.hDialog({title:'请选择覆盖城市',width:50,height:550});	
    }

    
    
    