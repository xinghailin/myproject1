define(function(require, exports, module) {
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
	submitButton.attr('disabled', 'disabled');
	
	handlebars.registerHelper('formatDatetime', _formatDatetime);
	handlebars.registerHelper('addButton', _addButton);
//	handlebars.registerHelper('showDialogue', showDialogue);
//	handlebars.registerHelper('showEditForm', showEditForm);
//	handlebars.registerHelper('formatType', _formatType);
//	handlebars.registerHelper('formatDefault', _formatDefault);
	
	$(function() {//alert("$");
//		push();
		load(1,PAGE_SIZE);
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);
	});
    
//	function keyValue(key,value){
//		this.key=key;
//		this.value=value;
//	}
	//表单搜索
	function dataSearch(dataObj){
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
    
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + '.json?startPage=' + curPageNo + '&pageSize=' + pageSize; // 查询数据url
//		var params = searchCondition + '&startPage=' + curPageNo + '&pageSize=' + pageSize ;
//		queryUrl = queryUrl + '?' + params;
//		$('#searchedParams').val(params) ;
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			//push(response.basicDataType);
			if (response && response.lst && response.lst.length) {
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
			$("a[name='deleteBtn']").on("click", delBasicData);
		});
	};
	
	//
//	function push(){
//		var md=$('#type');
//		var alloption=md.find('option');
//		var len=alloption.size();//alert(len);
//		for(i=0;i<len;i++){
//			if(alloption[i].value)
//			{obj.push(new keyValue(alloption[i].value,alloption[i].text));
//			//alert((alloption[i].value+"+++"+alloption[i].text))
//			}
//		}
//	}
	
	//以下函数用于定义页面显示
	//根据编码值显示对应的select中的文本值
//	function _displayText(code, selectId) {
//		var options = document.getElementById(selectId).options;
//		for ( var i = 0, len = options.length; i < len; i++) {
//			if (options[i].value === String(code)) {
//				return options[i].text;
//			}
//		}
//		return '';
//	}
	// 3位1逗号
//	function _addComma(amount) {
//		if (amount === null) {
//			return '';
//		}
//		amount += '';
//		var x = amount.split('.'), x1 = x[0].replace(/\d+?(?=(?:\d{3})+$)/g, '$&,'), x2 = x.length > 1 ? '.' + x[1] : '';
//		return x1 + x2;
//	}
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
	//添加修改角色按钮
	function _addButton(id){
		var nbsp = "&nbsp;";
		var edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_03 margin_let10' id='"+id+"'/>").html('<span>修改</span>');
		var del = $("<a href='javascript:void(0);' target='_self' name='deleteBtn' class='btn63_04 margin_let10' id='"+id+"'/>").html('<span>删除</span>');
		var html=$('<span />').html(edit).append(nbsp).append(del).append(nbsp).html();
		return new handlebars.SafeString(html); 
	}
	
	//格式化类型
//	function _formatType(key){
////		var html=obj[key];
////		return new handlebars.SafeString(html); 
//		var len=obj.length;
//		for(var i=0;i<len;i++){
//			if(obj[i].key==key){return obj[i].value;}
//		}
//	}
	
	//是否默认
//	function _formatDefault(key){
//		return key=='1'?"是":"否" ;
//	}
	
	
	//以下函数按钮事件处理函数
	function showEditForm(){
		var id=$(this).attr('id');
		var addRoleUrl = $("#editUrl").val()+"?id="+id;
		showDialogue(addRoleUrl, 600, 450);
	}
	
	function showAddForm() {
		var addUrl = $("#addUrl").val();
		showDialogue(addUrl, 600, 450);
	}
    
	function delBasicData() {
		var id = $(this).attr('id');
		$.dialog('请确认删除此基础数据! 否则请关闭该对话框', function(){
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
					if (response.status == 1) {
						$.dialog('删除成功', function(){
							window.location.href = window.location.href;
						});
					} else {
						$.dialog(response.msg, function(){});
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					$.dialog('删除失败', function(){});
				}
			});
		});
	}
	
//	function configResource(){
//		var id = $(this).attr('id');
//		var configResourceUrl = $("#configResourceUrl").val()+"?id="+id;
//		showDialogue(configResourceUrl, 600, 300);
//	}
	
	function showDialogue(url,w,h){
		var iWidth = w;
		var iHeight = h;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
		var win = window.open(url, "弹出窗口24", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
	}

	function reset() {
		$("#searchForm")[0].reset();
	}
	
	
	//绑定按钮事件
	// 新增
	$("#addBtn").bind("click", showAddForm);
	// 重置
	$("#resetBtn").bind("click", reset);
	submitButton.removeAttr('disabled');
    //submitButton.trigger("click");
	//alert("end");
 });