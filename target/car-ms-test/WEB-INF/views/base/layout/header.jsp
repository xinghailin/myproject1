<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<%@ page import="org.ufa.security.util.SecurityContext" %>
<!--header-->
<div class="kft_head">
	<h1 class="kft_logo">运营平台管理系统</h1>
	<div class="kft_welcome">
		<div class="kft_welcome_left"></div>
		<div class="kft_welcome_right">
			<form id="logoutForm" action="${contextPath}/j_spring_security_logout"></form>
			<a href="javascript:void(0)" onClick="javascript:document.getElementById('logoutForm').submit();">安全退出</a>
		</div>
		<%-- 欢迎 <%=SecurityContext.getUserName()%>登录管理系统 --%>
	</div>
	<div class="kft_menu">
		<!-- <ul id="topMenu">
			<li><a href="#" class="current"><span>个人中心</span></a></li>
			<li><a href="#"><span>会员信息</span></a></li>		
		</ul> -->
	</div>
</div>
<!--end header-->