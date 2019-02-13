define(function(require, exports, module) {
	require('../base/validation-proxy');
	require('art-dialog')($);require('jquery-css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#signtime', null, null);
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
	handlebars.registerHelper('_formatype', _formatype);
	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
	$(function() {
//		pushAll();
		load(1,PAGE_SIZE);//加载数据列表
		loadProvinces();//加载省下拉列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
		$('#provinces').bind('change', queryCitiesByProvinceId);//根据省ID查询下面的市区
		$('#Editprovinces').bind('change', queryCitiesByProvinceId1);//根据省ID查询下面的市区
		$("#btnAddShop").bind("click",showAddForm);
		$("#cancelBtn1").bind("click",backQueryPage);
		$("#btnExcel").click(
				function(){
					form.submit();
				});
	});
	function _formatype(key) {
		if(key ==0){
			return '虚拟';
		}else if(key == 1){
			return '自营';
		}else if(key == 2){
			return '城市合伙人';
		}else if(key == 3){
			return '寄售';
		}
		return '';
	}
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
				$("a[name='editBtn']").on("click", editBtn);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	
	
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
	function _addButton(id,type){
		var nbsp = "&nbsp;";
		var edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>配车</span>') ;
		var html=$('<span />').append(edit).html();
		return new handlebars.SafeString(html); 
	}
	//配车
	function editBtn(){
		var $this=$(this);
		var theId=$this.attr('id');
		var comparisonTotaMoney=$('#comparisonTotaMoneyUrl').val()+"?id="+theId+"&checkval="+$('#checkval').val();
		$.ajax({
	        url:comparisonTotaMoney,
	        type:'post',
	        datatype:'json',
	        success:function(data){
	        	if(data.status){
	        	location.href=$('#supplycardetailedlistUrl').val()+"?id="+theId+"&checkval="+$('#checkval').val();
	        	}else{
	        		alert(data.msg);
	        	}
	        }
		});
	};
	function showProducts(){
		mainPage.hide();
		subPage.show();
		var id=$(this).attr('id');
		_id=id;
		queryProductsById(1,PAGE_SIZE,id); //查询显示的信息<option>
	}
	//格式化时间
	function _formatSimpleDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate());
	}
	//补零
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
	//返回按钮
	function backQueryPage(){$("#types").prop('selectedIndex', 0);//$("#types").find("option:selected").removeAttr("selected");
		$('#EAA').hide();//$("#types").val("");
//		$("#types").find("option:selected").attr("selected",false);
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
		$("#editForm1")[0].reset();$("#types").prop('selectedIndex', 0)//$("#types").find("option:selected").removeAttr("selected");//$("#types").val();
//		$("#types option").each(function (i) {
//            $(this).attr("selected", "");
//        }
//        );
		//$("#types").removeSelected();
		var $cities =$("#Editcities");
		 $cities.find('option').remove();
		 $cities.append("<option value=''>--请选择市--</option>");
		 $('#hideId').val('');
		 $('#He').html('添加门店');
		 $('.invalid').remove();
		$('#EAA').show();
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
				},credit : {
					amount:true,maxlength:11
				},financial : {
					amount:true,maxlength:11
				}
//				,Ssigntime : {
//					dateorspace:true
//				}
			},
			messages : {
				name : {
					required : "门店名称必填",
					maxlength:"门店名称太长"
				},address : {
					required : "门店地址必填",
					maxlength:"门店地址太长"
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