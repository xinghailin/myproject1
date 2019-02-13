<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<input id="editUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="PERMISSION_ROLE_EDIT_URL"/>'/>
<form name="editForm" id="editForm" >
<div class="table_list2">
	<div class="tablist_margin0">
		<div class="tablist">
		  <p class="title_p2 fz_14px">角色编辑</p>
			<ul class="tb_ul">
			  <li>
			  	<div class="tab_txt01">
			  	   <span class="td_01"><label class="fc_red">*</label>角色名称：</span>
 				     <span class="" style="margin-top: 5px;">
				       <input name="name" id="name" value="<c:out value='${role.name}'/>" style=" width: 240px" type="text" class="input_text" />
				     </span>
  			  	</div>
			  </li>
			  <li>
			  	<div class="tab_txt01"><span class="td_01"><label class="fc_red">*</label>描述：</span>
			  		<span class="" style="margin-top: 5px;">
			  		  <input name="description" value="<c:out value='${role.description}'/>" id="description" style=" width: 240px" type="text" class="input_text" />
			  		</span>
			  	</div>
			  </li>
			  <li>
		        <div class="tab_txt01"> 	
		          <span class="td_01"><label class="fc_red">*</label>类型：</span>
		          <span class="">
		          <input name="appId" value="" type="radio" <c:if test="${empty role.appId}">checked="checked"</c:if>>普通角色&nbsp;<input name="appId" value="0" type="radio" <c:if test="${role.appId eq 0}">checked="checked"</c:if>>工作流角色（移库、销售）
		          </span>
		        </div>
		    </li>
			</ul>
		</div>
		<div class="btnlist">
			<a href="javascript:void(0);" id="submitBtn" class="btn63_01" style="margin-left:15%">保存</a> 
			<a id='resetBtn' href="javascript:void(0);" class="btn63_02 margin_let10"><span>重置</span></a>
			<a href="javascript:window.close();" id='closeBtn' class="btn63_02 margin_let10">关闭</a>
		</div>
	</div>
</div>
<input name="id" id="id" value="<c:out value='${role.id}'/>" type="hidden"/>
</form>
<script type="text/javascript">
	<%--seajs.use("${scriptBasePath}/permission/role/edit.js");--%>
    // 加载入口模块
    seajs.use("${scriptBasePath}/permission/role/edit.js?r=<%=new Date()%>");
</script>
