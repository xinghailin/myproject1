define(function(require, exports, module) {
	require('jquery-css');require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	var PAGE_SIZE = 10;
	var checkvalc = [];
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
	/*var s = "abc,abcd,aaa";
	ss = s.split(",");// 在每个逗号(,)处进行分解。
*/	//分页数据加载
	var cid=$('#cid').val();//付款申请单id
	function load(curPageNo, pageSize) {
		
		var checkval= $('#checkval').val();
		checkvalc=checkval.split(",");
        dataList.show();
		noDataMsg.hide();
		if(checkval.length>1){
				var queryUrl = $('#searchUrl').val() + "?checkvalc="+checkvalc+"&paytype="+$('#paytype').val(); // 添加显示url}
			} else{
				var queryUrl = $('#updateUrl').val() + "?id="+cid;}// 编辑显示url}
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		}).done(function(response) {
			if (response.result.length>0) {
				if(checkval.length<1){
				if(response.contract.paytype==1){//定金
					if(response.contract.currency==1){
						$('#contract').html('定金参考价(Deposit reference price):'+'&nbsp'+'&nbsp'+response.contract.cdownpay+'&nbsp'+'C$');
						$('#pp').html("定金金额(down payment):");
						var b=response.contract.downpay;
						$('#appliedamount').val(b);
					}else if(response.contract.currency==2){
						$('#contract').html('定金参考价(Deposit reference price):'+'&nbsp'+'&nbsp'+response.contract.cdownpay+'&nbsp'+'$');
						$('#pp').html("定金金额(down payment):");
						var b=response.contract.downpay;
						$('#appliedamount').val(b);
					}
				}else if(response.contract.paytype==2){//全款
					if(response.contract.currency==1){
						$('#contract').html('全款参考价(Full reference price):'+'&nbsp'+'&nbsp'+response.contract.ctotalpay+'&nbsp'+'C$');
						$('#pp').html("全款金额(total payment):");
						var c=response.contract.totalpay;
						$('#appliedamount').val(c);
					}else if(response.contract.currency==2){
						$('#contract').html('全款参考价(Full reference price):'+'&nbsp'+'&nbsp'+response.contract.ctotalpay+'&nbsp'+'$');
						$('#pp').html("全款金额(total payment):");
						var c=response.contract.totalpay;
						$('#appliedamount').val(c);
					}
				}else if(response.contract.paytype==3){//尾款
					if(response.contract.currency==1){
						$('#contract').html('尾款参考价(Balance payment reference price):'+'&nbsp'+'&nbsp'+response.contract.cfinalpay+'&nbsp'+'C$');
						$('#pp').html("尾款金额(final payment):");
						var finalpay=response.contract.finalpay;
						$('#appliedamount').val(finalpay);
					}else if(response.contract.currency==2){
						$('#contract').html('尾款参考价(Balance payment reference price):'+'&nbsp'+'&nbsp'+response.contract.cfinalpay+'&nbsp'+'$');
						$('#pp').html("尾款金额(final payment):");
						var finalpay=response.contract.finalpay;
						$('#appliedamount').val(finalpay);
					}
				}}
				if($('#paytype').val()==1){
					if(response.currency==1){
						$('#contract').html('全款参考价(Full reference price):'+'&nbsp'+'&nbsp'+response.totalpay+'&nbsp'+'C$');
						$('#pp').html("全款金额(total payment):");
					}else if(response.currency==2){
						$('#contract').html('全款参考价(Full reference price):'+'&nbsp'+'&nbsp'+response.totalpay+'&nbsp'+'$');
						$('#pp').html("全款金额(total payment):");
					}
				}else if($('#paytype').val()==2){
					if(response.currency==1){
						$('#contract').html('定金参考价(Deposit reference price):'+'&nbsp'+'&nbsp'+response.downpay+'&nbsp'+'C$');
						$('#pp').html("定金金额(down payment):");
					}else if(response.currency==2){
						$('#contract').html('定金参考价(Deposit reference price):'+'&nbsp'+'&nbsp'+response.downpay+'&nbsp'+'$');
						$('#pp').html("定金金额(down payment):");
					}
				}
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
	}
	/*var t=setInterval(function(){监听事件
        var q=$('#checkval').val();
        if(q){
        	alert(123);
           load();
            clearInterval(t)
        }
    },0)*/
	// 重置
	function reset() {       
		form[0].reset();
	}
	$('#ch').click(function bu(){
		load();
	});
	var status=true;
	function savenewBtn(){
		 var reg = /^(((\d*).\d+)|(\d+.(\d*)|\d+))$/;
		 var selfbuy=$('#selfbuy').val();
		 	var applyaddUrl=$('#applyaddUrl').val()+"?checkvalc="+checkvalc+"&id="+cid;
		 	var appliedamount =$('#appliedamount').val();
		 	if(selfbuy==1){//自采定金
		 	$(".money").each(function(){
		 	 var result=$(this).val();
		 	 var that=this;
		 	 if(result!=""){if(!reg.test(result)){
		 		 $.dialog("money format incorrect!", function(){$(that).focus()})
					return false;
		 	}
		 	 }
		 		});
		 	/*var othercost=$('#othercost').val();
			var insurance=$('#insurance').val();
			var t1price=$('#t1price').val();
			var t2price=$('#t2price').val();
			var t3price=$('#t3price').val();
			var t4price=$('#t4price').val();
			if (!reg.test(appliedamount)) {
				 $.dialog("money format incorrect!", function(){})
					return false;
			}else if(!reg.test(othercost)){
				 $.dialog("money format incorrect!", function(){$('#othercost').focus()})
					return false;
			}else if(!reg.test(insurance)){
				 $.dialog("money format incorrect!", function(){$('#insurance').focus()})
					return false;
			}else if(t1price!=""&&!reg.test(t1price)){
				 $.dialog("money format incorrect!", function(){$('#t1price').focus()})
					return false;
			}else if(t2price!=""&&!reg.test(t2price)){
				 $.dialog("money format incorrect!", function(){$('#t2price').focus()})
					return false;
			}else if(t3price!=""&&!reg.test(t3price)){
				 $.dialog("money format incorrect!", function(){$('#t3price').focus()})
					return false;
			}else if(t4price!=""&&!reg.test(t4price)){
				 $.dialog("money format incorrect!", function(){$('#t4price').focus()})
					return false;
			}*/
			}else {
				if (!reg.test(appliedamount)) {
					 $.dialog("money format incorrect!", function(){})
						return false;
				}
		 	}
			 var formData = new FormData($( "#searchForm" )[0]);
			 if(status){
				 status=false;
		 $.ajax({
             url:applyaddUrl,
             type:'post',
             datatype:'json',
             data: formData,
	         async: false,  
	         cache: false,  
	         contentType: false,  
	         processData: false, 
             success:function(data){
                 if(data.status){
                	 $.dialog("apply succeed !", function(){
                		 location.href=$('#njndApplyPayLstIndexUrl').val()+"?currpage="+$('#currpage').val();
                	 })
                 }else{
                	 $.dialog(data.msg, function(){})
                 }
             }
         })
			 }
	}
	
	function cancelBtn(){
		 location.href=$('#njndApplyPayLstIndexUrl').val()+"?currpage="+$('#currpage').val();
	}
	//绑定新增按钮事件
	$("#btnReset").bind("click", reset);
	function choosepurchase(){
		var buyid=$('#buyid').val();
		var realsale = $("#choosepurUrl").val()+"?buyid="+buyid+"&cid="+cid+"&userCountry="+$('#userCountry').val();
	showDialogue(realsale, 800, 500);}
	function showDialogue(url,w,h){
		var iTop = 100;
		var iLeft = 100;
		var iWidth = window.parent.screen.availWidth-iLeft*2;
		var iHeight = window.parent.screen.availHeight-iTop*2;
		var win = window.open(url, "弹出窗口24", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
	}
	function close(){window.close()}
	$('#choseBtn').bind("click",choosepurchase);
	$('#savenewBtn').bind("click",savenewBtn);
	$('#savenewBtn1').bind("click",savenewBtn);
	$('#cancelBtn').bind("click",cancelBtn);
});
function loads(){
	$('#ch').click();
}