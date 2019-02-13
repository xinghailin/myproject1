var arr={};
define(function(require, exports, module) {
	require('art-dialog')($);
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
	handlebars.registerHelper('_formatSealstatus', _formatSealstatus);
	handlebars.registerHelper('_formatSimpleDatetime', _formatSimpleDatetime);
	handlebars.registerHelper('_formatStatus', _formatStatus);
	handlebars.registerHelper('_addButton', _addButton);
	var globe_context_id = $('#globe_context_id').val() ;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});

	//格式化 流程步骤
	function _formatSealstatus(status,uploadstatus) {
		if (status === 1) {
			return '未审核';
		}
		if (status === 2) {
			return '审核不通过';
		}
		if (status === 3) {
			return '审核通过';
		}
		if (status === 4) {
			return '甲方盖章不成功';
		}
		if (status === 5) {
			if(uploadstatus === 1){
				return '乙方盖章成功';
			}else if (uploadstatus === 2){
				return '甲方盖章成功';
			}
			
		} 
		if (status === 6) {
			return '合同生效';
		}
		
		
		return "**";
	}
	
	//格式化 合同状态
	function _formatStatus(status) {
		if (status === 1) {
			return '正常';
		}
		if (status === 3) {
			return '作废';
		}
		
		return "**";
	}
	// 格式化时间
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

	function _addButton(id,status){
		    var nbsp = "&nbsp;";
		    var check = "&nbsp;";
		   if(1 == status){
			   check = $("<a href='javascript:void(0);' target='_self' name='delBtn' class='btn63_03' id='"+id+"' />").html('<span>作废</span>');
		   }
			var look = $("<a href='javascript:void(0);' target='_self' name='viewlookBtn' class='btn63_03' id='"+id+"'/>").html('<span>查看</span>');
			var html=$('<span />').append(check).append(nbsp).append(look).append(nbsp).html();
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
				$("a[name='delBtn']").on("click", viewdel);
				$("a[name='viewlookBtn']").on("click", viewLook);
				$("[name='orderID']:checkbox").bind("click", function() {
					var th = $(this)
					if (th.prop("checked")) {
						if (arr[th.val()]) {
						} else {
							arr[th.val()] = 1
						}
					} else {
						if (arr[th.val()]) {
							delete arr[th.val()]
						}
					}
				});
				
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
	

	  function viewdel() {
		  var url = $('#checkUrl').val();
		  var id = $(this).attr('id');
		$.dialog('确定删除？', function() {
			$.ajax(url, {
				type : 'POST',
				dataType : 'json',
				data : {
					id : id
				}
			}).done(function(response) {
				if (response.rescode == '1') {
					alert(response.result);
				} else {
					alert("提示：" + response.result);
				}
				window.location.reload();
			})
		})
	}
	
	function viewLook(){
		location.href=$('#lookUrl').val()+"?id="+$(this).attr('id');  
	}
		
	
});

