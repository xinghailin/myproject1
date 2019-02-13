define(function(require, exports, module) {
	require('jquery-css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var sArr=[];
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatSimpleDate', _formatSimpleDate);
	handlebars.registerHelper('addButton', _addButton);
	var globe_context_id = $('#globe_context_id').val() ;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});

	//格式化时间
	function _formatSimpleDate(datetime) {
		if (datetime === null) {
			return '';
		}
		
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate());
	}
	function _formatSimpleDatetime(datetime) {
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

	function _addButton(id,group_id){
		    var nbsp = "&nbsp;";
			var edit = $("<a href='javascript:void(0);' target='_self' name='viewBtn' class='btn63_03' id='"+id+"' group_id='"+group_id+"' />").html('<span>修改</span>');
			var addpic = $("<a href='javascript:void(0);' target='_self' name='viewaddBtn' class='btn63_03' id='"+id+"'/>").html('<span>添加图片</span>');
			var picList = $("<a href='javascript:void(0);' target='_self' name='viewpicListBtn' class='btn63_03' id='"+id+"'/>").html('<span>图片列表</span>');
			var del = $("<a href='javascript:void(0);' target='_self' name='deleteBtn' class='btn63_02 margin_let10' group_id='"+group_id+"'/>").html('<span>删除</span>');
			var html=$('<span />').append(edit).append(nbsp).append(addpic).append(nbsp).append(picList).append(nbsp).append(del).html();
			return new handlebars.SafeString(html); 
		
	}
	//表单搜索
	function dataSearch(dataObj){
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	//分页数据加载
	function load(curPageNo, pageSize) {
		searchCondition = form.serialize();
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
				$("a[name='viewBtn']").on("click", viewEdit);
				$("a[name='viewaddBtn']").on("click", viewaddPic);
				$("a[name='viewpicListBtn']").on("click", viewPicList);
				$("a[name='deleteBtn']").on("click", delData);
				
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	
    
	function reset() {       
		form[0].reset();
	}
	
	$("#btnReset").bind("click", reset);
	
	function add() {       
		window.location.href=$('#addUrl').val();
	}
	
	$("#btnAdd").bind("click", add);
	
	function viewEdit(){
		location.href=$('#updateUrl').val()+"?group_id="+$(this).attr('group_id');
	}
	
	function viewaddPic(){
		location.href=$('#addpicUrl').val()+"?id="+$(this).attr('id');  //此 id 为 title id
	}
	
	function viewPicList(){
		location.href=$('#picListUrl').val()+"?title_id="+$(this).attr('id');  //此 id 为 title id
	}	
	
	
	//删除推荐
	function delData() {
		var group_id = $(this).attr('group_id');
			var url = $('#delareaUrl').val();
			$.ajax({
				type : 'GET',
				url :url ,
				data : {
					group_id : group_id
				},
				async : false,
				success : function(response) {
					if (response.status) {
						load(1,PAGE_SIZE);
					}else{
						alert(response.msg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert('删除失败');
				}
			});
	}
	
	
});
