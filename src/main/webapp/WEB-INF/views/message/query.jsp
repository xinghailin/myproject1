<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input id="searchUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="MESSAGE_PREFIX_QUERY"/>'/>
<input id="deleteUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="MESSAGE_PREFIX_DELETE"/>'/>
<input id="queryIdUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="MESSAGE_PREFIX_QUERY_ID"/>'/>
<input id="bizAreaQueryUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="CONTENT_BIZ_AREA_ADDR_QUERY_URL"/>' />
<input id="bizAreaQueryUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="CONTENT_BIZ_AREA_ADDR_QUERY_URL"/>' />
<input id="bizQueryUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="CONTENT_BIZ_BYAREA_QUERY_URL"/>' />
<input type="hidden" value="<ufa:url namespace="cloud-portal-ms" fieldName="TASK_ITEMS"/>" id="taskUrl">
<input type="hidden" value="${curpage}" id="curpage">
<input type="hidden" value="<ufa:url namespace="cloud-portal-ms" fieldName="MESSAGE_PREFIX_ADD"/>" id="formSubmit">
 <div class="main_right" id="queryDiv">
	<div class="rg_list">
		<div class="tb_list">
		<form name="searchForm" id="searchForm">
			<ul class="tb_ul02">
			  <li>
			  <div class="tbul02_left02 border_right">
			    <div class="tab_txt01"><span class="td_01">商家名称：</span>
			  		<span class="td_05"><input id="bizAreaName" name="bizName" type="text" class="input_text02"  /></span>
			  		<input type="hidden" id="typeId" value="3">
			  	</div>
			  </div>
			  <div class="tbul02_left02">
			    <div class="tab_txt01">
			  		<span class="td_01">任务名称：</span>
			  		<span class="td_05">
			  		 <input name="taskName" id="bizAreaAddr" type="text" class="input_text02"  />
			  		</span>
			  	</div>
			  </div>
			  <div class="tbul02_left02">
			    <div class="tab_txt01"><span class="td_01"></span>
			  		<span class="td_05" >
			  		</span>
			  		<span class="td_01"></span>
			  		<span class="td_05"></span>
			  		<span class="td_01"></span>
			  		<span class="td_05"></span>
			  	 </div>
			  </div>			  	
			  </li>			  
			  <li>
			  <div class="btnlist02">
			       <a href="javascript:void(0)" id='searchBtn' class="btn63_01">查询</a>
                   <a href="javascript:void(0)" id='resetBtn' class="btn63_02 margin_let10">重置</a>
 			  </div>
			  </li>
			</ul>
			</form>
		</div>		
		<div class="clear"></div>
		  <div  class="hide" id="J_DataList"></div>
		  <div class="nodata hide" id="J_NoDataMsg">
		            <div class="prompt"> 暂无数据 </div>
		  </div>
	</div>
</div>
<!-- 修改页面 ↓ -->
<div class="mian_right-new" id="updateDiv" hidden="true" >
<form name="addForm" id="addForm" method="POST" action="<ufa:url namespace="cloud-portal-ms" fieldName="MESSAGE_PREFIX_ADD"/>" enctype="multipart/form-data">
<input type="hidden" value="${curpage}" name="curpage">
<div class="rg_list">
<h1 class="tt_h1">修改通知</h1>
<div class="tb_list">
	<ul class="tb_ul02">
	
	 <li>
	  	 <div class="tbul02_left02 border_right">
	  	  <div class="tab_txt01">
	  	  <span class="td_01"><label class="fc_red"> </label>  &nbsp;&nbsp; 用户群体:全部用户</span>
	  	 
	  	  	    <span class="td_02" style="margin-top: 8px;">
                </span>
		  </div>
	     </div>
	      	<input id="id" name="id" hidden ="true">
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
		        
		        
		        <div class="tbul02_left02">
	  	  <div class="tab_txt01">
	  	  	<span class="td_01"><label class="fc_red"></label></span>
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
	     <div id="hiddenTask" class="tbul02_left02 border_right" hidden="true">
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
	  	  	 <textarea name="content" cols="40" id="content" rows="5"  ></textarea>
	  	  	</span>
	  	  	
	  	 </div>
	   </div>
	   </li>
 	 </ul>
</div>
   <div class="btnlist02">
			       <a href="javascript:void(0)" id='addBtn' class="btn63_01">保存</a>
                   <a href="javascript:void(0)" id='backBtn' class="btn63_02 margin_let10">返回</a>
 			  </div>
</div>
</form>
</div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center">商家名称</th>
 			<th style="text-align:center">商家Logo</th>
            <th style="text-align:center">内容</th>
			<th style="text-align:center">类型</th>
			<th style="text-align:center">任务名称</th>
			<th style="text-align:center">截止日期</th>
			<th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{bizName}}</td>
            <td><img src="{{formatImage bizLogo}}" height="40" width="40" onmouseout="hiddenPic()" onmousemove="showPic(event,this.src)"/></td>
			<td>{{content}}</td>
			<td>{{formatType type}}</td>
			<td>{{taskName}}</td>
			<td>{{formatDatetime endTime}}</td> 
			<td class="weindth165"> {{addButton id}} </td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination" class="pagelist"></div>
</script>
<div id="imgLayer" class="ele_img_item clearfix" style="position:absolute;z-index:1;width: 260px; solid;display:none;" ></div>
<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/message/query.js?r=<%=new Date()%>");
</script>
