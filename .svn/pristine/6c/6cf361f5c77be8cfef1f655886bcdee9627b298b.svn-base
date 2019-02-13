<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<input type="hidden" id="updateleasebacksaveUrl"
	value="<ufa:url fieldName="updateleasebacksave" namespace="car-ms"/>">
<input type="hidden" id="BrandinitiaUrl"
	value="<ufa:url fieldName="queryBrandinitia" namespace="car-ms"/>">
<input type="hidden" id="backUrl"
	value="<ufa:url fieldName="leasebackListpage" namespace="car-ms"/>">
<input type="hidden" id="calculate1Url" value="<ufa:url fieldName="calculate1" namespace="car-ms"/>">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/jquery.jedate.js"></script>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>融资租赁售后回租合同修改</title>
<link href="${cssBasePath}/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${cssBasePath}/jedate.css">
</head>
<style>
@media ( min-width : 1330px) {
	.container {
		width: 1300px;
	}
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
	min-width: 110px; text-align: right;
}

.du-info {
	width: 100%; text-align: center; padding-top: 15px; display: flex;
}

.du-info span {
	width: 120px; display: inline-block; font-weight: 700; margin-left: 8px; line-height: 154px;
}

.du-info textarea {
	width: 50%; resize: none;
}

.du-btn {
	text-align: center; margin: 50px 0;
}

