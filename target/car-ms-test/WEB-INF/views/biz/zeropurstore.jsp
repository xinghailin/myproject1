<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>零采车任务</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizcontract.css" />
<link rel="stylesheet" href="${cssBasePath}/common/index.css" />
<input type="hidden" id="backUrl" value="<ufa:url fieldName="bizzeropurstoreindex" namespace="car-ms"/>">
</head>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container">
				<h3 class="title">零采车任务</h3>
				<div class="form-inline">
					<div class="form-group newInput"><label>车辆品牌：</label> <label>${zp.brand}</label></div>
					<div class="form-group newInput"><label>车辆型号：</label> <label>${zp.model}</label></div>
					<div class="form-group newInput"><label>车辆版本：</label> <label>${zp.version}</label></div>
					<div class="form-group newInput"><label>外观颜色：</label> <label>${zp.outcolor}</label></div>
					<div class="form-group newInput"><label>内饰颜色：</label> <label>${zp.incolor}</label></div>
					<div class="form-group newInput"><label>配置：</label> <label>${zp.config}</label></div>
			</div>
				<form name="editForm" id="editForm" method="post" action="<ufa:url namespace="car-ms" fieldName="bizzeropurstoretosave"/>" style="margin-top: 20px"><input type="hidden" id="id" name="id" value="${zp.id}"> <input type="hidden" id="currpage" name="currpage" value="${currpage}">
					<div class="form-inline" style="padding-top: 20px">
						<div class="form-group newInput" style="width: 30%"><label>零采成本价：</label> <input type="text" class="form-control" id="costprice" name="costprice" placeholder="金额（元）" value="${zp.costprice}" readonly="readonly"></div>
						<div class="form-group newInput" style="width: 30%"><label>门店结算价：</label> <input type="text" class="form-control" id="settleprice" name="settleprice" placeholder="金额（元）" value="${zp.settleprice}" readonly="readonly"></div>
						<div class="form-group newInput" style="width: 30%"><label>车架号：</label> <input type="text" class="form-control" name="vin" value="${zp.vin}" readonly="readonly"></div>
				</div></form>
				<div class="du-btn"><c:if test="${zp.status eq '1'}">
						<button type="button" class="btn btn-danger" style="padding: 6px 18px; margin-left: -200px;" id="saveBtn">入库</button>
					</c:if>
					<button type="button" class="btn btn-warning" style="padding: 6px 18px" id="backBtn">返回</button></div>
		</div>
	</div>
</div>
	<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
	<script>
seajs.use("${scriptBasePath}/biz/zeropurstore.js?r=<%=new Date()%>");
	</script>
</body>
</html>