define(function(require, exports, module) {
	require('../../base/validation-proxy');
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var PAGE_SIZE = 10;
	var submitButton = $("#searchBtn");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null;
	var obj = new Array() ;
	
	submitButton.attr('disabled', 'disabled');
	
	handlebars.registerHelper('formatDatetime', _formatDatetime);
	handlebars.registerHelper('formatStatus', formatStatus);
	handlebars.registerHelper('addButton', _addButton);
	handlebars.registerHelper('showDialogue', showDialogue);
	handlebars.registerHelper('showEditForm', showEditForm);
    
	$(function() {
		load(1,PAGE_SIZE);
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);
		$("#batchResetBtn").bind("click",showResetPwdForm);
	});
    function formatStatus(status){
    	if(status==1)return '正常';
    	if(status==0)return '已停用';
    	return '';
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
		var queryUrl = $('#searchUrl').val() + '.json'; // 查询数据url
		queryUrl = queryUrl + '?startPage=' + curPageNo + '&pageSize=' + pageSize;
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
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
			$("a[name='editBtn']").on("click", showEditForm);
			$("a[name='ableBtn']").on("click", ableUser);
			$("a[name='deleteBtn']").on("click", delUserData);
		});
	};
	//启用/停用用户
	function ableUser() {
		var $this=$(this);
		var id = $this.attr('id');var st=$this.attr('status');
//		$.dialog('请确认删除此用户! 否则请关闭该对话框', function(){
			var ableUrl = $("#ableUrl").val();
			$.ajax({
				type : 'POST',
				url : ableUrl + '.json',
				dataType : 'json',
				data : {
					id : id,status:st
				},
				async : false,
				success : function(response) {
					if (response.status) {
//						$.dialog('删除成功', function(){
//							window.location.href = window.location.href;
							load($('#J_CurPageNo').text(),PAGE_SIZE);
//						});
					} else {
						$.dialog('稍后再试一下吧', function(){});
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					$.dialog('出错了。。。', function(){});
				}
			});
//		});
	}
	
	//删除用户
	function delUserData() {
		var id = $(this).attr('id');
		$.dialog('请确认删除此用户! 否则请关闭该对话框', function(){
			var deleteUrl = $("#deleteUrl").val();
			$.ajax({
				type : 'GET',
				url : deleteUrl + '.json',
				dataType : 'json',
				data : {
					id : id
				},
				async : false,
				success : function(response) {
					if (response.status > 0) {
						$.dialog('删除成功', function(){
//							window.location.href = window.location.href;
							load(1,PAGE_SIZE);
						});
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
	
	//添加修改角色按钮
	function _addButton(id,status){
		var nbsp = "&nbsp;";
		var st=status==1?"停用":"启用";
		var edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03 margin_let10' id='"+id+"'/>").html('<span>修改</span>');
		var able = $("<a href='javascript:void(0);' target='_self' name='ableBtn' class='btn63_03 margin_let10' status='"+status+"' id='"+id+"'/>").html('<span>'+st+'</span>');
		var del = $("<a href='javascript:void(0);' target='_self' name='deleteBtn' class='btn63_04 margin_let10' id='"+id+"'/>").html('<span>删除</span>');
		var html=$('<span />').html(edit).append(nbsp).append(able).append(nbsp).append(del).append(nbsp).html();
		return new handlebars.SafeString(html); 
	}
	
	//以下函数按钮事件处理函数
	function showEditForm(){
		var id=$(this).attr('id');
		var editUrl = $("#editUrl").val()+"?id="+id;
		showDialogue(editUrl, 600, 450);
	}
	
	function showAddForm() {
		var addUrl = $("#addUrl").val();
		showDialogue(addUrl, 600, 450);
	}
	
	//重置密码开窗
	function showResetPwdForm(){
		if($("input[name = userID]:checked").length == 0){
			$.dialog('请至少选择一条记录', function(){});
			return;
		}
		var idStr="";
		$("input[name = userID]:checked").each(function(){
			var id=$(this).attr('id');
			idStr+=id.substring(6)+" ";
		});
		var resetPwdUrl = $("#resetPwdUrl").val()+"?idStr="+idStr;
		showDialogue(resetPwdUrl, 650, 700);
	}
	
	function showDialogue(url,w,h){
		var iWidth = w;
		var iHeight = h;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
		var win = window.open(url, "弹出窗口25", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
	}
    
	//格式化日期
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

	//绑定新增按钮事件
	$("#addBtn").bind("click", showAddForm);
	// 重置
	$("#resetBtn").bind("click", reset);
	submitButton.removeAttr('disabled');
    submitButton.trigger("click");
    
});

//全选 反选
function checkAllUser() {
	 $("[name = userID]:checkbox").each(function () {
      $(this).prop("checked", !$(this).prop("checked"));
    });
}

/**
 * 重置查询条件
 * @param name
 * @param status
 * @param type
 */
function resetConditions(userName,name,code){
	
	location.reload();
	
	if(userName.length > 0 && userName != "") $("#userName").val(userName);
	
	if(name.length > 0 && name != "") $("#name").val(name);
	
	if(code.length > 0 && code != "") $("#code").val(code);
	
}