.du-btn a {
	margin: 0 30px;
}
</style>
<body>
	<div class="box">
		<div class="container">
			<h3 class="title">融资租赁售后回租合同</h3>
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="addleasebacksave" namespace="car-ms"/>"
				enctype="multipart/form-data" method="post">
				<div class="form-inline">
					<div class="form-group newInput">
						<label>车辆销售合同档案编号:</label> <label>${bizc.filecode }</label>
					</div>
					<div class="form-group newInput" style="margin-left: 105px;">
						<label>车辆销售合同:</label>
						<a href="${contextPath}${bizc.salecontract }" download="${bizc.salecontract}"
							class="btn btn-danger" role="button"> 合同下载 </a>

					</div>
				</div>
				<div class="form-inline">
					<div class="form-group newInput" style="margin-left: 45px;">
						<label>第一年租赁文件:</label>
						<a href="${contextPath}${biz.saleborrowfile1 }" download="${biz.saleborrowfile1}"
							class="btn btn-danger" role="button"> 融资租赁第一年租赁文件下载 </a>
						<input id="saleborrowfile3" name="saleborrowfile3" type="file">
					</div>
					<div class="form-group newInput">
						<label>第二到四年租赁文件:</label>
						<a href="${contextPath}${biz.saleborrowfile2}" download="${biz.saleborrowfile2}"
							class="btn btn-danger" role="button" > 融资租赁二到四年租赁文件下载 </a>
						<input id="saleborrowfile4" name="saleborrowfile4" type="file" style="margin-left: 30px;">
					</div><br/>
					<div class="form-group newInput" style="margin-left: 47px;">
						<label>抵押文件1:</label>
						<a href="${contextPath}${biz.pledgefile1}" download="${biz.pledgefile1}"
							class="btn btn-danger" role="button"> 抵押文件下载 </a>
						<input id="pledgefile3" name="pledgefile3" type="file">
					</div>
					<div class="form-group newInput" style="margin-left: 90px;">
						<label>抵押文件2:</label>
						<a href="${contextPath}${biz.pledgefile2}" download="${biz.pledgefile2}"
							class="btn btn-danger" role="button"> 其他文件下载 </a>
						<input id="pledgefile4" name="pledgefile4" type="file">
					</div>
				</div>
				<h4 style="padding: 10px 0;" class="list-group-item-danger">基本信息</h4>

				<div class="form-inline">
					<input type="hidden" id="id" name="id" value="${id }"> <input type="hidden" id="first"
						name="first" value="${first }"> <input type="hidden" id="second" name="second"
						value="${second }"> <input type="hidden" id="thirdly" name="thirdly"
						value="${thirdly }"> <input type="hidden" id="fourthly" name="fourthly"
						value="${fourthly }"> <input type="hidden" id="currpage" value="${currpage }">
					<div class="form-group newInput" style="margin-left: -17px;">
						<label>甲方（出租人）：</label> ${biz.name }
					</div>
					<div class="form-group newInput">
						<label>住所：</label> ${biz.address }
					</div>
					<div class="form-group newInput">
						<label>实际经营场所：</label> ${biz.runaddress }
					</div>
					<div class="form-group newInput">
						<label>联系人：</label> ${biz.principle }
					</div>
					<div class="form-group newInput" style="margin-left: 50px;">
						<label>电话：</label> ${biz.phone }
					</div>
				</div>
				<div class="form-inline" style="margin-top: 15px;">
					<div class="form-group newInput" style="margin-left: -17px;">
						<label><span style="color: red">*</span>乙方（承租人）：</label> <input type="text" name="bname"
							value="${biz.bname }" class="form-control required">
					</div>
					<div class="form-group newInput">
						<label><span style="color: red">*</span>身份证号：</label> <input type="text" name="identify"
							value="${biz.identify }" class="form-control required card">
					</div>
					<div class="form-group newInput">
						<label><span style="color: red">*</span>电话：</label> <input type="text" name="bphone"
							value="${biz.bphone }" class="form-control required phone">
					</div>
					<div class="form-group newInput">
						<label>住所：</label> <input type="text" name="baddress" value="${biz.baddress }"
							class="form-control">
					</div>
					<div class="form-group newInput">
						<label>实际经营场所：</label> <input type="text" name="brunaddress" value="${biz.brunaddress }"
							class="form-control">
					</div>
					<div class="form-group newInput">
						<label>传真：</label> <input type="text" name="faxes" value="${biz.faxes }" class="form-control">
					</div>
					<div class="form-group newInput">
						<label>联系人：</label> <input type="text" name="bprinciple" value="${biz.bprinciple }"
							class="form-control">
					</div>
					<div class="form-group newInput">
						<label><span style="color: red">*</span>签订日期：</label> <input type="text" id="sightime1"
							name="sightime1" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${biz.sightime}" />"
							class="form-control required mesTime" placeholder="请选择时间" readonly="">
					</div>
					<br />
					<div class="form-group newInput">
						<label>车辆品牌：</label> ${biz.brand }
					</div>
					<div class="form-group newInput" style="margin-left: 25px;">
						<label>型号：</label> ${biz.model }
					</div>
					<div class="form-group newInput" style="margin-left: 25px;">
						<label>版别：</label> ${biz.version }
					</div>
					<br />
					<div class="form-group newInput">
						<label>车架号：</label> ${biz.vin }
					</div>
				</div>
				<h4 style="padding: 10px 0;" class="list-group-item-danger">融资租赁售后回租第一年</h4>
				<div class="form-inline">
					<div class="form-group newInput">
						<label><span style="color: red">*</span>合同编号：</label> <input type="text" name="firstyearccode"
							value="${biz.firstyearccode }" class="form-control required">
					</div>
					<div class="form-group newInput">
						<label><span style="color: red">*</span>租赁物货款：</label> <input type="text" id="leaseprice"
							name="leaseprice" value="${biz.leaseprice }" class="form-control required money"
							placeholder="此处为风控审批  金额(元)" onchange="aproveprice(this.value)">
					</div>
					<div class="form-group newInput">
						<label>GPS费用：</label> <input type="text" name="gpsprice" class="form-control money"
							value="${biz.gpsprice }" placeholder="金额(元)">
					</div>
					<div class="form-group newInput">
						<label>手续费：</label> <input type="text" name="handcharge" value="${biz.handcharge }"
							class="form-control money" placeholder="金额(元)">
					</div>
					<div class="form-group newInput">
						<label><span style="color: red">*</span>动态监管费：</label> <input type="text" id="superviseprice"
							value="${biz.superviseprice }" name="superviseprice" class="form-control required money"
							placeholder="租赁物货款的1%  金额(元)">
					</div>
					<div class="form-group newInput">
						<label><span style="color: red">*</span>履约险：</label> <input type="text" name="promiseprice"
							id="promiseprice" value="${biz.promiseprice }" class="form-control required money"
							placeholder="租赁物货款的 1.5%">
					</div>
					<div class="form-group newInput">
						<label>期限：</label> <label><span style="color: red; font-size: 16px; padding: 0 5px">12</span>个月<span
								style="color: red; font-size: 16px; padding: 0 5px">12</span>期</label>
					</div>
					<div class="form-group newInput">
						<label style="margin-left: 24px;"><span style="color: red">*</span>额外利率：</label> <input
							type="text" name="additionalinterestrate" id="additionalinterestrate"
							value="${biz.additionalinterestrate }" class="form-control required money"><label
							style="color: red;">%</label>
					</div>
				</div>
				<h4 style="padding: 10px 0; font-size: 16px;" class="list-group-item-success">扣款账户如下</h4>
				<div class="form-inline">
					<div class="form-group newInput">
						<label><span style="color: red">*</span>开户行：</label> <input type="text" name="openbank"
							value="${biz.openbank }" class="form-control required">
					</div>
					<div class="form-group newInput">
						<label><span style="color: red">*</span>账户名：</label> <input type="text" name="accountname"
							value="${biz.accountname }" class="form-control required">
					</div>
					<div class="form-group newInput">
						<label><span style="color: red">*</span>账号：</label> <input type="text" name="accountcode"
							value="${biz.accountcode }" class="form-control required" id=userName1 oninput="user(this)"
							style="font-weight: 700">
					</div>
				</div>
				<h4 style="padding: 10px 0; font-size: 16px;" class="list-group-item-success">还款计划表第一年</h4>
				<p style="text-align: center; padding: 10px 0">
					<button type="button" class="btn btn-danger calculate1">自动计算还款</button>
				</p>
				<div class="table-responsive">
					<table class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
								<th class="success">首付</th>
								<th>租赁期限</th>
								<th>月租金</th>
								<th>支付日</th>
								<th>每年总租金合计</th>
							</tr>
						</thead>
						<tbody class="table1">
							<c:forEach var="item" items="${plan1}">
								<tr>
									<td align="center">0</td>
									<td>${item.term }</td>
									<td>${item.price }</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.paytime}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="du-contain">
					<div class="form-inline ensure3" style="margin-top: 20px; display: none;">
						<button type="button" class="close" aria-label="Close" style="color: red; opacity: 1"
							onclick="del(this)">
							<span aria-hidden="true" style="color: red;">&times;</span>
						</button>
						<div class="form-group newInput">
							<label>担保人：</label> <input type="text" name="bondsman" value="${item.bondsman}"
								class="form-control">
						</div>
						<div class="form-group newInput">
							<label>住所：</label> <input type="text" name="bmaddress" value="${item.bmaddress}"
								class="form-control">
						</div>
						<div class="form-group newInput">
							<label>实际经营场所：</label> <input type="text" name="bmrunaddress" value="${item.bmrunaddress}"
								class="form-control">
						</div>
						<div class="form-group newInput">
							<label>传真：</label> <input type="text" name="bmfaxes" value="${item.bmfaxes}"
								class="form-control">
						</div>
						<div class="form-group newInput">
							<label>电话：</label> <input type="text" name="bmphone" value="${item.bmphone}"
								class="form-control">
						</div>
					</div>
					<c:forEach var="item" items="${bizb1}">
						<div class="form-inline ensure1" style="margin-top: 20px">
							<button type="button" class="close" aria-label="Close" style="color: red; opacity: 1"
								onclick="del(this)">
								<span aria-hidden="true" style="color: red;">&times;</span>
							</button>
							<div class="form-group newInput">
								<label>担保人：</label> <input type="text" name="bondsman" value="${item.bondsman}"
									class="form-control">
							</div>
							<div class="form-group newInput">
								<label>住所：</label> <input type="text" name="bmaddress" value="${item.bmaddress}"
									class="form-control">
							</div>
							<div class="form-group newInput">
								<label>实际经营场所：</label> <input type="text" name="bmrunaddress" value="${item.bmrunaddress}"
									class="form-control">
							</div>
							<div class="form-group newInput">
								<label>传真：</label> <input type="text" name="bmfaxes" value="${item.bmfaxes}"
									class="form-control">
							</div>
							<div class="form-group newInput">
								<label>电话：</label> <input type="text" name="bmphone" value="${item.bmphone}"
									class="form-control">
							</div>
						</div>
					</c:forEach>
				</div>
				<p style="text-align: center; padding: 10px 0">
					<button type="button" class="btn btn-warning ensure1-btn">添加担保人</button>
				</p>
				<h4 style="padding: 10px 0; margin-top: 30px" class="list-group-item-danger">融资租赁售后回租第二到四年</h4>
				<div class="form-inline">
					<div class="form-group newInput">
						<label><span style="color: red">*</span>合同编号：</label> <input type="text"
							name="secondyearccode" value="${biz.secondyearccode }" class="form-control required"
							placeholder="第二到四年">
					</div>
					<div class="form-group newInput">
						<label><span style="color: red">*</span>租赁物货款：</label> <input type="text" id="sleaseprice"
							name="sleaseprice" value="${biz.sleaseprice }" class="form-control required money"
							placeholder="第二到四年   金额（元）">
					</div>
					<div class="form-group newInput">
						<label>GPS费用：</label> <input type="text" name="sgpsprice" value="${biz.sgpsprice }"
							class="form-control money" placeholder="金额(元)">
					</div>
					<div class="form-group newInput">
						<label>手续费：</label> <input type="text" name="shandcharge" value="${biz.shandcharge }"
							class="form-control money" placeholder="金额(元)">
					</div>
					<div class="form-group newInput">
						<label><span style="color: red">*</span>动态监管费：</label> <input type="text" id="ssuperviseprice"
							name="ssuperviseprice" value="${biz.ssuperviseprice }" class="form-control required money"
							placeholder="租赁物货款的1%  金额(元)">
					</div>
					<div class="form-group newInput">
						<label><span style="color: red">*</span>履约险：</label> <input type="text" id="spromiseprice"
							name="spromiseprice" value="${biz.spromiseprice }" class="form-control required money"
							placeholder="租赁物货款的 1.5%">
					</div>
					<div class="form-group newInput">
						<label>期限：</label> <label><span style="color: red; font-size: 16px; padding: 0 5px">36</span>个月<span
								style="color: red; font-size: 16px; padding: 0 5px">36</span>期</label>
					</div>
				</div>
				<h4 style="padding: 10px 0; font-size: 16px;" class="list-group-item-success">扣款账户如下</h4>
				<div class="form-inline">
					<div class="form-group newInput">
						<label><span style="color: red">*</span>开户行：</label> <input type="text" name="sopenbank"
							value="${biz.sopenbank }" class="form-control required">
					</div>
					<div class="form-group newInput">
						<label><span style="color: red">*</span>账户名：</label> <input type="text" name="saccountname"
							value="${biz.saccountname }" class="form-control required">
					</div>
					<div class="form-group newInput">
						<label><span style="color: red">*</span>账号：</label> <input type="text" name="saccountcode"
							value="${biz.saccountcode }" class="form-control required" id=userName2 oninput="user(this)"
							style="font-weight: 700">
					</div>
				</div>
				<h4 style="padding: 10px 0; font-size: 16px;" class="list-group-item-success">还款计划表第二到四年</h4>
				<p style="text-align: center; padding: 10px 0">
					<button type="button" class="btn btn-danger calculate2">自动计算还款</button>
				</p>
				<div class="table-responsive">
					<table class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
								<th class="success">首付</th>
								<th>租赁期限</th>
								<th>月租金</th>
								<th>支付日</th>
								<th>每年总租金合计</th>
							</tr>
						</thead>
						<tbody class="table2">
							<c:forEach var="item" items="${plan2}">
								<tr>
									<td align="center">0</td>
									<td>${item.term }</td>
									<td>${item.price }</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.paytime}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="du-contain2">
					<div class="form-inline ensure4" style="margin-top: 20px; display: none;">
						<button type="button" class="close" aria-label="Close" style="color: red; opacity: 1"
							onclick="del(this)">
							<span aria-hidden="true">×</span>
						</button>
						<div class="form-group newInput">
							<label>担保人：</label> <input type="text" name="bondsman2" value="${item.bondsman}"
								class="form-control">
						</div>
						<div class="form-group newInput">
							<label>住所：</label> <input type="text" name="bmaddress2" value="${item.bmaddress}"
								class="form-control">
						</div>
						<div class="form-group newInput">
							<label>实际经营场所：</label> <input type="text" name="bmrunaddress2" value="${item.bmrunaddress}"
								class="form-control">
						</div>
						<div class="form-group newInput">
							<label>传真：</label> <input type="text" name="bmfaxes2" value="${item.bmfaxes}"
								class="form-control">
						</div>
						<div class="form-group newInput">
							<label>电话：</label> <input type="text" name="bmphone2" value="${item.bmphone}"
								class="form-control">
						</div>
					</div>
					<c:forEach var="item" items="${bizb2}">
						<div class="form-inline ensure2" style="margin-top: 20px">
							<button type="button" class="close" aria-label="Close" style="color: red; opacity: 1"
								onclick="del(this)">
								<span aria-hidden="true">×</span>
							</button>
							<div class="form-group newInput">
								<label>担保人：</label> <input type="text" name="bondsman2" value="${item.bondsman}"
									class="form-control">
							</div>
							<div class="form-group newInput">
								<label>住所：</label> <input type="text" name="bmaddress2" value="${item.bmaddress}"
									class="form-control">
							</div>
							<div class="form-group newInput">
								<label>实际经营场所：</label> <input type="text" name="bmrunaddress2" value="${item.bmrunaddress}"
									class="form-control">
							</div>
							<div class="form-group newInput">
								<label>传真：</label> <input type="text" name="bmfaxes2" value="${item.bmfaxes}"
									class="form-control">
							</div>
							<div class="form-group newInput">
								<label>电话：</label> <input type="text" name="bmphone2" value="${item.bmphone}"
									class="form-control">
							</div>
						</div>
					</c:forEach>
				</div>
				<p style="text-align: center; padding: 10px 0">
					<button type="button" class="btn btn-warning ensure2-btn">添加担保人</button>
				</p>
				<div class="du-info">
					<span>合同信息补充：</span>
					<textarea class="form-control" name="note" rows="7">${biz.note }</textarea>
				</div>
				<div class="du-btn">
					<a href="javascript:;" class="btn btn-danger submit" role="button">合同提交保存 </a>
					<a href="javascript:;" class="btn btn-warning" onclick="back()" role="button"
						style="padding: 6px 38px"> 取消 </a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
