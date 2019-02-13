<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>

<input id="downpaypassUrl" type="hidden"
	value='<ufa:url namespace="car-ms" fieldName="downpaypass"/>' />
<input id="bizcontractfinancepageUrl" type="hidden"
	value='<ufa:url namespace="car-ms" fieldName="bizcontractfinancepage"/>' />

<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/jquery.jedate.js"></script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${cssBasePath}/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${cssBasePath}/jedate.css">
</head>
<style>
@media ( min-width : 1330px) {
	.container {
		width: 1300px;
	}
}

table td,table th {
	text-align: center;
}

.box {
	/*width: 1524px;*/
	overflow: hidden; color: #555;
	/*margin-left: 50px;*/
}

.title {
	padding: 10px 0 30px;
}

.newInput {
	padding: 10px 15px 10px 15px; min-width: 300px;
}

.newInput label:first-child {
	min-width: 120px; text-align: right;
}

.du-btn {
	text-align: center; margin: 50px 0;
}

.du-btn a {
	margin: 0 20px;
}
</style>
<body>
	<div class="box">
		<div class="container">
			<input id="loginid" value="${loginid }" type="hidden"> 
			<input id="id" value="${id }" type="hidden">
			<input id="currpage" value="${currpage }" type="hidden">
			<h3 class="title">金融车首付款</h3>
			<h4 style="padding: 10px 0;" class="list-group-item-danger">车辆销售合同</h4>
			<div class="form-inline">
				<div class="form-group newInput" style="width: 415px;">
					<label>合同编号：</label> <label>${con.filecode }</label>
				</div>
				<div class="form-group newInput" style="width: 415px;">
					<label>合同下载：</label>
					<a href="${contextPath}${con.salecontract }" class="btn btn-primary" role="button"
						download="${con.salecontract }" role="button"> 合同下载 </a>
				</div>
			</div>
			<div class="form-inline">
				<div class="form-group newInput" style="width: 415px;">
					<label>客户姓名：</label> <label>${con.bname }</label>
				</div>
				<div class="form-group newInput" style="width: 415px;">
					<label>客户身份证：</label> <label>${con.identify }</label>
				</div>
				<div class="form-group newInput" style="width: 415px;">
					<label>联系电话：</label> <label>${con.bphone }</label>
				</div>
			</div>
			<h4 style="padding: 10px 0;" class="list-group-item-danger">合同信息</h4>
			<div class="form-inline">
				<div class="form-group newInput" style="width: 415px;" style="width: 415px;">
					<label>车架号：</label> <label>${con.vin }</label>
				</div>
				<div class="form-group newInput" style="width: 415px;">
					<label>品牌：</label> <label>${con.brand }</label>
				</div>
				<div class="form-group newInput" style="width: 415px;">
					<label>型号：</label> <label>${con.model }</label>
				</div>
				<div class="form-group newInput" style="width: 415px;">
					<label>版别：</label> <label>${con.version }</label>
				</div>
				<div class="form-group newInput" style="width: 415px;">
					<label>外观颜色：</label> <label>${con.outcolor }</label>
				</div>
				<div class="form-group newInput" style="width: 415px;">
					<label>内饰颜色：</label> <label>${con.incolor }</label>
				</div>
				<div class="form-group newInput" style="width: 415px;">
					<label>购车类型：</label> <label>金融购车</label>
				</div>
				<div class="form-group newInput" style="width: 415px;">
					<label>验车结果：</label> <label>通过</label>
				</div>
				<div class="form-group newInput" style="width: 415px;">
					<label>报价质保：</label> <label>${con.qualityprice1 }元</label>
				</div>
				<div class="form-group newInput" style="width: 415px;">
					<label>报价保险：</label> <label>${con.insurancesure }元</label>
				</div>
				<div class="form-group newInput" style="width: 415px;">
					<label>报价车损险：</label> <label>${con.cardamageinsurance }元</label>
				</div> 
				<div class="form-group newInput" style="width: 415px;color: red;">
					<label>风控补额：</label> <label>${missmoney }元</label>
				</div>
				<div class="form-group newInput" style="width: 415px;color: red;">
					<label>金融实收定金：</label> <label>${con.realdownpay }元</label>
				</div>
			</div>
			<div class="form-inline" style="padding-top: 20px">
				<div class="form-group newInput">
					<label style="color: red">首付款：第一份金融合同的租赁物货款*1%+第一份金融的租赁物货款*1.5%+报价车损险+报价质保+报价保险金额(商业险+交强险)+风控补额</label>
				</div>
			</div>
			<div class="form-inline">
				<div class="form-group newInput" style="width: 415px;">
					<label>第一份金融合同的租赁物货款：</label> <label>${leaseprice }</label> <label style="padding-left: 3px">元</label>
				</div>
				<div class="form-group newInput" style="width: 415px;">
					<label>实收首付款：</label> <input type="text" class="form-control" id="financerealdownpay"
						value="${downpayment }">
				</div>
				<div class="form-group newInput" style="width: 415px;">
					<label>贴补金额：</label> <input type="text" class="form-control" placeholder="购置税和贷款不足金额" id="repairmoney" value="">
				</div>
			</div>

			<div class="du-btn">
				<a href="#" class="btn btn-danger" onclick="submitBtn()" style="padding: 6px 38px">通过</a>
				<a href="#" class="btn btn-warning" onclick="back()" style="padding: 6px 38px">返回</a>
			</div>
		</div>
	</div>
</body>
<script>
function  back(){
	location.href = $('#bizcontractfinancepageUrl').val()
	+ "?currpage=" + $('#currpage').val();
}
	var status=true;
	function submitBtn() {
		var reg = /(^\-?[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^\-?(0){1}$)|(^\-?[0-9]\.[0-9]([0-9])?$)/;
		var financerealdownpay = $('#financerealdownpay').val();
		var downpaypassUrl = $('#downpaypassUrl').val();
		var repairmoney = $('#repairmoney').val();
		var id = $('#id').val();
		var loginid = $('#loginid').val();
		if (!reg.test(repairmoney)) {
			$('#repairmoney').focus();
			return false;
		}
		if (!reg.test(financerealdownpay)) {
			$('#financerealdownpay').focus();
		} else {
			if(status){
			status=false;
			$.ajax({
				//几个参数需要注意一下
				type : "POST",//方法类型
				dataType : "json",//预期服务器返回的数据类型
				url : downpaypassUrl,//url
				data : {
					financerealdownpay : financerealdownpay,
					id : id,
					loginid : loginid,
					repairmoney : repairmoney
				},
				success : function(data) {
					if (data.status) {
						alert("保存成功");
						location.href = $('#bizcontractfinancepageUrl').val()
								+ "?currpage=" + $('#currpage').val();
					} else {
						alert(data.msg);
					}
				}

			});
			}
		}

	};
</script>