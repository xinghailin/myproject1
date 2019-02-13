<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<style>
table td{padding: 8px 0 8px 0}
textarea{width: 100%}
</style>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input id="sendUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="SMS_BATCH_SEND"/>' />
<form name="addForm" id="addForm" >
<div class="table_list2">
<form id="addForm">
	<div class="tablist_margin0">
		<div class="tablist" style="border-bottom: 1px solid #D4D4D4">
		  <p class="title_p2 fz_14px">群发短信</p>
		  <div style="width: 100%;float: left">
		    
		      <table  style="width: 100%">
		        <tr>
		          <td>请输入手机号<span style="font-size: 12px;color: red;">(多个手机号请以;分号隔开)</span>:</td>
		        </tr>
		        <tr>
		          <td>
		            <textarea id="mobileStr" name="mobileStr" rows="" cols=""></textarea>
		          </td>
		        </tr>
		        <tr>
		          <td>请输入短信内容:</td>
		        </tr>
		        <tr>
		          <td>
		            <textarea id="content" name="content" rows="" cols=""></textarea>
		          </td>
		        </tr>
		      </table>
		    
		  </div>
		</div>
		<div class="btnlist">
			<a href="javascript:void(0);" id="sendBtn" class="btn63_01" style="margin-left:15%">发送短信</a>
		</div>
	</div>
	</form>
</div>
</form>


<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/system/sms/send.js");
</script>
