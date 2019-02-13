define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#leaveFactoryTime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
//	var sArr=[];
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	/*require('../base/jquey-bigic');
	require('../../styles/common/bigic.css');*/
	handlebars.registerHelper('_operate', operate);
	var globe_context_id = $('#globe_context_id').val() ;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
	if($('#currency').val()==1){
			$('p').html('C$');
	}else if($('#currency').val()==2){
			$('p').html('$');
	}
//		pushAll();
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);//tax refund file and clearance of goods file download
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	function operate(id){
		var nbsp = "&nbsp;";
		var look = $("<a href='javascript:void(0);' target='_self' name='look2Btn' class='btn63_03' id='"+id+"'/>").html('<span>查看(view)</span>') ;
		var html=$('<span />').append(look).html();
		return new handlebars.SafeString(html);
	}
	function look2Btn(){//详情查看
		var $this=$(this);
		var audit=$('#audit').val();
		var finals=$('#finals').val();
		var theId=$this.attr('id');
		window.location.href=$('#detailsUrl').val()+"?id="+theId+"&audit="+audit+"&payid="+$('#id').val()+"&finals="+finals+"&username="+$('#username').val();//audit=1 是从添加付款申请过来的 audit=2 是从审核过来的
	}
	//补零
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
	/*function pushAll(){
		var styleLst=$('#address');
		var slo=styleLst.find('option');
		var ss=slo.size();
		for(var i=0;i<ss;i++){
			if(slo[i].value){sArr.push(slo[i]);}
		}
	}*/
	//表单搜索
	function dataSearch(dataObj){
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize) ;
	}
	datepickerUtil.datesTrigger('#createtime', null, null);
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val()+"?id="+$('#id').val()+"&start="+curPageNo+"&pageSize="+pageSize;; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			$('#loginId').val(response.loginId);
			if (response.result.length>0) {
				dataList.html(template(response)).css('height', 'auto');
				pagination.init({
					'pageSize' : PAGE_SIZE,
					'totalCount' : response.total,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
				$("a[name='look2Btn']").on("click", look2Btn);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	function reset() {       
		form[0].reset();
	}
	function Updateback(){
		location.href=$('#freightApplyUpdatepageUrl').val()+'?currpage='+$('#currpage').val();
	}
	function cancel(){
		location.href=$('#njndpayapplyauditindexUrl').val()+'?currpage='+$('#currpage').val();
	}
	function back(){
		location.href=$('#njndpayapplyauditindexUrl').val()+'?currpage='+$('#currpage').val();
	}
	var status=true;
	function submit(){
		var freightCarupdateUrl=$('#updatecontractUrl').val()+"?id="+$('#id').val()+"&currpage="+$('#currpage').val()+"&username="+$('#username').val();
		if(status){
			status=false;
		$.ajax({
             url:freightCarupdateUrl,
             type:'post',
             datatype:'json',
     }).done(function(response) {
		if (response.status) {
			$.dialog('审核通过！', function(){location.href=$('#njndpayapplyauditindexUrl').val()+'?currpage='+$('#currpage').val();})
		} else {
			$.dialog(response.msg, function(){})
		}
	});}
	}
	function submit1(){
		var c=$('#cause').val();
		if (c.trim().length==0) {
			$.dialog("审核不通过原因必填！", function(){})
		}else{
			var freightCarupdateUrl=$('#updatecontractNoPassUrl').val()+"?id="+$('#id').val()+"&currpage="+$('#currpage').val()+"&cause="+$('#cause').val()+"&username="+$('#username').val();
			if(status){
				status=false;
			$.ajax({
		        url:freightCarupdateUrl,
		        type:'post',
		        datatype:'json',
			 }).done(function(response) {
					if (response.status) {
						$.dialog('提交成功！', function(){location.href=$('#njndpayapplyauditindexUrl').val()+'?currpage='+$('#currpage').val();})
					} else {
						$.dialog(response.msg, function(){})
					}
				});
			}
		}
	}
	
	function submit3(){
		var selfbuy=$('#selfbuy').val();
		var finalpay=$('#finalpay').val();
		var othercosturl=$('#othercosturl1').val();
		var othercost=$('#othercost').val();
		var trimurl=$('#trimurl2').val();
		var otherurl=$('#otherurl').val();
		var reg = /^(((\d*).\d+)|(\d+.(\d*)|\d+))$/;
		if(selfbuy==1){
			if(!reg.test(finalpay)){
				 $.dialog("money format incorrect!", function(){ $('#finalpay').focus()})
					return false;
			}else if(!reg.test(othercost)){
				$.dialog("money format incorrect!", function(){ $('#othercost').focus()})
				return false;
			}
			$(".money").each(function(){
			 	 var result=$(this).val();
			 	 var that=this;
			 	 if(result!=""){if(!reg.test(result)){
			 		 $.dialog("money format incorrect!", function(){$(that).focus()})
						return false;
			 	}
			 	 }
			 });
		 if(othercosturl==""){
				 $.dialog("4S Miscellaneous files!", function(){$('#othercosturl1').focus()})
					return false;
			}
		}else if(!reg.test(finalpay)){
			 $.dialog("money format incorrect!", function(){ $('#finalpay').focus()})
				return false;
		}
		var finalsubmitUrl=$('#finalsubmitUrl').val()+"?id="+$('#id').val();
		 var formData = new FormData($( "#searchForm" )[0]); 
		 if(status){
			 status=false;
		 $.ajax({
		        url:finalsubmitUrl,
		        type:'post',
		        datatype:'json',
		        data: formData,
	            async: false,  
	            cache: false,  
	            contentType: false,  
	            processData: false, 
			 }).done(function(response) {
					if (response.status) {
						$.dialog('提交成功！', function(){location.href=$('#back1Url').val()+'?currpage='+$('#currpage').val();})
					} else {
						$.dialog(response.msg, function(){})
					}
				});
		 }
	}
	function back1(){
		location.href=$('#back1Url').val()+"?currpage="+$('#currpage').val();
		
	}
	$("#back").bind("click", back);
	$("#cancel").bind("click", cancel);
	$("#submit").bind("click",submit);
	$("#submit1").bind("click",submit1);
	$("#submit3").bind("click",submit3);
	$("#back1").bind("click",back1);
	
});
