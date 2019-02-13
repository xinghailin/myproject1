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
	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
	handlebars.registerHelper('_formatlanguage', _formatlanguage);
	handlebars.registerHelper('formatPic', _formatPic);
	handlebars.registerHelper('addButton', _addButton);
	var globe_context_id = $('#globe_context_id').val() ;
	var ftpFileUrl = $('#ftpFileUrl').val() ;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});

	function _formatSimpleDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) + ' '
				+ _fillZero(datetime.getHours()) + ':' + _fillZero(datetime.getMinutes()) + ':' + _fillZero(datetime.getSeconds());
	}
	
	function _formatlanguage(language) {
		if ("chinese" === language) {
			return '中文';
		}
		if ("english" === language) {
			return '英文';
		}
		if ("spaish" === language) {
			return '西班牙语';
		}
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
			var del = $("<a href='javascript:void(0);' target='_self' name='deleteBtn' class='btn63_02 margin_let10' id='"+id+"'/>").html('<span>删除</span>');
			var html=$('<span />').append(edit).append(nbsp).append(del).html();
			return new handlebars.SafeString(html); 
		
	}
	//表单搜索
	function dataSearch(dataObj){
		//searchCondition = form.serialize();
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
				$("a[name='deleteBtn']").on("click", delData);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	
	function backFun(){
		window.location.href=$('#nextUrl').val();
    }
	$("#backBtn").bind("click",backFun);
	
	function add() {       
		window.location.href=$('#addUrl').val();
	}
	
	$("#btnAdd").bind("click", add);
	
	function viewEdit(){
		location.href=$('#updateUrl').val()+"?pic_id="+$(this).attr('id');
	}
	
	//删除推荐
	function delData() {
		var id = $(this).attr('id');
			var url = $('#delpicUrl').val();
			$.ajax({
				type : 'GET',
				url :url ,
				data : {
					title_id : id
				},
				async : false,
				success : function(response) {
					if (response.status) {
						load(1,PAGE_SIZE);
					} else {
						$.dialog('无记录删除', function(){});
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					$.dialog('删除失败', function(){});
				}
			});
	}
	
	//格式化图片
	function _formatPic(src){
		src = src==null||src==''?ftpFileUrl:ftpFileUrl+src;
		return new handlebars.SafeString(src);
	}
	
});
	//显示头像
	function showPic(a, sUrl) {
		var x, y;
		var event = a ? a : window.event;
		var mX = event.x ? event.x : event.pageX;
		var my = event.y ? event.y : event.pageY;
		x = event.clientX;
		y = event.clientY;
		var div = $("#imgLayer");
		div.css("left",x);
	    div.css("top",y);
	    div.css("left",mX+10+"px");
	    div.css("posTop",my+10 +"px");
	    div.html("<img style='float:left;'  heith='160' width='160'  src=\"" + sUrl + "\">") ;
	    div.css("display","block");
	}
	//隐藏头像
	function hiddenPic() {
		var div = $("#imgLayer");
		div.html("") ;
		div.css("display","none");
	}
	
	

