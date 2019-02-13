<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input id="searchUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="SYS_BASIC_DATA_QUERY_URL"/>'/>
<input id="addUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="SYS_BASIC_DATA_TO_ADD_URL"/>'/>
<input id="editUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="SYS_BASIC_DATA_TO_EDIT_URL"/>'/>
<input id="deleteUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="SYS_BASIC_DATA_DEL_URL"/>'/>
<input id="refreshcache" type="hidden" value='<ufa:url namespace="car-ms" fieldName="SYS_BASIC_DATA_REFRESH_URL"/>'/>
<input id="searchedParams" type="hidden"/>
<input id="baseData" type="hidden"/>
<div class="main_right">
	<div class="rg_list">
		<div class="tb_list">
		<form name="searchForm" id="searchForm">
			<ul class="tb_ul02">
			  <li>
			   <div class="tbul02_left02 border_right">
			     <div class="tab_txt01"><span class="td_01">数据类型：</span>
			  		<span class="td_06">
			  		  <select name="type" id="type" class="select2">
					     <option value="">--请选择--</option>
					     <c:forEach items="${basicDataType}" var="item">  
						  <option value="${item.key}">${item.value}</option>
						 </c:forEach>
				      </select>
				    </span>
			  	</div>
			   </div>
			   <div class="tbul02_left02">
			     <div class="tab_txt01">
			  		<span class="td_01">数据描述：</span>
			  		<span class="td_05">
			  		   <input id="description" name="description" type="text" class="input_text02"/>
			  		</span>
			  	</div>
			   </div>			  	
			  </li>
  			  <li>
			  <div class="btnlist02">
			       <a href="javascript:void(0)" id='searchBtn' class="btn63_01">查询</a>
			       <a href="javascript:void(0)" id='addBtn' class="btn63_01 margin_let10">新增</a>
                   <a href="javascript:void(0)" id='resetBtn' class="btn63_02 margin_let10">重置</a>
                   <a href="javascript:void(0)" id='refreshBtn' class="btn63_01 margin_let10">刷新缓存</a>
 			  </div>
			  </li>
			</ul>
			</form>
		</div>
		<div class="clear"></div>
		  <div  class="hide" id="J_DataList"></div>
		  <div class="nodata hide" id="J_NoDataMsg">
		      <p>选择的查询条件暂时没有数据。</p>
		  </div>
	</div>
</div>

<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center">序号</th>
            <th style="text-align:center">键</th>
            <th style="text-align:center">值</th>  
            <th style="text-align:center">类型</th>
            <th style="text-align:center">排序</th> 
            <th style="text-align:center">是否默认</th>  
			<th style="text-align:center">描述</th>
			<th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result.result}}
        <tr>
            <td>{{id}}</td>
			<td>{{code}}</td>
            <td>{{value}}</td>
            <td>{{formatType type}}</td>
            <td>{{sortNum}}</td>
            <td>{{formatDefault isDefault}}</td>
			<td>{{description}}</td>
			<td class="weindth165">
				{{addButton id}}
			</td>
        </tr>
        {{/result.result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>

<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/system/basicdata/query.js?r=<%=new Date()%>");
</script>
