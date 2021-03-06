<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>开票-财务部</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="invoicefinancelist" namespace="car-ms"/>">
<input type="hidden" id="formUrl" value="<ufa:url fieldName="invoiceshopfinancesave" namespace="car-ms"/>">
</head>
<style>
@media ( min-width : 1330px) {
	.container {
		width: 1524px;
	}
}

table td, table th {
	text-align: center;
}

.box {
	/*width: 1524px;*/
	overflow: hidden;
	color: #555;
	/*margin-left: 50px;*/
}

.title {
	padding: 10px 0;
}

.newInput {
	padding: 10px 15px 10px 15px;
	min-width: 300px;
}

.newInput label:first-child {
	min-width: 120px;
	text-align: right;
}

.du-btn {
	text-align: center;
	margin: 50px 0;
}

.du-btn a {
	margin: 0 20px;
}

.upload {
	margin-top: 20px;
}

.upload .form-inline label {
	min-width: 130px;
	text-align: right;
	padding: 10px 0;
}

.bv-form .help-block {
	margin-bottom: 0;
}

.nav-tabs li.bv-tab-success>a {
	color: #3c763d;
}

.nav-tabs li.bv-tab-error>a {
	color: #a94442;
}

.help-block {
	text-align: right;
}

.form-inline .has-feedback .form-control-feedback {
	top: 10px;
	right: 10px;
}

.form-inline .form-group.vali {
	height: 62px;
}

.has-success .form-control {
	border-color: #ccc;
}

.glyphicon-ok {
	display: none;
}

.close {
	display: none;
}

.close.fileinput-remove {
	display: none;
}

.form-group img {
	cursor: pointer;
	height: 150px;
	width: 150px;
}

.du-title {
	font-size: 16px;
	font-weight: 700;
}

.du-mask {
	background: rgba(0, 0, 0, .5);
	width: 100%;
	height: 100%;
	z-index: 999;
	position: absolute;
	top: 0;
	left: 0;
}

.du-contain {
	position: absolute;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
}

.du-main {
	position: absolute;
	top: 0;
	width: auto;
	height: 96%;
}

.du-tool {
	position: fixed;
	top: 20px;
	right: 50px;
	z-index: 999;
}

.du-tool button {
	width: 70px;
	height: 30px;
	text-align: center;
	margin: 0 10px;
	line-height: 30px;
	font-size: 16px;
	color: #fff;
	border: 1px solid #00A1CB;
	background: #05a8eb;
}

