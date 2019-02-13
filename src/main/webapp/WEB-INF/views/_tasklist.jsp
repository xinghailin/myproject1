<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link rel="stylesheet" href="${cssBasePath}/common/index.css" />
<link rel="stylesheet" href='${cssBasePath}/common/common.css' />
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
</head>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; width: 1400px;">
		<div class="rg_list">
			<div class="table_list">
				<table class="tb_mian" cellspacing="0" cellpadding="0">
					<thead>
						<tr style="background-color: #dff0d8;">
							<th>菜单(menu)</th>
							<th>上级菜单(Superior menu)</th>
							<th>任务统计(Statistics Task)</th>
							<th>任务说明(task specification)</th>
							<th>操作(operate)</th>
					</tr>
				</thead>
					<tbody>
						<c:forEach var="item" items="${lst}">
							<tr>
								<td>${item.memu}</td>
								<td>${item.parentmenu}</td>
								<td><span style="color: red; font-weight: bold;">${item.num}</span></td>
								<td>${item.note}</td>
								<td><a href="${contextPath}${item.url}" class="btn btn-primary" role="button" style="padding: 2px 6px; text-align: center;">去处理(to deal with)</a></td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
		<div style="margin: 10px 0; float: left; margin-left: 40%;"><span style="color: #337ab7; font-size: 14px; font-weight: bold;">共 ${fn:length(lst)} 个待办菜单</span></div>
</div>
</body>
</html>