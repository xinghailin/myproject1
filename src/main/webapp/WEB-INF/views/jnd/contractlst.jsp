<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl"
	value="<ufa:url fieldName="jndcontractquery" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="jndcontractedit" namespace="car-ms"/>">
<input type="hidden" id="deleteUrl" value="<ufa:url fieldName="jndContractdel" namespace="car-ms"/>">
<input type="hidden" id="addUrl" value="<ufa:url fieldName="jndcontractadd" namespace="car-ms"/>">
<input type="hidden" id="auditUrl"
	value="<ufa:url fieldName="jndContractaudit" namespace="car-ms"/>">
<input type="hidden" id="viewUrl" value="<ufa:url fieldName="jndContractview" namespace="car-ms"/>">
<input type="hidden" id="currpage" value="${currpage}">
<input type="hidden" id="node" value="${node}">
<input type="hidden" id="userCountry" value="${userCountry}">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 220px;">采购计划编号(purchaseCode)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input class="input_text01" name="pcode" id="pcode" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 220px;">采购计划名称(purchaseName)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="name" id="name" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 220px;">合同编号(contractCode)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input class="input_text01" name="code" id="code" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 220px;">品牌(brand)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="brand" id="brand" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 220px;">创建时间(createTime)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input class="input_text01" name="createtime" id="createtime" class="input_text01"
										type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 220px;">状态(status)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<select id="status" name="status" style="width: 180px;">
										<option value="">--请选择(please select)--</option>
										<c:if test="${node eq 0}">
											<option value="0">待审核(pending)</option>
											<option value="10">已撤销(revoked)</option>
											<option value="1">采购通过(purchase approved)</option>
											<option value="2">采购修改(purchase modification)</option>
											<option value="3">采购不通过(purchase unapproved)</option>
											<option value="4">法务通过(legal approved)</option>
											<option value="5">法务修改(legal modification)</option>
											<option value="6">法务不通过(legao unapproved)</option>
											<option value="7">全通过(full approval)</option>
											<option value="8">财务修改(financial modification)</option>
											<option value="9">财务不通过(financial unapproved)</option>
											<option value="10">未申请付款(payment not applied)</option>
										</c:if>
										<c:if test="${node eq 1}">
											<option value="0">待审核(pending)</option>
											<option value="1">采购通过(purchase approved)</option>
											<option value="2">采购修改(purchase modification)</option>
											<option value="3">采购不通过(purchase unapproved)</option>
										</c:if>
										<c:if test="${node eq 2}">
											<option value="1">采购通过(purchase approved)</option>
											<option value="4">法务通过(legal approved)</option>
											<option value="5">法务修改(legal modification)</option>
											<option value="6">法务不通过(legao unapproved)</option>
										</c:if>
										<c:if test="${node eq 3}">
											<option value="4">法务通过(legal approved)</option>
											<option value="7">全通过(full approval)</option>
											<option value="8">财务修改(financial modification)</option>
											<option value="9">财务不通过(legao unapproved)</option>
										</c:if>
									</select>
								</span>
							</div>
						</div>
					</li>
				</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="width: 400px; margin: auto;">
						<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询(search)</a>
						<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置(reset)</a>
						<c:if test="${node eq 0}">
							<a href="javascript:void(0);" id="btnAddContract" class="btn63_01 margin_let10">添加合同(add)</a>
						</c:if>
					</div>
				</div>
				<c:if test="${node eq 0}">
					<span style="color: red; font-size: 14px; margin-left: 50px;">提示：合同三步审核完毕后，需上传正式签字合同才能供付款申请使用！(Tip: after the three-step review of the contract, you need to upload the formal signed contract for payment application)</span>
				</c:if>
			</form>
		</div>
		<div class="clear"></div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
		</div>
	</div>
</div>
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
           	<th style="text-align:center;word-wrap:break-word;">采购计划编号(purchaseCode)</th>
			<th style="text-align:center;word-wrap:break-word;">采购计划名称(purchaseName)</th>
			<th style="text-align:center;word-wrap:break-word;">合同编号(contractCode)</th>
			<th style="text-align:center;word-wrap:break-word;">主动采购方(activePurchaser)</th>
<th style="text-align:center;word-wrap:break-word;">商城合同编号(mallContractCode)</th>
			<th style="text-align:center;word-wrap:break-word;">采购方式(purchaseType)</th>
            <th style="text-align:center;word-wrap:break-word;">品牌(brand)</th>
			<th style="text-align:center;word-wrap:break-word;">型号(model)</th>
			<th style="text-align:center;word-wrap:break-word;">排量(cc)</th>
			<th style="text-align:center;word-wrap:break-word;">数量(num)</th>
			<th style="text-align:center;word-wrap:break-word;">总价(totalPrice)</th>
			<th style="text-align:center;word-wrap:break-word;">创建时间(createTime)</th>
            <th style="text-align:center;word-wrap:break-word;">状态(status)</th>
			<th style="text-align:center;word-wrap:break-word;">签字(sign)</th>
			<th style="text-align:center;word-wrap:break-word;">未付款(non-payment)</th>
            <th style="text-align:center;word-wrap:break-word;width:195px;">操作(operate)</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{purchaseCode}}</td>
            <td>{{purchaseName}}</td>
 			<td>{{code}}</td>
			<td>{{update needer}}</td>
<td>{{mallContractCode}}</td>
			<td>{{formatbuytype paytype selfbuy}}</td>
            <td>{{brand}}</td>
			<td>{{model}}</td>
			<td>{{displacement}}</td>
			<td>{{num}}</td>
			<td>{{totalprice}}</td>
			<td>{{_formatDatetime createtime}}</td>
            <td>{{_formatStatus status}}</td>
			<td>{{stampFun stamp}}</td>
			<td>{{payment stamp apaylock}}</td>
            <td>{{operate id status}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jnd/contractlst.js?v=<%=new Date()%>");
</script>