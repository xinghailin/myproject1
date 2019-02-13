<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
  <div class="main_right">
	<div class="rg_list">
		<div class="tb_list">
		<form name="searchForm" id="searchForm">
			<ul class="tb_ul02">
			  <li>
			  <div class="tbul02_left02 border_right">
			    <div class="tab_txt01"><span class="td_01">名称：</span>
			  		<span class="td_05"><input id="name" name="name" type="text" class="input_text02"/></span>
			  	</div>
			  </div>
			  <div class="tbul02_left02 border_right">
			    <div class="tab_txt01"><span class="td_01">描述：</span>
			  		<span class="td_05"><input id="description" name="description" type="text" class="input_text02"/></span>
			  	 </div>
			  </div><div class="tbul02_left02">
			    <div class="tab_txt01"><span class="td_01">角色类型：</span>
			  	<span class="td_05" style="margin-top: 6px;">
			  	<select id="appId" name="appId"><option value="">--请选择--</option>
		           <option value="1">普通</option><option value="2">工作流</option>
                </select>
			  	</span>
			  	</div>
			  </div>			  	
			  </li>			  
			  <li>
			  <div class="btnlist02">
			       <a href="javascript:void(0)" id='searchBtn' class="btn63_01">查询</a>
			       <a href="javascript:void(0)" id='addBtn' class="btn63_01 margin_let10">新增</a>
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
<input id="searchUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="PERMISSION_ROLE_QUERY_URL"/>'/>
<input id="addUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="PERMISSION_ROLE_ADD_URL"/>'/>
<input id="editUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="PERMISSION_ROLE_EDIT_URL"/>'/>
<input id="deleteUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="PERMISSION_ROLE_DELETE_URL"/>'/>
<input id="configResourceUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="PERMISSION_ROLE_CONFIG_RESOURCE_URL"/>'/>
<input id="configMenuUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="MENU_ROLE_CONFIG_RESOURCE_URL"/>'/>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center">编号</th>
            <th style="text-align:center">名称</th>
            <th style="text-align:center">描述</th>
<th style="text-align:center">类型</th> 
			<th style="text-align:center">创建时间</th>
			<th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result.result}}
        <tr>
            <td>{{id}}</td>
			<td>{{name}}</td>
            <td>{{description}}</td>
<td>{{formatappId appId}}</td>
			<td>{{formatDatetime createTime}}</td>
			<td class="width250">
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
	<%--seajs.use("${scriptBasePath}/permission/role/query.js");--%>
    // 加载入口模块
    seajs.use("${scriptBasePath}/permission/role/query.js?r=<%=new Date()%>");
</script>
