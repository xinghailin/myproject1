define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var submitButton = $("#searchBtn");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var mainview=$('#MainView');
	var subview=$('#EA');
	var curPP,addoredit,deleteUrl= $("#deleteUrl").val();
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('addButton', _addButton);
	handlebars.registerHelper('formatPic', _formatPic);
	handlebars.registerHelper('formatTime', _formatDatetime);
//	handlebars.registerHelper('formatCh', _formatCh);
	var searchUrl = $('#searchUrl').val() + '.json'; 
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		load(1,PAGE_SIZE);
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);
	});
    function saveFun(){
//    	if(!subview.find('#Tchannel').val()){$.dialog('请选择频道', function(){});return false;}
//    	var img=subview.find('#Tpic').val();
//    	var pi=subview.find('#productImg').prop("src");alert(pi);return false;
//    	if(!img){$.dialog('请选择图片', function(){});return false;}
		var ts=subview.find('#Tsort').val();
		if(ts){
		if((/^\d{0,3}$/).test(ts))
		{
			$('#editForm').submit();
			}
		else{
			$.dialog('排序为有效正整数【0~999】', function(){});
			return false;
			}
		}
		else{$('#editForm').submit();}
    }
	//表单搜索
	function dataSearch(dataObj){
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = searchUrl + '?startPage=' + curPageNo + '&pageSize=' + pageSize;
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json'
		}).done(function(response) {
			if (response && response.lst && response.lst.length) {
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
			$("a[name='editBtn']").on("click", showEditForm);
			$("a[name='deleteBtn']").on("click", delData);
			$('img').bigic();
		});
	};
	//删除推荐
	function delData() {
		var id = $(this).attr('id');
		$.dialog('请确认删除! 否则请关闭该对话框', function(){
			var url = deleteUrl;
			$.ajax({
				type : 'POST',
				url : url + '.json',
				dataType : 'json',
				data : {
					id : id
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
		});
	}
	function reset() {
		$("#searchForm")[0].reset();
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
	//添加修改角色按钮
	function _addButton(id){
		var nbsp = "&nbsp;";
		var edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_01 margin_let10' id='"+id+"'/>").html('<span>修改</span>');
		var del = $("<a href='javascript:void(0);' target='_self' name='deleteBtn' class='btn63_02 margin_let10' id='"+id+"'/>").html('<span>删除</span>');
		var html=$('<span />').html(edit).append(nbsp).append(del).append(nbsp).html();
		return new handlebars.SafeString(html); 
	}
	var globe_context_id = $('#globe_context_id').val() ;
	//格式化图片
	function _formatPic(src){
//		src = src==null||src==''?globe_context_id+'/images/mg_01.png':globe_context_id+src;
		return new handlebars.SafeString(globe_context_id+src);
	}
	function _formatCh(channelId){
		if(channelId==1)return "蜡笔兔管家";
		else if(channelId==2)return "蜡笔兔";
		return "";
	}
	//隐藏主页面，显示修改页面
	function showEditForm(){
//		addoredit=1;
		var theId=$(this).attr('id');
		subview.find('#hideId').val(theId);
		var pp=$(this).parent().parent();
//		var channel=pp.find('td:eq(0)').html();
		var link=pp.find('td:eq(0)').html();
		var psrc=pp.find('td:eq(1)').children().prop('src');
		var sort=pp.find('td:eq(2)').html();
//		subview.find('#Tchannel').val($(this).attr('channelId'));
		subview.find('#Turi').val(link);
		subview.find('#productImg').prop("src",psrc);
//		subview.find('#Tpic').val("src",psrc);
//		var file = subview.find('#Tpic');
//		file.after(file.clone().val("")); 
//		file.remove(); 
		subview.find('#Tpic').val("");
		subview.find('#Tsort').val(sort);
		subview.find('#He').html("banner修改");
		mainview.hide();subview.show();
	}
	//隐藏主页面，显示添加页面
	function showAddForm() {
//		addoredit=0;
		//清空隐藏域
		subview.find('#hideId').val('');
		//初始化内容
		subview.find('#Turi').val('');
		subview.find('#productImg').prop("src",'');
		subview.find('#Tpic').val("");
		subview.find('#Tsort').val('');
		subview.find('#He').html("banner新增");
		mainview.hide();subview.show();
	}
	function goback(){
		mainview.show();subview.hide();
	}
	//绑定新增按钮事件
	$("#addBtn").bind("click", showAddForm);
	$('#saveBtn').bind("click",saveFun);
	$('#cancelBtn').bind("click",goback);
	// 重置
	$("#resetBtn").bind("click", reset);
	/*$(function(){
		$.ajax({
			//请求方式（post或get）默认为get。注意其他http请求方法，例如put和delete也可以使用，但仅部分浏览器支持。
		    type: 'POST',
		    //String类型URL请求字符串。默认为当前页地址
		    url: "http://www.baidu.com/12345.action" ,
		    //// 发送到服务器的数据，它将被自动转为字符串类型。如果是GET请求，它将被附加到URL后面。jQuery会自动将对象数据转换为 "name=codeplayer&age=18&uid=1&uid=2&uid=3"
		    data: { name:"codeplayer", age:18, uid: [1, 2, 3] } ,
		    // 服务器返回的数据类型：
		    //xml：返回XML文档，可用JQuery处理。
		    //json：返回JSON数据
		    //text：返回纯文本字符串。
		    dataType: "json", 
		    // 同步请求，发送请求后浏览器将被锁定，只有等到该请求完成(无论成功或失败)后，用户才能操作，js代码才会继续执行
		    async: false,
		    //指定请求完成(无论成功或失败)后需要执行的回调函数。该函数还有两个参数：
		    //一个是jqXHR对象，一个是表示请求状态的字符串('success'、 'notmodified'、 'error'、 'timeout'、 'abort'或'parsererror')。
		    complete:function(textStatus, jqXHR){
		    },
		    // 假设返回的字符串数据为{ "name": "CodePlayer", age: 20 }
		    // jQuery已帮我们将该JSON字符串转换为对应的JS对象，可以直接使用
		    success: function( data, textStatus, jqXHR ){
		        alert( data.name ); // CodePlayer
		    } ,
		    // 请求失败时执行
		    // errorMsg 可能为： "Not Found"、"Internal Server Error"等
		    error: function(jqXHR, textStatus, errorMsg){
		        alert("请求失败：" + errorMsg);
		    }
		});
	});*/
	submitButton.removeAttr('disabled');
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
function imagePreview(obj,imgObj){
	var f = $('#'+obj).prop ('files')[0];
	var src = window.URL.createObjectURL(f);
	$('#'+imgObj).attr('src',src) ;
}