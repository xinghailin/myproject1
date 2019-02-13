<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<c:set var="titleKey"><tiles:insertAttribute name="titleKey" /></c:set>
<!DOCTYPE html>
<html>
	<!-- 页面头部开始  -->
	<head>
	<meta charset="UTF-8" />
	<link rel="shortcut icon" href="${imagesBasePath}/common/icon.ico" />
	<title><fmt:message key="${titleKey}" /></title>
	
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="Content-Language" content="zh-cn" />
	<meta name="robots" content="all" />
	
	<tiles:insertAttribute name="links" />
	
	<script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}"></script>
	<%-- <script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea.js" data-config="${contextPath}/resources/config.js?ts=${ts}" ></script>  --%>
	<script type="text/javascript">
		window.contextPath = '<c:out value="${contextPath}"/>';
	</script>
	
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="content" />
</body>
<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/base/frame.js");
</script>
</html>