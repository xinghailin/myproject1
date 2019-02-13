<%@ page contentType="text/html; charset=UTF-8" import="java.util.*"%>
<%@ include file="/common/taglibs.jsp"%>
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="SNAKER_ALLTASK_LIST" namespace="car-ms"/>">
<link rel="stylesheet" href="${ctx}/styles/css/style.css" type="text/css" media="all" />
<script src="${ctx}/styles/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="${ctx}/styles/js/table.js" type="text/javascript"></script>
<div class="main_right" id="viewList">
	<div class="rg_list">
		<h1 class="tt_h1">全部任务列表<span style="color:red;font-size:14px;margin-left: 10px;">提示：此页面仅供监控流程进度来用，点击查看按钮进入相应页面后仅供详情查看，切勿进行流程的流转操作！</span></h1>
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
            <td>{{lookProcessButton processId orderId}}{{handleButtonall actionUrl processId taskId orderId}}</td>
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