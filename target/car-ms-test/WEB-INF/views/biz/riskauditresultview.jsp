<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>风控进件审核</title>
    <link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
    <link rel="stylesheet" href="${cssBasePath}/css/bizrisk.css" />
    <input type="hidden" id="currpage" name="currpage" value="${currpage}">
	<input type="hidden" id="all" name="all" value="${all}">
	<input type="hidden" id="backUrl" value="<ufa:url fieldName="bizcontractindex" namespace="car-ms"/>">
</head>
<body>
<div class="main_right" id="viewList" style="margin-left:300px;height: 100%;">
<div class="box">
    <div class="container kv-main">
        <h3 class="title">风控进件审核</h3>
        <h4 style="padding: 10px 0;" class="list-group-item-danger">销售合同编号：<span>${co.filecode }</span></h4>
<div class="form-inline"><div class="form-group newInput">
<label>车辆销售合同：</label>
<a href="${contextPath}${co.salecontract}" download="${salecontractname}" style="text-decoration: underline;margin-left: 10px;color: #4d90fe;" title="点击下载">${salecontractname}</a>
</div><div class="form-group newInput">
    <label>报价单：</label>
    <a href="${contextPath}${co.reportbill}" download="${reportbillname}" style="text-decoration: underline;margin-left: 10px;color: #4d90fe;" title="点击下载">${reportbillname}</a>
</div></div>
		
<h4 class="du-title" style="margin-top: 30px">1.申请表</h4>
<div class="form-inline">
    <img src="${contextPath}${risk.applybill}" alt="点击放大" class="img-thumbnail">
</div>
<h4 class="du-title">2.身份证（正反面）</h4>
<div class="form-inline"><c:forEach var="item" items="${filelst2}">
    <img src="${contextPath}${item.address}" alt="..." class="img-thumbnail"></c:forEach>
</div>
<h4 class="du-title">3.驾驶证</h4>
<div class="form-inline">
    <img src="${contextPath}${risk.driverprove}" alt="点击放大" class="img-thumbnail">
</div>
<h4 class="du-title">4.工作证明</h4>
<div class="form-inline">
    <img src="${contextPath}${risk.workprove}" alt="点击放大" class="img-thumbnail">
</div>
<h4 class="du-title">5.征信报告</h4>
<div class="form-inline"><c:forEach var="item" items="${filelst5}">
    <img src="${contextPath}${item.address}" alt="..." class="img-thumbnail"></c:forEach>
</div>
<h4 class="du-title">6.工资卡或经营走账卡（正面）</h4>
<div class="form-inline"><c:forEach var="item" items="${filelst6}">
    <img src="${contextPath}${item.address}" alt="..." class="img-thumbnail"></c:forEach>
</div>
<h4 class="du-title">7.流水（多图）</h4>
<div class="form-inline"><c:forEach var="item" items="${filelst7}">
    <img src="${contextPath}${item.address}" alt="..." class="img-thumbnail"></c:forEach>
</div>
<h4 class="du-title">8.房产证（多图）</h4>
<div class="form-inline"><c:forEach var="item" items="${filelst8}">
    <img src="${contextPath}${item.address}" alt="..." class="img-thumbnail"></c:forEach>
</div>
<h4 class="du-title">9.结婚证（可选）</h4>
<div class="form-inline">
    <img src="${contextPath}${risk.marryprove}" alt="点击放大" class="img-thumbnail">
</div>
<h4 class="du-title">10.担保人身份证（正反面 可选）</h4>
<div class="form-inline"><c:forEach var="item" items="${filelst10}">
    <img src="${contextPath}${item.address}" alt="..." class="img-thumbnail"></c:forEach>
</div>
<div class="form-inline" style="margin-top: 30px">
<div class="form-group newInput">
<label>审批金额：</label>
    ${risk.aproveprice }
</div>
</div>
<div class="form-inline">
<div class="form-group newInput">
<label>补件原因：</label>
${risk.repairreason }
</div>
<div class="form-group newInput">
<label>拒单原因：</label>
${risk.refusereason }
</div>
</div>
<div class="form-inline">
    <label>审批结果：</label>${co.status eq '51'?"风控初审通过":co.status eq '52'?"初审补件":co.status eq '53'?"初审不通过":co.status eq '54'?"复审通过":co.status eq '55'?"复审补件":co.status eq '56'?"复审不通过":""}
</div>
<div class="du-btn">
<a href="javascript:;" class="btn btn-warning" role="button" id="backBtn" style="padding: 6px 38px">返回</a>
</div>	
    </div>
</div>
</div>
</body>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}"></script>
<script>
seajs.use("${scriptBasePath}/biz/contractshoppass.js");
</script>
</html>