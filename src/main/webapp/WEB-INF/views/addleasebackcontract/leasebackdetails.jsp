<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<input type="hidden" id="backUrl"
	value="<ufa:url fieldName="leasebackListpage" namespace="car-ms"/>">
<input type="hidden" id="passUrl" value="<ufa:url fieldName="saleborrowpass" namespace="car-ms"/>">
<input type="hidden" id="nopassUrl"
	value="<ufa:url fieldName="saleborrownopass" namespace="car-ms"/>">
<input type="hidden" id="back1Url"
	value="<ufa:url fieldName="financialcontracts" namespace="car-ms"/>">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/jquery.jedate.js"></script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>融资租赁售后回租合同详情</title>
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
			<!-- 本页面是详情查看和审核页面  -->
			<h4 style="padding: 10px 0;" class="list-group-item-danger">车辆销售合同</h4>
			<div class="form-inline">
				<input type="hidden" id="currpage" value="${currpage }"> <input type="hidden"
					id="saleborrowid" value="${id }">
				<!-- 金融合同id -->
				<input type="hidden" id="loginId" value="${loginId }">
				<!--登录账户id  -->
				<input type="hidden" id="type" value="${type }">
				<!--1 返回添加列表 2 返回 修改编辑列表 3 返回 审核列表页面  -->
				<div class="form-group newInput">
					<label>合同编号：</label> <label>${bizc.filecode }</label>
				</div>
			</div>
			<h4 style="padding: 10px 0; font-size: 16px;" class="list-group-item-success">基本信息</h4>
			<div class="form-inline">
				<div class="form-group newInput">
					<label>甲方（卖方）：</label> <label>${bizc.name }</label>
				</div>
				<div class="form-group newInput">
					<label>选择门店：</label> <label>${bizc.shopname }</label>
				</div>
				<div class="form-group newInput">
					<label>住所（址）：</label> <label>${bizc.address }</label>
				</div>
				<div class="form-group newInput">
					<label>联系人：</label> <label>${bizc.principle }</label>
				</div>
				<div class="form-group newInput">
					<label>档案编号：</label> <label>${bizc.filecode }</label>
				</div>
				<div class="form-group newInput">
					<label>联系电话：</label> <label>${bizc.phone }</label>
				</div>
			</div>
			<div class="form-inline">
				<div class="form-group newInput">
					<label>乙方（买方）：</label> <label>${bizc.bname }</label>
				</div>
				<div class="form-group newInput">
					<label>住所（址）：</label> <label>${bizc.baddress }</label>
				</div>
				<div class="form-group newInput">
					<label>公司名称：</label> <label>${bizc.companyname }</label>
				</div>
				<div class="form-group newInput">
					<label>联系电话：</label> <label>${bizc.bphone }</label>
				</div>
				<div class="form-group newInput">
					<label>身份证号：</label> <label>${bizc.identify }</label>
				</div>
				<div class="form-group newInput">
					<label>企业代码：</label> <label>${bizc.corpcode }</label>
				</div>
			</div>
			<h4 style="padding: 10px 0; font-size: 16px;" class="list-group-item-success">车辆信息</h4>
			<div class="form-inline">
				<div class="form-group newInput">
					<label>车辆品牌：</label> <label>${bizc.brand }</label>
				</div>
				<div class="form-group newInput">
					<label>车辆型号：</label> <label>${bizc.model }</label>
				</div>
				<div class="form-group newInput">
					<label>车辆版别：</label> <label>${bizc.version }</label>
				</div>
				<div class="form-group newInput">
					<label>外观颜色：</label> <label>${bizc.outcolor }</label>
				</div>
				<div class="form-group newInput">
					<label>内饰颜色：</label> <label>${bizc.incolor }</label>
				</div>
				<div class="form-group newInput">
					<label>配置：</label> <label>${bizc.config }</label>
				</div>
				<div class="form-group newInput">
					<label>车辆售价：</label> <label>${bizc.saleprice }</label>
				</div>
				<div class="form-group newInput">
					<label>运费：</label> <label>${bizc.transprice }</label>
				</div>
				<div class="form-group newInput">
					<label>上牌费：</label> <label>${bizc.filecode }</label>
				</div>
				<div class="form-group newInput">
					<label>金融购车：</label> <label>是</label>
				</div>
			</div>
			<div class="form-inline">
				<div class="form-group newInput">
					<label>车辆销售合同：</label>
					<a href="${contextPath}${bizc.salecontract }" class="btn btn-primary"
						download="${bizc.salecontract }" role="button"> 合同下载 </a>
				</div>
				<div class="form-group newInput">
					<label>报价单：</label>
					<a href="${contextPath}${bizc.reportbill }" download="${bizc.reportbill }"
						class="btn btn-primary" role="button"> 报价单下载 </a>
				</div>
			</div>
			<div class="du-info">
				<span style="width: 150px;">销售合同信息补充：</span>
				<textarea class="form-control" rows="7" readonly="readonly">${bizc.note }</textarea>
			</div>
			<h3 class="title">融资租赁售后回租合同</h3>
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="addleasebacksave" namespace="car-ms"/>"
				enctype="multipart/form-data" method="post">
				<div class="form-inline">
					<div class="form-group newInput" style="width: 26%;">
						<label> 第一年租赁文件:</label>
						<a href="${contextPath}${biz.saleborrowfile1 }" download="${biz.saleborrowfile1 }"
							class="btn btn-danger" role="button" style=" margin-top: -7px;"> 融资租赁第一年合同下载
						</a>
					</div>
					<div class="form-group newInput" style="width: 30%;">
						<label>第二到四年租赁文件:</label>
						<a href="${contextPath}${biz.saleborrowfile2}" download="${biz.saleborrowfile2}"
							class="btn btn-danger" role="button" style=" margin-top: -7px;">
							融资租赁二到四年合同下载 </a>
					</div>
					<br />
					<div class="form-group newInput" style="width: 30%;">
						<label>抵押文件1:</label>
						<a href="${contextPath}${biz.pledgefile1}" download="${biz.pledgefile1}"
							class="btn btn-danger" role="button" style=" margin-top: -7px;"> 抵押文件下载 </a>
					</div>
					<div class="form-group newInput" style="width: 30%;margin-left: -20px;">
						<label>抵押文件2:</label>
						<a href="${contextPath}${biz.pledgefile2}" download="${biz.pledgefile2}"
							class="btn btn-danger" role="button" style=" margin-top: -7px;"> 其他文件下载 </a>
					</div>
				</div>
				<h4 style="padding: 10px 0;" class="list-group-item-danger">基本信息</h4>
				<div class="form-inline">
					<input type="hidden" id="cid" name="cid" value="${id }"> <input type="hidden"
						id="loginId" name="loginId" value="${loginId }"> <input type="hidden" id="first"
						name="first" value="${first }"> <input type="hidden" id="second" name="second"
						value="${second }"> <input type="hidden" id="thirdly" name="thirdly"
						value="${thirdly }"> <input type="hidden" id="fourthly" name="fourthly"
						value="${fourthly }">
					<div class="form-group newInput">
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
					<div class="form-group newInput">
						<label>电话：</label> ${biz.phone }
					</div>
				</div>
				<div class="form-inline">
					<div class="form-group newInput">
						<label>乙方（承租人）：</label> ${biz.bname }
					</div>
					<div class="form-group newInput">
						<label>身份证号：</label> ${biz.identify }
					</div>
					<div class="form-group newInput">
						<label>电话：</label> ${biz.bphone }
					</div>
					<div class="form-group newInput">
						<label>住所：</label> ${biz.baddress }
					</div>
					<div class="form-group newInput">
						<label>实际经营场所：</label> ${biz.brunaddress }
					</div>
					<div class="form-group newInput">
						<label>传真：</label> ${biz.faxes }
					</div>
					<div class="form-group newInput">
						<label>联系人：</label> ${biz.bprinciple }
					</div>
					<div class="form-group newInput">
						<label>签订日期：</label>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${biz.sightime}" />
					</div>
					<div class="form-group newInput">
						<label>车辆品牌：</label> ${biz.brand }
					</div>
					<div class="form-group newInput">
						<label>型号：</label> ${biz.model }
					</div>
					<div class="form-group newInput">
						<label>版别：</label> ${biz.version }
					</div>
					<div class="form-group newInput">
						<label>车架号：</label> ${biz.vin }
					</div>
				</div>
				<h4 style="padding: 10px 0;" class="list-group-item-danger">融资租赁售后回租第一年</h4>
				<div class="form-inline">
					<div class="form-group newInput">
						<label>合同编号：</label> ${biz.firstyearccode }
					</div>
					<div class="form-group newInput">
						<label>租赁物货款：</label> ${biz.leaseprice }
					</div>
					<div class="form-group newInput">
						<label>GPS费用：</label> ${biz.gpsprice }
					</div>
					<div class="form-group newInput">
						<label>手续费：</label> ${biz.handcharge }
					</div>
					<div class="form-group newInput">
						<label>动态监管费：</label> ${biz.superviseprice }
					</div>
					<div class="form-group newInput">
						<label>履约险：</label> ${biz.promiseprice }
					</div>
					<div class="form-group newInput">
						<label>期限：</label> <label><span style="color: red; font-size: 16px; padding: 0 5px">12</span>个月<span
								style="color: red; font-size: 16px; padding: 0 5px">12</span>期</label>
					</div>
					<div class="form-group newInput">
						<label>额外利率：</label> ${biz.additionalinterestrate }%
					</div>
				</div>
				<h4 style="padding: 10px 0; font-size: 16px;" class="list-group-item-success">扣款账户如下</h4>
				<div class="form-inline">
					<div class="form-group newInput">
						<label>开户行：</label> ${biz.openbank }
					</div>
					<div class="form-group newInput">
						<label>账户名：</label> ${biz.accountname }
					</div>
					<div class="form-group newInput">
						<label>账号：</label> ${biz.accountcode }
					</div>
				</div>
				<h4 style="padding: 10px 0; font-size: 16px;" class="list-group-item-success">还款计划表第一年</h4>
				<p style="text-align: center; padding: 10px 0"></p>
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
					<c:forEach var="item" items="${bizb1}">
						<div class="form-inline ensure1" style="margin-top: 20px">
							<div class="form-group newInput">
								<label>担保人：</label> ${item.bondsman}
							</div>
							<div class="form-group newInput">
								<label>住所：</label> ${item.bmaddress}
							</div>
							<div class="form-group newInput">
								<label>实际经营场所：</label> ${item.bmrunaddress}
							</div>
							<div class="form-group newInput">
								<label>传真：</label> ${item.bmfaxes}
							</div>
							<div class="form-group newInput">
								<label>电话：</label> ${item.bmphone}
							</div>
						</div>
					</c:forEach>
				</div>
				<p style="text-align: center; padding: 10px 0"></p>
				<h4 style="padding: 10px 0; margin-top: 30px" class="list-group-item-danger">融资租赁售后回租第二到四年</h4>
				<div class="form-inline">
					<div class="form-group newInput">
						<label>合同编号：</label> ${biz.secondyearccode }
					</div>
					<div class="form-group newInput">
						<label>租赁物货款：</label> ${biz.sleaseprice }
					</div>
					<div class="form-group newInput">
						<label>GPS费用：</label> ${biz.sgpsprice }
					</div>
					<div class="form-group newInput">
						<label>手续费：</label> ${biz.shandcharge }
					</div>
					<div class="form-group newInput">
						<label>动态监管费：</label> ${biz.ssuperviseprice }
					</div>
					<div class="form-group newInput">
						<label>履约险：</label> ${biz.spromiseprice }
					</div>
					<div class="form-group newInput">
						<label>期限：</label> <label><span style="color: red; font-size: 16px; padding: 0 5px">36</span>个月<span
								style="color: red; font-size: 16px; padding: 0 5px">36</span>期</label>
					</div>
				</div>
				<h4 style="padding: 10px 0; font-size: 16px;" class="list-group-item-success">扣款账户如下</h4>
				<div class="form-inline">
					<div class="form-group newInput">
						<label>开户行：</label> ${biz.sopenbank }
					</div>
					<div class="form-group newInput">
						<label>账户名：</label> ${biz.saccountname }
					</div>
					<div class="form-group newInput">
						<label>账号：</label> ${biz.saccountcode }
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
					<c:forEach var="item" items="${bizb2}">
						<div class="form-inline ensure1" style="margin-top: 20px">
							<div class="form-group newInput">
								<label>担保人：</label> ${item.bondsman}
							</div>
							<div class="form-group newInput">
								<label>住所：</label> ${item.bmaddress}
							</div>
							<div class="form-group newInput">
								<label>实际经营场所：</label> ${item.bmrunaddress}
							</div>
							<div class="form-group newInput">
								<label>传真：</label> ${item.bmfaxes}
							</div>
							<div class="form-group newInput">
								<label>电话：</label> ${item.bmphone}
							</div>
						</div>
					</c:forEach>
				</div>
				<c:choose>
					<c:when test="${audit==1 }">
						<div class="du-info">
							<span style="width: 150px;">审核不通过原因：</span>
							<textarea class="form-control" id="nopass" name="nopass" rows="7"></textarea>
						</div>
						<div class="du-btn">
							<div class="du-btn">
								<a href="javascript:;" class="btn btn-warning" role="button" onclick="pass()"
									style="padding: 6px 38px"> 审核通过 </a>

								<a href="javascript:;" class="btn63_02 margin_let10" role="button" onclick="nopass()"
									style="padding: 6px 38px"> 审核不通过 </a>

								<a href="javascript:;" class="btn btn-warning" role="button" onclick="back()"
									style="padding: 6px 38px"> 返回 </a>
							</div>
					</c:when>
					<c:otherwise>
						<div class="du-info">
							<span>合同信息补充：</span>
							<textarea class="form-control" name="note" rows="7" readonly="readonly">${biz.note }</textarea>
						</div>
						<div class="du-btn">
							<c:if test="${type==1 }">
								<!--返回添加列表页面  -->
								<a href="javascript:;" class="btn btn-warning" role="button" onclick="back1()"
									style="padding: 6px 38px"> 返回 </a>
							</c:if>
							<c:if test="${type==2 }">
								<!-- 返回编辑撤销列表 -->
								<a href="javascript:;" class="btn btn-warning" role="button" onclick="back2()"
									style="padding: 6px 38px"> 返回 </a>
							</c:if>
							<c:if test="${type==3 }">
								<!-- 返回审核列表 -->
								<a href="javascript:;" class="btn btn-warning" role="button" onclick="back3()"
									style="padding: 6px 38px"> 返回 </a>
							</c:if>
						</div>
					</c:otherwise>
				</c:choose>
			</form>
		</div>
	</div>
