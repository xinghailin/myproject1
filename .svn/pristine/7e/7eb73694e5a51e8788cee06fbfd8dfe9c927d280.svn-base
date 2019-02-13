<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<div style="position: absolute; top: 0px; left: 0px; z-index: 11; width: 100%; background: #212121; height: 43px; min-width: 1900px;">
	<div style="width: 1880px;">
		<div class="navbar-logo"><a class="brand" href="javascript:toWelcome();" target="_self"><img src="images/common/logos01.png" /></a></div>
		<div class="container-fluid">
			<ul class="pull-right">
				<c:choose>
					<c:when test="${accountInfo!=null}">
						<li><span class="username"><c:out value="${accountInfo.loginName}" />, 您好!</span><a href="${contextPath}/j_spring_security_logout" class="close_btn" style="color: #fff">安全退出</a></span></li>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
		</ul>
	</div>
</div>
</div>