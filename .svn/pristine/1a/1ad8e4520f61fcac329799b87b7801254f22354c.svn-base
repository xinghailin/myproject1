<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>

<html>
	<head>
		<meta charset="utf-8">
		
		<title>会员登录</title>
		<%-- <script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}"></script> 
		<script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea.js" data-config="${contextPath}/resources/config.js?ts=${ts}"></script>--%>
		<script type="text/javascript">
			window.contextPath = '<c:out value="${contextPath}"/>';
		</script>
		<style>
			*{
	margin:0;
	padding:0;
}
body{
	font-family:"Trebuchet MS", "Myriad Pro", Arial, sans-serif;
	font-size:14px;
	background:#f4f4f4 url(../images/bg.gif) repeat top left;
	color:#333;
	text-shadow:1px 1px 1px #fff;
	overflow-y:scroll;
}
h1{
	font-size:56px;
}
h2{
	font-size:20px;
	padding:0px 0px 40px 0px;
	color:#aaa;
}
h2 span{
	color:#ffa800;
}
a{
	color:#777;
}
a:hover{
	color:#222;
}
p{
	padding:5px 0px;
}
.wrapper{
	width:960px;
	margin:10% auto;
	min-height:550px;
}
.box{
	width:49%;
}
.left{
	float:left;
}
.right{
	float:right;
}
.clear{
	clear:both;
}
a.back{
	color:#777;
	position:fixed;
	top:5px;
	right:10px;
	text-decoration:none;
}
/* Form Style */
.form_wrapper{
	background:#fff;
	border:1px solid #ddd;
	margin:0 auto;
	width:350px;
	font-size:16px;
	-moz-box-shadow:1px 1px 7px #ccc;
	-webkit-box-shadow:1px 1px 7px #ccc;
	box-shadow:1px 1px 7px #ccc;
}
.form_wrapper h3{
	padding:20px 30px 20px 30px;
	background-color:#444;
	color:#fff;
	font-size:25px;
	border-bottom:1px solid #ddd;
}
.form_wrapper form{
	display:none;
	background:#fff;
}
.form_wrapper .column{
	width:47%;
	float:left;
}
form.active{
	display:block;
}
form.login{
	width:350px;
}
form.register{
	width:550px;
}
form.forgot_password{
	width:300px;
}
.form_wrapper a{
	text-decoration:none;
	color:#777;
	font-size:12px;
}
.form_wrapper a:hover{
	color:#000;
}
.form_wrapper label{
	display:block;
	text-align:left;
	width:315px;
	height:32px;
	float:left;
	line-height:32px;
	margin-left:35px
}
.form_wrapper input[type="text"],
.form_wrapper input[type="password"]{
	border: solid 1px #E5E5E5;
	background: #FFFFFF;
	margin: 5px 30px 0px 30px;
	padding: 9px;
	display:block;
	font-size:16px;
	width:76%;
	background: 
		-webkit-gradient(
			linear,
			left top,
			left 25,
			from(#FFFFFF),
			color-stop(4%, #EEEEEE),
			to(#FFFFFF)
		);
	background: 
		-moz-linear-gradient(
			top,
			#FFFFFF,
			#EEEEEE 1px,
			#FFFFFF 25px
			);
	-moz-box-shadow: 0px 0px 8px #f0f0f0;
	-webkit-box-shadow: 0px 0px 8px #f0f0f0;
	box-shadow: 0px 0px 8px #f0f0f0;
}
.form_wrapper input[type="text"]:focus,
.form_wrapper input[type="password"]:focus{
	background:#feffef;
}
.form_wrapper .bottom{
	background-color:#444;
	border-top:1px solid #ddd;
	margin-top:20px;
	clear:both;
	color:#fff;
	text-shadow:1px 1px 1px #000;
	height:63px;
}
.form_wrapper .bottom a{
	display:block;
	clear:both;
	padding:10px 30px;
	text-align:right;
	color:#ffa800;
	text-shadow:1px 1px 1px #000;
}
.form_wrapper a.forgot{
	float:right;
	font-style:italic;
	line-height:24px;
	color:#ffa800;
	text-shadow:1px 1px 1px #fff;
}
.form_wrapper a.forgot:hover{
	color:#000;
}
.form_wrapper div.remember{
	float:left;
	width:140px;
	margin:20px 0px 20px 30px;
	font-size:11px;
}
.form_wrapper div.remember input{
	float:left;
	margin:2px 5px 0px 0px;
}
.form_wrapper span.error{
	visibility:hidden;
	color:red;
	font-size:11px;
	font-style:italic;
	display:block;
	margin:4px 30px;
}
.form_wrapper input[type="submit"],.submint_btn {
	background: #e3e3e3;
	border: 1px solid #ccc;
	color: #333;
	font-family: "Trebuchet MS", "Myriad Pro", sans-serif;
	font-size: 14px;
	font-weight: bold;
	padding: 8px 0 9px;
	text-align: center;
	width: 150px;
	cursor:pointer;
	float:right;
	margin:15px 15px 10px 10px;
	text-shadow: 0px 1px 0px #fff;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	-moz-box-shadow: 0px 0px 2px #fff inset;
	-webkit-box-shadow: 0px 0px 2px #fff inset;
	box-shadow: 0px 0px 2px #fff inset;
}
.form_wrapper input[type="submit"]:hover {
	background: #d9d9d9;
	-moz-box-shadow: 0px 0px 2px #eaeaea inset;
	-webkit-box-shadow: 0px 0px 2px #eaeaea inset;
	box-shadow: 0px 0px 2px #eaeaea inset;
	color: #222;
}
.lg_input01{float:left; padding:8px;}
.input_css{
	border: solid 1px #E5E5E5;
	background: #FFFFFF;
	margin: 5px 30px 0px 30px;
	padding: 9px;
	display:block;
	font-size:16px;
	width:266px;
	height:39px;
}
		</style>
	</head>
	<body style="background: #444; text-align:center;">
		<div class="wrapper">
			<div class="content">
				<div id="form_wrapper" class="form_wrapper">
					<form class="login active" name="loginForm" id="loginForm" action="${contextPath}/j_spring_security_check" method="post">
						<h3><img src="${imagesBasePath}/common/logos.png"></h3>
						<div>
							<div style="width:100%; float:left">
								<label>用户名:</label>
							</div>
							<input type="text" class="input_css" placeholder="手机号码/姓名简写" name="j_username"  id="j_username"/>
						</div>
						<div>
							<div style="width:100%; float:left">
								<label>密码:</label>
							</div>
							<input type="password" class="input_css"  placeholder="输入密码" name="j_password" id="j_password"/>
						</div>
						<div class="bottom">
						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION.message}">
								<div class="lg_input01" style="width: 150;">
									<div style="color:red"><fmt:message key="${SPRING_SECURITY_LAST_EXCEPTION.message}" /></div>
								</div>
						</c:if>
							<input type="button" id="loginBtn" class="submint_btn" value="登录"></input>
							<div class="clear"></div>
						</div>
					</form>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</body>
	<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
	<script type="text/javascript">
	    seajs.use("${scriptBasePath}/login.js?r=<%=new Date()%>");
	</script>
</html>