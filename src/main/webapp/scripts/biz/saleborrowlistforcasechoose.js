define(function(require, exports, module) {
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null,searchurl;
	handlebars.registerHelper('_operate', operate);
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		searchurl=$('#searchUrl').val()
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	function operate(id,caseid){
		var nbsp = "&nbsp;",html,look;
		if(caseid==null)
				{look = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03' id='"+id+"'/>").html('<span>立案</span>');html=$('<span />').append(look).html();}
		else 
				html='';
		return new handlebars.SafeString(html);
	}
	function audit(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#case1addurl').val()+"?id="+theId;//+"&currpage="+$('#J_CurPageNo').text();
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
		var queryUrl = searchurl + "?start="+curPageNo+"&pageSize="+pageSize;
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
				$("a[name='editBtn']").on("click", audit);
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
	function back(){
		location.href=$("#backUrl").val();//+"?currpage="+$('#currpage').val();
	}
	//绑定新增按钮事件
	$("#btnReset").bind("click", reset);
	$("#backBtn").bind("click", back);
});