<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css" />
<input id="addUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="SYS_USER_ADD_URL"/>' />
<form name="addForm" id="addForm" >
<div class="table_list2">
	<div class="tablist_margin0">
		<div class="tablist">
		  <p class="title_p2 fz_14px">新增用户</p>
			<ul class="tb_ul">
			  <li>
			  	<div class="tab_txt01"><span class="td_01"><label class="fc_red">*   </label>用户名称：</span>
			  		<span class="td_02"><input name="userName" id="userName" type="text" class="input_text" maxlength="20" minlength="3"/></span>
			  	</div>
			  </li>
			  <li>
			  	<div class="tab_txt01"><span class="td_01"><label class="fc_red">*   </label>用户密码：</span>
			  		<span class="td_02"><input name="loginPassword" id="loginPassword" type="password" class="input_text" maxlength="20" /></span>
			  	</div>
			  </li>
			  <li>
		        <div class="tab_txt01">
		          <span class="td_01">用户编号：</span>
		          <span class="td_02">
		              <input name="code" id="code" type="text" class="input_text"   maxlength="20" minlength="1"/>
				    </span>
			  	</div>
			  </li>
			  <li>
			  	<div class="tab_txt01"><span class="td_01"><label class="fc_red"></label>真实姓名：</span>
			  		<span class="td_02">
			  		     <input name="name" id="name" type="text" class="input_text" maxlength="25"/>
			  		</span>
			  	</div>
			  </li>
			  <li>
			  <div class="tab_txt01">
			  <span class="td_01">所属地区：</span> 
			  	<span class="td_02" style=" margin-top: 4px;">
				<select id="country" name="country" style="width:150px;">
		  	  	  <option value="">--请选择--</option>
		  	  	   <option value="1">--加拿大--</option>
		  	  	    <option value="2">--中东--</option></select>
			      </span>
					</div>
					</li>
			  <li>
			  <div class="tab_txt01"><span class="td_01">所属门店：</span> 
			  	<span class="td_02" style="margin-top: 4px;">
				<select id="shop" name="shop">
		  	  	  <option value="">--请选择--</option>
			           <c:forEach var="item" items="${shopLst}">  
			             <option value="<c:out value="${item.id}"></c:out>"><c:out value="${item.name}"></c:out></option>
			           </c:forEach>
		          </select></span>
					</div>
					</li>
			  <li>
			  	<div class="tab_txt01"><span class="td_01"><label class="fc_red">*   </label>角色：</span>
			  		<span class="td_02" style="overflow-y:auto;height:450px;width:300px;">
			  		<table >
			  		<c:forEach items="${roleList}" var="item"> 
			  		 <tr><td>
			  		  <input name="roleId" id="roleId${item.roleId}" type="checkbox"  class="input_text" value="${item.roleId}"/>  ${item.roleName}
			  		  </td></tr>
			  		  </c:forEach>
			  		</table>
			  		</span>
			  	</div>
			  </li>
			</ul>
		</div>
		<div class="btnlist">
			<a href="javascript:void(0);" id="addBtn" class="btn63_01" style="margin-left:15%">确定</a>
			<a id='resetBtn' href="javascript:void(0);" class="btn63_02 margin_let10">重置</a>  
			<a href="javascript:window.close();" class="btn63_02 margin_let10">关闭</a>
		</div>
	</div>
</div>
</form>
<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/system/user/add.js");
</script>
