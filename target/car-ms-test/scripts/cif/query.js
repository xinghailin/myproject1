define(function(require,exports, module) {
	require('art-dialog')($);
	require('jquery-css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var searchBtn = $("#searchBtn");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null;
	var curp;
	searchBtn.attr('disabled', 'disabled');
	handlebars.registerHelper('formatType', _formatType);
	handlebars.registerHelper('formatMtype', _formatMtype);
	handlebars.registerHelper('formatYp', _formatYp);
	handlebars.registerHelper('formatStateButton', _formatStateButton);
	handlebars.registerHelper('formatButton', _formatButton);
	$(function() {
		searchCondition = form.serialize();
		load(1, PAGE_SIZE);
		searchBtn.bind("click", {
			curPageNo : 1,
			pageSize : PAGE_SIZE
		}, dataSearch);
	});
	//格式化身份
	function _formatType(type){
		if(type=='1'){return "设计师";}
		else if(type=='2'){return "供应商";}
		else if(type=='3'){return "开发商";}
		else return "";
	}
	//格式化是否黄页
	function _formatYp(type){
		if(type=='1'){return "是";}
		else if(type=='0'){return "否";}
		else return "";
	}
	//格式化b端c端
	function _formatMtype(type){
		if(type=='1'){return "B端";}
		else if(type=='2'){return "C端";}
		else return "";
	}
	//格式化身份
	function _formatStateButton(state){
		if(state=='0'){return "冻结";}
		else if(state=='1'){return "激活";}
		return "";
	}
	// 表单搜索
	function dataSearch(dataObj) {
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize);
	}
	function load(curPageNo, pageSize) {
		dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + '.json';
		queryUrl = queryUrl + '?startPage=' + curPageNo + '&pageSize='+ pageSize;
		$.ajax(queryUrl, {
					type : 'POST',
					dataType : 'json',
					data : searchCondition
				})
				.done(
						function(response) {
							if (response && response.lst
									&& response.lst.length) {
								curp=curPageNo;
								var source = $('#dataListTemplate').html(), template = handlebars
										.compile(source);
								dataList.html(template(response)).css('height',
										'auto');
								pagination.init({
									'pageSize' : PAGE_SIZE,
									'totalCount' : response.total,
									'load' : load,
									'currentPage' : curPageNo
								});
								$('#J_CurPageNo').text(curPageNo);
								//绑定按钮事件处理函数
								$("a[name='accBtn']").on("click", accPass);
							} else {
								dataList.empty().css('height', '40px').hide();
								noDataMsg.show();
							}
						});
	}
	// 帐号解冻冻结
	function accPass(){
		var id=$(this).attr('id');
		var state=$(this).attr('state');
		state=state=='0'?'1':'0';
		var isRelUrl = $("#accountUrl").val();
			$.ajax({
				type : 'POST',
				url : isRelUrl + '.json?id='+id,
				dataType : 'json',
				data : {state:state},
				async : false,
				success : function(response) {
					if (response.status == '1') {
						load(curp, PAGE_SIZE);
					} else {
						$.dialog('请稍后再试', function() {
						});
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					$.dialog("异常", function() {});
				}
			});
	}
	//格式化帐号操作按钮
	function _formatButton(id,state){//状态:0.冻结; 1.激活 
		var nbsp = "&nbsp;";
		var edit = $("<a href='javascript:void(0);' target='_self' name='accBtn' state='"+state+"' class='btn63_03 margin_let10' id='"+id+"'/>"),html;
		if(state==0){edit.html('<span>解冻</span>');}
		else {edit.html('<span>冻结</span>');}
		html=$('<span />').html(edit).append(nbsp).html();
		return new handlebars.SafeString(html); 
	}
	function reset() {
		$("#searchForm")[0].reset();
	}
	// 绑定按钮事件重置
	$("#resetBtn").bind("click", reset);
	searchBtn.removeAttr('disabled');
});