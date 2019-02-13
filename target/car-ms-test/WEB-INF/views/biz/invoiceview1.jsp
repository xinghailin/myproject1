<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>开票查看</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="invoicelist" namespace="car-ms"/>">
<input type="hidden" id="fbackUrl" value="<ufa:url fieldName="invoicefinancelist" namespace="car-ms"/>">
<input type="hidden" id="process" value="${process}">
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
				<h3 class="title">开票-查看</h3>
				<h4 style="padding: 10px 0;" class="list-group-item-danger">基本信息</h4>
				<div class="form-inline">
					<div class="form-group newInput"><label>销售合同编号：</label> <label>${co.filecode}</label></div>
					<div class="form-group newInput"><label>合同类别：</label> <label>金融</label></div>
					<div class="form-group newInput"><label>车架号：</label> <label>${co.vin}</label></div>
					<div class="form-group newInput"><label>客户姓名：</label> <label>${co.bname}</label></div>
					<div class="form-group newInput"><label>销售合同下载：</label> <a href="${contextPath}${co.salecontract}" download="${salecontractname}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${salecontractname}</a></div>
					<div class="form-group newInput"><label>金融合同第一年：</label> <a href="${contextPath}${sale.saleborrowfile1}" download="${firtyear}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${firtyear}</a></div>
					<div class="form-group newInput"><label>金融合同第2-4年：</label> <a href="${contextPath}${sale.saleborrowfile2}" download="${secondyear}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${secondyear}</a></div>
					<div class="form-group newInput"><label>贷审会审批表：</label> <a href="${contextPath}${risk.approvaltableurl}" download="${texturlname}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${texturlname}</a></div>
			</div>
				<div class="form-inline">
					<div class="form-group newInput du-choose-invoice"><label><span style="color: red; font-weight: bold">*</span>开票类型：</label> <label class="radio-inline">机动车专用发票 </label></div>
			</div>
				<div class="use_bill">
					<div class="form-inline">
						<div class="form-group newInput du-choose-type"><label><span style="color: red; font-weight: bold">*</span>类型：</label> <label class="radio-inline">个人 </label></div>
				</div>
					<div class="personal_con" id="picarea">
						<div class="form-inline">
							<div class="form-group newInput vali"><label><span style="color: red">*</span>开票金额：</label>${invoice.amount}</div>
							<div class="form-group newInput vali"><label><span style="color: red">*</span>姓名：</label>${invoice.companyname}</div>
							<div class="form-group newInput vali"><label><span style="color: red">*</span>电话：</label>${invoice.phone}</div>
							<div class="form-group newInput vali"><label><span style="color: red">*</span>身份证号：</label>${invoice.identify}</div>
					</div>
						<div class="form-inline"><label style="margin-left: 50px;">身份证正反面（两图）：</label>
							<div class="form-group upload"><c:forEach var="item" items="${lst5}">
									<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
								</c:forEach></div></div>
						<div class="form-inline"><label style="margin-left: 50px;">转账银行流水/支付宝/微信流水截图（多图）：</label>
							<div class="form-group upload"><c:forEach var="item" items="${lst2}">
									<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
								</c:forEach></div></div> <c:if test="${invoice.behalfpay eq '1'}">
							<div class="form-inline">
								<div class="checkbox"><label style="margin-left: 50px; font-weight: bold"> 代付款证明（一图）： </label>
									<div class="form-group upload"><c:forEach var="item" items="${lst3}">
											<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
										</c:forEach></div></div>
							</div>
							<div class="form-inline"><label style="margin-left: 50px;">代付款人身份证正反面（两图）：</label>
								<div class="form-group upload"><c:forEach var="item" items="${lst4}">
										<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
									</c:forEach></div></div>
						</c:if>
				</div>
			</div>
				<h4 style="padding: 10px 0;" class="list-group-item-danger">结算价（门店部）</h4>
				<div class="form-inline">
					<div class="form-group newInput vali"><label><span style="color: red">*</span>结算车价：</label> <input type="text" class="form-control" name="settlementcarprice" value="${invoice.settlementcarprice}" readonly="readonly"></div>
					<div class="form-group newInput vali"><label><span style="color: red">*</span>购置税：</label> <input type="text" class="form-control" name="purchasetax" value="${invoice.purchasetax}" readonly="readonly"></div>
					<div class="form-group newInput vali"><label><span style="color: red">*</span>保险：</label> <input type="text" class="form-control" name="insurance" value="${invoice.insurance}" readonly="readonly"></div>
					<div class="form-group newInput vali"><label><span style="color: red">*</span>动态监管：</label> <input type="text" class="form-control" name="dynamicsupervise" value="${invoice.dynamicsupervise}" readonly="readonly"></div>
					<div class="form-group newInput vali"><label><span style="color: red">*</span>履约险：</label> <input type="text" class="form-control" name="appointinsurance" value="${invoice.appointinsurance}" readonly="readonly"></div>
					<div class="form-group newInput vali"><label><span style="color: red">*</span>上牌费：</label> <input type="text" class="form-control" name="plateprice" value="${invoice.plateprice}" readonly="readonly"></div>
					<div class="form-group newInput vali"><label>其他1：</label> <input type="text" class="form-control" id="other1price" name="other1price" value="${invoice.other1price}" readonly="readonly"></div>
					<div class="form-group newInput vali"><label>备注1：</label> <input type="text" class="form-control" id="other1description" name="other1description" value="${invoice.other1description}" readonly="readonly"></div>
					<div class="form-group newInput vali"><label>其他2：</label> <input type="text" class="form-control" id="other2price" name="other2price" value="${invoice.other2price}" readonly="readonly"></div>
					<div class="form-group newInput vali"><label>备注2：</label> <input type="text" class="form-control" id="other2description" name="other2description" value="${invoice.other2description}" readonly="readonly"></div>
			</div>
			<div class="form-inline">
					<div class="form-group newInput"><label>补填原因：</label> <textarea class="form-control" rows="4" style="resize: none; min-width: 300px" id="du-reason1" name="backreason">${invoice.backreason}</textarea></div>
					<div class="form-group newInput"><label>不通过原因：</label> <textarea class="form-control" rows="4" style="resize: none; min-width: 300px" id="du-reason2" name="nopassreason">${invoice.nopassreason}</textarea></div>
			</div>
				<h4 style="padding: 10px 0;" class="list-group-item-danger">结算明细（财务部）</h4>
				<form id="use_personal"><input type="hidden" id="conid" name="conid" value="${co.id }"><input type="hidden" id="id" name="id" value="${invoice.id }"><input type="hidden" id="currpage" name="currpage" value="${currpage}">
					<div class="form-inline">
						<div class="form-group newInput vali"><label><span style="color: red">*</span>结算车价：</label> <input type="text" class="form-control" name="fsettlementcarprice" value="${invoice.fsettlementcarprice}" readonly="readonly"></div>
						<div class="form-group newInput vali"><label><span style="color: red">*</span>购置税：</label> <input type="text" class="form-control" name="fpurchasetax" value="${invoice.fpurchasetax}" readonly="readonly"></div>
						<div class="form-group newInput vali"><label><span style="color: red">*</span>保险：</label> <input type="text" class="form-control" name="finsurance" value="${invoice.finsurance}" readonly="readonly"></div>
						<div class="form-group newInput vali"><label><span style="color: red">*</span>动态监管：</label> <input type="text" class="form-control" name="fdynamicsupervise" value="${invoice.fdynamicsupervise}" readonly="readonly"></div>
						<div class="form-group newInput vali"><label><span style="color: red">*</span>履约险：</label> <input type="text" class="form-control" name="fappointinsurance" value="${invoice.fappointinsurance}" readonly="readonly"></div>
						<div class="form-group newInput vali"><label><span style="color: red">*</span>上牌费：</label> <input type="text" class="form-control" name="fplateprice" value="${invoice.fplateprice}" readonly="readonly"></div>
						<div class="form-group newInput vali"><label>其他1：</label> <input type="text" class="form-control" id="fother1price" name="fother1price" value="${invoice.fother1price}" readonly="readonly"></div>
						<div class="form-group newInput vali"><label>备注1：</label> <input type="text" class="form-control" id="fother1description" name="fother1description" value="${invoice.fother1description}" readonly="readonly"></div>
						<div class="form-group newInput vali"><label>其他2：</label> <input type="text" class="form-control" id="fother2price" name="fother2price" value="${invoice.fother2price}" readonly="readonly"></div>
						<div class="form-group newInput vali"><label>备注2：</label> <input type="text" class="form-control" id="fother2description" name="fother2description" value="${invoice.fother2description}" readonly="readonly"></div>
				</div>
					<div class="form-inline">
						<div class="form-group newInput"><label>补填原因：</label> <textarea class="form-control" rows="4" style="resize: none; min-width: 300px" id="du-reason1" name="fbackreason">${invoice.fbackreason}</textarea></div>
						<div class="form-group newInput"><label>不通过原因：</label> <textarea class="form-control" rows="4" style="resize: none; min-width: 300px" id="du-reason2" name="fnopassreason">${invoice.fnopassreason}</textarea></div>
				</div></form>
				<div class="du-btn"><a href="javascript:;" class="btn btn-warning" role="button" style="padding: 6px 38px" id="backBtn">返回</a></div>
		</div>
	</div>
</div>
</body>
<script src="${contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/js/bootstrapValidator.min.js"></script>
<script>
	function back(){
		var process=$("#process").val();
		if(1==process)
		location.href=$("#backUrl").val() + "?currpage=" + $('#currpage').val();
		else location.href=$("#fbackUrl").val() + "?currpage=" + $('#currpage').val();
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
</script>
</html>