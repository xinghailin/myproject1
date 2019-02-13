define(function(require, exports, module) {
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null, node = $("#node").val(), all = $("#all").val();
	var source = $('#dataListTemplate').html(), template = handlebars
			.compile(source);
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('_operate', operate);
	handlebars.registerHelper('formatstatus', formatstatus);
	handlebars.registerHelper('formatclienttype', formatclienttype);
	handlebars.registerHelper('formatfinance', formatfinance);
	function formatstatus(status, status2, finance) {
		if (!status)
			return "门店部待审核";
		if (status == 1)
			return "门店部审核通过";
		if (status == 2)
			return "门店部审核不通过";
		if (status == 22)
			return "门店部驳回修改";
		if (status == 3&&finance==2)//全款
			return "全款定金已到账";
		if (status == 3&&finance==1)//金融
			return "金融定金已到账";
		if (status == 4)
			return "风控进件待审核";
		if (status == 30)
			return "已选车";
		if (status == 51)
			return "风控进件初审通过";
		if (status == 52)
			return "风控进件初审补件";
		if (status == 53)
			return "风控进件初审拒单";
		if (status == 54)
			return "风控进件复审通过";
		if (status == 55)
			return "风控进件复审补件";
		if (status == 56)
			return "风控进件复审拒单";
		if (status == 61)
			return "金融定金同意支付 ";
		if (status == 63)
			return "金融定金拒绝支付 ";
		if (status == 62 && status2 == null)
			return "金融合同已选车";
		if (status == 6)
			return "金融合同已添加";
		if (status == 7)
			return "金融合同审核通过";
		if (status == 8 && status2 == null&&finance==2)
			return "全款车辆保险已添加";
		if (status == 8 && status2 == 1&&finance==1)
			return "金融车辆保险已添加";
		if (status == 62&&status2 == 1&&finance==1)
			return "金融已交车验车";
		if (status2 == 1&&finance==2)
			return "全款已交车验车";
		if (status2 == 2)
			return "验车不通过退款";
		if (status2 == 3 && finance == 1)
			return "金融车首付款确认";
		if (status2 == 3 && finance == 2)
			return "全款回款确认";
		if (status2 == 4)
			return "材料已出库";
		if (status2 == 5)
			return "结算";
	}

	function formatclienttype(key) {
		if (key == 1)
			return "个人";
		if (key == 2)
			return "单位";
		return "";
	}
	function formatfinance(key) {
		if (key == 1)
			return "是";
		if (key == 2)
			return "否";
		return "";
	}
	function operate(id, status, finance, status2) {
		var spa = "&nbsp;", html, edit, view;
		if (status==62||status == 6 || status == 7 || status == 8) {
			view = $(
					"<a href='javascript:void(0);' target='_self' name='base1Btn' class='btn63_03' id='"
							+ id + "'/>").html('<span>查看</span>');
		}else if ((status==3&&finance==1)){//金融定金到账审核页面查看
			view = $(
					"<a href='javascript:void(0);' target='_self' name='base2Btn' class='btn63_03' id='"
							+ id + "'/>").html('<span>查看</span>');
		}else {
			view = $(
					"<a href='javascript:void(0);' target='_self' name='baseBtn' class='btn63_03' id='"
							+ id + "'/>").html('<span>查看</span>');
		}
		if(!node)//node空值 销售合同列表操作
		{if(!all){if(status==1){//门店部审核通过
			if(finance==1){
				edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>风控进件</span>');
				html=$('<span />').html(view).append(spa).append(edit).html();
			}else{
//				edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>选车</span>');
				html=$('<span />').html(view).html();
			}
		}else if(status==22){//门店部驳回修改
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>修改</span>');
			html=$('<span />').html(view).append(spa).append(edit).html();
	   }else if(status==54){//复审通过
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>支付定金</span>');
			html=$('<span />').html(view).append(spa).append(edit).html();
		}else if(status==52||status==55){//初审、复审补件
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>风控补件</span>');
			html=$('<span />').html(view).append(spa).append(edit).html();
		}else if (status == 8 && status2 == null&&finance==2) {// 交车验车
			paycar = $(
					"<a href='javascript:void(0);' target='_self' name='paycarBtn' class='btn63_03' id='"
							+ id + "'/>").html('<span>全款交车验车</span>');
			html = $('<span />').html(view).append(spa).append(paycar)
					.html();
		}else if (status == 62 && status2 == null&&finance==1) {// 交车验车
			paycar = $(
					"<a href='javascript:void(0);' target='_self' name='paycarBtn' class='btn63_03' id='"
							+ id + "'/>").html('<span>金融交车验车</span>');
			html = $('<span />').html(view).append(spa).append(paycar)
					.html();
		}/*else if(status==8&&status2==3){//材料出库
			MaterialOutbound = $("<a href='javascript:void(0);' target='_self' name='MaterialOutboundBtn' class='btn63_03' id='"+id+"'/>").html('<span>材料出库</span>');
			html=$('<span />').html(view).append(spa).append(MaterialOutbound).html();
		}*/else{
			html=$('<span />').html(view).html();}}else{//总览时只查看
				html=$('<span />').html(view).html();}
		}else if(node==1){
			//门店部
			if(!status){
				edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>审核</span>');
				html=$('<span />').html(view).append(spa).append(edit).html();
			}else{html=$('<span />').html(view).html();}
		}
		else if (node == 2) {// 财务部
			if (status == 1&&finance==2) {//全款
				edit = $(
						"<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"
								+ id + "'/>").html('<span>全款定金到账</span>');
				html = $('<span />').html(view).append(spa).append(edit).html();
			} else if(status==61) {//金融
				edit = $(
						"<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"
								+ id + "'/>").html('<span>金融定金到账</span>');
				html = $('<span />').html(view).append(spa).append(edit).html();
			}else{
				html = $('<span />').html(view).html();
			}
		}else if(node==3){//风控进件初审
			if(finance==1){if(status==4){
				edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>进件初审</span>');
				html=$('<span />').html(view).append(spa).append(edit).html();
			}else{html=$('<span />').html(view).html();}}
		}else if(node==4){//风控进件复审
			if(finance==1){if(status==51){
				edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>进件复审</span>');
				html=$('<span />').html(view).append(spa).append(edit).html();
			}else{html=$('<span />').html(view).html();}}
		}else if(node==5){//全款选车
			if(finance==2){if(status==3){
				edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>全款选车</span>');
				html=$('<span />').html(view).append(spa).append(edit).html();
			}else{html=$('<span />').html(view).html();}}
		}  
		return new handlebars.SafeString(html);
	}
	function base1Btn() {// 金融合同添加后和全款保险报价后的查看
		var $this = $(this);
		var theId = $this.attr('id');
		location.href = $('#baseUrl').val() + "?id=" + theId + "&currpage="
				+ $('#J_CurPageNo').text() + "&type=2" + "&all=" + all;
	}
	function base2Btn() {// 金融合同添加后和全款保险报价后的查看
		var $this = $(this);
		var theId = $this.attr('id');
		location.href = $('#baseUrl').val() + "?id=" + theId + "&currpage="
				+ $('#J_CurPageNo').text() + "&type=4" + "&all=" + all;
	}

	// 查看合同信息
	function viewfun() {// 金融复审通过及以前和全款加入车价号成功时的查看
		var $this = $(this);
		var theId = $this.attr('id');
		location.href = $('#baseUrl').val() + "?type=1&id=" + theId
				+ "&currpage=" + $('#J_CurPageNo').text() + "&node="
				+ $('#node').val() + "&all=" + all;
	}
	/**
	 * 交车验车
	 */
	function paycarBtn() {
		var $this = $(this);
		var theId = $this.attr('id');
		location.href = $('#paycarUrl').val() + "?id=" + theId + "&currpage="
				+ $('#J_CurPageNo').text() + "&loginid=" + $('#loginid').val();
	}

	// 查看合同信息
	function editClient() {
		var $this = $(this);
		var theId = $this.attr('id');
		location.href = $('#editUrl').val() + "?id=" + theId + "&currpage="
				+ $('#J_CurPageNo').text() + "&node=" + $('#node').val();
	}

	// 格式化时间
	function _formatDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-'
				+ _fillZero((datetime.getMonth() + 1)) + '-'
				+ _fillZero(datetime.getDate()) + ' '
				+ _fillZero(datetime.getHours()) + ':'
				+ _fillZero(datetime.getMinutes()) + ':'
				+ _fillZero(datetime.getSeconds());
	}
	// 格式化时间
	function _formatSimpleDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-'
				+ _fillZero((datetime.getMonth() + 1)) + '-'
				+ _fillZero(datetime.getDate());
	}
	// 补零
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
	// 表单搜索
	function dataSearch(dataObj) {
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize);
	}
	// 分页数据加载
	function load(curPageNo, pageSize) {
		dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?node=" + node + "&start="
				+ curPageNo + "&pageSize=" + pageSize + "&all=" + all; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			if (response.result.length > 0) {
				dataList.html(template(response)).css('height', 'auto');
				pagination.init({
					'pageSize' : PAGE_SIZE,
					'totalCount' : response.total,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
				// 绑定列表按钮事件处理函数
				$("a[name='baseBtn']").on("click", viewfun);
				$("a[name='editBtn']").on("click", editClient);
				$("a[name='paycarBtn']").on("click", paycarBtn);
				$("a[name='base1Btn']").on("click", base1Btn);
				$("a[name='base2Btn']").on("click", base2Btn);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	}
	// 重置
	function reset() {
		form[0].reset();
	}
	$("#btnReset").bind("click", reset);
//	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
//	});
});