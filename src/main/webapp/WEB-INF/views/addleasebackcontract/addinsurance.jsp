<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<input type="hidden" id="insurancesaveUrl"
	value="<ufa:url fieldName="insurancesave" namespace="car-ms"/>">
<input type="hidden" id="bizcontractindexUrl"
	value="<ufa:url fieldName="bizcontractindex" namespace="car-ms"/>">
<input type="hidden" id="backUrl"
	value="<ufa:url fieldName="financialcontracts" namespace="car-ms"/>">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/jquery.jedate.js"></script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>金融车辆保险报价</title>
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

.newInput p:first-child {
	min-width: 120px; text-align: right;
}

.du-btn {
	text-align: center; margin: 50px 0;
}
</style>
<body>
	<div class="box">
		<div class="container">
			<h3 class="title">报价保险添加</h3>
			<div class="form-inline">
				<div class="form-group newInput" style="width: 400px; margin-left: 15px;">
					<label>销售合同编号：</label> <label>${biz.filecode }</label>
				</div>
				<div class="form-group newInput" style="width: 400px; margin-left: -33px;">
					<label>车辆品牌：</label> <label>${biz.brand }</label>
				</div>
				<div class="form-group newInput" style="width: 400px; margin-left: -10px;">
					<label>车辆型号：</label> <label>${biz.model }</label>
				</div>
				<br />
				<div class="form-group newInput" style="width: 400px; margin-left: 45px;">
					<label>车辆版本：</label> <label>${biz.version }</label>
				</div>
				<div class="form-group newInput" style="width: 400px; margin-left: -50px;">
					<label>车架号：</label> <label>${biz.vin }</label>
				</div>
				<div class="form-group newInput" style="width: 400px; margin-left: -10px;">
					<label>金融车：</label>
					<c:if test="${biz.finance==1 }">
						<label>是</label>
					</c:if>
					<c:if test="${biz.finance==2 }">
						<label>否</label>
					</c:if>
				</div>
			</div>
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="insurancesave" namespace="car-ms"/>" enctype="multipart/form-data"
				method="post">
				<input type="hidden" id="id" name="id" value="${biz.id }" /> <input type="hidden" id="currpage"
					name="currpage" value="${currpage }">
				<div class="form-inline" style="padding-top: 20px">
					<div class="insurance">
						<div class="count">

							<div class="form-group newInput" style="width: 400px; margin-left: 60px;">
								<label>交强险：</label> <input type="text" name="insurance1" value="${biz.insurance }"
									class="form-control" placeholder="金额（元）">
							</div>
							<div class="form-group newInput" style="width: 400px; margin-left: -65px;">
								<label>车船税：</label> <input type="text" id="vehicleandvesseltax" name="vehicleandvesseltax"
									class="form-control" placeholder="金额（元）">
							</div>
							<div class="form-group newInput" style="width: 400px; margin-left: -38px;">
								<label>商业险总价：</label> <input type="text" name="cinsurance1" id="cinsurance1"
									value="${biz.cinsurance }" class="form-control" placeholder="金额（元）">
							</div>
							<div class="form-group newInput" style="width: 500px; margin-left: 30px;">
								<label>交强险类型：</label> <input id="qualitypriceyear" name="insurance1type" value="1"
									type="radio">店保 <input id="qualitypriceyear" name="insurance1type" value="2"
									type="radio">非店保 
									
							</div>
							<div class="form-group newInput" style="width: 400px; margin-left: -150px;">
								<label>交保时间：</label> <input type="text" name="insurancetime" value=""
									class="form-control mesTime" readonly="readonly" placeholder="交强险交保时间">
							</div>
							<br />
							<div class="form-group newInput" style="width: 400px; margin-left: 60px;">
								<label>车损险：</label> <input type="text" name="cardamageinsurance" id="cardamageinsurance"
									class="form-control" placeholder="金额（元）">
							</div>
							<div class="form-group newInput" style="width: 400px; margin-left: -110px;">
								<label>第三者责任险：</label> <input type="text" name="thirdinsurance" id="thirdinsurance"
									class="form-control" placeholder="金额（元）">
							</div>
							<div class="form-group newInput" style="width: 400px; margin-left: 38px;">
								<label>玻璃险：</label> <input type="text" name="glassinsurance" id="glassinsurance"
									class="form-control" placeholder="金额（元）">
							</div>
							<br />
							<div class="form-group newInput" style="width: 400px;">
								<label>车上人员责任险：</label> <input type="text" name="carpersonnelinsurance"
									id="carpersonnelinsurance" class="form-control" placeholder="金额（元）">
							</div>
							<div class="form-group newInput" style="width: 400px; margin-left: -5px;">
								<label>盗抢险：</label> <input type="text" name="theftrobberyinsurance"
									id="theftrobberyinsurance" class="form-control" placeholder="金额（元）">
							</div>
							<div class="form-group newInput" style="width: 400px; margin-left: -5px;">
								<label>划痕险：</label> <input type="text" name="scratchinsurance" id="scratchinsurance"
									class="form-control" placeholder="金额（元）">
							</div>
							<br />

							<div class="form-group newInput" style="width: 400px; margin-left: 60px;">
								<label>自燃险：</label> <input type="text" name="catacausisinsurance" id="catacausisinsurance"
									class="form-control" placeholder="金额（元）">
							</div>

							<div class="form-group newInput" style="width: 400px; margin-left: -65px;">
								<label>涉水险：</label> <input type="text" name="wadinginsurance" id="wadinginsurance"
									class="form-control" placeholder="金额（元）">
							</div>
							<div class="form-group newInput" style="width: 400px; margin-left: -20px;">
								<label>不计免赔：</label> <input type="text" name="accidentExcessReduction"
									id="accidentExcessReduction" class="form-control" placeholder="金额（元）">
							</div>

						</div>
						<div class="form-group newInput" style="width: 800px; margin-left: 45px;">
							<label>质保类型：</label> <input id="qualitypricenature" name="qualitypricenature" value="1"
								type="radio">整车 <input id="qualitypricenature" name="qualitypricenature" value="2"
								type="radio">三大件
						</div>
						<div class="form-group newInput" style="width: 800px; margin-left: 45px;">
							<label>质保年限：</label> <input id="qualitypriceyear" name="qualitypriceyear" value="1"
								type="radio">一年 <input id="qualitypriceyear" name="qualitypriceyear" value="2"
								type="radio">两年 <input id="qualitypriceyear" name="qualitypriceyear" value="3"
								type="radio">三年
						</div>
						<div class="form-group newInput" style="width: 800px; margin-left: 45px;">
							<label>质保总价：</label> <input type="text" name="qualityprice1" value="${biz.qualityprice }"
								class="form-control" placeholder="平行进口车质保  金额（元）">
						</div>
					</div>
					</form>
					<div class="du-btn">
						<button type="button" onclick="count()" class="btn btn-danger" style="padding: 6px 38px">计算商业险总额</button>
						<button type="button" onclick="save()" class="btn btn-danger" style="padding: 6px 38px">保存</button>
						<button type="button" onclick="back()" class="btn btn-warning" style="padding: 6px 38px">返回</button>
					</div>
				</div>
		</div>
