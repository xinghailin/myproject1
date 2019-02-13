define(function(require, exports, module) {
	//require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	var PAGE_SIZE = 10;
	var checkval = [];
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null ;
	source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	function editCar(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href = $('#editUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text();
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
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize+"&buyid="+$('#buyid').val()+"&paytype="+$('#paytype').val()+"&cbuyid="+$('#cbuyid').val()+"&cid="+$('#cid').val()+"&selfbuy="+$('#selfbuy').val(); // 查询数据url
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
	//绑定新增按钮事件
	$("#btnReset").bind("click", reset);
	function havechoose(){
			var obj =$("input[name='buyID']:checked");
			var ch=0;
		    for(k in obj){
		        if(obj[k].checked)
		            checkval.push(obj[k].value);
		    }
		    for(var i=0;i<checkval.length;i++){
		    	ch+=','+checkval[i];
		    }
		    if(checkval.length==0){
		    	 $.dialog("Please select contract!", function(){})
					return false;
		   }else{
			   var paytype=$('#paytype').val();
			   	window.opener.document.getElementById("checkval").value="";
			   	window.opener.document.getElementById("paytype").value=paytype;
				window.opener.document.getElementById("checkval").value=ch;
				window.close();
				window.opener.loads();
			
			}
	}
	function back(){
		location.href=$('#backUrl').val()+"?currpage="+$('#currpage').val();
	}
	function close(){window.close()}
	$("#sureBtn").bind("click", havechoose);
	$("#closeBtn").bind("click", close);
	$("#back").bind("click", back);
});