.du-tool button:hover {
	color: #fff;
	background: #0586bf;
}
</style>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container">
				<!--<form action="" id="rightVli" class="rightVli">-->
				<h3 class="title">开票-财务</h3>
				<h4 style="padding: 10px 0;" class="list-group-item-danger">基本信息</h4>
				<div class="form-inline">
					<div class="form-group newInput"><label>销售合同编号：</label> <label>${co.filecode}</label></div>
					<div class="form-group newInput"><label>合同类别：</label> <label>全款</label></div>
					<div class="form-group newInput"><label>所属门店：</label> <label>${co.shopname}</label></div>
					<div class="form-group newInput"><label>填写人姓名(销售姓名)：</label> <label>${co.sellername}</label></div>
					<div class="form-group newInput"><label>车架号：</label> <label>${co.vin}</label></div>
					<div class="form-group newInput"><label>客户姓名/企业名称：</label> <label>${co.bname}</label></div>
					<div class="form-group newInput"><label>销售合同下载：</label> <a href="${contextPath}${co.salecontract}" download="${salecontractname}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${salecontractname}</a></div>
			</div>
				<div class="form-inline">
					<div class="form-group newInput du-choose-invoice"><label><span style="color: red; font-weight: bold">*</span>开票类型：</label> <label class="radio-inline"><c:if test="${invoice.typebig eq 1}">增值税发票</c:if> <c:if test="${invoice.typebig eq 2}">机动车专用发票</c:if> </label></div>
			</div>
				<div class="use_bill"><c:if test="${invoice.typebig eq 2}">
						<div class="form-inline">
							<div class="form-group newInput du-choose-type"><label><span style="color: red; font-weight: bold">*</span>类型：</label> <label class="radio-inline"><c:if test="${invoice.typesmall eq 1}">个人</c:if> <c:if test="${invoice.typesmall eq 2}">企业</c:if> </label></div>
						</div>
					</c:if> <c:if test="${(invoice.typebig eq 1) or (invoice.typebig eq 2 and invoice.typesmall eq 2)}">
						<div class="personal_con" id="picarea">
							<div class="form-inline">
								<div class="form-group newInput vali"><label><span style="color: red">*</span>开票金额：</label>${invoice.amount}</div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>单位名称：</label>${invoice.companyname}</div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>税号：</label>${invoice.taxnum}</div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>开户行：</label>${invoice.openbank}</div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>银行卡号：</label>${invoice.banknum}</div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>经营地址：</label>${invoice.runaddress}</div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>联系电话：</label>${invoice.phone}</div>
						</div>
							<div class="form-inline" id="personal-myCard"><label style="margin-left: 50px;">营业执照（一图）：</label>
								<div class="form-group upload"><c:forEach var="item" items="${lst1}">
										<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
									</c:forEach></div></div>
							<div class="form-inline" id="personal-flow"><label style="margin-left: 50px;">转账银行流水/支付宝/微信流水截图（多图）：</label>
								<div class="form-group upload"><c:forEach var="item" items="${lst2}">
										<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
									</c:forEach></div></div> <c:if test="${invoice.behalfpay eq '1'}">
								<div class="form-inline">
									<div class="checkbox"><label style="margin-left: 50px; font-weight: bold"> 代付款证明（一图）： </label>
										<div class="form-group upload"><c:forEach var="item" items="${lst3}">
												<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
											</c:forEach></div></div>
								</div>
								<div class="form-inline personal-card" id="personal-card"><label style="margin-left: 50px;">代付款人身份证正反面（两图）：</label>
									<div class="form-group upload"><c:forEach var="item" items="${lst4}">
											<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
										</c:forEach></div></div>
							</c:if>
						</div>
					</c:if> <c:if test="${invoice.typebig eq 2 and invoice.typesmall eq 1}">
						<div class="personal_con" id="picarea">
							<div class="form-inline">
								<div class="form-group newInput vali"><label><span style="color: red">*</span>开票金额：</label> <input type="text" class="form-control" name="money" value="${invoice.amount}"></div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>姓名：</label> <input type="text" class="form-control" name="name" value="${invoice.companyname}"></div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>电话：</label> <input type="text" class="form-control" name="phone" value="${invoice.phone}"></div>
								<div class="form-group newInput vali"><label><span style="color: red">*</span>身份证号：</label> <input type="text" class="form-control" name="cardId" value="${invoice.identify}"></div>
						</div>
							<div class="form-inline" id="personal-myCard"><label style="margin-left: 50px;">身份证正反面（两图）：</label>
								<div class="form-group upload"><c:forEach var="item" items="${lst5}">
										<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
									</c:forEach></div></div>
							<div class="form-inline" id="personal-flow"><label style="margin-left: 50px;">转账银行流水/支付宝/微信流水截图（多图）：</label>
								<div class="form-group upload"><c:forEach var="item" items="${lst2}">
										<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
									</c:forEach></div></div> <c:if test="${invoice.behalfpay eq '1'}">
								<div class="form-inline">
									<div class="checkbox"><label style="margin-left: 50px; font-weight: bold"> 代付款证明（一图）： </label>
										<div class="form-group upload"><c:forEach var="item" items="${lst3}">
												<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
											</c:forEach></div></div>
								</div>
								<div class="form-inline personal-card" id="personal-card"><label style="margin-left: 50px;">代付款人身份证正反面（两图）：</label>
									<div class="form-group upload"><c:forEach var="item" items="${lst4}">
											<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
										</c:forEach></div></div>
							</c:if>
						</div>
					</c:if>
					<h4 style="padding: 10px 0;" class="list-group-item-danger">结算价（门店部）</h4>
					<div class="form-inline">
						<div class="form-group newInput vali"><label><span style="color: red">*</span>结算车价：</label> <input type="text" class="form-control" name="settlementcarprice" value="${invoice.settlementcarprice}" readonly="readonly"></div>
						<div class="form-group newInput vali"><label><span style="color: red">*</span>购置税：</label> <input type="text" class="form-control" name="purchasetax" value="${invoice.purchasetax}" readonly="readonly"></div>
						<div class="form-group newInput vali"><label><span style="color: red">*</span>保险：</label> <input type="text" class="form-control" name="insurance" value="${invoice.insurance}" readonly="readonly"></div>
						<div class="form-group newInput vali"><label><span style="color: red">*</span>上牌费：</label> <input type="text" class="form-control" name="plateprice" value="${invoice.plateprice}" readonly="readonly"></div>
						<div class="form-group newInput vali"><label>其他1：</label> <input type="text" class="form-control" id="other1price" name="other1price" value="${invoice.other1price}" readonly="readonly"></div>
						<div class="form-group newInput vali"><label>备注1：</label> <input type="text" class="form-control" id="other1description" name="other1description" value="${invoice.other1description}" readonly="readonly"></div>
						<div class="form-group newInput vali"><label>其他2：</label> <input type="text" class="form-control" id="other2price" name="other2price" value="${invoice.other2price}" readonly="readonly"></div>
						<div class="form-group newInput vali"><label>备注2：</label> <input type="text" class="form-control" id="other2description" name="other2description" value="${invoice.other2description}" readonly="readonly"></div>
				</div>
					<h4 style="padding: 10px 0;" class="list-group-item-danger">结算明细（财务部）</h4>
					<form id="use_personal"><input type="hidden" id="ret" name="ret" value=""> <input type="hidden" id="conid" name="conid" value="${co.id }"><input type="hidden" id="id" name="id" value="${invoice.id }"><input type="hidden" id="currpage" name="currpage"
						value="${currpage}">
						<div class="form-inline">
							<div class="form-group newInput vali"><label><span style="color: red">*</span>结算车价：</label> <input type="text" class="form-control" name="fsettlementcarprice" value="${invoice.fsettlementcarprice}"></div>
							<div class="form-group newInput vali"><label><span style="color: red">*</span>购置税：</label> <input type="text" class="form-control" name="fpurchasetax" value="${invoice.fpurchasetax}"></div>
							<div class="form-group newInput vali"><label><span style="color: red">*</span>保险：</label> <input type="text" class="form-control" name="finsurance" value="${invoice.finsurance}"></div>
							<div class="form-group newInput vali"><label><span style="color: red">*</span>上牌费：</label> <input type="text" class="form-control" name="fplateprice" value="${invoice.fplateprice}"></div>
							<div class="form-group newInput vali"><label>其他1：</label> <input type="text" class="form-control" id="fother1price" name="fother1price" value="${invoice.fother1price}"></div>
							<div class="form-group newInput vali"><label>备注1：</label> <input type="text" class="form-control" id="fother1description" name="fother1description" value="${invoice.fother1description}"></div>
							<div class="form-group newInput vali"><label>其他2：</label> <input type="text" class="form-control" id="fother2price" name="fother2price" value="${invoice.fother2price}"></div>
							<div class="form-group newInput vali"><label>备注2：</label> <input type="text" class="form-control" id="fother2description" name="fother2description" value="${invoice.fother2description}"></div>
					</div>
						<div class="form-inline">
							<div class="form-group newInput"><label>补填原因：</label> <textarea class="form-control" rows="4" style="resize: none; min-width: 300px" id="du-reason1" name="fbackreason">${invoice.fbackreason}</textarea></div>
							<div class="form-group newInput"><label>不通过原因：</label> <textarea class="form-control" rows="4" style="resize: none; min-width: 300px" id="du-reason2" name="fnopassreason">${invoice.fnopassreason}</textarea></div>
					</div></form>
					<div class="du-btn"><c:if test="${invoice.status eq 4}">
							<button class="btn btn-danger" role="button" id="submit" style="padding: 6px 38px" onclick="submit()">通过</button>
							<button class="btn btn-danger" role="button" id="repBtn" style="padding: 6px 38px">补填</button>
							<button class="btn btn-danger" role="button" id="noBtn" style="padding: 6px 38px">不通过</button>
						</c:if> <a href="javascript:;" class="btn btn-warning" role="button" style="padding: 6px 38px" id="backBtn">返回</a></div></div>
		</div>
	</div>
