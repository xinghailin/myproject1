define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#leaveFactoryTime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
//	var sArr=[];
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
	handlebars.registerHelper('_formatStatus', _formatStatus);
	handlebars.registerHelper('_operate', _operate);
//	handlebars.registerHelper('_formatAddress', _formatAddress);
//	handlebars.registerHelper('addButton', _addButton);
	handlebars.registerHelper('formatPic', _formatPic);
	var searchUrl=$('#searchUrl').val();
	var shopId=$("#hideshopid").val();
	$(function() {
//		pushAll();
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});

	function _operate(status,id,saleStatus){
		var edit;
		if (saleStatus==null) {
			if (status==3) {
				edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>入库审核</span>');
				}else if(status==9){
				edit = $("<a href='javascript:void(0);' target='_self' name='selBtn' class='btn63_03' id='"+id+"'/>").html('<span>审核</span>');
				}
				var html=$('<span />').html(edit).html();
				return new handlebars.SafeString(html);
		}
		
	}
	//格式化审核状态
	function _formatStatus(status,saleStatus) {
		if(status==3&&saleStatus==null){
			return "已移库门店";
		}else if(saleStatus==1){
			return "购车锁定";
		}else if(saleStatus==2){
			return "购车物流";
		}else if(saleStatus==3){
			return "已销未提";
		}else if(status==2){
			return "移库中";
		}else if(status==9){
			return "返回仓库中";
		}
		return '';
	}
	//格式化仓库地址
	function _formatAddress(key) {
		if(key)
		for(var len=sArr.length,i=0;i<len;i++){
		if(key == sArr[i].value){
			return sArr[i].text;
		}}
		return '';
	}
	//格式化时间
	function _formatDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) + ' '
				+ _fillZero(datetime.getHours()) + ':' + _fillZero(datetime.getMinutes()) + ':' + _fillZero(datetime.getSeconds());
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
	function pushAll(){
		var styleLst=$('#address');
		var slo=styleLst.find('option');
		var ss=slo.size();
		for(var i=0;i<ss;i++){
			if(slo[i].value){sArr.push(slo[i]);}
		}
	}
	function selCar(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#selUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text();
	}
	function editCar(){
		var $this=$(this);
		var theId=$this.attr('id');
		$.dialog('是否重新入库？', function(){
		var edi=$('#editUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text();
		$.ajax(edi, {
			type : 'GET', 
			dataType : 'json'
		}).done(function(response) {
			if (response.status) {
				$.dialog('等待审核！', function(){
					load(1,PAGE_SIZE);
				});
			}else{
				$.dialog(response.message, function(){});
			} 
		})});
	}
	//表单搜索
	function dataSearch(dataObj){
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	//格式化图片
	function _formatPic(src){
		var globe_context_id = $('#globe_context_id').val() ;
		src = src==null||src==''?globe_context_id:globe_context_id+src;
		return new handlebars.SafeString(src);
	}
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = searchUrl + "?shopId="+shopId+"&start="+curPageNo+"&pageSize="+pageSize; // 查询数据url
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
//				$("a[name='applyMove']").on("click", applyMove);
//				$("a[name='outRep']").on("click", outRep);
				$('img').bigic();
				$("a[name='editBtn']").on("click", editCar);
				$("a[name='selBtn']").on("click", selCar);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	
	//添加操作按钮
	function _addButton(id){
		var nbsp = "&nbsp;";
		var record = $("<a href='javascript:void(0);' class='btn63_03' target='_self' name='applyMove' class=''  id='"+id+"'/>").html("申请移库");
		var detail = $("<a href='javascript:void(0);' class='btn63_03' target='_self' name='outRep'  id='"+id+"'/>").html("购车出库");
		var html=$('<span />').html(record).append(nbsp).append(detail).html();
		return new handlebars.SafeString(html);
	}
	
	//申请移库
	function applyMove(){
		var id = $(this).attr("id");
		location.href = $("#applyUrl").val() + "?carId="+id;
	}

	//购车出库
	function outRep(){
		var id = $(this).attr("id");
		location.href = $("#outUrl").val() + "?id="+id;
	}
	// 重置
	function reset() {       
		form[0].reset();
	}
	function back() {       
		location.href=$('#backUrl').val();
	}
	$("#btnReset").bind("click", reset);
	$("#backBtn").bind("click", back);
});
//显示头像
function showPic(a, sUrl) {
	var x, y;
	var event = a ? a : window.event;
	var mX = event.x ? event.x : event.pageX;
	var my = event.y ? event.y : event.pageY;
	x = event.clientX;
	y = event.clientY;
	var div = $("#imgLayer");
	div.css("left",x);
    div.css("top",y);
    div.css("left",mX+10+"px");
    div.css("posTop",my+10 +"px");
    div.html("<img style='float:left;'  heith='160' width='160'  src=\"" + sUrl + "\">") ;
    div.css("display","block");
}
//隐藏头像
function hiddenPic() {
	var div = $("#imgLayer");
	div.html("") ;
	div.css("display","none");
}