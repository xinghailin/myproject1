define(function(require, exports, module) {
	require('jquery-css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null,type=$("#type").val();
	var source = $('#dataListTemplate').html(),
	template = handlebars.compile(source);
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('_operate', operate);
	handlebars.registerHelper('formatstatus', formatstatus);
	handlebars.registerHelper('formatclienttype', formatclienttype);
	handlebars.registerHelper('formatfinance', formatfinance);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	function formatstatus(status){
		if (status == 30)
			return "已选车";
		if (status == 7)
			return "金融合同审核通过";
		if (status == 8)
			return "保险报价已添加";
	}
	function formatclienttype(key){
		if(key==1)return "个人";
		if(key==2)return "单位";
		return "";
	}
	function formatfinance(key){
		if(key==1)return "是";
		if(key==2)return "否";
		return "";
	}
	function operate(id,status,finance){
		var spa = "&nbsp;",html,insurance,view;
			view = $("<a href='javascript:void(0);' target='_self' name='base1Btn' class='btn63_03' id='"+id+"'/>").html('<span>查看</span>');
			html=$('<span />').html(view).html();
			if(status==7&&finance==1){//金融保险报价
				insurance = $("<a href='javascript:void(0);' target='_self' name='insuranceBtn' class='btn63_03' id='"+id+"'/>").html('<span>金融保险报价</span>');
				html=$('<span />').html(view).append(spa).append(insurance).html();
			}
			if(status==30&&finance==2){//全款保险报价
				insurance = $("<a href='javascript:void(0);' target='_self' name='insuranceBtn' class='btn63_03' id='"+id+"'/>").html('<span>全款保险报价</span>');
				html=$('<span />').html(view).append(spa).append(insurance).html();
			}
		return new handlebars.SafeString(html);
	}
	function base1Btn(){//金融合同添加后和全款保险报价后的查看
		var $this=$(this);
		var theId=$this.attr('id');
		location.href=$('#baseUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&insurance=1";
	}
	function insuranceBtn(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#addinsuranceUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text();
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
	//表单搜索
	function dataSearch(dataObj){
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() +"?start="+curPageNo+"&pageSize="+pageSize+"&type="+type; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			if (response.result.length>0) {
				dataList.html(template(response)).css('height', 'auto');
				pagination.init({
					'pageSize' : PAGE_SIZE,
					'totalCount' : response.num,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
				//绑定列表按钮事件处理函数
				$("a[name='insuranceBtn']").on("click", insuranceBtn);
				$("a[name='base1Btn']").on("click", base1Btn);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	// 重置
	function reset() {       
		form[0].reset();
	}
	$("#btnReset").bind("click", reset);
});