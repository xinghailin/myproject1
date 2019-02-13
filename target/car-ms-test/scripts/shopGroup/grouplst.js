var gload,psize;
define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);require('jquery-css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;psize=PAGE_SIZE;
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
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	function operate(id){
		var nbsp = "&nbsp;",view,del,html; 
			view = $("<a href='javascript:void(0);' target='_self' name='viewBtn' class='btn63_03' id='"+id+"'/>").html('<span>编辑</span>');
		    del = $("<a href='javascript:void(0);' target='_self' name='delBtn' class='btn63_04 margin_let10' id='"+id+"'/>").html('<span>删除</span>') ;
		   html=$('<span />').html(view).append(del).html();
	
		return new handlebars.SafeString(html);
	}
//	查看组门店信息
	function editClient(){
		var $this=$(this);
		var theId=$this.attr('id');
		var addUrl = $('#toeditUrl').val()+"?id="+theId;
		showDialogue(addUrl, 700, 800);
	}
//	删除组门店信息
	function delClient(){
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
				$("a[name='viewBtn']").on("click", editClient);
				$("a[name='delBtn']").on("click", delClient);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};gload=load;
	// 重置
	function reset() {       
		form[0].reset();
	}
	function addnew() {
		var addUrl = $("#toaddUrl").val();
		showDialogue(addUrl, 700, 800);
	}
	
	function showDialogue(url,w,h){
		var iWidth = w;
		var iHeight = h;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
		var win = window.open(url, "弹出窗口25", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
	}
	$("#btnReset").bind("click", reset);
	$("#btnadd").bind("click", addnew);
});
function searchclick(bl){
	if(bl)
		gload($('#J_CurPageNo').text(),psize);
	else
		document.getElementById("btnSearch").click();
}