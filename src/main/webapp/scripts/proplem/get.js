define(function(require) {

	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	//var submitButton = $("#searchBtn");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null;
	var flag=false;
	$(function() {
		$("#searchBtn").bind('click',[1,PAGE_SIZE],queryload);
		load(1, PAGE_SIZE);
	});
	
	handlebars.registerHelper('formatDatetime', _formatDatetime);
	handlebars.registerHelper('opertaion', _opertaion);
	
	handlebars.registerHelper('formatType', _formatType);
	searchCondition = form.serialize();
	function queryload(params){
	    load(params.data[0], params.data[1]);
	};
	

	function load(curPageNo, pageSize) {
//		dataList.show().block({
//			theme : true
//		});
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#getProplemUrl').val() + '.json'; // 查询数据url
		queryUrl = queryUrl + '?startPage=' + curPageNo + '&pageSize=' + pageSize;
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data :  $('#searchForm').serialize() 
		}).done(function(response) {
//			dataList.unblock();
			if (response && response.result && response.result.result && response.result.result.length) {
				var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
				dataList.html(template(response)).css('height', 'auto');
				pagination.init({
					'pageSize' : PAGE_SIZE,
					'totalCount' : response.total,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
			//绑定列表按钮事件处理函数
			$("a[name='editBtn']").on("click", select);
			$("a[name='deleteBtn']").on("click", cancleSelect);
		});
	};
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
	function _opertaion(id,type){
		var ids = window.opener.getProplemId();
		var edit = $("<a href='javascript:void(0);' target='_self' name='editBtn'  class='btn63_03 margin_let10' id='"+id+"'/>").html('<span>选择</span>');
		var del = $("<a href='javascript:void(0);' target='_self' name='deleteBtn'  class='btn63_04 margin_let10' style='display: none;' id='"+id+"'/>").html('<span>取消</span>');
		if(ids)
			{
			if(ids.indexOf(id)>=0)
				{
				edit  = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03 margin_let10' style='display: none;' id='"+id+"'/>").html('<span>选择</span>');
				del = $("<a href='javascript:void(0);' target='_self' name='deleteBtn' class='btn63_04 margin_let10'  id='"+id+"'/>").html('<span>取消</span>');
				}
			}
		var nbsp = "&nbsp;";
		var html=$('<span />').html(edit).append(nbsp).append(del).append(nbsp).html();
		return new handlebars.SafeString(html); 
	}
	
	function _formatType(type)
	{
		if(type ==0 )
			{
			return "对错";
			}
		else
			{
			return "多选";
			}
	}
	function select()
	{   
		if(flag){$.dialog('只能选一个题目，请先取消之前的题目再选', function(){});
		return false;}
		var cre;
		var type = $(this).parent().prev().prev().html();
		var span = "";
		if(type=="对错")
		{
			cre=0;
			span =  $(window.opener.document).find('#span1');
			var cou=span.find('input[name^="propelmDTO"]').size();
			if(cou){$.dialog('只能选一个题目，请先取消之前的题目再选', function(){});
			return false;}
		}
		else
			{
			cre=1;
			span =  $(window.opener.document).find('#span2');
			var cou=span.find('input[name^="propelmDTO"]').size();
			if(cou){$.dialog('只能选一个题目，请先取消之前的题目再选', function(){});
			return false;}
			}
		var nbsp = "&nbsp;";
		$(this).hide();
		$(this).next().show();
		var name = $(this).parent().prev().prev().prev().html();
		var id = $(this).prop('id');
	    var addli = $('<label style="float: left;" id=li'+id+'/>')
	    var inputhidden = $('<input type="hidden" value="'+id+'" id=hidden'+id+' name=propelmDTO['+cre+'].proplemId>');
	    addli.html(name);
	    span.append(inputhidden).append(addli).append(nbsp);
	    window.opener.subgetincrease();
	    flag=true;
	}
	
	function cancleSelect()
	{
		$(this).hide();
		$(this).prev().show();
		var id = $(this).prop('id');
		$(window.opener.document).find('#li'+id).remove();
		$(window.opener.document).find('#hidden'+id).remove();
		flag=false;
	}
});
