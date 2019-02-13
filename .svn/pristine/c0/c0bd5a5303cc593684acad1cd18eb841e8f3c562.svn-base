<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>风控案件</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizrisk.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css" />
</head>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container kv-main">
				<h3 class="title">资产上传</h3>
				<h4 style="padding: 10px 10px;" class="list-group-item-danger">案件名称：<span style="display: inline-block; width: 300px;">${riskcase.casename}</span></h4>
				<form name="editForm" id="editForm" method="POST" enctype="multipart/form-data" class="upload" action="<ufa:url namespace="car-ms" fieldName="uploadcasemonitorsave"/>"><input type="hidden" id="id" name="id" value="${riskcase.id}">
				<input type="hidden" id="currpage" name="currpage" value="${currpage }">
					<div class="form-inline" style="margin-top: 20px;">
						<div class="form-group newInput"><label style="font-weight: normal;">资产情况描述：</label> <textarea class="form-control" rows="4" style="resize: none; min-width: 300px" id="property" name="property"></textarea></div>
						<div class="form-group newInput"><label style="font-weight: normal;">执行人情况描述：</label> <textarea class="form-control" rows="4" style="resize: none; min-width: 300px" id="person" name="person"></textarea></div>
				</div></form>
				<div class="du-btn"><a href="javascript:;" class="btn btn-danger" role="button" id="saveBtn" style="padding: 6px 38px">提交</a> <a href="javascript:;" class="btn btn-warning" role="button" id="backBtn" style="padding: 6px 38px" onclick="history.back()">返回</a></div>
		</div>
	</div>
</div>
</body>
<script src="${contextPath}/js/jquery-2.1.4.min.js"></script>
<script>
	$("#saveBtn").click(function(){
		var a=$("#property");
		if(!$.trim(a.val())){
			alert("请填入资产情况描述");
			return false;
		}
		a=$("#person");
		if(!$.trim(a.val())){
			alert("请填入执行人情况描述");
			return false;
		}
		$('#editForm').submit();
	})
	var flag=true;
$("#backBtn").click(function(){
	if(flag){flag=false;
		location.href="${contextPath}${backadd}?currpage=${currpage}";
	}
})
</script>
</html>