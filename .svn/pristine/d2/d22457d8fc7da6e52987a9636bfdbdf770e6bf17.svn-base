<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<%-- <link rel='stylesheet' type="text/css" href='${cssBasePath}/index.css' />
<link rel='stylesheet' type="text/css" href='${cssBasePath}/common.css' />
<link rel='stylesheet' type="text/css" href='${cssBasePath}/jquery.css' /> --%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/common/taurus-common.css" rel="stylesheet">
<meta http-equiv="Expires" CONTENT="0"> 
<meta http-equiv="Cache-Control" CONTENT="no-cache"> 
<meta http-equiv="Pragma" CONTENT="no-cache"> 
<input id="addUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="PERMISSION_RESOURCE_ADD_URL"/>' />
<form name="addForm" id="addForm" >
<div class="table_list2">
	<div class="tablist_margin0">
		<div class="tablist">
		   <p class="title_p2 fz_14px">新增资源</p>
			<ul class="tb_ul">
			
			   <li>
		        <div class="tab_txt01">
		          <span class="td_01"><label class="fc_red">*</label>资源名称：</span>
		          <span class="td_02"><input name="name" id="name" type="text" class="input_text" /></span>
		        </div>
		    </li>
		    <li>
		        <div class="tab_txt01"> 	
		          <span class="td_01"><label class="fc_red">*</label>URI：</span>
		          <span class="td_02"><input name="uri" id="uri" type="text" class="input_text" /></span>
		        </div>
		    </li>
		     <li>
			  	<div class="tab_txt01">
			  	    <span class="td_01"><label class="fc_red">*</label>请求方法：</span>
 				  	<span class="td_02"><input type="radio" name="method"   id="methodGET" checked="checked"  value="GET"></span><span class="td_03">GET</span>
			  		<span class="td_02"><input type="radio" name="method"   id="methodPOST" value="POST"></span><span class="td_03">POST</span>
  			  	</div>
			  </li>
			     <li>
			  	<div class="tab_txt01">
			  	   <span class="td_01"><label class="fc_red">*</label>所属系统：</span>
 				   <span class="td_06">
			  			<select id="appId" name="appId" class="select">
			  				<option value="">请选择</option>
			  				<option value="1">门户</option>
			  				<option value="2">管理平台</option>
			  			</select>
			  			
			  		</span>
			  		<span class="td_07"></span>
  			  	</div>
			  </li>
			  <li>
			  	<div class="tab_txt01">
			  	   <span class="td_01"><label class="fc_red">*</label>状态：</span>
 				   <span class="td_06" >
			  		    <select id="status" name="status"  class="select">
			  				<option value="">请选择</option>
			  				<option value="1">有效</option>
			  				<option value="0">无效</option>
			  			</select>
			  		</span>
			  		<span class="td_07"></span>
  			  	</div>
			  </li>
			  <li>
			   	<div class="tab_txt01">
			  	   <span class="td_01">描述：</span>
 				       <span class="td_02"><input name="description" id="description"  rows="3" cols="20" class="input_text"/></span>
  			  	</div>
			  </li>
			</ul>
		</div>
		<div class="btnlist">
			<a href="javascript:void(0)" id="addBtn"  class="btn63_01" style="margin-left:15%">保存</a> 
			<a id='resetBtn' href="javascript:void(0);" class="btn63_02 margin_let10">重置</a>
			<a href="javascript:window.close();"  class="btn63_02 margin_let10">关闭</a>
		</div>
	</div>
</div>
</form>

<script type="text/javascript">
    seajs.use("${scriptBasePath}/permission/resource/add.js?r=<%=new Date()%>");
</script>