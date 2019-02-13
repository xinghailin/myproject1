define(function(require, exports, module) {
	require('jquery-css');require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#ccreatetime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatStatus', _formatcstatus);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('operate', operate);
//	var globe_context_id = $('#globe_context_id').val(),
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	function operate(id,cstatus,paytype){
		var html='',spa="&nbsp;";
		var view,del,edit,reb;
		/**
		 * <option value="1">定金通过</option>
	<option value="2">定金不通过</option>
	<option value="3">定金审核中</option>
	<option value="4">定金已撤销</option>
	<option value="5">尾款通过</option>
	<option value="6">尾款不通过</option>
	<option value="7">尾款审核中</option>
	<option value="8">尾款已撤销</option>
	<option value="9">全款通过</option>
	<option value="10">全款不通过</option>
	<option value="11">全款审核中</option>
	<option value="12">全款已撤销</option>
	cstatus 1 审核中 2 审核通过 3 审核不通过 4撤销 paytype 付款类型1 定金 2全款 3尾款
		 */
		view = $("<a href='javascript:void(0);' target='_self' name='viewBtn' class='btn63_02' id='"+id+"'/>").html('<span>view</span>');
		if (paytype=='1'&&cstatus=='2') {//定金通过 查看 编辑（尾款）
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn1' class='btn63_01' id='"+id+"'/>").html('<span>submitFinalPayment</span>');
			html=$('<span />').html(view).append(spa).append(edit).html();
		}else if (paytype=='1'&&cstatus=='3'){//不通过 编辑（定金） 删除 查看
			del = $("<a href='javascript:void(0);' target='_self' name='delBtn' class='btn63_02' id='"+id+"'/>").html('<span>delete</span>');
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_01' id='"+id+"'/>").html('<span>edit</span>');
			html=$('<span />').html(view).append(spa).append(edit).append(spa).append(del).html();
		}else if (paytype=='1'&&cstatus=='1'){//审核中 撤销 删除 查看（定金）
			reb = $("<a href='javascript:void(0);' target='_self' name='rebBtn' class='btn63_02' id='"+id+"'/>").html('<span>repeal</span>');
			html=$('<span />').html(view).append(spa).append(reb).html();
		}else if (paytype=='1'&&cstatus=='4'){//已撤销 编辑（定金） 删除 查看
			del = $("<a href='javascript:void(0);' target='_self' name='delBtn' class='btn63_02' id='"+id+"'/>").html('<span>delete</span>');
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_01' id='"+id+"'/>").html('<span>edit</span>');
			html=$('<span />').html(view).append(spa).append(edit).append(spa).append(del).html();
		}else if (paytype=='3'&&cstatus=='3'){//不通过 编辑 查看（尾款）
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_01' id='"+id+"'/>").html('<span>edit</span>');
			html=$('<span />').html(view).append(spa).append(edit).html();
		}else if (paytype=='3'&&cstatus=='1'){//审核中 撤销 查看（尾款）
			reb = $("<a href='javascript:void(0);' target='_self' name='rebBtn' class='btn63_02' id='"+id+"'/>").html('<span>repeal</span>');
			html=$('<span />').html(view).append(spa).append(reb).html();
		}else if (paytype=='3'&&cstatus=='4'){//已撤销 编辑 查看（尾款）
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_01' id='"+id+"'/>").html('<span>edit</span>');
			html=$('<span />').html(view).append(spa).append(edit).html();
		}else if (paytype=='2'&&cstatus=='1'){//全款审核中 编辑 查看 （全款）
			reb = $("<a href='javascript:void(0);' target='_self' name='rebBtn' class='btn63_02' id='"+id+"'/>").html('<span>repeal</span>');
			html=$('<span />').html(view).append(spa).append(reb).html();
		}else if (paytype=='2'&&cstatus=='3'){//全款不通过 编辑 查看（全款）
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_01' id='"+id+"'/>").html('<span>edit</span>');
			html=$('<span />').html(view).append(spa).append(edit).html();
		}else if (paytype=='2'&&cstatus=='4'){//已撤销 编辑 查看（全款）
			del = $("<a href='javascript:void(0);' target='_self' name='delBtn' class='btn63_02' id='"+id+"'/>").html('<span>delete</span>');
			edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_01' id='"+id+"'/>").html('<span>edit</span>');
			html=$('<span />').html(view).append(spa).append(edit).append(spa).append(del).html();
		}else if (paytype=='2'&&cstatus=='2'){//全款通过 查看（全款）
			html=$('<span />').html(view).html();
		}else if (paytype=='3'&&cstatus=='2'){//尾款通过 查看（尾款）
			html=$('<span />').html(view).html();
		}
		return new handlebars.SafeString(html);
	}
	//格式化图片
	function _formatcstatus(cstatus,paytype){
		if(cstatus=='2'&&paytype=='1'){
				return "定金通过(down-payment approved)";
			}else if(cstatus=='3'&&paytype=='1'){
				return "定金不通过(down-payment unapproved)";
			}else if(cstatus=='1'&&paytype=='1'){
				return "定金审核中(downpayment pending)";
			}else if(cstatus=='4'&&paytype=='1'){
				return "定金已撤销(downpayment revoked)";
			}else if(cstatus=='2'&&paytype=='3'){
				return "尾款通过(final payment approved)";
			}else if(cstatus=='3'&&paytype=='3'){
				return "尾款不通过(final payment unapproved)";
			}else if(cstatus=='1'&&paytype=='3'){
				return "尾款审核中(final payment pending)";
			}else if(cstatus=='4'&&paytype=='3'){
				return "尾款已撤销(final payment revoked)";
			}else if(cstatus=='2'&&paytype=='2'){
				return "全款通过(full payment approved)";
			}else if(cstatus=='3'&&paytype=='2'){
				return "全款不通过(full payment unapproved)";
			}else if(cstatus=='1'&&paytype=='2'){
				return "全款审核中(full payment pending)";
			}else if(cstatus=='4'&&paytype=='2'){
				return "全款已撤销(full payment revoked)";
			}else return "";
	}
	//格式化调剂
	function _formatAdjust(cstatus){
		if(cstatus=='1'){return "是";}
		else return "否";
	}
	function editFun(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href = $('#editUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text();
	}
	function viewFun(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href = $('#edit2Url').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&view=1";
	}
	function edit1Fun(){//到尾款提交页面
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href = $('#edit1Url').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text()+"&finals=1"+"&view=1";
	}
	function addFun(){
		window.location.href = $('#addUrl').val()+"?currpage="+$('#J_CurPageNo').text()+"&userCountry="+$('#userCountry').val();
	}
	function delFun(){
		var $this=$(this);
		var theId=$this.attr('id');
		$.dialog("Are you sure about deleting？", function(){
		var delurl = $('#deleteUrl').val()+"?id="+theId;
		$.ajax(delurl, {
			type : 'post',
			dataType : 'json'
		}).done(function(response) {
			if (response.status) {
				$.dialog("delete succeed!", function(){load(1,PAGE_SIZE);})
			} else {
				$.dialog(response.msg, function(){})
			}
		});
		})
	}
	function rebFun(){
		var $this=$(this);
		var theId=$this.attr('id');
		$.dialog("Are you sure to cancel?", function(){
			var delurl = $('#rebFunUrl').val()+"?id="+theId;
			$.ajax(delurl, {
				type : 'get',
				dataType : 'json'
			}).done(function(response) {
				if (response.status) {
					load($('#J_CurPageNo').text(),PAGE_SIZE);
				} else {
					$.dialog(response.msg, function(){})
				}
			});
			})
	}
	
	//格式化时间
	function _formatSimpleDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate());
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
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize+"&userCountry="+$('#userCountry').val(); // 查询数据url
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
				$("a[name='viewBtn']").on("click", viewFun);
				$("a[name='editBtn']").on("click", editFun);
				$("a[name='editBtn1']").on("click", edit1Fun);
				$("a[name='delBtn']").on("click", delFun);
				$("a[name='rebBtn']").on("click", rebFun);
				$('.tb_mian tbody tr td').not(":last-child").hover(function(){
					var $this=$(this);
				    var mes=$this.parent().attr('code');
				    var arr=mes.split(',');
				    warp=$("<div style='position:absolute;z-index: 999;background: red;padding: 5px 10px;color: #fff;font-weight:bold;opacity:.8;border-radius:8px'></div>")
				    var pa="";
				    for(var i=0;i<arr.length;i++){
				        pa+="<p style='padding: 2px 0'>"+arr[i]+"</p>";
				    }
				    $(pa).appendTo(warp);
				    var top=$this.offset().top;
				    var left=$this.offset().left;
				    warp.appendTo($this).css({top:top,left:left});
				},function(){
				    warp.remove();
				});
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
	$("#btnAddApay").bind("click", addFun);
});