</body>
<script type="text/javascript">
	var status=true;
	$('.mesTime').jeDate({
		isinitVal : true,
		format : "YYYY-MM-DD",
		isTime : false,
		isClear : false,
		minDate : "2014-09-19 00:00:00",
		today : 'NOW'
	});
	/* function self(){
	 document.getElementById("self").style.display="block"; 
	 $('input:radio[name=qualitypriceyear]').attr('checked',false);
	 } */
	var reg = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/;
	function count() {

		var count = $('.count .form-control');
		var cinsurance = 0;
		for (var i = 0; i < count.length; i++) {//循环input框
			count.eq(i).val();//每个input框的值
			if (reg.test(count.eq(i).val()) && i > 3) {
				cinsurance = Number(count.eq(i).val()) + Number(cinsurance);
			} else if (count.eq(i).val() != "" && !reg.test(count.eq(i).val())
					&& i != 3) {
				count.eq(i).focus();
			}
		}
		$('#cinsurance1').val(cinsurance.toFixed(2));
	};
	function save() {
		/* var count=$('.count .form-control');
		var cinsurance=0;
		for (var i = 0; i < count.length; i++) {//循环input框
			count.eq(i).val();//每个input框的值
			if(reg.test(count.eq(i).val())){
				cinsurance=Number(count.eq(i).val())+Number(cinsurance);
			}else if(count.eq(i).val()!=""&&!reg.test(count.eq(i).val())){
				count.eq(i).focus();
			}
		}
		$('#cinsurance').val(cinsurance.toFixed(2)); */
		var a = $("input[name='insurance1type']:checked").val();
		if (a == undefined) {
			alert("请选择交强险类型！");
			return false;
		}
		var insurancesaveUrl = $("#insurancesaveUrl").val();
		var insurance = $('.count .form-control');
		for (var j = 0; j < insurance.length; j++) {
			if (j != 3) {
				if (insurance.eq(j).val() != ""
						&& !reg.test(insurance.eq(j).val())) {
					insurance.eq(j).focus();
					return false;
				}
			}
		}
		if(status){
		status=false;
		$.ajax({
			//几个参数需要注意一下
			type : "POST",//方法类型
			dataType : "json",//预期服务器返回的数据类型
			url : insurancesaveUrl,//url
			data : $('#searchForm').serialize(),
			success : function(data) {
				if (data.status) {
					alert("保存成功");
					location.href = $('#backUrl').val() + "?currpage="
							+ $('#currpage').val() + "&type=2";
				} else {
					alert(data.msg);
				}
			}

		});
		}
	}
	function back() {
		location.href = $('#backUrl').val() + "?currpage="
				+ $('#currpage').val() + "&type=2";
	}
</script>