<script>
	function aproveprice(val) {
		$('#superviseprice').val(parseFloat(val * 0.01).toFixed(2));
		$('#promiseprice').val(parseFloat(val * 0.015).toFixed(2));
		$('#sleaseprice').val(parseFloat(val * 3 / 4).toFixed(2));
		$('#ssuperviseprice').val(parseFloat(val * 0.03 / 4).toFixed(2));
		$('#spromiseprice').val(parseFloat(val * 0.045 / 4).toFixed(2));
	}
	$(".calculate1")
			.click(
					function() {
						var additionalinterestrate = $(
								"#additionalinterestrate").val();//额外利率
						var c = /((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/;
						if (!c.test(additionalinterestrate)
								&& additionalinterestrate != "") {
							$("#additionalinterestrate").focus();
							return false;
						}
						var calculate1 = $('#calculate1Url').val();
						var sightime1 = $('#sightime1').val();
						var leaseprice = $('#leaseprice').val();
						if (sightime1 == "") {
							$("#sightime1").focus();
						} else {
							$
									.ajax({
										//几个参数需要注意一下
										type : "POST",//方法类型
										dataType : "json",//预期服务器返回的数据类型
										url : calculate1,//url
										data : {
											sightime1 : sightime1,
											leaseprice : leaseprice,
											type : 1,
											additionalinterestrate : additionalinterestrate
										},
										success : function(data) {
											console.log(data);//打印服务端返回的数据(调试用)
											var table1 = $('.table1 tr');
											for (var i = 0; i < table1.length; i++) {
												if (i == 0) {
													table1.eq(0).find('td').eq(
															2).html(
															data.leaseprice2);
													table1
															.eq(0)
															.find('td')
															.eq(3)
															.html(
																	data.time2[0].time1);
													table1
															.eq(0)
															.find('td')
															.eq(4)
															.html(
																	data.totalleaseprice1);
												} else {
													table1.eq(i).find('td').eq(
															2).html(
															data.leaseprice3);
													table1
															.eq(i)
															.find('td')
															.eq(3)
															.html(
																	data.time2[i].time1);
												}
											}
										},
									});
						}
					});
	$(".calculate2").click(
			function() {
				var calculate1 = $('#calculate1Url').val();
				var sightime1 = $('#sightime1').val();
				var leaseprice = $('#leaseprice').val();
				if (sightime1 == "") {
					$("#sightime1").focus();
				} else {
					$.ajax({
						//几个参数需要注意一下
						type : "POST",//方法类型
						dataType : "json",//预期服务器返回的数据类型
						url : calculate1,//url
						data : {
							sightime1 : sightime1,
							leaseprice : leaseprice,
							type : 2
						},
						success : function(data) {
							console.log(data);//打印服务端返回的数据(调试用)
							var table = $('.table2 tr');
							for (var i = 0; i < table.length; i++) {
								if (i == 0) {
									table.eq(0).find('td').eq(2).html(
											data.leaseprice2);
									table.eq(0).find('td').eq(3).html(
											data.time2[0].time1);
								} else {
									table.eq(i).find('td').eq(2).html(
											data.leaseprice3);
									table.eq(i).find('td').eq(3).html(
											data.time2[i].time1);
								}
							}
							table.eq(0).find('td').eq(4).html(
									data.totalleaseprice2);
							table.eq(12).find('td').eq(4).html(
									data.totalleaseprice3);
							table.eq(24).find('td').eq(4).html(
									data.totalleaseprice3);
						},
					});
				}
			});
	$(function() {
		var leaseprice = $('#leaseprice').val();
		$('#superviseprice').val(parseFloat(leaseprice * 0.01).toFixed(2));
		$('#promiseprice').val(parseFloat(leaseprice * 0.015).toFixed(2));
		$('#sleaseprice').val(parseFloat(leaseprice * 3 / 4).toFixed(2));
		$('#ssuperviseprice').val(parseFloat(leaseprice * 0.03 / 4).toFixed(2));
		$('#spromiseprice').val(parseFloat(leaseprice * 0.045 / 4).toFixed(2));
	});
	//时间初始化
	$('.mesTime').jeDate({
		//    isinitVal:true,
		format : "YYYY-MM-DD",
		isTime : false,
		isClear : false,
		minDate : "2014-09-19 00:00:00"
	});
	//添加担保人
	var div = $(".ensure3").clone().css('display', 'block');
	var div2 = $(".ensure4").clone().css('display', 'block');
	$(".ensure1-btn").click(function() {
		var aa = div.clone();
		aa.appendTo($(".du-contain")).find("input").val("");
	});
	$(".ensure2-btn").click(function() {
		var aa = div2.clone();
		aa.appendTo($(".du-contain2")).find("input").val("");
	});
	//删除担保人
	function del(target) {
		$(target).parent().remove();
	}

	//银行卡号正则匹配
	function user(code) {
		//[^\d\s] 除了数字和任何空白字符
		//   $(code).val($(code).val().replace(/[^\d\s]+$/g,""));
		$(code).val(
				$(code).val().replace(/[^\d\s]/g, '').replace(/(\d{4})(?=\d)/g,
						"$1 "));
		if (!/\d{14,19}/.test($(code).val())) {
			//        alert(1)
			$(this).focus();
		}
	}

	var status=true;
	$(".submit")
			.click(
					function() {

						var reqNum = 0;
						var phoNum = 0;
						var phoNum2 = 0;
						var phoNum3 = 0;
						var priNum = 0;
						var moneyNum = 0;
						var moneyNum2 = 0;
						var moneyNum3 = 0;
						//必填值验证
						$.each($(".required"), function() {
							if ($(this).val() == "") {
								$(this).focus();
								//    	            alert($(this).siblings('label').text().replace(/\*|\：/g, "") + "为必填字段");
								return false;
							} else {
								return reqNum++;
							}
						});

						if (reqNum == $(".required").length) {
							//手机号验证
							//    	        $.each($(".phone"), function () {
							//    	            if (!/^1[34578]\d{9}$/.test($(this).val())) {
							//    	                $(this).focus();
							//    	                return false;
							//    	            }
							//    	            else{
							//    	                phoNum++;
							//    	            }
							//    	        });

							$.each($(".phone"),
									function() {
										if ($(this).hasClass('required')) {
											if (!/^1[34578]\d{9}$/.test($(this)
													.val())) {
												$(this).focus();
												return false;
											} else {
												return phoNum++;
											}
										} else {
											if ($(this).val() != "") {
												phoNum2++;
												if (!/^1[34578]\d{9}$/.test($(
														this).val())) {
													$(this).focus();
													return false;
												} else {
													return phoNum3++;
												}
											}
										}
									})
						}
						if ($(".phone.required").length == phoNum
								&& phoNum2 == phoNum3) {
							//提交时 去除银行卡空格  银行卡验证
							var userName1 = $("#userName1").val().replace(
									/\s/g, '');
							var userName2 = $("#userName2").val().replace(
									/\s/g, '');
							if (!/^\d{14,19}$/.test(userName1)) {
								$("#userName1").focus();
							} else if (!/^\d{14,19}$/.test(userName2)) {
								$("#userName2").focus();
							} else {
								priNum = 1;
							}
						}
						if (priNum == 1) {
							//金额验证
							$
									.each(
											$(".money"),
											function() {
												if ($(this)
														.hasClass('required')) {
													if (!/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/
															.test($(this).val())) {
														$(this).focus();
														return false;
													} else {
														return moneyNum++;
													}
												} else {
													if ($(this).val() != "") {
														moneyNum2++;
														if (!/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/
																.test($(this)
																		.val())) {
															$(this).focus();
															return false;
														} else {
															return moneyNum3++;
														}
													}
												}
											});
						}
						if ($(".money.required").length == moneyNum
								&& moneyNum2 == moneyNum3) {
							//提交
							var updateleasebacksaveUrl = $(
									'#updateleasebacksaveUrl').val()
									+ "?updateleaseback=1";
							//提交时 去除银行卡空格
							//  var userName1=$("#userName1").val().replace(/\s/g,'');
							//  var userName2=$("#userName2").val().replace(/\s/g,'');
							var formData = new FormData($("#searchForm")[0]);
							if(status){
							status=false;
							$.ajax({
								//几个参数需要注意一下
								type : "POST",//方法类型
								dataType : "json",//预期服务器返回的数据类型
								url : updateleasebacksaveUrl,//url
								data : formData,
								async : false,
								cache : false,
								contentType : false,
								processData : false,
								success : function(data) {
									if (data.status) {
										alert("保存成功");
										location.href = $('#backUrl').val()
												+ "?currpage="
												+ $('#currpage').val()
												+ "&type=1";
									} else {
										alert(data.msg);
									}
								}

							});
							}
						}

					});

	function rent(code) {
		var ss = $(code).val();
		if (ss.slice(0, 14) != "瑞新(上海)融资租赁有限公司") {
			$(code).val("瑞新(上海)融资租赁有限公司");
		}
	};
	function back() {
		location.href = $('#backUrl').val() + "?currpage="
				+ $('#currpage').val() + "&type=1";
	};
	$(
			"<td rowspan='12' style='text-align: center;vertical-align: inherit;font-weight: 700'>"
					+ $('#first').val() + "</td>").appendTo(
			$(".table1 tr").eq(0))
	$(
			"<td rowspan='12' style='text-align: center;vertical-align: inherit;font-weight: 700'>"
					+ $('#second').val() + "</td>").appendTo(
			$(".table2 tr").eq(0))
	$(
			"<td rowspan='12' style='text-align: center;vertical-align: inherit;font-weight: 700'>"
					+ $('#thirdly').val() + "</td>").appendTo(
			$(".table2 tr").eq(12))
	$(
			"<td rowspan='12' style='text-align: center;vertical-align: inherit;font-weight: 700'>"
					+ $('#fourthly').val() + "</td>").appendTo(
			$(".table2 tr").eq(24))
</script>
