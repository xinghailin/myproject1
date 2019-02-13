<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<tiles:insertAttribute name="links" />	
	<script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
	<%-- <script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea.js" data-config="${contextPath}/resources/config.js?ts=${ts}"></script> --%>
	<script type="text/javascript">
		window.contextPath = '<c:out value="${contextPath}"/>';
	</script>
</head>
<body>
<tiles:insertAttribute name="content" />
</body>
</html>