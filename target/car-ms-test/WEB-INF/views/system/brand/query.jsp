<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input id="searchUrl" type="hidden" value='<ufa:url namespace="decorate-portal-ms" fieldName="SYS_BRAND_QUERY_URL"/>'/>
<input id="addUrl" type="hidden" value='<ufa:url namespace="decorate-portal-ms" fieldName="SYS_BRAND_TO_ADD_URL"/>'/>
<input id="editUrl" type="hidden" value='<ufa:url namespace="decorate-portal-ms" fieldName="SYS_BRAND_TO_EDIT_URL"/>'/>
<input id="deleteUrl" type="hidden" value='<ufa:url namespace="decorate-portal-ms" fieldName="SYS_BRAND_DEL_URL"/>'/>
<div class="main_right">
	<div class="rg_list">
		<div class="tb_list">
		<form name="searchForm" id="searchForm">
			<ul class="tb_ul02">
			  <li>
			   <div class="tbul02_left02">
			  	<div class="tab_txt01"><span class="td_01">品牌名：</span>
			  		<span class="td_05" style="margin-top: 4px;"><input id="brandName" name="brandName" type="text" class="input_text02"/></span>
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
		      <p>没有数据。</p>
		  </div>
	</div>
</div>

<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center">ID</th>
            <th style="text-align:center">品牌名</th>
<th style="text-align:center">创建时间</th>
			<th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#lst}}
        <tr>
            <td>{{id}}</td>
			<td>{{name}}</td>
<td>{{formatDatetime createTime}}</td>
			<td class="weindth165">
				{{addButton id}}
			</td>
        </tr>
        {{/lst}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>

<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/system/brand/query.js?r=<%=new Date()%>");
</script>
