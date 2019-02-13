<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">

<input id="searchUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="SYS_USER_QUERY_URL"/>'/>
<input id="addUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="SYS_USER_TO_ADD_URL"/>'/>
<input id="editUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="SYS_USER_TO_EDIT_URL"/>'/>
<input id="ableUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="SYS_USER_ABLE_URL"/>'/>
<input id="deleteUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="SYS_USER_DEL_URL"/>'/>
 <input id="resetPwdUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="SYS_USER_TO_RESET_PWD"/>'/>
 <div class="main_right">
	<div class="rg_list">
		<div class="tb_list">
		<form name="searchForm" id="searchForm">
			<ul class="tb_ul02">
			  <li>
			  <div class="tbul02_left02 border_right">
			    <div class="tab_txt01"><span class="td_01">用户名称：</span>
			  		<span class="td_05">  <input id="userName" name="userName" type="text" class="input_text02"  /></span>
			  	</div>
			  </div>
			  <div class="tbul02_left02 border_right">
			    <div class="tab_txt01">
			  		<span class="td_01">用户姓名：</span>
			  		<span class="td_05"> 
			  		 <input name="name" id="name" type="text" class="input_text02"  />
			  		</span>
			  	</div>
			  </div>
			  <div class="tbul02_left02">
			    <div class="tab_txt01"><span class="td_01">用户编号：</span>
			  		<span class="td_05" >
			  		  <input id="code" name="code" type="text" class="input_text02" />
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
			       <a href="javascript:void(0)" id='addBtn' class="btn63_01 margin_let10">新增</a>
                   <a href="javascript:void(0)" id='resetBtn' class="btn63_02 margin_let10">重置</a>
 			  </div>
			  </li>
			</ul>
			</form>
		</div>		
		<div class="clear"></div>
		<div class="up_pwd_bt"><a href="javascript:void(0)" id="batchResetBtn" class="btn63_01 margin_let10"><span>重置密码</span></a></div>
		  <div  class="hide" id="J_DataList"></div>
		  <div class="nodata hide" id="J_NoDataMsg">
		            <div class="prompt"> 暂无数据 </div>
		  </div>
	</div>
</div>
<input id="searchUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="PERMISSION_ROLE_QUERY_URL"/>'/>
<input id="addUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="PERMISSION_ROLE_ADD_URL"/>'/>
<input id="editUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="PERMISSION_ROLE_EDIT_URL"/>'/>
<input id="deleteUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="PERMISSION_ROLE_DELETE_URL"/>'/>
<input id="configResourceUrl" type="hidden" value='<ufa:url namespace="cloud-portal-ms" fieldName="PERMISSION_ROLE_CONFIG_RESOURCE_URL"/>'/>

<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center">&nbsp;<input type="checkbox" id="allUserID" onclick="checkAllUser()" />&nbsp;</th>
            <th style="text-align:center">用户名称</th>
            <th style="text-align:center">用户姓名</th>
			<th style="text-align:center">用户编号</th>
			<th style="text-align:center">创建时间</th>
			<th style="text-align:center">状态</th>
			<th style="text-align:center;width:200px;">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result.result}}
        <tr>
            <td><input type="checkbox" name="userID" id="userID{{id}}" value="{{id}}" ></td>
             <td>{{loginName}}</td>
			<td>{{name}}</td>
            <td>{{code}}</td>
			<td>{{formatDatetime createTime}}</td>
			<td>{{formatStatus status}}</td>
			<td>
				{{ addButton id status}}
			</td>
        </tr>
        {{/result.result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination" class="pagelist"></div>
</script>

<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/system/user/query.js");
</script>
