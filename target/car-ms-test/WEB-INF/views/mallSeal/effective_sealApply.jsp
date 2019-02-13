<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/index.css">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="MALL_SEALAPPLY_EFFECTIVE_METHOD" namespace="car-ms"/>">
<input type="hidden" id="checkUrl" value="<ufa:url fieldName="MALL_SEALAPPLY_DEL_SUBMIT" namespace="car-ms"/>">
<input type="hidden" id="lookUrl" value="<ufa:url fieldName="MALL_SEALAPPLYLOOK_PAGE" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">

<input type="hidden" id="addUrl" value="<ufa:url fieldName="WEB_PURCHASE_AREA_ADD_PAGE" namespace="car-ms"/>">
	<div class="rg_list">
		<input type="hidden" id="currpage" name="currpage" value="${currpage}" /> 
		<div class="tb_list">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="freightApply" namespace="car-ms"/>" method="post"
				target="hideiframe">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_left02" style="width: 25%;">
							<div class="tab_txt01">
								<span class="td_01">海外直采合同编号：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="code" id="code" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">订单编号：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="orderids" id="orderids" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>

		
					</li>
				</ul>
				<div class="btnlist" style="margin-bottom: 20px;">

					<div style="text-align: center;">
						<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
						<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a>
					</div>
				</div> 
			</form>
		</div>
		<div class="clear"></div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
		</div>
</div>
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian table150" id="001">
        <thead>
        <tr>
            <th>合同编号</th>
            <th>订单编号</th>
            <th>文件名称</th>
            <th>备注</th>
            <th>申请人</th>
            <th>申请时间</th>
            <th>盖章人</th>
            <th>盖章时间</th>
            <th>流程步骤</th>
            <th>合同状态</th>
            <th style="width:120px;">操作</th>
      </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{code}}</td>
            <td>{{orderids}}</td>
            <td>{{contractfilename}}</td>
            <td>{{remarks}}</td>
            <td>{{applyer}}</td>
            <td>{{_formatSimpleDatetime applytime}}</td>
            <td>{{sealer}}</td>
            <td>{{_formatSimpleDatetime sealtime}}</td>
            <td>{{_formatSealstatus sealstatus uploadstatus}}</td>
            <td>{{_formatStatus status }}</td>
            <td>{{_addButton id status}}</td> 
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/mallSeal/effective_sealApply.js?r=<%=new Date()%>");
</script>