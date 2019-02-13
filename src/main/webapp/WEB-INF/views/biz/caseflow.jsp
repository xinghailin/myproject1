<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>流程图</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<%-- <input type="hidden" id="back1Url" value="<ufa:url fieldName="caselawlst" namespace="car-ms"/>">
<input type="hidden" id="currpage" value="${currpage}">
<input type="hidden" id="node" value="${node}">--%>
</head>
<style>
.box {
	width: 1524px;
	overflow: hidden;
	color: #666;
}

.title {
	padding: 10px 0 20px;
}

.content {
	/*overflow: hidden;*/
	/*display: flex;*/
	/*align-items: center;*/
	/*justify-content:space-between;*/
	display: flex;
	align-items: center;
	flex-wrap: wrap;
}

.start {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	background: #595;
	color: #fff;
	font-size: 16px;
	text-align: center;
	line-height: 50px;
}

.end {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	background: #955;
	color: #fff;
	font-size: 16px;
	text-align: center;
	line-height: 50px;
}

.flow {
	/*display: inline-block;*/
	display: flex;
	align-items: center;
	margin: 15px 0;
	/*overflow: hidden;*/
}

.between {
	width: 200px;
	height: 100px;
	background: #F6F7FF;
	border: 2px solid #0a70c0;
	border-radius: 15px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	font-size: 15px;
	flex-wrap: wrap;
	word-wrap: break-word;
	padding: 3px;
	color: #333;text-align:center;
}

.between p {
	margin: 0 0 0px;
}

/* .between p:first-child {
	margin-top: 8px;
} */
.flow:last-child .between {
	color: red;
	border: 2px solid red;
}

.arrow {
	width: 100px;
	height: 50px;
	position: relative;
	display: inline-block;
	margin-left: 10px;
}

.arrow:before {
	border: none;
	background-color: #666;
	height: 30%;
	width: 70%;
	top: 35%;
	left: 0;
}

.arrow:before, .arrow:after {
	content: '';
	border-color: transparent;
	border-style: solid;
	position: absolute;
}

.arrow:after {
	left: 70%;
	top: 5px;
	border-width: 20px 20px;
	border-left-color: #666;
}

.du-btn {
	text-align: center;
	margin: 50px 0;
}

.du-btn a {
	margin: 0 20px;
}
</style>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<h3 class="title">流>>程>>图</h3>
			<div class="content">
				<div class="start">开始</div> <c:forEach var="item" items="${steps}" varStatus="vs">
					<div class="flow">
						<div class="arrow"></div>
						<div class="between center-block"><p>${vs.index+1}.${item.casename}</p>
							<p>${item.detail}</p>
							<p><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.createtime}" /></p></div>
					</div>
				</c:forEach> <c:if test="${riskcase.status eq 10 and((riskcase.excecuteresult eq 1 or riskcase.excecuteresult eq 2)or(riskcase.excecute2result eq 1 or riskcase.excecute2result eq 2))}">
					<div class="arrow"></div>
					<div class="end">结束</div>
				</c:if>
		</div>
			<div class="du-btn"><a href="javascript:void(0);" class="btn btn-warning" role="button" style="padding: 6px 30px" id="backBtn">返回 </a></div>
	</div>
</div>
</body>
<script src="${contextPath}/js/jquery-2.1.4.min.js"></script>
<script>
var flag=true;
$("#backBtn").click(function(){
	if(flag){flag=false;
		location.href="${contextPath}${backadd}?currpage=${currpage}";
	}
})
</script>
</html>