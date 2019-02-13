<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.ufa.org/ufa/tags" prefix="ufa"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="scriptBasePath" value="${ctx}/scripts" />
<input type="hidden" id="globe_context_id" value="${pageContext.request.contextPath}" />