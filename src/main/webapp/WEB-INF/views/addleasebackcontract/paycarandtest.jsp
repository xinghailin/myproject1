<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<input id="paycarpassUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="paycarpass"/>' />
<input id="bizcontractindexUrl" type="hidden"
	value='<ufa:url namespace="car-ms" fieldName="bizcontractindex"/>' />
	<input id="paycarnopassUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="paycarnopass"/>' />

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

.du-noPass {
	display: none;
}
</style>
<body>
	<div class="box">
		<div class="container">
			<h3 class="title">验车</h3>
			<h4 style="padding: 10px 0;" class="list-group-item-danger">车辆销售合同</h4>
			<div class="form-inline">
				<div class="form-group newInput">
					<input id="id" value="${id}" type="hidden"> <input id="loginid" value="${loginid}"
						type="hidden"> <input id="currpage" value="${currpage}" type="hidden"> <label>合同编号：</label>
					<label>${con.filecode}</label>
				</div>
				<div class="form-group newInput">
					<label>合同下载：</label>
					<a href="${contextPath}${con.salecontract}" class="btn btn-primary" role="button"
						download="${con.salecontract }"> 合同下载 </a>
				</div>
			</div>
			<div class="form-inline">
				<div class="form-group newInput">
					<label>客户姓名：</label> <label>${con.bname}</label>
				</div>
				<div class="form-group newInput">
					<label>客户身份证：</label> <label>${con.identify}</label>
				</div>
				<div class="form-group newInput">
					<label>联系电话：</label> <label>${con.bphone}</label>
				</div>
			</div>
			<h4 style="padding: 10px 0;" class="list-group-item-danger">合同信息</h4>
			<div class="form-inline">
				<div class="form-group newInput" style="width: 25%">
					<label>车架号：</label> <label>${con.vin}</label>
				</div>
				<div class="form-group newInput" style="width: 25%">
					<label>品牌：</label> <label>${con.brand}</label>
				</div>
				<div class="form-group newInput" style="width: 25%">
					<label>型号：</label> <label>${con.model}</label>
				</div>
				<div class="form-group newInput" style="width: 25%">
					<label>版别：</label> <label>${con.version}</label>
				</div>
				<div class="form-group newInput" style="width: 25%">
					<label>外观颜色：</label> <label>${con.outcolor}</label>
				</div>
				<div class="form-group newInput" style="width: 25%">
					<label>内饰颜色：</label> <label>${con.incolor}</label>
				</div>
			</div>
			<div class="form-inline">
				<div class="form-group newInput du-choose" style="padding-right: 71px">
					<label>验车结果：</label> 
					<label class="radio-inline" style="margin-right: 20px"> 
					<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="1" checked> 通过
					</label> 
					<label class="radio-inline"> 
					<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="2"> 不通过
					</label>
				</div>
			</div>
			<div class="form-inline du-noPass">
				<div class="form-group newInput">
					<label>不通过原因：</label> <label class="radio-inline du-noPass-choose"> <input type="radio"
						name="one" id="inlineRadio3" value="1" checked> 换车
					</label> <label class="radio-inline"> 车架号： </label> <input type="text" class="form-control" id="du-reason">
				</div>
				<div class="form-group newInput">
					<label class="radio-inline du-noPass-choose"> <input type="radio" name="one"
						id="inlineRadio4" value="2"> 退订金
					</label> <label class="radio-inline"> 退款原因： </label>
					<textarea class="form-control" rows="4" style="resize: none; min-width: 220px" id="refundcause"
						name="refundcause"></textarea>
				</div>
			</div>
			<div class="du-btn">
				<a href="javascript:;" class="btn btn-danger" role="button" style="padding: 6px 38px"
					id="passBtn">确定 </a>
				<a href="javascript:;" class="btn btn-warning" role="button" id="nopassBtn" style="padding: 6px 30px"> 取消
				</a>
				<a href="javascript:;" class="btn btn-warning" role="button" onclick="back()" style="padding: 6px 30px"> 返回
				</a>
			</div>
		</div>
	</div>
</body>
<script src="js/jquery-2.1.4.min.js"></script>
<script>
function back(){
	location.href = $('#bizcontractindexUrl').val()
	+ "?currpage=" + $('#currpage').val();
};
	$(".du-choose input").click(function() {
		if ($("#inlineRadio2").is(":checked")) {
			$(".du-noPass").css({
				display : 'block'
			});
		} else {
			$(".du-noPass").css({
				display : 'none'
			});
		}
	})
	var status=true;
	$("#passBtn").click(
			function() {
				if ($("#inlineRadio2").is(":checked")) {
					if ($("#inlineRadio3").is(":checked")&& ($.trim($("#du-reason").val()) == "")) {
						alert("请输入车架号");
						return false;
					} else{
						var vin=$('#du-reason').val();
						var id = $('#id').val();
						var loginid = $('#loginid').val();
						var paycarpass = $('#paycarpassUrl').val();
						if(status){
						status=false;
						$.ajax({
							//几个参数需要注意一下
							type : "POST",//方法类型
							dataType : "json",//预期服务器返回的数据类型
							url : paycarpass,//url
							data : {
								id : id,
								loginid : loginid,vin:vin
							},
							success : function(data) {
								if (data.status) {
									alert("保存成功");
									location.href = $('#bizcontractindexUrl').val()
											+ "?currpage=" + $('#currpage').val();
								} else {
									alert(data.msg);
								}
							}
						});
						}
					} 
				} else {
					var id = $('#id').val();
					var loginid = $('#loginid').val();
					var paycarpass = $('#paycarpassUrl').val();
					if(status){
					status=false;
					$.ajax({
						//几个参数需要注意一下
						type : "POST",//方法类型
						dataType : "json",//预期服务器返回的数据类型
						url : paycarpass,//url
						data : {
							id : id,
							loginid : loginid
						},
						success : function(data) {
							if (data.status) {
								alert("保存成功");
								location.href = $('#bizcontractindexUrl').val()
										+ "?currpage=" + $('#currpage').val();
							} else {
								alert(data.msg);
							}
						}
					});
					}
				}
			});
			$("#nopassBtn").click(function() {
				if ($("#inlineRadio2").is(":checked")) {
				if ($("#inlineRadio4").is(":checked")&& ($.trim($("#refundcause").val()) == "")) {
					alert("请输入退款原因");
				} else {
					var refundcause=$("#refundcause").val();
					var id = $('#id').val();
					var loginid = $('#loginid').val();
					var paycarnopass = $('#paycarnopassUrl').val();
					if(status){
					status=false;
					$.ajax({
						//几个参数需要注意一下
						type : "POST",//方法类型
						dataType : "json",//预期服务器返回的数据类型
						url : paycarnopass,//url
						data : {
							id : id,
							loginid : loginid,refundcause:refundcause
						},
						success : function(data) {
							if (data.status) {
								alert("保存成功");
								location.href = $('#bizcontractindexUrl').val()
										+ "?currpage=" + $('#currpage').val();
							} else {
								alert(data.msg);
							}
						}
					}); 
					}
				}
				} 
				});
</script>