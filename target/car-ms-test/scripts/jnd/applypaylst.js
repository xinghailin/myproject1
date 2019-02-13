define(function(require, exports, module) {
	require('jquery-css');require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#createtime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null ;
//	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatStatus', _formatStatus);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('operate', operate);
	handlebars.registerHelper('formatAdjust', _formatAdjust);
//	var globe_context_id = $('#globe_context_id').val(),
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	function operate(id,status){
		var html='',spa="&nbsp;";
		var view,del,edit,reb;
		view = $("<a href='javascript:void(0);' target='_self' name='viewBtn' class='btn63_01' id='"+id+"'/>").html('<span>查看</span>');
		if (status=='1') {//定金通过 查看 编辑（尾款）
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_01' id='"+id+"'/>").html('<span>编辑</span>');
			html=$('<span />').html(view).append(spa).append(edit).html();
		}else if (status=='2'){//不通过 编辑（定金） 删除 查看
			del = $("<a href='javascript:void(0);' target='_self' name='delBtn' class='btn63_02' id='"+id+"'/>").html('<span>删除</span>');
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_01' id='"+id+"'/>").html('<span>编辑</span>');
			html=$('<span />').html(view).append(spa).append(edit).append(spa).append(del).html();
		}else if (status=='3'){//审核中 撤销 删除 查看（定金）
			reb = $("<a href='javascript:void(0);' target='_self' name='rebBtn' class='btn63_02' id='"+id+"'/>").html('<span>撤销</span>');
			del = $("<a href='javascript:void(0);' target='_self' name='delBtn' class='btn63_02' id='"+id+"'/>").html('<span>删除</span>');
			html=$('<span />').html(view).append(spa).append(reb).append(spa).append(del).html();
		}else if (status=='4'){//已撤销 编辑（定金） 删除 查看
			del = $("<a href='javascript:void(0);' target='_self' name='delBtn' class='btn63_02' id='"+id+"'/>").html('<span>删除</span>');
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_01' id='"+id+"'/>").html('<span>编辑</span>');
			html=$('<span />').html(view).append(spa).append(edit).append(spa).append(del).html();
		}else if (status=='5') {//尾款通过 查看（尾款）
			html=$('<span />').html(view).html();
		}else if (status=='6'){//不通过 编辑 查看（尾款）
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_01' id='"+id+"'/>").html('<span>编辑</span>');
			html=$('<span />').html(view).append(spa).append(edit).html();
		}else if (status=='7'){//审核中 撤销 查看（尾款）
			reb = $("<a href='javascript:void(0);' target='_self' name='rebBtn' class='btn63_02' id='"+id+"'/>").html('<span>撤销</span>');
			html=$('<span />').html(view).append(spa).append(reb).html();
		}else if (status=='8'){//已撤销 编辑 查看（尾款）
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_01' id='"+id+"'/>").html('<span>编辑</span>');
			html=$('<span />').html(view).append(spa).append(edit).html();
		}
		return new handlebars.SafeString(html);
	}
	//格式化图片
	function _formatStatus(status){
		if(status=='1'){return "定金通过";}
		else if(status=='2'){return "定金不通过";}
		else if(status=='3'){return "定金审核中";}
		else if(status=='4'){return "定金已撤销";}
		else if(status=='5'){return "尾款通过";}
		else if(status=='6'){return "尾款不通过";}
		else if(status=='7'){return "尾款审核中";}
		else if(status=='8'){return "尾款已撤销";}
		else return "";
	}
	//格式化调剂
	function _formatAdjust(status){
		if(status=='1'){return "是";}
		else return "否";
	}
	function editFun(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href = $('#editUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text();
	}
	function addFun(){
		window.location.href = $('#addUrl').val()+"?currpage="+$('#J_CurPageNo').text();
	}
	function delFun(){
		var $this=$(this);
		var theId=$this.attr('id');
		$.dialog("确定删除吗？", function(){
		var delurl = $('#deleteUrl').val()+"?id="+theId;
		$.ajax(delurl, {
			type : 'get',
			dataType : 'json'
		}).done(function(response) {
			if (response.status) {
				load(1,PAGE_SIZE);
			} else {
				$.dialog(response.msg, function(){})
			}
		});
		})
	}
	function rebFun(){
		var $this=$(this);
		var theId=$this.attr('id');
		$.dialog("确定撤销吗？", function(){
			var delurl = $('#deleteUrl').val()+"?revocation=1&id="+theId;
			$.ajax(delurl, {
				type : 'get',
				dataType : 'json'
			}).done(function(response) {
				if (response.status) {
					load($('#J_CurPageNo').text(),PAGE_SIZE);
				} else {
					$.dialog(response.msg, function(){})
				}
			});
			})
	}
	function viewFun(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href = $('#editUrl').val()+"?id="+theId+"&view=1&currpage="+$('#J_CurPageNo').text();
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
				$("a[name='delBtn']").on("click", delFun);
				$("a[name='rebBtn']").on("click", rebFun);
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
	$("#btnAddApay").bind("click", addFun);
});