<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
	<head>
		<title>采购流程-银行审批(付首付)</title>
		<%@ include file="/common/meta.jsp"%>
		<link rel="stylesheet" href="${ctx}/styles/css/style.css" type="text/css" media="all" />
		<script src="${ctx}/styles/js/jquery-1.8.3.min.js" type="text/javascript"></script>
		<script src="${ctx}/styles/js/snaker/dialog.js" type="text/javascript"></script>
	</head>
	<body>
 <div class="main_right" id="queryDiv">
	<div class="rg_list">
	   <div class="tb_list">
		<form id="inputForm" action="${ctx }/loan/financeInformationCheck" method="post" target="mainFrame">
			<input type="hidden" name="processId" value="${processId }" />
			<input type="hidden" name="orderId" value="${orderId }" />
			<input type="hidden" name="taskId" value="${taskId }" />
			<input type="hidden" name="tAccountId" value="${tAccountId}" />
			交纳的保证金:<input  name="depositAmount" value="${depositAmount}" />
			激活金额:<input  name="activeMoney" value="${activeMoney}" />
			
			
			<!-- 待处理人 -->
			<input type="hidden" name="S_apply.operator" value="${nextOperator }" />
			<table class="table_all" align="center" border="0" cellpadding="0"
				cellspacing="0" style="margin-top: 0px">
			<tr>
				<td class="td_table_1">
					<span>财务审批：</span>
				</td>
				<td class="td_table_2" colspan="3">
					<input type="radio" name="method" value="0" checked="checked"/>是
					<input type="radio" name="method" value="-1" />否
				</td>
			</tr>
			</table>
			<table align="center" border="0" cellpadding="0"
				cellspacing="0">
				<tr align="left">
					<td colspan="1">
						<input type="submit" class="button_70px" name="submit" value="提交">
						&nbsp;&nbsp;
						<input type="button" class="button_70px" name="reback" value="返回"
							onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
		<div class="clear"></div>
	   </div>
  </div>
 </body>
</html>
