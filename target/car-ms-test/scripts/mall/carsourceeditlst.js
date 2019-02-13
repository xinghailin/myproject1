define(function(require, exports, module) {
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null;
	var source = $('#dataListTemplate').html(),
	template = handlebars.compile(source),country=$('#country').val();
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('_operate', operate);
	handlebars.registerHelper('formatstatus', formatstatus);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	function formatstatus(status){
		if(status==1)return "显示";
		if(status==2)return "不显示";
		return "";
	}
	function operate(id,status){
		var nbsp = "&nbsp;",edit,html
		edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>编辑</span>');
//		v = $("<a href='javascript:void(0);' target='_self' name='vBtn' class='btn63_03' id='"+id+"'/>").html('<span>'+(status==1?'不展示':'展示')+'</span>');
//		del = $("<a href='javascript:void(0);' target='_self' name='delBtn' class='btn63_04' id='"+id+"'/>").html('<span>删除</span>');
		html=$('<span />').html(edit).html();
		return new handlebars.SafeString(html);
	}
//	编辑信息
	function editClient(){
		var $this=$(this);
		var theId=$this.attr('id');
		var eUrl = $('#editUrl').val()+"?id="+theId;
		location.href=eUrl+"&currpage="+ $('#J_CurPageNo').text();
	}
//有效无效信息
	function vClient(){
		var $this=$(this);
		var theId=$this.attr('id');
		var vUrl = $('#vUrl').val()+"?id="+theId;
		$.ajax(vUrl,{
			type : 'get',
			dataType : 'json'
		}).done(function(response) {
			if (response.status) {
				load($('#J_CurPageNo').text(),PAGE_SIZE);
			} else {
				alert(response.message)
			}
		})
	}
	function delClient(){
		var th=$(this).attr('id');
		if(confirm('确定删除？')){
			$.ajax($('#delUrl').val()+"?id="+th,{
				type : 'get',
				dataType : 'json'
			}).done(function(response) {
				if (response.status) {
					load(1,PAGE_SIZE);
				} else {
					alert(response.message)
				}
			})
		}
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
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize+"&country="+country; // 查询数据url
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
//				$("a[name='delBtn']").on("click", delClient);
//				$("a[name='vBtn']").on("click", vClient);
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
	function addnew() {
		var area=$('#areaid').val()
		if(!area){alert('请选择\"新建车源可选区域\"');return false;}
		var addUrl = $("#toaddUrl").val();
//		showDialogue(addUrl, 700, 800);
		location.href=addUrl+"?areaid="+area+"&currpage="+ $('#J_CurPageNo').text();
	}
	
	function showDialogue(url,w,h){
		var iWidth = w;
		var iHeight = h;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
		var win = window.open(url, "弹出窗口25", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
	}
	$("#btnReset").bind("click", reset);
	$("#addBtn").bind("click", addnew);
});