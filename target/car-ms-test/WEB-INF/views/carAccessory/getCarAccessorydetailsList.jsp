<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/index.css">
<input type="hidden" id="searchUrl"
	value="<ufa:url fieldName="CarAccessorydetailsList" namespace="car-ms"/>">
<input type="hidden" id="newAddCarAccessoryUrl"
	value="<ufa:url fieldName="newAddCarAccessory" namespace="car-ms"/>">
<input type="hidden" id="CarAccessoryDetailsUrl"
	value="<ufa:url fieldName="CarAccessoryDetails" namespace="car-ms"/>">
<input type="hidden" id="carAccessorypage"
	value="<ufa:url fieldName="carAccessorypage" namespace="car-ms"/>">
<input type="hidden" id="auditCarAccessoryDetailsUrl"
	value="<ufa:url fieldName="auditCarAccessoryDetails" namespace="car-ms"/>">

<input type="hidden" id="currpage" value="${currpage }">
<input type="hidden" id="id" value="${id }">
<input type="hidden" id="type" value="${type}">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px;">
	<div class="rg_list">
		<div class="tb_list"></div>
		<div class="clear"></div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
		</div>
		<div class="btnlist" style="margin-bottom: 20px;">
			<div style="width: 300px; margin: auto;">
				<c:if test="${type==1 }">
					<a href="javascript:void(0);" id="newAddCarAccessory" class="btn63_01 margin_let10">新增随车附件</a>
				</c:if>
				<a href="javascript:void(0);" id="btnSearch" class="btn63_01">返回</a>
			</div>
		</div>
		<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center">品牌</th>
            <th style="text-align:center">型号</th>
			<th style="text-align:center">车架号</th>
            <th style="text-align:center">版别</th>
			<th style="text-align:center">操作人</th>
			<th style="text-align:center">状态</th>
 			<th style="text-align:center">提交时间</th>
			<th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{brand}}</td>
            <td>{{model}}</td>
            <td>{{vin}}</td>
  			<td>{{version}}</td>
			<td>{{allname status creatorname receivename getname}}</td>
			<td>{{allstatus status}}</td>
			<td>{{_formatDatetime creatime}}</td>
            <td>{{_operate id status}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
</script>
<script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea-debug.js"
data-config="${contextPath}/resources/config-debug.js?ts=2013090913" id="seajsnode"></script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/carAccessory/CarAccessorydetailsList.js?r=<%=new Date()%>");
</script>