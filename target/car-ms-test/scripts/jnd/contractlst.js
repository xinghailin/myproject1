define(function(require, exports, module) {
	require('jquery-css');require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');
	datepickerUtil.datesTrigger('#createtime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null ;
	var $userCountry=$('#userCountry');
	var userCountry=$userCountry.size()?$userCountry.val():"";
//	submitButton.attr('disabled', 'disabled');
	handlebars.registerHelper('_formatStatus', _formatStatus);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	handlebars.registerHelper('operate', operate);
	handlebars.registerHelper('stampFun', stampFun);
	handlebars.registerHelper('payment', payment);
	handlebars.registerHelper('update', update);
	
	handlebars.registerHelper('formatbuytype', formatbuytype);
//	var globe_context_id = $('#globe_context_id').val(),
	var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
	var node=$('#node').val();//0 1 2 3
	$(function() {
		var cur=$('#currpage').val();
		if(cur)load(cur,PAGE_SIZE);
		else
		load(1,PAGE_SIZE);//加载数据列表
		submitButton.bind("click", {curPageNo : 1, pageSize : PAGE_SIZE}, dataSearch);//信息查询
	});
	
	function operate(id,status){
		var html='',spa="&nbsp;";
		if(node==0){//管理 全部status
		var view = $("<a href='javascript:void(0);' target='_self' name='viewBtn' class='btn63_02' id='"+id+"'/>").html('<span>view</span>'),
		edit = $("<a href='javascript:void(0);' target='_self' name='editBtn' class='btn63_01' id='"+id+"'/>").html('<span>edit</span>'),
		reb = $("<a href='javascript:void(0);' target='_self' name='rebBtn' class='btn63_02' id='"+id+"'/>").html('<span>cancel</span>'),
		del = $("<a href='javascript:void(0);' target='_self' name='delBtn' class='btn63_02' id='"+id+"'/>").html('<span>delete</span>');
//		stamp = $("<a href='javascript:void(0);' target='_self' name='audBtn' class='btn63_01' id='"+id+"'/>").html('<span>上传</span>');	
		if (status==null) {//初始 查看、撤销、删除
			html=$('<span />').html(view).append(spa).append(reb).append(spa).append(del).html();
		}else if (status=='1'){//采购审核通过  查看
			html=$('<span />').html(view).html();
		}else if (status=='2'){//采购修改  查看、编辑、删除
			html=$('<span />').html(view).append(spa).append(edit).append(spa).append(del).html();
		}else if (status=='3'){//采购不通过 删除 查看
			html=$('<span />').html(view).append(spa).append(del).html();
		}else if (status=='4'){//法务通过  查看
			html=$('<span />').html(view).html();
		}else if (status=='5') {//法务修改 查看、编辑、删除
			html=$('<span />').html(view).append(spa).append(edit).append(spa).append(del).html();
		}else if (status=='6'){//法务不通过 查看、删除
			html=$('<span />').html(view).append(spa).append(del).html();
		}else if (status=='7'){//财务通过 查看
			html=$('<span />').html(view).html();
		}else if (status=='8'){//财务修改 查看、编辑、删除
			html=$('<span />').html(view).append(spa).append(edit).append(spa).append(del).html();
		}else if (status=='9'){//财务不通过 查看、删除
			html=$('<span />').html(view).append(spa).append(del).html();
		}else if (status=='10'){//撤销 查看、编辑、删除
			html=$('<span />').html(view).append(spa).append(edit).append(spa).append(del).html();
		}}
		else if(node==1){//采购 状态：
			var view = $("<a href='javascript:void(0);' target='_self' name='viewBtn' class='btn63_02' id='"+id+"'/>").html('<span>查看</span>'),
			aud = $("<a href='javascript:void(0);' target='_self' name='audBtn' class='btn63_01' id='"+id+"'/>").html('<span>审核</span>');	
			if (status==null) {//初始 审核
				html=$('<span />').html(aud).html();
			}else if (status=='1'){//采购审核通过  查看
				html=$('<span />').html(view).html();
			}else if (status=='2'){//采购修改  查看
				html=$('<span />').html(view).html();
			}else if (status=='3'){//采购不通过  查看
				html=$('<span />').html(view).html();
			}}
		else if(node==2){//法务
			var view = $("<a href='javascript:void(0);' target='_self' name='viewBtn' class='btn63_02' id='"+id+"'/>").html('<span>查看</span>'),
			aud = $("<a href='javascript:void(0);' target='_self' name='audBtn' class='btn63_01' id='"+id+"'/>").html('<span>审核</span>');
			if (status=='1'){//采购审核通过  审核
				html=$('<span />').html(aud).html();
			}else if (status=='4'){//法务通过  查看
				html=$('<span />').html(view).html();
			}else if (status=='5') {//法务修改 查看
				html=$('<span />').html(view).html();
			}else if (status=='6'){//法务不通过 查看
				html=$('<span />').html(view).html();
			}}
		else if(node==3){//财务
			var view = $("<a href='javascript:void(0);' target='_self' name='viewBtn' class='btn63_02' id='"+id+"'/>").html('<span>查看</span>'),
			aud = $("<a href='javascript:void(0);' target='_self' name='audBtn' class='btn63_01' id='"+id+"'/>").html('<span>审核</span>');
			if (status=='4'){//法务审核通过  审核
				html=$('<span />').html(aud).html();
			}else if (status=='7'){//财务通过  查看
				html=$('<span />').html(view).html();
			}else if (status=='8') {//财务修改 查看
				html=$('<span />').html(view).html();
			}else if (status=='9'){//财务不通过 查看
				html=$('<span />').html(view).html();
			}}
		return new handlebars.SafeString(html);
	}
	function update(needer){
		if(needer="中国采购"){
			return "中国采购(China Sourcing)";
		}else if(needer="海外采购"){
			return "海外采购(Overseas Sourcing)";
		}else if(needer="商城采购"){
			return "商城采购(Online-Stores Sourcing)";
		}
	}
	//格式化图片
	function _formatStatus(status){
		if(status=='1'){return "采购通过(purchase)";}
		else if(status=='2'){return "采购修改(purchase modification)";}
		else if(status=='3'){return "采购不通过(purchase unapproved)";}
		else if(status=='4'){return "法务通过(legal approved)";}
		else if(status=='5'){return "法务修改(legal modification)";}
		else if(status=='6'){return "法务不通过(legao unapproved)";}
		else if(status=='7'){return "全通过(full approval)";}
		else if(status=='8'){return "财务修改(financial modification)";}
		else if(status=='9'){return "财务不通过(financial unapproved)";}
		else if(status=='10'){return "已撤销(revoked)";}
		else if(status==null){return "待审核(pending)";}
		else return "";
	}
	function formatbuytype(a,b){
		if(a==1){
			return "全款(full payment)"
		}
		if(a==2){
			if(b==1){
				return "定金自采(down-payment self purchase)"
			}
			if(b==2){
				return "定金代采(down-payment agency purchase)"
			}
			return "定金(down-payment)"
		}
	}
	function payment(stamp,apaylock){
		if(stamp==1&&apaylock==null){
			return "未申请付款(payment not applied)";
		}/*else if(stamp==1&&apaylock!=null){
			return "已申请付款";
		}else{
			return "不能申请付款";
		}*/
	}
	function editFun(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href = $('#editUrl').val()+"?id="+theId+"&userCountry="+userCountry+"&currpage="+$('#J_CurPageNo').text();
	}
	function rebFun(){
		var $this=$(this);
		var theId=$this.attr('id');
//		window.location.href = $('#deleteUrl').val()+"?id="+theId+"&currpage="+$('#J_CurPageNo').text();
		var delurl = $('#deleteUrl').val()+"?id="+theId+"&revocation=1";
		$.ajax(delurl, {
			type : 'get',
			dataType : 'json'
		}).done(function(response) {
			if (response.status) {
				var cp=$('#J_CurPageNo').text();
				if(cp)
				load(cp,PAGE_SIZE);
				else load(1,PAGE_SIZE);
			} else {
				$.dialog(response.msg, function(){})
			}
		});
	}
	function addFun(){
		window.location.href = $('#addUrl').val()+"?userCountry="+userCountry+"&currpage="+$('#J_CurPageNo').text();
	}
	function delFun(){
		var $this=$(this);
		var theId=$this.attr('id');
		$.dialog("确定删除吗？(Confirm deletion？)", function(){
		var delurl = $('#deleteUrl').val()+"?id="+theId;
		$.ajax(delurl, {
			type : 'get',
			dataType : 'json'
		}).done(function(response) {
			if (response.status) {
				load(1,PAGE_SIZE);
			} else {
				$.dialog(response.msg, function(){})
			}
		});
		})
	}
	function viewFun(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href = $('#viewUrl').val()+"?id="+theId+"&userCountry="+userCountry+"&node="+node+"&currpage="+$('#J_CurPageNo').text();
	}
	function audFun(){
		var $this=$(this);
		var theId=$this.attr('id');
		window.location.href = $('#auditUrl').val()+"?id="+theId+"&node="+node+"&currpage="+$('#J_CurPageNo').text();
	}
	function stampFun(s){
		if(s==1)return "已上传(upload successfully)";
		return "";
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
		var queryUrl = $('#searchUrl').val() + "?node="+node+"&userCountry="+userCountry+"&start="+curPageNo+"&pageSize="+pageSize; // 查询数据url
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
				if(node==0){
				$("a[name='editBtn']").on("click", editFun);
				$("a[name='delBtn']").on("click", delFun);
				$("a[name='rebBtn']").on("click", rebFun);}
				if(node>0){
				$("a[name='audBtn']").on("click", audFun);}
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
	$("#btnAddContract").bind("click", addFun);
});