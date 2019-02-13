<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<head>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/index.css">
<input type="hidden" id="searchUrl"
	value="<ufa:url fieldName="issuingCompanyList" namespace="car-ms"/>">
<input type="hidden" id="addIssuingCompanyUrl" value="<ufa:url fieldName="addIssuingCompany" namespace="car-ms"/>">
<input type="hidden" id="deleteUrl" value="<ufa:url fieldName="deleteIssuingCompany" namespace="car-ms"/>">
<input type="hidden" id="addIssuingCompanyUrl" value="<ufa:url fieldName="addIssuingCompany" namespace="car-ms"/>">
<input type="hidden" id="issuingCompanyCarSourceUrl" value="<ufa:url fieldName="issuingCompanyCarSource" namespace="car-ms"/>">
<input type="hidden" id="currpage" value="${currpage }">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">名称：</span>
								<span class="td_02" style="margin-top: 4px;">
								<input name="name" class="input_text01" type="text" style="width: 180px;">
							</div>
						</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">状态：</span>
								<span class="td_02" style="margin-top: 4px;">
									<select name="status" id="status" class="input_text01" type="text" style="width: 180px;">
									<option value="">请选择</option>
									<option value="1">启用</option>
									<option value="2">未启用</option>
									</select>
								</span>
							</div>
						</div>
					</li>
				</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="width: 300px; margin: auto;">
						<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
						<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a>
						<a href="javascript:void(0);" id="addIssuingCompany" class="btn63_01 margin_let10">新增开证公司</a>
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
            <th style="text-align:center;">开证公司名称</th>
            <th style="text-align:center;">状态</th>
			
			<th style="text-align:center;width: 280px;">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{name}}</td>
            <td>{{status status}}</td>
 			
            <td>{{_operate id}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=2013090913" id="seajsnode"></script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/MallissuingCompany/issuingCompanyListPage.js?r=<%=new Date()%>");
</script>