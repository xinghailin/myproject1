<%@ page contentType="text/html; charset=UTF-8" import="java.util.*"%>
<%@ include file="/common/taglibs.jsp"%>

<input type="hidden" id="searchUrl" value="<ufa:url fieldName="SNAKER_TASK_LIST" namespace="car-ms"/>">
<link rel="stylesheet" href="${ctx}/styles/css/style.css" type="text/css" media="all" />
<script src="${ctx}/styles/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="${ctx}/styles/js/table.js" type="text/javascript"></script>

<div class="main_right" id="viewList">
	<div class="rg_list">
		<h1 class="tt_h1">我的任务列表</h1>
	</div>
	
	<div class="clear"></div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无任务</p>
		</div>
</div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center">流程名称</th>
			<th style="text-align:center">流程创建时间</th> 
            <th style="text-align:center">任务名称</th>            
			<th style="text-align:center">任务创建时间</th>
			<th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>          
            <td>{{processName}}</td>
            <td>{{orderCreateTime}}</td> 
            <td>{{taskName}}</td>        
            <td>{{taskCreateTime}}</td>
            <td>{{lookProcessButton processId orderId}}{{handleButton actionUrl processId taskId orderId}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>	

<script type="text/javascript">
    seajs.use("${scriptBasePath}/controlRepository/task.js?r=<%=new Date()%>");
</script>