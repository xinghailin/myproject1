<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>风控进件审核</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizrisk.css" />
<input type="hidden" id="backUrl" value="<ufa:url fieldName="bizcontractindex" namespace="car-ms"/>">
</head>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container kv-main">
				<h3 class="title">风控进件审核</h3>
				<h4 style="padding: 10px 0;" class="list-group-item-danger">销售合同编号：<span>${co.filecode }</span></h4>
				<div class="form-inline"><div class="form-group newInput du-choose-category"><label>车辆销售合同：</label> <a href="${contextPath}${co.salecontract}" download="${salecontractname}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${salecontractname}</a></div>
					<div class="form-group newInput du-choose-category"><label>报价单：</label> <a href="${contextPath}${co.reportbill}" download="${reportbillname}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${reportbillname}</a></div></div>
				<h4 class="du-title" style="margin-top: 10px">1.申请表（1张 正面 必选）</h4>
				<div class="form-inline"><img src="${contextPath}${risk.applybill}" alt="点击放大" class="img-thumbnail"></div>
				<h4 class="du-title">2.身份证（2张 正反面 必选）</h4>
				<div class="form-inline"><c:forEach var="item" items="${filelst2}">
						<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
					</c:forEach></div>
				<h4 class="du-title">3.驾驶证（1张 必选）</h4>
				<div class="form-inline"><img src="${contextPath}${risk.driverprove}" alt="点击放大" class="img-thumbnail"></div>
				<h4 class="du-title">4.工作证明（1张 必选）</h4>
				<div class="form-inline"><img src="${contextPath}${risk.workprove}" alt="点击放大" class="img-thumbnail"></div>
				<h4 class="du-title">5.征信报告（多张 必选）</h4>
				<div class="form-inline"><c:forEach var="item" items="${filelst5}">
						<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
					</c:forEach></div>
				<h4 class="du-title">6.工资卡或经营走账卡（多张 正面 必选）</h4>
				<div class="form-inline"><c:forEach var="item" items="${filelst6}">
						<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
					</c:forEach></div>
				<h4 class="du-title">7.流水（多张 必选）</h4>
				<div class="form-inline"><c:forEach var="item" items="${filelst7}">
						<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
					</c:forEach></div>
				<h4 class="du-title">8.房产证（多张 必选）</h4>
				<div class="form-inline"><c:forEach var="item" items="${filelst8}">
						<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
					</c:forEach></div>
				<h4 class="du-title">9.结婚证（1张 非必选）</h4>
				<div class="form-inline"><c:if test="${not empty risk.marryprove}">
						<img src="${contextPath}${risk.marryprove}" alt="点击放大" class="img-thumbnail">
					</c:if></div>
				<h4 class="du-title">10.担保人身份证（多张 正反面 非必选）</h4>
				<div class="form-inline"><c:forEach var="item" items="${filelst10}">
						<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
					</c:forEach></div>
				<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="bizriskaudit"/>" enctype="multipart/form-data" style="margin-top: 20px"><input type="hidden" id="id" name="id" value="${co.id}"> <input type="hidden" id="riskid" name="riskid"
					value="${risk.id}"> <input type="hidden" id="ret" name="ret" value=""> <input type="hidden" id="node" name="node" value="${node}"> <input type="hidden" id="currpage" name="currpage" value="${currpage}">
					<div class="form-inline" style="margin-top: 30px">
						<div class="form-group newInput"><label>审批金额：</label> <c:if test="${node eq '3'}">
								<input type="text" class="form-control" id="aproveprice" name="aproveprice" placeholder="金额（元）" value="${risk.aproveprice}">
							</c:if> <c:if test="${node eq '4'}">${risk.aproveprice}</c:if></div>
						<div class="form-group newInput"><label>缺少金额：</label> <c:if test="${node eq '3'}">
								<input type="text" class="form-control" id="missmoney" name="missmoney" placeholder="金额（元）" value="${risk.missmoney}">
							</c:if> <c:if test="${node eq '4'}">${risk.missmoney}</c:if></div> <!-- <div class="form-group newInput">
<label>消费贷贷审会审批表：</label><input id="texturl" name="fapprovaltable" type="file"> 
</div> -->
				</div>
					<div class="form-inline" style="margin-top: 30px">
						<div class="form-group newInput"><label>消费贷贷审会审批表：</label> <c:if test="${not empty risk.approvaltableurl}">
								<a href="${contextPath}${risk.approvaltableurl}" download="${texturlname}" style="text-decoration: underline; margin-right: 10px; color: #4d90fe;" title="点击下载">${texturlname}</a>
							</c:if> <c:if test="${node eq '3'}">
								<input id="fapprovaltable" name="fapprovaltable" type="file">
							</c:if></div>
				</div>
					<div class="form-inline">
						<div class="form-group newInput"><label>补件原因：</label> <textarea class="form-control" rows="4" style="resize: none; min-width: 300px" id="du-reason1" name="repairreason">${risk.repairreason}</textarea></div>
						<div class="form-group newInput"><label>拒单原因：</label> <textarea class="form-control" rows="4" style="resize: none; min-width: 300px" id="du-reason2" name="refusereason">${risk.refusereason}</textarea></div> <c:if test="${node eq '3' and co.status eq '4'}">
							<div class="form-inline">
								<div class="form-group newInput"><label>状态：</label>风控进件待审核</div>
							</div>
						</c:if> <c:if test="${node eq '4' and co.status eq '51'}">
							<div class="form-inline">
								<div class="form-group newInput"><label>状态：</label>风控进件初审通过</div>
							</div>
						</c:if>
				</div></form>
				<div class="du-btn"><a href="javascript:;" class="btn btn-danger" role="button" id="saveBtn" style="padding: 6px 38px">审核通过 </a> <a href="javascript:;" class="btn btn-warning" role="button" id="remainBtn" style="padding: 6px 38px">补件 </a> <a href="javascript:;" class="btn btn-warning"
					role="button" id="noBtn" style="padding: 6px 38px">拒单</a> <a href="javascript:;" class="btn btn-warning" role="button" id="backBtn" style="padding: 6px 38px">返回</a></div>
		</div>
	</div>
</div>
</body>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script>
seajs.use("${scriptBasePath}/biz/riskaudit.js?r=<%=new Date()%>");
</script>
</html>