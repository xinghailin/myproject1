<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input id="addUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="BIZ_AREA_ADD_URL"/>' />
<input id="bizAreaQueryUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="CONTENT_BIZ_AREA_ADDR_QUERY_URL"/>' />
<input id="labelQueryParentUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="CONTENT_LABEL_PARENT_QUERY_URL"/>' />
<input id="searchUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="COUPON_FRESH_QUERY_URL"/>'/> 
<input id="deleteUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="COUPON_FRESH_DELETE_URL"/>'/> 
<input id="editUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="COUPON_FRESH_EDIT_URL"/>'/>
<input id="isRelUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="COUPON_IS_RELEASED_URL"/>'/>
<input id="bizAreaQueryUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="CONTENT_BIZ_AREA_ADDR_QUERY_URL"/>' />
<input id="bizQueryUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="CONTENT_BIZ_BYAREA_QUERY_URL"/>' />
<input type="hidden" value="<ufa:url namespace="cloud-portal-ms" fieldName="TASK_ITEMS"/>" id="taskUrl">
<input type="hidden" value="<ufa:url namespace="cloud-portal-ms" fieldName="MESSAGE_PREFIX_ADD"/>" id="formSubmit">
<div class="mian_right-new" >

<form name="addForm" id="addForm" method="POST" action="<ufa:url namespace="cloud-portal-ms" fieldName="MESSAGE_PREFIX_ADD"/>" enctype="multipart/form-data">
<div class="rg_list">
<h1 class="tt_h1">发送通知</h1>
<div class="tb_list">
	<ul class="tb_ul02">
	 <li>
	  	 <div class="tbul02_left02 border_right">
	  	  <div class="tab_txt01">
	  	  <span class="td_01"> &nbsp;&nbsp; 用户群体：全部用户
	  	  </span>
	  	  <input type="hidden" id="typeId" value="3">
	  	  	    <span class="td_02" style="margin-top: 8px;"></span>
		  </div>
	     </div>
     	<span class="td_center"><label class="fc_red">*</label>截止日期
	  	<input id="endTime" name="endTime" type="text" style="width: 180px"/>
	  	</span>
 	   </li>
 	   <li>
		  	<div class="tbul02_left02"  style="width: 100%; border-right: 0px;">
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 90px;"><label class="fc_red">*</label>地区：</span>
		  	  	<span class="td_02" style="margin-top: 8px;">
		  	  	  <select id="area" style="width:200px;">
		  	  	  <option value="">--请选择--</option>
			           <c:forEach var="item" items="${areaList}">  
			             <option value="<c:out value="${item.value.value}"></c:out>"> <c:out value="${item.value.value}"></c:out></option>
			           </c:forEach>
		          </select>
		        </span>
		        <span class="td_01" style="width: 90px;"><label class="fc_red">*</label>商圈：</span>
		  	  	<span class="td_02" style="margin-top: 8px;">
		  	  	  <select id="bizarea"  style="width:200px;">
		          </select>
		          
		        </span>
		        
		        <span class="td_01" style="width: 90px;"><label class="fc_red">*</label>商家：</span>
		  	  	<span class="td_02" style="margin-top: 8px;">
		  	  	  <select name="bizId" id="biz" style="width:200px;">
		          </select>
		          <input id="bizName" name="bizName" hidden="true">
		          <input id="bizLogoItems" hidden="true">
		          <input id="bizLogo" name="bizLogo" hidden="true">
		        </span>
		        
		        
		        <div class="" style="float: left; width: 20%;">
	  	  <div class="tab_txt01">
	  	  	    <span class="td_02" style="margin-top: 8px;">
	  	              &nbsp;&nbsp;任务:<input id="isTask" type="checkbox"  />
                </span>
                <input id="type"  name="type" hidden="true"/>
		  </div>
	     </div>
			 </div>
		     </div>
		   	</li>
 	    <li>
	     <div id="hiddenTask" class="tbul02_left02" hidden="true">
	  	  <div class="tab_txt01">
	  	  	<span class="td_01"><label class="fc_red">*</label>任务名称：</span>
	  	  	    <span class="td_02" style="margin-top: 8px;">
	  	          <select name="taskId" id="taskId" style="width:130px;">
		          </select>
		          <input id="taskName" name="taskName" hidden="true">
                </span>
		  </div>
	     </div>
 	   </li>
 	   	<li>
	  	<div class="tbul02_left02 border_right" style="width: 834px; border-right: 0px;">
	  	  <div class="tab_txt01">
	  	  	<span class="td_01"><label class="fc_red">*</label>通知内容：</span>
	  	  	<span class="td_02" style="height: 132px;"> 
	  	  	 <textarea name="content" cols="40"  rows="5"  ></textarea>
	  	  	</span>
	  	  	
	  	 </div>
	   </div>
	   </li>
 	 </ul>
</div>
<div class="btnlist">
  <div style="width: 91px; margin: auto;"><a href="javascript:void(0);" class="btn63_01" id="addBtn">保存</a></div>
</div>
</div>
</form>
</div>

 <script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/message/add.js?r=<%=new Date()%>");
</script>
