<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html>
	<!-- 底层基础样式 -->
	<%--<link rel='stylesheet' type="text/css" href='${cssBasePath}/common/base.css' />
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery-default.css" />
	<!-- 首页框架样式 -->
	<link rel="stylesheet" type="text/css" href="${cssBasePath}/common/global.css" />--%>
	<!-- IE专有样式 -->
	<!--[if lt IE 8]>
	<link rel="stylesheet" href="${cssBasePath}/common/ie.css" type="text/css">
	<![endif]-->
	<script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}"></script>
	<%-- <script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea.js" data-config="${contextPath}/resources/config.js?ts=${ts}"></script> --%>
	<script type="text/javascript">
		window.contextPath = '<c:out value="${contextPath}"/>';
	</script>
</head>
<body>
	<tiles:insertAttribute name="content" />
</body>
</html>