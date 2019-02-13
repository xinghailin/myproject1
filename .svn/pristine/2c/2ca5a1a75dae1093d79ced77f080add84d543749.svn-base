define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#starttime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var checkval = [];
	var userCountry=$('#userCountry').val();
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');

	handlebars.registerHelper('_operate', operate);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('mode', mode);
	handlebars.registerHelper('_supplycarstatus', _supplycarstatus);
	handlebars.registerHelper('_type', _type);
	var globe_context_id = $('#globe_context_id').val() ;
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		checkval.splice(0,checkval.length);
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	function mode(financetype,type){
		if (financetype==1&&type==2) {
			return "样车金融";
		}else if(financetype==2&&type==2){
			return "采购金融";
		}
	}
	function _supplycarstatus(supplycarstatu){
		if(supplycarstatu==1){
			return "配车中";
		}else if(supplycarstatu==2){
			return "运输中";
		}
	}
	function _type(key){
		if(key==0){
			return "虚拟";
		}else if(key==1){
			return "自营";
		}else if(key==2){
			return "城市合伙人";
		}else if(key==3){
			return "寄售";
		}
	}
	function operate(cid){
		var nbsp = "&nbsp;";
		var add = $("<a href='javascript:void(0);' target='_self' name='addBtn' class='btn63_03' id='"+cid+"'/>").html('<span>车况汇报</span>') ;
		var look = $("<a href='javascript:void(0);' target='_self' name='lookBtn' class='btn63_03' id='"+cid+"'/>").html('<span>车况查看</span>') ;
		var html=$('<span />').append(add).append(nbsp).append(look).html();
		return new handlebars.SafeString(html);
	}
	//格式化时间
	function _formatDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) ;
	}
	function lookBtn(){
		var $this=$(this);
		var theId=$this.attr('id');
		realsale=$('#addcaseUrl').val()+"?id="+theId+"&type=1";//查看
		showDialogue(realsale, 600, 600);
	};
	function addBtn(){
		var $this=$(this);
		var theId=$this.attr('id');
		var realsale = $("#addcaseUrl").val()+"?id="+theId+"&type=2";//添加
		showDialogue(realsale, 600, 600);
	};
	function showDialogue(url,w,h){
		var iWidth = w;
		var iHeight = h;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
		var win = window.open(url, "弹出窗口6", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
	};
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
	Array.prototype.unique3 = function(){
   	 var res = [];
   	 var json = {};
   	 for(var i = 0; i < this.length; i++){
   	  if(!json[this[i]]){
   	   res.push(this[i]);
   	   json[this[i]] = 'a';
   	  }
   	 }
   	 return res;
   	}
	//分页数据加载
	function load(curPageNo, pageSize) {
		var obj =$("input[name='carid']:checked");
	    for(k in obj){
	        if(obj[k].checked)
	            checkval.push(obj[k].value);
	    }
	    checkval=checkval.unique3();
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
					'totalCount' : response.num,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
//				$('img').bigic();
				$("a[name='lookBtn']").on("click", lookBtn);
				$("a[name='addBtn']").on("click",addBtn);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
	function submit(){
		var obj =$("input[name='carid']:checked");
	    for(k in obj){
	        if(obj[k].checked)
	            checkval.push(obj[k].value);
	    }
	    checkval=checkval.unique3();
	    if (checkval.length>0) {
	    	location.href=$('#shopUrl').val()+"?checkval="+checkval;
	    }else{
	    	alert("请选择要配的车");
	    }
	}
	$(document).ready(function(){
		  $(".clear").change(function(){
			  checkval.splice(0,checkval.length);//清空数组 
		  });
		});
	
	function reset() {       
		form[0].reset();
	}
	$("#btnReset").bind("click", reset);
	$("#submit").bind("click", submit);
});
