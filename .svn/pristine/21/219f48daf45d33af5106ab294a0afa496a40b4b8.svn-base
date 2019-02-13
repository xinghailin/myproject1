<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>风控进件</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizcontract.css" />
<input type="hidden" id="backUrl" value="<ufa:url fieldName="bizcontractindex" namespace="car-ms"/>">
<input type="hidden" id="uploadUrl" value="<ufa:url fieldName="bizriskfilesbatupload" namespace="car-ms"/>">
<input type="hidden" id="formUrl" value="<ufa:url fieldName="bizriskadd" namespace="car-ms"/>">
</head>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container kv-main">
				<h3 class="title">风控进件</h3>
				<h4 style="padding: 10px 0;" class="list-group-item-danger">销售合同编号：<span>${co.filecode }</span></h4>
				<form name="editForm" id="editForm" method="POST" enctype="multipart/form-data" style="margin-top: 20px"><input type="hidden" id="conid" name="conid" value="${co.id }"> <input type="hidden" id="concode" name="concode" value="${co.filecode }"> <input type="hidden"
					id="currpage" name="currpage" value="${currpage}">
					<h4>1.申请表（1张 正面 必选）</h4>
					<div class="form-group"><input id="file-01" class="file-loading" type="file"></div>
					<h4>2.身份证（2张 正反面 必选）</h4>
					<div class="form-group"><input id="file-02" class="file-loading" type="file" multiple data-max-file-count="2"></div>
					<h4>3.驾驶证（1张 必选）</h4>
					<div class="form-group"><input id="file-03" class="file-loading" type="file"></div>
					<h4>4.工作证明（1张 必选）</h4>
					<div class="form-group"><input id="file-04" class="file-loading" type="file"></div>
					<h4>5.征信报告（多张 必选）</h4>
					<div class="form-group"><input id="file-05" class="file-loading" type="file" multiple></div>
					<h4>6.工资卡或经营走账卡（多张 正面 必选）</h4>
					<div class="form-group"><input id="file-06" class="file-loading" type="file" multiple></div>
					<h4>7.流水（多张 必选）</h4>
					<div class="form-group"><input id="file-07" class="file-loading" type="file" multiple></div>
					<h4>8.房产证（多张 必选）</h4>
					<div class="form-group"><input id="file-08" class="file-loading" type="file" multiple></div>
					<h4>9.结婚证（1张 非必选）</h4>
					<div class="form-group"><input id="file-09" class="file-loading" type="file"></div>
					<h4>10.担保人身份证（多张 正反面 非必选）</h4>
					<div class="form-group"><input id="file-10" class="file-loading" type="file" multiple></div>
					<div style="color: red;">注意：上传图片过程可能耗时较长，请耐心等待！</div>
					<div class="du-btn"><a href="javascript:;" class="btn btn-danger" role="button" id="saveBtn" style="padding: 6px 38px">保存</a><a href="javascript:;" class="btn btn-warning" role="button" id="backBtn" style="padding: 6px 38px">取消</a></div></form>
		</div>
	</div>
</div>
	<div class="mask">
		<div class="loding"><img src="${contextPath}/img/loading1.gif" alt="">
			<p>正在上传中......</p></div>
</div>
</body>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script>
	seajs.use("${scriptBasePath}/biz/riskadd.js?r=<%=new Date()%>");
</script>
</html>