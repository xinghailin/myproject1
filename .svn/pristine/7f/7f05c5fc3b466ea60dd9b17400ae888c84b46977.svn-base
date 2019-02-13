<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/common/taurus-common.css" rel="stylesheet">
<input id="actionUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="SYS_USER_RESET_PWD_URL"/>' />
<div class="table_list" style="margin-top: 0px;">
	<form id="resetForm">
		<div class="table_list2">
			<div class="tablist_margin0">
				<div class="tablist">
					<p class="title_p2 fz_14px">您将为以下用户重置密码：</p>
					<table class="tb_mian" cellpadding="0" cellspacing="0">
						<thead>
							<tr>
								<th style="text-align: center">编号</th>
								<th style="text-align: center">用户名称</th>
								<th style="text-align: center">用户姓名</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${users }" varStatus="status">
								<tr>
									<td>${status.count} <input type="hidden" name="userId"
										value="${user.id }" />
									</td>
									<td>${user.loginName }</td>
									<td>${user.name }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="btnlist02">
					<a id='submitBtn' href="javascript:void(0);" class="btn63_01">保存</a>
					<a id='closeBtn' href="javascript:void(0);"
						class="btn63_02 margin_let10">关闭</a>
				</div>
			</div>
		</div>
	</form>
</div>

<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/system/user/resetpwd.js?r=<%=new Date()%>");
</script>