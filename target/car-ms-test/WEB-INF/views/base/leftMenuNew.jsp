<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<input type="hidden" id="loadMenuUrl" value="<ufa:url fieldName="MENU_USER_ROLE_QUERY_URL" namespace="car-ms"/>">
<div class="main_left" id="main_left">
	<div class="nav_list">
		<ul id="menuListItem">
		</ul>
	</div>
</div>
<script type="text/javascript">
   	seajs.use("${scriptBasePath}/leftMenuNew.js");
   	function toWelcome(){
   		$('#mainFrame').attr('src','${contextPath}/welcome');
   		$("#firstMenu").html("首页");
		$("#secondMenu").html("欢迎光临");
   	}
   	function tasklist(){
   		$('#mainFrame').attr('src','${contextPath}/tasklist');
   		$("#firstMenu").html("首页");
   		$("#secondMenu").html("待办任务");
   	}
</script>