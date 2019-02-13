<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>新建风控案件</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizrisk.css" />
<input type="hidden" id="currpage" name="currpage" value="${currpage}">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="caseotherlst" namespace="car-ms"/>">
</head>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container kv-main">
				<h3 class="title">新建二抵/其他类案件</h3>
				<form name="editForm" id="editForm" method="POST" enctype="multipart/form-data" class="upload" action="<ufa:url namespace="car-ms" fieldName="casesave"/>"><input type="hidden" id="type" name="type" value="2">
					<h4 style="padding: 10px 10px;" class="list-group-item-danger">案件名称：<span style="display: inline-block; width: 300px;"><input class="form-control" name="casename" id="casename" value="" style="display: inline-block;" type="text"></span></h4>
					<div class="form-inline">
						<div class="form-group newInput"><label>文件1：</label><input id="f1" name="f1" type="file" style="display: inline-block"></div>
						<div class="form-group newInput"><label>文件2：</label><input id="f2" name="f2" type="file" style="display: inline-block"></div>
						<div class="form-group newInput"><label>文件3：</label><input id="f3" name="f3" type="file" style="display: inline-block"></div>
						<div class="form-group newInput"><label>情况描述：</label> <textarea class="form-control" rows="4" style="resize: none; min-width: 300px" id="du-reason1" name="note"></textarea></div></div></form>
				<div class="du-btn"><a href="javascript:;" class="btn btn-danger" role="button" id="saveBtn" style="padding: 6px 38px">提交</a><a href="javascript:;" class="btn btn-warning" role="button" id="backBtn" style="padding: 6px 38px">返回</a></div>
		</div>
	</div>
</div>
</body>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script>
	seajs.use("${scriptBasePath}/biz/case2add.js?r=<%=new Date()%>");
</script>
</html>