</html>
<script>
	function back1() {
		location.href = $('#back1Url').val() + "?currpage="
				+ $('#currpage').val() + "&type=1";
	}
	function back2() {
		location.href = $('#backUrl').val() + "?currpage="
				+ $('#currpage').val() + "&type=1";
	};
	function back3() {
		location.href = $('#backUrl').val() + "?currpage="
				+ $('#currpage').val() + "&type=2";
	};

	function nopass() {
		var loginId = $("#loginId").val();
		var id = $("#saleborrowid").val();
		var saleborrownopass = $('#nopassUrl').val();
		var nopass = $('#nopass').val();
		if (nopass.length > 0) {
			$.ajax({
				url : saleborrownopass,
				type : 'post',
				datatype : 'json',
				data : {
					loginId : loginId,
					id : id,
					nopass : nopass
				},
				success : function(data) {
					if (data.status) {
						alert("提交成功");
						location.href = $('#backUrl').val() + "?currpage="
								+ $('#currpage').val() + "&type=2";
					} else {
						alert(data.msg);
					}
				}
			});
		} else {
			alert("审核不通过原因必填");
		}
	};
	function pass() {
		var loginId = $("#loginId").val();
		var id = $("#saleborrowid").val();
		var saleborrowpass = $('#passUrl').val();
		$.ajax({
			url : saleborrowpass,
			type : 'post',
			datatype : 'json',
			data : {
				loginId : loginId,
				id : id
			},
			success : function(data) {
				if (data.status) {
					alert('审核成功');
					location.href = $('#backUrl').val() + "?currpage="
							+ $('#currpage').val() + "&type=2";
				} else {
					alert(data.msg);
				}
			}
		});
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
