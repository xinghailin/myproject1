define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var sArr=[];
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_operate', operate);
	handlebars.registerHelper('_status', status);
//	var globe_context_id = $('#globe_context_id').val() ;
	  var shopid=$('#shopid').val();
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询

	});
	function status(status){
		if(status==1){
			return "审核通过";
		}else if(status==2){
			return "审核不通过";
		}else{
			return "未审核";
		}
	};
	function operate(id,status){
		var type=$('#type').val();
		var nbsp = "&nbsp;";
		var edit,look,update,repeal;
		var html='';
		if(type==1){//编辑和修改
			if(shopid!=""){
				look = $("<a href='javascript:void(0);' target='_self' name='look1Btn' class='btn63_03' id='"+id+"'/>").html('<span>查看</span>') ;
				html=$('<span />').append(look).html();
			}else{
				if (status==1) {
					look = $("<a href='javascript:void(0);' target='_self' name='look1Btn' class='btn63_03' id='"+id+"'/>").html('<span>查看</span>') ;
					html=$('<span />').append(look).html();
				}else if(status==null){//未审核可以撤销
					look = $("<a href='javascript:void(0);' target='_self' name='look1Btn' class='btn63_03' id='"+id+"'/>").html('<span>查看</span>') ;
					repeal=$("<a href='javascript:void(0);' target='_self' name='repealBtn' class='btn63_03' id='"+id+"'/>").html('<span>撤销</span>') ;
					html=$('<span />').append(look).append(nbsp).append(repeal).html();
				}else if(status==2||status==3){//审核不通过 或撤销是可以编辑
					look = $("<a href='javascript:void(0);' target='_self' name='look1Btn' class='btn63_03' id='"+id+"'/>").html('<span>查看</span>') ;
					update=$("<a href='javascript:void(0);' target='_self' name='updateBtn' class='btn63_03' id='"+id+"'/>").html('<span>编辑</span>') ;
					html=$('<span />').append(look).append(nbsp).append(update).html();
				}
			}
		}else{//审核列表显示
			if (status==1||status==2||status==3) {//1是审核通过 2 审核不通过 3门店撤销
				look = $("<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"+id+"'/>").html('<span>查看</span>') ;
				html=$('<span />').append(look).html();
			}else{
				look = $("<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"+id+"'/>").html('<span>查看</span>') ;
				edit = $("<a href='javascript:void(0);' target='_self' name='audit' class='btn63_03' id='"+id+"'/>").html('<span>审核</span>');
				html=$('<span />').append(look).append(nbsp).append(edit).html();
			}
		}	
		return new handlebars.SafeString(html);
	}
	
	function audit(){
		var $this=$(this);
		var theId=$this.attr('id');//audit=1 代表是到审核页面
		window.location.href=$('#leasebackdetails').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&loginId="+$('#loginId').val()+"&audit=1"+"&type=2";
	}
	
	//查看详情
	/**
	 * 编辑查看详情
	 */
	function leasebackdetails1(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#leasebackdetails').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&loginId="+$('#loginId').val()+"&type=2";
	}
	//审核查看详情
	function leasebackdetails(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#leasebackdetails').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&loginId="+$('#loginId').val()+"&type=3";
	}
	//修改
	function updateleaseback(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href=$('#leasebackdetails').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&update=1"+"&type=2";
	}
	//撤销
	function repealleaseback(){
		var $this=$(this);
		var theId=$this.attr('id');
		var repealleaseback=$('#repealleasebackUrl').val()+"?id="+theId;
		 $.ajax({
            url:repealleaseback,
            type:'post',
            datatype:'json',
    }).done(function(response) {
		if (response.status) {
			$.dialog('撤销成功！', function(){
				location.href=$('#backUrl').val()+"?currpage="+$('#J_CurPageNo').text()+"&type=1";
				})//加载数据列表)}
		} else {
			$.dialog(response.msg, function(){})
		}
	});
	}
	function delCar(){
		var $this=$(this);
		var theId=$this.attr('id');
		$.dialog('确定删除？', function(){
		var del=$('#deleteUrl').val()+"?id="+theId;
		$.ajax(del, {
			type : 'get', 
			dataType : 'json'
		}).done(function(response) {
			if (response.status) {
				$.dialog('删除成功！', function(){
					load(1,PAGE_SIZE);
				});
			}else{
				$.dialog('需求单已经绑定采购', function(){
				});
			} 
		})});
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
		var queryUrl;
		if(shopid){
			queryUrl = $('#searchshopgroupUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize+"&shopid="+shopid; // 查询数据url
		}else {
			 queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize+"&shopid="+shopid; // 查询数据url
		}
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			if (response.result.length>0) {
				dataList.html(template(response)).css('height', 'auto');
				pagination.init({
					'pageSize' : PAGE_SIZE,
					'totalCount' : response.num,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
				$("a[name='audit']").on("click", audit);
				$("a[name='lookBtn']").on("click", leasebackdetails);
				$("a[name='look1Btn']").on("click", leasebackdetails1);
				
				$("a[name='updateBtn']").on("click", updateleaseback);
				$("a[name='repealBtn']").on("click", repealleaseback);
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
	$("#btnReset").bind("click", reset);
//	$(function(){
//		$msg=$('#hideMsg');
//		if($msg.val())$.dialog($msg.val(), function(){});
//	})
});