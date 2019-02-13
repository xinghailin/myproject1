define(function(require, exports, module) {
	require('jquery-css');require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#ccreatetime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatStatus', _formatcstatus);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('operate', operate);
//	var globe_context_id = $('#globe_context_id').val(),
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
//		$('.tb_mian').click(function(){alert(3)})
	});
	function operate(id,cstatus,paytype){
		var html='',spa="&nbsp;";
		var view,del,edit,reb;
		/**
		 * <option value="1">定金通过</option>
	<option value="2">定金不通过</option>
	<option value="3">定金审核中</option>
	<option value="4">定金已撤销</option>
	<option value="5">尾款通过</option>
	<option value="6">尾款不通过</option>
	<option value="7">尾款审核中</option>
	<option value="8">尾款已撤销</option>
	<option value="9">全款通过</option>
	<option value="10">全款不通过</option>
	<option value="11">全款审核中</option>
	<option value="12">全款已撤销</option>
	cstatus 1 审核中 2 审核通过 3 审核不通过 4撤销 paytype 付款类型1 定金 2全款 3尾款
		 */
		
		if (paytype=='1'&&cstatus=='1') {//定金通过 查看 编辑（尾款）
			edit = $("<a href='javascript:void(0);' " +
					"target='_self' name='editBtn' class='btn63_01' id='"+id+"'/>").html('<span>审核</span>');
			html=$('<span />').append(edit).html();
		}else if(paytype=='2'&&cstatus=='1'){
			edit = $("<a href='javascript:void(0);' " +
					"target='_self' name='editBtn' class='btn63_01' id='"+id+"'/>").html('<span>审核</span>');
			html=$('<span />').append(edit).html();
		}else if(paytype=='3'&&cstatus=='1'){
			edit = $("<a href='javascript:void(0);' " +
					"target='_self' name='editBtn' class='btn63_01' id='"+id+"'/>").html('<span>审核</span>');
			html=$('<span />').append(edit).html();
		}else{
			view = $("<a href='javascript:void(0);'" +
					" target='_self' name='viewBtn'  class='btn63_02' id='"+id+"'/>").html('<span>查看</span>');
			html=$('<span />').html(view).html();
		}
			return new handlebars.SafeString(html);
	}
	//格式化图片
	function _formatcstatus(cstatus,paytype){
		if(cstatus=='2'&&paytype=='1'){
				return "定金通过";
			}else if(cstatus=='3'&&paytype=='1'){
				return "定金不通过";
			}else if(cstatus=='1'&&paytype=='1'){
				return "定金审核中";
			}else if(cstatus=='4'&&paytype=='1'){
				return "定金已撤销";
			}else if(cstatus=='2'&&paytype=='3'){
				return "尾款通过";
			}else if(cstatus=='3'&&paytype=='3'){
				return "尾款不通过";
			}else if(cstatus=='1'&&paytype=='3'){
				return "尾款审核中";
			}else if(cstatus=='4'&&paytype=='3'){
				return "尾款已撤销";
			}else if(cstatus=='2'&&paytype=='2'){
				return "全款通过";
			}else if(cstatus=='3'&&paytype=='2'){
				return "全款不通过";
			}else if(cstatus=='1'&&paytype=='2'){
				return "全款审核中";
			}else if(cstatus=='4'&&paytype=='2'){
				return "全款已撤销";
			}else return "";
	}
	function editFun(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href = $('#editUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&username="+$('#username').val();
	}
	function viewFun(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href = $('#editUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&username="+$('#username').val();
	}
	//格式化时间
	function _formatSimpleDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate());
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
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize; // 查询数据url
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
				$("a[name='viewBtn']").on("click", viewFun);
				$("a[name='editBtn']").on("click", editFun);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	//绑定新增按钮事件
//	$('#saveBtn').bind("click",saveFun);
	// 重置
	function reset() {       
		form[0].reset();
	}
	$("#btnReset").bind("click", reset);
});
