<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>

<head>

<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/index.css">
<input type="hidden" id="searchUrl"
	value="<ufa:url fieldName="carAccessorylist" namespace="car-ms"/>">
<input type="hidden" id="cityUrl" value="<ufa:url fieldName="shopcity" namespace="car-ms"/>">
<input type="hidden" id="addCarAccessoryUrl" value="<ufa:url fieldName="addCarAccessory" namespace="car-ms"/>">
<input type="hidden" id="CarAccessorydetailsUrl"
	value="<ufa:url fieldName="CarAccessoryDetailsListPage" namespace="car-ms"/>">
<input type="hidden" id="allCarAccessorydetailsUrl" value="<ufa:url fieldName="allCarAccessorydetails" namespace="car-ms"/>">

<input type="hidden" id="currpage" value="${currpage }">
<input type="hidden" id="type" value="${type}">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">品牌：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="brand" id="brand" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">型号：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="model" id="model" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">版别：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input type="text" id="version" name="version" class="input_text01" style="width: 180px;" />&nbsp;
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 25%;">
							<div class="tab_txt01">
								<span class="td_01">车架号：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="vin" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
					</li>
				</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="width: 300px; margin: auto;">
						<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
						<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a>
						<c:if test="${type==1 }">
						<a href="javascript:void(0);" id="addCarSource" class="btn63_01 margin_let10">新增随车附件</a></c:if>
					</div>
				</div>
			</form>
		</div>
		<div class="clear"></div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
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
 			<th style="text-align:center">创建时间</th>
			<th style="text-align:center">总子记录条数</th>
			<th class="nums" style="text-align:center">待接收子记录条数</th>
			<th class="nums" style="text-align:center">待审核子记录条数</th>
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
			<td>{{_formatDatetime creatime}}</td>
			<td>{{num}}</td>
			<td class="nums">{{receiveNum}}</td>
			<td class="nums">{{auditNum}}</td> 
            <td>{{_operate id receiveNum auditNum}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=2013090913" id="seajsnode"></script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/carAccessory/carAccessorypagelist.js?r=<%=new Date()%>");
</script>