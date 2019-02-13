define(function(require, exports, module) {
	require('jquery-css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null;
	var source = $('#dataListTemplate').html(),
	template = handlebars.compile(source);
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('_operate', operate);
	handlebars.registerHelper('formatstatus', formatstatus);
	handlebars.registerHelper('formatclienttype', formatclienttype);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	function formatstatus(status,status2,finance){
		if(status2==1&&finance==2) return "全款已经交车验车";
		if(status==8&&status2==1&&finance==1) return "金融已经保险报价";
		if(status2==3&&finance==1)return "金融首付款确定";
		if(status2==3&&finance==2)return "全款回款确定";
		if(status2==4)return "材料已出库";
		if(status2==5)return "结算";
		return "";
	}
	function formatclienttype(key){
		if(key==1)return "个人";
		if(key==2)return "单位";
		return "";
	}
	function operate(id,status,status2,finance){
		var nbsp = "&nbsp;";
		var edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>查看</span>');
		var html=$('<span />').append(edit).html();
		if(status==8&&status2==1&&finance==2){//门店交车验车通过全款车
			var fullpayment = $("<a href='javascript:void(0);' target='_self' name='fullpaymentBtn' class='btn63_03' id='"+id+"'/>").html('<span>全款回款确定</span>');
			var html=$('<span />').append(edit).append(nbsp).append(fullpayment).html();
		}else if(status==8&&status2==1&&finance==1){//金融车首付款
			var financial= $("<a href='javascript:void(0);' target='_self' name='financialBtn' class='btn63_03' id='"+id+"'/>").html('<span>金融车首付款</span>');
			var html=$('<span />').append(edit).append(nbsp).append(financial).html();
		}else if(status==8&&status2==3){//材料出库
			MaterialOutbound = $("<a href='javascript:void(0);' target='_self' name='MaterialOutboundBtn' class='btn63_03' id='"+id+"'/>").html('<span>材料出库</span>');
			html=$('<span />').html(edit).append(nbsp).append(MaterialOutbound).html();
		}else if(status==8&&status2==4){//结算
			var settleaccounts= $("<a href='javascript:void(0);' target='_self' name='settleaccountsBtn' class='btn63_03' id='"+id+"'/>").html('<span>结算</span>');
			var html=$('<span />').append(edit).append(nbsp).append(settleaccounts).html();
		}
		return new handlebars.SafeString(html);
	}
//	查看合同信息
	function editClient(){
		var $this=$(this);
		var theId=$this.attr('id');
		location.href=$('#editUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&type=3";
	}
	/**
	 * 材料出库
	 */
	function MaterialOutboundBtn(){
		var $this=$(this);
		var theId=$this.attr('id');
		location.href=$('#MaterialOutboundUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&loginid="+$('#loginid').val();
	}
	/**
	 * 全款确定
	 */
	function fullpaymentBtn(){
		var $this=$(this);
		var theId=$this.attr('id');
		location.href=$('#fullpaymentUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&loginid="+$('#loginid').val()+"&type=1";//&type=1 全款确定
	}
	/**
	 * 金融车首付款
	 */
	function financialBtn(){
		var $this=$(this);
		var theId=$this.attr('id');
		location.href=$('#fullpaymentUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&loginid="+$('#loginid').val()+"&type=2";//&type=2 金融首付确定
	}
	/**
	 * 结算
	 */
	function settleaccountsBtn(){
		var $this=$(this);
		var theId=$this.attr('id');
		location.href=$('#settleaccountsUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&loginid="+$('#loginid').val();//
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
	//添加客户信息
	function addClient(){
		location.href=$('#addUrl').val()+"?worktype="+wt+"&currpage="+$('#J_CurPageNo').text();
	};
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize+"&type=1";
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			if (response.result.length>0) {
				dataList.html(template(response)).css('height', 'auto');
				pagination.init({
					'pageSize' : PAGE_SIZE,
					'totalCount' : response.total,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
				//绑定列表按钮事件处理函数
				$("a[name='editBtn']").on("click", editClient);
				$("a[name='fullpaymentBtn']").on("click", fullpaymentBtn);
				$("a[name='financialBtn']").on("click", financialBtn);
				$("a[name='MaterialOutboundBtn']").on("click", MaterialOutboundBtn);
				$("a[name='settleaccountsBtn']").on("click", settleaccountsBtn);
				
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