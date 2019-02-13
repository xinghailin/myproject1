<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">

<input id="searchUrl" type="hidden" value='<ufa:url namespace="decorate-portal-ms" fieldName="PERMISSION_RESOURCE_QUERY_URL"/>' /> 
<input id="addUrl" type="hidden" value='<ufa:url namespace="decorate-portal-ms" fieldName="PERMISSION_RESOURCE_ADD_URL"/>' /> 
<input id="editUrl" type="hidden" value='<ufa:url namespace="decorate-portal-ms" fieldName="PERMISSION_RESOURCE_EDIT_URL"/>' /> 
<input id="deleteUrl" type="hidden" value='<ufa:url namespace="decorate-portal-ms" fieldName="PERMISSION_RESOURCE_DELETE_URL"/>' /> 

<div class="main_right">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm">
			<ul class="tb_ul02">
			  <li>
			    <div class="tbul02_left02 border_right">
			      <div class="tab_txt01">
			  		<span class="td_01"><label class="fc_red">*</label>资源名称：</span>
			  		<span class="td_05"><input name="name" id="name" type="text" class="input_text02" /></span>
			  	  </div>
			    </div>
			    <div class="tbul02_left02 border_right">
			      <div class="tab_txt01"><span class="td_01">URI：</span>
			  		<span class="td_05"><input name="uri" id="uri" type="text" class="input_text02"/></span>
			  	  </div>
			    </div>
			    <div class="tbul02_left02">
			      <div class="tab_txt01"><span class="td_01">请求方法：</span>
			  		<span class="td_02"><input type="radio" name="method" value="GET"></span><span class="td_03">GET</span>
			  		<span class="td_02"><input type="radio" name="method" value="POST"></span><span class="td_03">POST</span>	
			  	  </div>
			    </div>			  	
			  </li>
			  <li>
			    <div class="tbul02_left02 border_right">
			      <div class="tab_txt01">
			  		<span class="td_01">所属系统：</span>
			  		<span class="td_06">
			  			<select class="select2" name="appId">
			  				<option value="-1">请选择</option>
			  				<option value="1">门户</option>
			  				<option value="2">管理平台</option>
			  			</select>
			  		</span>
			  	 </div>
			    </div>
			    <div class="tbul02_left02">
			      <div class="tab_txt01"><span class="td_01">状态：</span>
			  		<span class="td_06">
			  			<select class="select2" name="status">
			  				<option value="-1">请选择</option>
			  				<option value="1">有效</option>
			  				<option value="0">无效</option>
			  			</select>
			  		</span>
			  	</div>
			    </div>		  	
			  </li>
			  <li>
			    <div class="btnlist02">
			     <a href="#" id="searchBtn" class="btn63_01">查询</a> 
			     <a href="#"  id="addBtn" class="btn63_01 margin_let10">新增</a> 
			     <a href="#" id="resetBtn" class="btn63_02 margin_let10">重置</a>
		        </div>
			  </li>
			</ul>
			</form>
		</div>
		<div class="clear"></div>
		  <div  class="hide" id="J_DataList"></div>
		  <div class="nodata hide" id="J_NoDataMsg">
		            <div class="prompt">
			        暂无数据
			   </div>
		  </div>		
	</div>
			
</div>


<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0"  class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center">名称</th>
            <th style="text-align:center">URI</th>
			<th style="text-align:center">应用</th>
			<th style="text-align:center">请求方法</th>
            <th style="text-align:center">描述</th>  
            <th style="text-align:center">状态</th>
			<th style="text-align:center">创建时间</th>
			<th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result.result}}
        <tr>
            <td>{{name}}</td>
			<td>{{uri}}</td>
			<td>{{formatAppId appId}}</td>
			<td>{{method}}</td>
            <td>{{description}}</td>
			<td>{{formatStatus status}}</td>
			<td>{{formatDatetime createTime}}</td>
			<td class="weindth165">
				{{ addButton id}}
			</td>
        </tr>
        {{/result.result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination" class="pagelist"></div>
</script>

<script type="text/javascript">
    seajs.use("${scriptBasePath}/permission/resource/query.js?r=<%=new Date()%>");
</script>