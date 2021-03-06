<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>风控案件</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizrisk.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css"/>
<input type="hidden" id="backUrl" value="<ufa:url fieldName="caselawlst" namespace="car-ms"/>">
</head>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container kv-main">
				<h3 class="title">融资租赁逾期案件跟进</h3>
				<h4 style="padding: 10px 10px;" class="list-group-item-danger">案件名称：<span style="display: inline-block; width: 300px;">${riskcase.casename }</span></h4>
				<div class="form-inline"><%@ include file="/WEB-INF/views/biz/case1piece3.jsp"%></div> <%@ include file="/WEB-INF/views/biz/case1piece.jsp"%>
				<form name="editForm" id="editForm" method="POST" enctype="multipart/form-data" class="upload" action="<ufa:url namespace="car-ms" fieldName="casesave2"/>"><input type="hidden" id="id" name="id" value="${riskcase.id}"> <input type="hidden" id="currpage" name="currpage"
					value="${currpage}"> <input type="hidden" id="status" name="status" value="${riskcase.status}">
						<div class="form-inline" style="margin-top: 20px;">
							<div class="form-group newInput"><label>诉前保全：</label> <label class="radio-inline" style="margin-right: 20px"> <input type="radio" name="prefixsafe" id="inlineRadio1" value="1">是
							</label> <label class="radio-inline"> <input type="radio" name="prefixsafe" id="inlineRadio2" value="2">否
							</label></div>
						</div>
						<div class="form-inline" id="part1">
							<div class="form-group newInput"><label style="font-weight: normal;">文件1：</label><input id="pf1" name="pf1" type="file" style="display: inline-block"></div>
							<div class="form-group newInput"><label style="font-weight: normal;">文件2：</label><input id="pf2" name="pf2" type="file" style="display: inline-block"></div>
							<div class="form-group newInput"><label style="font-weight: normal;">文件3：</label><input id="pf3" name="pf3" type="file" style="display: inline-block"></div>
							<div class="form-group newInput"><label style="font-weight: normal;">情况描述：</label> <textarea class="form-control" rows="4" style="resize: none; min-width: 300px" id="du-reason1" name="pnote"></textarea></div>
						</div>
					</form>
				<div class="du-btn"><a href="javascript:;" class="btn btn-danger" role="button" id="saveBtn" style="padding: 6px 38px">提交</a> <a href="javascript:;" class="btn btn-warning" role="button" id="backBtn" style="padding: 6px 38px">返回</a></div>
		</div>
	</div>
</div>
</body>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script>
	seajs.use("${scriptBasePath}/biz/caseoperate.js?r=<%=new Date()%>");
</script>
</html>