<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.io.*,java.util.* "%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.ufa.org/ufa/tags" prefix="ufa"%>
<%!
private static final String ftpFileUrl=ResourceBundle.getBundle("cloud-portal-ms").getString("ftpFileUrl");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="cssBasePath" value="${contextPath}/styles" />
<c:set var="scriptBasePath" value="${contextPath}/scripts" />
<c:set var="imagesBasePath" value="${contextPath}/images" />
<c:set var="ts" value="2013090913" />
<%
	response.setHeader("Cache-Control", "no-cache,no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);
	pageContext.setAttribute("ftpFileUrl", ftpFileUrl);
%>
<input type="hidden" id="globe_context_id" value="${pageContext.request.contextPath}"/>
<input type="hidden" id="ftpFileUrl" value="<%=ftpFileUrl%>"/>
