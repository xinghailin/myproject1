<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/common/index.css" />
<link rel="stylesheet" href='${cssBasePath}/common/common.css' />
<link rel="stylesheet" href="${cssBasePath}/common/default.css">
<link rel="stylesheet" href="${contextPath}/resources/style/jquery.css" />
</head>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px;">
		<div class="rg_list">
			<div class="table_list">
				<table class="tb_mian" cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<th style="text-align: center;">案件</th>
							<th style="text-align: center">资产情况描述</th>
							<th style="text-align: center">执行人情况描述</th>
							<th style="text-align: center">创建时间</th>
					</tr>
				</thead>
					<tbody>
						<c:forEach var="item" items="${lst}">
							<tr>
								<td>${riskcase.casename}</td>
								<td><c:out value="${item.property}"></c:out></td>
								<td>${item.person}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.createtime}" /></td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
		<div style="margin: 50px 0; float: left; margin-left: 40%;"><span style="color: red; font-size: 14px; font-weight: bold;">共 ${fn:length(lst)} 条记录 </span><a href="javascript:;" class="btn btn-warning" role="button" id="backBtn" style="padding: 6px 38px; text-align: center; margin: 0 20px;">返回</a></div>
</div>
</body>
<script src="${contextPath}/js/jquery-2.1.4.min.js"></script>
<script>
var flag=true;
$("#backBtn").click(function(){
	if(flag){flag=false;
		location.href="${contextPath}${backadd}?currpage=${currpage}";
	}
})
</script>
</html>