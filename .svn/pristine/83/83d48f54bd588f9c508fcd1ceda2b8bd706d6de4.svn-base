define(function(require, exports, module) {
	require('../base/validation-proxy');
	require('art-dialog')($);require('jquery-css');
	var pagination = require('../base/pagination');
//	var pagination_products = require('../base/MyPagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var productssubmitButton=$("#productsSearchBtn");
	var _id="";
	var form = $('#searchForm');
	var productsSearchForm =$('#productsSearchForm')
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var productsList =$('#J_DataList_Products');
	var productsNoDataMsg=$('#J_NoDataMsg_Products');
//	var sArr=[];
	var searchCondition = null ;
	var productsSearchCondition = null
	var mainPage=$('#queryDiv');
	var subPage=$('#productsDiv');
	var curpage;
//	var deleteUrl=$('#delSupplierUrl').val();
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('addButton', _addButton);
	handlebars.registerHelper('formatJnd', formatJnd);
//	handlebars.registerHelper('formatYp', _formatYp);
//	handlebars.registerHelper('editButton', _editButton);

	$(function() {
//		pushAll();
		load(1,PAGE_SIZE);//加载数据列表
		loadProvinces();//加载省下拉列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
		$('#provinces').bind('change', queryCitiesByProvinceId);//根据省ID查询下面的市区
		$('#Editprovinces').bind('change', queryCitiesByProvinceId1);//根据省ID查询下面的市区
		$("#btnAddShop").bind("click",showAddForm);
		$("#saveBtn1").bind("click",saveShop);
		$("#cancelBtn1").bind("click",backQueryPage);
	});
//	function pushAll(){
//		var styleLst=$('#styleList');
//		var slo=styleLst.find('option');
//		var ss=slo.size();
//		for(var i=0;i<ss;i++){
//			if(slo[i].value){sArr.push(slo[i]);}
//		}
//	}
	//表单搜索
	function dataSearch(dataObj){
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + ".json?start="+curPageNo+"&pageSize="+pageSize; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			if (response.result.length>0) {
				var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
				dataList.html(template(response)).css('height', 'auto');
				pagination.init({
					'pageSize' : PAGE_SIZE,
					'totalCount' : response.total,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
				//绑定列表按钮事件处理函数
				$("a[name='viewBtn']").on("click", viewCars);
				$("a[name='editBtn']").on("click", editShop);
				$("a[name='delBtn']").on("click", delShop);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	function viewCars(){
		location.href=$('#viewUrl').val()+'?storeId='+$(this).attr('id');
	}
	
	function delShop(){
		var $this=$(this);
		$.dialog('确定删除？', function(){
		$.ajax($('#deleteUrl').val()+"?theId="+$this.attr('id'), {
			type : 'GET', 
			dataType : 'json'
		}).done(function(response) {
			if (response.status) {
				$.dialog('删除成功！', function(){
					load(1,PAGE_SIZE);
				});
			}else{
				$.dialog(response.message, function(){});
			} 
		})});
	}
	
    function loadProvinces(){
    	var provincesQueryUrl =$('#provincesQueryUrl').val();
    	$.ajax(provincesQueryUrl, {
			type : 'POST', 
			dataType : 'json'
		}).done(function(response) {
			if (response.status>0) {
			var  dataList = response.result;
			var  $provinces =$("#provinces");
				 $provinces.find('option').remove();
				 $provinces.append("<option value=''>--请选择省--</option>");
				for (var i = 0; i < dataList.length; i++) {
					$provinces.append("<option value='" + dataList[i].id+ "'>"+ dataList[i].name+ "</option>");
				}
				$("#Editprovinces").html($provinces.html());
			} 
		})
    }
    
    function queryCitiesByProvinceId(){
    	var queryCitiesByProvinceIdUrl=$("#citiesQueryUrl").val();
    	var  proviceId=$('#provinces').val();
    	$.ajax(queryCitiesByProvinceIdUrl, {
			type : 'POST', 
			dataType : 'json',
			data:{provinceId:proviceId}
		}).done(function(response) {
			if (response.status>0) {
			var  dataList = response.result;
			var  $cities =$("#cities");
				 $cities.find('option').remove();
				 $cities.append("<option value=''>--请选择市--</option>");
				for (var i = 0; i < dataList.length; i++) {
					$cities.append("<option value='" + dataList[i].areaId+ "'>"+ dataList[i].areaName+ "</option>");
				}
			} 
		})
    }
    
    function queryCitiesByProvinceId1(){
    	var queryCitiesByProvinceIdUrl=$("#citiesQueryUrl").val();
    	var  proviceId=$('#Editprovinces').val();
//    	$.ajax(queryCitiesByProvinceIdUrl, {
//			type : 'POST', 
//			dataType : 'json',
//			data:{provinceId:proviceId}
//		}).done(function(response) {
//			if (response.status>0) {
//			var  dataList = response.result;
//			var  $cities =$("#Editcities");
//				 $cities.find('option').remove();
//				 $cities.append("<option value=''>--请选择市--</option>");
//				for (var i = 0; i < dataList.length; i++) {
//					$cities.append("<option value='" + dataList[i].areaId+ "'>"+ dataList[i].areaName+ "</option>");
//				}
//			} 
//		})
		
		$.ajax({
			type : 'POST',
			url : queryCitiesByProvinceIdUrl,
			dataType : 'json',
			data : {provinceId:proviceId} ,
			async : false,
			success : function(response) {
				if (response.status>0) {
					var  dataList = response.result;
					var  $cities =$("#Editcities");
						 $cities.find('option').remove();
						 $cities.append("<option value=''>--请选择市--</option>");
						for (var i = 0; i < dataList.length; i++) {
							$cities.append("<option value='" + dataList[i].areaId+ "'>"+ dataList[i].areaName+ "</option>");
						}
					}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				$.dialog('获取记录失败', function() {
				});
			}
		});
		
    }
    
	function reset() {       
		$("#searchForm")[0].reset();
	}
	
	function _addButton(id){
		var nbsp = "&nbsp;";
		var carsQueryUrl = $('#productSupplierQueryUrl').val()+"?accountId="+id ;
//		var edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>产品</span>');
		var product = $("<a href='javascript:void(0);' target='_self' name='viewBtn' class='btn63_03 margin_let10' id='"+id+"'/>").html('<span>查看车辆</span>');
		var edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03 margin_let10' id='"+id+"'/>").html('<span>编辑</span>') ;
		var del = $("<a href='javascript:void(0);' target='_self' name='delBtn' class='btn63_04 margin_let10' id='"+id+"'/>").html('<span>删除</span>') ;
//		var html=$('<span />').html(product).append(nbsp).append(edit).append(nbsp).append(del).html();
		var html=$('<span />').html(product).append(nbsp).append(edit).append(nbsp).append(del).html();
		return new handlebars.SafeString(html); 
	}
	
	function showProducts(){
		mainPage.hide();
		subPage.show();
		var id=$(this).attr('id');
		_id=id;
		queryProductsById(1,PAGE_SIZE,id); //查询显示的信息<option>
	}
	function formatJnd(type){
		if(type=='1')return '是';
		return '否';
	}
//	function _formatProductType(key){
//		var result="",temp=pArr.length;
//		if(key){
//			for(var j=0;j<temp;j++){
//				if(key==pArr[j].value){
//					result+=pArr[j].text;break;
//				}
//			}
//		}
//		return result;
//	}
	
	//返回按钮
	function backQueryPage(){
		$('#EAA').hide();
		$('#viewList').show();
	}
	function _formatStyle(key){
		var result="",temp=sArr.length;
		if(key){
		var styles = key.split(",");
		for(i=0;i<styles.length;i++){
			if(styles[i]){
			for(var j=0;j<temp;j++){
				if(styles[i]==sArr[j].value){
					result+=(sArr[j].text+",");break;
				}
			}
		}
		}
		}
		return result==""?"":result.substr(0,result.length-1); 
	}
	function _formatYp(key){
		if(key==1)return "是";
		if(key==0)return "否";
		return "";
	}
	function _editButton(id){
		var nbsp = "&nbsp;";
		var edit = $("<a href='javascript:void(0);' target='_self' name='editProductBtn' class='btn63_03' id='"+id+"'/>").html('<span>编辑</span>');
		var html=$('<span />').html(edit).append(nbsp).append(nbsp).html();
		return new handlebars.SafeString(html);
	}
    
	
	function queryProductsById(curPageNo, pageSize,id) {
		id=_id;
		var searchUrlProductsUrl = $("#searchUrlProductsUrl").val();
		productsList.show();
		productsNoDataMsg.hide();
		$.ajax({
			type : 'POST',
			url : searchUrlProductsUrl + ".json?start="+curPageNo+"&pageSize="+pageSize+"&tAccountId="+id+"&type=2",
			dataType : 'json',
			data : productsSearchCondition ,
			async : false,
			success : function(response) {
				if (response.result.length > 0) {
					var source = $('#dataListTemplate_products').html(), template = handlebars.compile(source);
					productsList.html(template(response)).css('height', 'auto');
					pagination_products.init({
						'pageSize' : PAGE_SIZE,
						'totalCount' : response.total,
						'load' : queryProductsById,
						'currentPage' : curPageNo
					});
					$("#J_CurPageNo_My").text(curPageNo);
					$('#tAccountId').val(response.tAccountId) ;
					$("a[name='editProductBtn']").on("click", showEditProducts);
				} else {
					productsList.empty().css('height', '40px').hide();
					productsNoDataMsg.show();
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				$.dialog('获取记录失败', function() {
				});
			}
		});
	}
	
	function showAddForm() {
//		var addUrl = $("#addUrl").val();
//		showDialogue(addUrl, 650, 500);
		$('#viewList').hide();
		$("#editForm1")[0].reset();
		var $cities =$("#Editcities");
		 $cities.find('option').remove();
		 $cities.append("<option value=''>--请选择市--</option>");
		 $('#hideId').val('');
		 $('#He').html('添加仓库');
		 $('.invalid').remove();
		 
//		 $('#jndtype').val('');
		$('#EAA').show();
	}
	function editShop(){$('.invalid').remove();
		$('#viewList').hide();
		$("#editForm1")[0].reset();
		var $cities =$("#Editcities");
		 $cities.find('option').remove();
		 $cities.append("<option value=''>--请选择市--</option>");
		 var $this=$(this);
			var theId=$this.attr('id');
			$('#hideId').val(theId);
			var pp=$this.parent().parent();
			var name=pp.find('td:eq(0)').html();
			var address=pp.find('td:eq(1)').html();
			var tel=pp.find('td:eq(2)').html();
			var province=pp.find('td:eq(3)').html();
			var city=pp.find('td:eq(4)').html();
			var principal=pp.find('td:eq(5)').html();
			var priTel=pp.find('td:eq(6)').html();
			var jnd=pp.find('td:eq(7)').html();
			var $contact;
			$.ajax({
				type : 'POST',
				url : $("#transferUrl").val()+".json",
				dataType : 'json',
				data : {province:province,city:city} ,
				async : false,
				success : function(response) {
					if (response.province) {
						var pro = response.province;
						var ci=response.city;
						$contact=$("#Editprovinces");
						$contact.val(pro);
						queryCitiesByProvinceId1();
						if(ci){
							$("#Editcities").val(ci);
						}
						}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					$.dialog('获取记录失败', function() {
					});
				}
			});
			var subview=$('#EAA');
			subview.find('#name').val(name);
			subview.find('#address').val(address);
			subview.find('#tel').val(tel);
			subview.find('#principal').val(principal);
			subview.find('#priTel').val(priTel);
			subview.find('#jndtype').attr("checked",jnd=="是"?true:false)//.attr("value",jnd=="是"?'1':'');
			subview.find('#He').html("修改仓库");
			subview.show();
	}
	/**
     * 关闭窗口
     */
	function refreshParent() {
//		window.opener.location.href = window.opener.location.href;
//		window.close();
//		$('#queryDiv').show();
//		$('#productsDiv').hide();
	}
	function saveShop(){
		if (validateAddForm()) {
			var addUrl = $("#createUrl").val();
			$.ajax({
				type : "POST",
				url : addUrl + ".json",
				dataType : "json",
				data : $("#editForm1").serialize(),
				async : false,
				success : function(response) {
					if (response.status) {
						var msg;
						if($('#hideId').val())msg="修改成功！";
						else msg="新增成功！";
						$.dialog(msg, function(){
//							refreshParent();
							$('#EAA').hide();
							$('#viewList').show();
							load(1,PAGE_SIZE);
						});
					} else {
						$.dialog(response.message, function(){});
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					$.dialog('请稍后重试!', function(){});
				}
			});
		}
	}
	function validateAddForm() {
		$("#editForm1").validate({
			rules : {
				name : {
					required : true,
					maxlength:50
				},address : {
					required : true,
					maxlength:50
				}
			},
			messages : {
				name : {
					required : "仓库名称必填",
					maxlength:"仓库名称太长"
				},address : {
					required : "仓库地址必填",
					maxlength:"仓库地址太长"
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
		return $("#editForm1").valid();
	}
	function showEditProducts(){
		var tAccountId = $('#tAccountId').val() ;
		var id=$(this).attr('id');
		var addUrl = $("#editProductUrl").val()+"?id="+id ;
		showDialogue(addUrl, 650, 500);
	}
    
	
	function showAddProductForm() {
		var tAccountId = $('#tAccountId').val() ;
		var addUrl = $("#addProductUrl").val()+"?tAccountId="+tAccountId ;
		showDialogue(addUrl, 650, 500);
	}
    
	function editSupplier(){
		var id=$(this).attr('id');
		var addUrl = $("#editUrl").val()+"?id="+id ;
		showDialogue(addUrl, 650, 500);
	}
	
	function delSupplier(){
		var id=$(this).attr('id');
		$.dialog('请确认删除此供应商! 否则请关闭该对话框', function(){
			var url = deleteUrl;
			$.ajax({
				type : 'GET',
				url : url + '.json',
				dataType : 'json',
				data : {
					id : id
				},
				async : false,
				success : function(response) {
					if (response.status) {
						load(1,PAGE_SIZE);
					} else {
						$.dialog('稍后再试', function(){});
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					$.dialog('删除失败', function(){});
				}
			});
		});
	}
	function showDialogue(url,w,h){
		var iWidth = w;
		var iHeight = h;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
		var win = window.open(url, "supplier", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
		win.focus();
	}
	// 重置
	$("#btnReset").bind("click", reset);
//	$("#productsResetBtn").bind("click", resetP);
	submitButton.removeAttr('disabled');
});