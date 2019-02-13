<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="jndPurchaseLstQuery" namespace="car-ms"/>">
<input type="hidden" id="subbuyIndexUrl" value="<ufa:url fieldName="jndSubPurchaseLstForContractIndex" namespace="car-ms"/>">
<input type="hidden" id="currpage" value="${currpage}">
<input type="hidden" id="userCountry" value="${userCountry}">
<div class="main_right" id="viewList" style="margin-left:40px;width: 95%;height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 250px;">采购计划编号(purchaseCode)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input class="input_text01" name="code" id="code" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 250px;">采购计划名称(purchaseName)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="name" id="name" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 250px;">采购计划创建时间(purchasedCreatime)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="time" id="time" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
					</li>
				</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
				<div style="width: 400px; margin: auto;">
					<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询(search)</a>
					<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置(reset)</a>
				</div>
			</div>
			</form>
		</div>
		<div class="clear"></div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
		</div><div class="btnlist">
		<div style="width: 250px; margin: auto;">
		<a id="sureBtn" href="javascript:void(0);" class="btn63_01 margin_let10">下一步(next)</a>
		<a id="closeBtn" href="javascript:void(0);" class="btn63_02 margin_let10">关闭(close)</a>
		</div>
		</div>
</div>
</div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr><th style="text-align:center">&nbsp;请选择(choose)&nbsp;</th>
            <th style="text-align:center">采购计划编号(purchaseCode)</th>
			<th style="text-align:center">采购计划名称(purchaseName)</th>
            <th style="text-align:center">采购车辆数量(purchasedCarNum)</th>
            <th style="text-align:center">采购计划创建时间(purchasedCreatime)</th>
            <th style="text-align:center">需求编号(needCode)</th>
			<th style="text-align:center">需求名称(needName)</th>
			<th style="text-align:center">需求车辆数量(needCarNum)</th>
            <th style="text-align:center">需求创建时间(needCreatime)</th>
            <th style="text-align:center">主动采购方(purchaseType)</th>
            <th style="text-align:center">商城合同编号(mallContractCode)</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr><td><input type="radio" name="carID" id="carID{{pid}}" value="{{pid}}" ></td>
            <td>{{pcode}}</td>
            <td>{{pname}}</td><td>{{pnum}}</td>
            <td>{{_formatDatetime pcreatetime}}</td>
            <td>{{code}}</td>
            <td>{{name}}</td>
 			<td>{{num}}</td>
            <td>{{_formatDatetime createtime}}</td>
            <td>{{update needer}}</td>
            <td>{{mallContractCode}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jnd/purchaselstforcontract.js?v=<%=new Date()%>");
</script>