</body>
<script src="${contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/js/bootstrapValidator.min.js"></script>
<script>
	function submit(){
		$("#use_personal").submit();
		if(vil("use_personal")){
			if(($("#fother1price").val().length) && ($("#fother1description").val().length == 0)){
				alert("其他1有值的情况下备注1必须填写");
				return false;
			}
			if(($("#fother2price").val().length) && ($("#fother2description").val().length == 0)){
				alert("其他2有值的情况下备注2必须填写");
				return false;
			}
			$("#ret").val(1);
			$.ajax({url:$("#formUrl").val() + "?shopfin=2",data:$("#use_personal").serialize(),dataType:'json',type:'post',success:function(data){
				console.log(data);
				alert("操作成功！");
				back();
			}});
		}
	}
	//是否通过表单验证
	function vil(id){
		var error=$("#" + id).find('.has-error');
		if(error.length > 0){
			error.eq(0).find('.form-control').focus();
			return false;
		}
		return true;
	}
	$("#use_personal")
	.bootstrapValidator(
	{ive:'disabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证
	excluded:[':disabled',':hidden',':not(:visible)'],//排除无需验证的控件，比如被禁用的或者被隐藏的
	submitButtons:'#submit',//指定提交按钮，如果验证失败则变成disabled，但我没试成功，反而加了这句话非submit按钮也会提交到action指定页面
	message:'通用的验证失败消息',//好像从来没出现过
	feedbackIcons:{//根据验证结果显示的各种图标
	valid:'glyphicon',invalid:'glyphicon glyphicon-remove',validating:'glyphicon glyphicon-refresh'},fields:{fsettlementcarprice:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},fpurchasetax:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},finsurance:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},fplateprice:{message:'验证失败',validators:{notEmpty:{message:'不能为空'},stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},fother1price:{message:'验证失败',validators:{stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},fother2price:{message:'验证失败',validators:{stringLength:{max:13,message:'金额超过最大限额'},regexp:{regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,message:'金额格式填写错误'}}},fother1description:{message:'验证失败',validators:{stringLength:{max:255,message:'长度必须在小于255位字符'}}},fother2description:{message:'验证失败',validators:{stringLength:{max:255,message:'长度必须在小于255位字符'}}}}})
	function back(){
		location.href=$("#backUrl").val() + "?currpage=" + $('#currpage').val();
	}
	//绑定新增按钮事件
	$("#backBtn").bind("click",back);
	var pictrue=$('#picarea img'),index,num=pictrue.length;
	pictrue
	.click(function(){
		$('body').css('overflow','hidden');
		var top=$(window).scrollTop();
		index=pictrue.index(this);
		var n=1;
		$(
		"<div class='du-mask' style='margin-top: "+top+"px'><div class='du-tool'><button class='du-prev'>上一张</button><button class='du-next'>下一张</button><button class='du-large'>放大</button><button class='du-small'>缩小</button><button class='du-close'>关闭</button></div><div class='du-contain'><img class='du-main'></div></div>")
		.appendTo('body');
		var src=$(this).attr('src');
		var main=$(".du-main");
		main.attr('src',src);
		var width=main.width();
		main.css("left",($(window).width() - width) / 2);
		//        上一页
		$(".du-prev").click(function(){
			to_left()
		});
		//       向上一页
		function to_left(){
			if(index == 0){
				alert("已经是第一张");
			}else{
				index=index - 1;
				var psrc=pictrue.eq(index).attr('src');
				main.attr('src',psrc).css("transform","scale(1,1)");
				var width=main.width();
				main.css({left:($(window).width() - width) / 2,top:0});
				n=1;
			}
		}
		//        下一页
		$(".du-next").click(function(){
			to_right();
		});
		//       向下一页
		function to_right(){
			if(num == (index + 1)){
				alert("已经是最后一张");
			}else{
				index=index + 1;
				var nsrc=pictrue.eq(index).attr('src');
				main.attr('src',nsrc).css("transform","scale(1,1)");
				var width=main.width();
				main.css({left:($(window).width() - width) / 2,top:0});
				n=1;
			}
		}
		//        放大
		$(".du-large").click(function(){
			n=n + 0.2;
			main.css("transform","scale(" + n,n + ")");
			//            drag(main.get(0));
		});
		//        缩小
		$(".du-small").click(function(){
			if(n > 0.6){
				n=n - 0.2;
				main.css("transform","scale(" + n,n + ")");
				//                drag(main.get(0))
			}
		});
		//        关闭
		$(".du-close").click(function(){
			$('.du-mask').remove();
			$('body').css('overflow','auto');
		})
		var timeoutflag=null;
		$(document).unbind("keydown").keydown(function(event){
			if(timeoutflag != null){
				clearTimeout(timeoutflag);
			}
			timeoutflag=setTimeout(function(){
				if((event.keyCode == 37) || (event.keyCode == 38)){
					to_left();
				}else if((event.keyCode == 39) || (event.keyCode == 40)){
					to_right();
				}//执行的代码自己写
			},100);//500毫秒内不会重复触发
		});
	});
	function noFun(pa){
		var p=pa.data.pas;
		if(2 == p){
			var file2=$("#du-reason1").val();
			file2=file2.trim();
			if(!file2 || file2.length > 200){
				alert("补填时，补填原因必填（200字以内）");
				return false;
			}
			$("#ret").val(2);
		}else if(3 == p){
			var file3=$("#du-reason2").val();
			file3=file3.trim();
			if(!file3 || file3.length > 200){
				alert("不通过时，不通过原因必填（200字以内）");
				return false;
			}
			$("#ret").val(3);
		}
		$.ajax({url:$("#formUrl").val() + "?shopfin=2",data:$("#use_personal").serialize(),dataType:'json',type:'post',success:function(data){
			console.log(data);
			alert("操作成功！");
			back();
		}});
	}
	$('#repBtn').bind("click",{pas:2},noFun);
	$('#noBtn').bind("click",{pas:3},noFun);
</script>
</html>