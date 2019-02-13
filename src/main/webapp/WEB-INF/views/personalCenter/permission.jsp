<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/common/taurus-common.css" rel="stylesheet">
<input id="searchUrl" type="hidden" value='<ufa:url namespace="decorate-portal-ms" fieldName="PERSONAL_QUERY_USER_ROLE_AJAX"/>' /> 
<div class="main_right">
<div class="rg_list">
    <p class="title_p2 fz_14px">个人角色权限查看</p>
    <input type="hidden" id="nowUserId" value="${sessionScope.accountInfo.id}" />
    <script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list">
    <table cellpadding="0" cellspacing="0"  class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center" >角色名称</th>
            <th style="text-align:center" >权限名称</th>
			<th style="text-align:center" >权限描述</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{roleName}}</td>
			<td>{{name}}</td>
			<td>{{description}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination" class="pagelist"></div>
</script>
<div  class="hide" id="J_DataList"></div>
		  <div class="nodata hide" id="J_NoDataMsg">
		      <div class="prompt">
				暂无数据
		      </div>
		     
		  </div>
	<%-- <div class="table_list" style="margin-top: 0px;" >
    <table cellpadding="0" cellspacing="0"  class="tb_mian">
        <thead>
        <tr>                     
            <th style="text-align:center">角色名称</th>
            <th style="text-align:center">权限名称</th>
			<th style="text-align:center">权限描述</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="resource" items="${resources}">
          <tr>
            <td style="text-align:left;padding:0 8px 0 8px;">
             <c:out value="${resource.roleName }"></c:out>
            </td>
			<td style="text-align:left;padding:0 8px 0 8px;">
			  <c:out value="${resource.name }"></c:out>
			</td>
            <td><c:out value="${resource.description }"></c:out> </td>			
          </tr>
        </c:forEach>      
        </tbody>
    </table>
</div> --%>
</div>
</div>

<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/personalCenter/permission.js?r=<%=new Date()%>");
</script>