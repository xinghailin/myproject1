<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>超级座驾运营管理平台</title>
<link rel='stylesheet' type="text/css" href='${cssBasePath}/common/index.css' />
<link rel='stylesheet' type="text/css" href='${cssBasePath}/common/common.css' />
<link rel='stylesheet' type="text/css" href='${cssBasePath}/common/jquery.css' />
<script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
</head>
<style>
.header_task {
	box-sizing: border-box;
	width: 100%;
	position: absolute;
	top: 0;
	left: 0;
	display: flex;
	align-item: center;
	justify-content: center;
	position: absolute;
}
#secondMenu{position:relative;z-index:2}
</style>
<body>
	<tiles:insertAttribute name="header" />
	<div class="header_lf" style="position: relative"><span class="home"></span> <span style="color: #585858;">您的位置：</span> <span id="firstMenu" class="fc00">首页</span> <span
		class="fc00 fz_14px">></span> <span id="secondMenu" class="fc00" style="cursor: pointer;">待办任务</span>
		<div class="header_task"><a id="tasklst" style="cursor: pointer; color: red; font-size: 20px;padding:0px 50px;background-color:white" href="javascript:tasklist();">待办任务(to-do tasks)</a></div></div>
	<div class="main_list"><tiles:insertAttribute name="leftMenu" /> <iframe id="mainFrame" name="mainFrame" src="${contextPath}/tasklist" frameborder="0" class="iframe"></iframe></div>
</body>
</html>
