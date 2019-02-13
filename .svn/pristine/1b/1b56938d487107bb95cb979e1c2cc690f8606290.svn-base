<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<input id="addUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="PERMISSION_ROLE_ADD_URL"/>' />
<form name="addForm" id="addForm" >
<div class="table_list2" >
  <div class="tablist_margin0">
    <div class="tablist" style="border-bottom:1px solid #d4d4d4;padding-bottom: 20px;">
		<p class="title_p2 fz_14px">新增角色</p>		   
			<ul class="tb_ul">
			<li>
		        <div class="tab_txt01">
		          <span class="td_01"><label class="fc_red">*</label>角色名称：</span>
		          <span class="" style="margin-top: 5px;"><input name="name" placeholder="请以ROLE_开头,输入英文大写字母" style=" width: 240px" id="name" type="text" class="input_text" /></span>
		        </div>
		    </li>
		    <li>
		        <div class="tab_txt01"> 	
		          <span class="td_01"><label class="fc_red">*</label>描述：</span>
		          <span class="" style="margin-top: 5px;"><input name="description" id="description" style=" width: 240px" type="text" class="input_text" /></span>
		        </div>
		    </li>
		    <li>
		        <div class="tab_txt01"> 	
		          <span class="td_01"><label class="fc_red">*</label>类型：</span>
		          <span class="">
		          <input name="appId" value="" type="radio" checked="checked">普通角色&nbsp;<input name="appId" value="0" type="radio">工作流角色（移库、销售）
		          </span>
		        </div>
		    </li>
			</ul> 
			<div class="btnlist">
			<a href="javascript:void(0);" id="addBtn" class="btn63_01" style="margin-left:30%">保存</a>
			<a id='resetBtn' href="javascript:void(0);" class="btn63_02 margin_let10"><span>重置</span></a> 
			<a href="javascript:void(0);" id='closeBtn' class="btn63_02 margin_let10">关闭</a>
		   </div>
		</div>
  </div>
</div>				
</form>

<script type="text/javascript">
	<%--seajs.use("${scriptBasePath}/permission/role/add.js");--%>
    // 加载入口模块
    seajs.use("${scriptBasePath}/permission/role/add.js?r=<%=new Date()%>");
</script>
