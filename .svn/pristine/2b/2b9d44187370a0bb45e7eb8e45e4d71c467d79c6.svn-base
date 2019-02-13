<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<base href="<%=basePath%>">

</head>
<body>

	<div align="center">
		<form action="staff/save" method="post" enctype="multipart/form-data">
			<table class="table table-border table-bordered table-bg">
				<tr>
					<input type="hidden" name="staid" value="${staff.staid }">
					<input type="hidden" name="isdel" value="0">
					<td class="tableleft">头像</td>
					<td width="200px" height="120px"><input type="file"
						name="file" /> <c:if test="${staff.staid !=nulls }">
							<img src="/xuexiao/upload/${staff.stapoto }" width="100%"
								height="100%">
						</c:if></td>
				</tr>
				<tr>
					<td class="tableleft">姓名</td>
					<td><input type="text" name="staname"
						value="${staff.staname }" /></td>
				</tr>
				<tr>
					<td class="tableleft">性别</td>
					<td><input type="text" name="stasex" value="${staff.stasex }" />
					</td>
				</tr>
				<tr>
					<td class="tableleft">年龄</td>
					<td><input type="text" name="staage" value="${staff.staage }" /></td>

				</tr>
				<tr>
					<td class="tableleft">介绍</td>
					<td><input type="text" name="stamemo"
						value="${staff.stamemo }" /></td>

				</tr>
				<tr>
					<td class="tableleft">密码</td>
					<td><input type="text" name="pwd" value="${staff.pwd }" /></td>

				</tr>
			</table>
			<!--  dfghjkl-->
			<tr>
				<!-- align:"center" -->
				<td>
					<button type="submit" class="btn btn-primary" type="button">保存</button>

				</td>
			</tr>
		</form>
	</div>
	</article>

	</div>
	</section>
	<script type="text/javascript">
	
</script>



</body>
</html>