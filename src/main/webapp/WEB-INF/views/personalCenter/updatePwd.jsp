<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input id="actionUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="PERSONAL_UDPATE_PWD_URL"/>'/>
<form id="updateForm" name="addGroupForm">
<div class="main_right">
	<div class="rg_list">	
	  <div class="tb_list">
		  <ul class="tb_ul">
		    <li>
		        <div class="tab_txt01">
		          <span class="td_01">当前登录名：</span>
		          <span class="td_03">${sessionScope.accountInfo.loginName}</span>
		        </div>
		    </li>
		    <li>
		        <div class="tab_txt01">
		          <span class="td_01"><label class="fc_red">*</label>请输入原密码：</span>
		          <span style="margin-top:4px;"><input name="name" id="name" type="password" maxlength="20" /></span>
		        </div>
		    </li>
		    <li>
		        <div class="tab_txt01">
		          <span class="td_01"><label class="fc_red">*</label>请输入新密码：</span>
		          <span style="margin-top:4px;"><input name="password" id="password" type="password" maxlength="20" /></span>
		        </div>
		    </li>
		    <li>
		        <div class="tab_txt01">
		          <span class="td_01"><label class="fc_red">*</label>再次输入新密码：</span>
		          <span style="margin-top:4px;"><input name="confirmPassword" id="confirmPassword" type="password" maxlength="20" /></span>
		        </div>
		    </li>	  
		  </ul>
		</div>
		<div class="btnlist" style="margin-left:170px;">	      
	        <a href="javascript:void(0)" class="btn63_01" id="aTagForForm" >保存</a>
	        <a href="javascript:void(0)" class="btn63_02 margin_let10" id="resetBtn" >重置</a>	      
		</div>
	</div>
</div>
</form>

<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/personalCenter/update.js?r=<%=new Date()%>");
</script>