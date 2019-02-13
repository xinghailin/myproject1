<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="jndApplyPayLstQuery" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="jndApplyPayEdit" namespace="car-ms"/>">
<input type="hidden" id="deleteUrl" value="<ufa:url fieldName="jndApplyPayDel" namespace="car-ms"/>">
<input type="hidden" id="addUrl" value="<ufa:url fieldName="jndApplyPayAdd" namespace="car-ms"/>">
<input type="hidden" id="currpage" value="${currpage}">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm">	    
			<ul class="tb_ul02">
				<li>
				<div class="tbul02_right02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 220px;">采购计划编号(purchaseCode)：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="code" id="code"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 220px;">采购计划名称(purchaseName)：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="name" id="name"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 220px;">付款供应方(supplier)：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="supplyname" id="supplyname"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
				</li>
				<li>
				<div class="tbul02_right02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 220px;">付款创建时间(createTime)：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="createtime" id="createtime"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_right02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 220px;">付款审核状态(auditStatus)：</span>
						<span class="td_02" style="margin-top: 4px;">
<select id="status" name="status" style="width:100px;">
<option value="">--请选择--</option>
<option value="1">定金通过</option><option value="2">定金不通过</option><option value="3">定金审核中</option><option value="4">定金已撤销</option>
<option value="5">尾款通过</option><option value="6">尾款不通过</option><option value="7">尾款审核中</option><option value="8">尾款已撤销</option>
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
					<a href="javascript:void(0);" id="btnAddApay" class="btn63_01 margin_let10">添加付款申请单(add)</a>
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
</div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center;word-wrap:break-word;">采购计划编号(purchaseCode)</th>
			<th style="text-align:center;word-wrap:break-word;">采购计划名称(purchaseName)</th>
			<th style="text-align:center;word-wrap:break-word;">品牌首字母(initials)</th>
            <th style="text-align:center;word-wrap:break-word;">品牌(brand)</th>
			<th style="text-align:center;word-wrap:break-word;">型号(model)</th>
			<th style="text-align:center;word-wrap:break-word;">版别(version)</th>
<th style="text-align:center;word-wrap:break-word;">调剂(adjust)</th>
<th style="text-align:center;word-wrap:break-word;">外观颜色(outColor)</th>
<th style="text-align:center;word-wrap:break-word;">内饰颜色(incolor)</th>
			<th style="text-align:center;word-wrap:break-word;">子计划数量(subPurNum)</th>
            <th style="text-align:center;word-wrap:break-word;">付款数量(num)</th>
			<th style="text-align:center;word-wrap:break-word;">付款供应方(supplier)</th>
			<th style="text-align:center;word-wrap:break-word;">总车价(totalprice)</th>
<th style="text-align:center;word-wrap:break-word;">付款创建时间(createTime)</th>
            <th style="text-align:center;word-wrap:break-word;">付款审核状态(auditStatus)</th>
            <th style="text-align:center;word-wrap:break-word;width:200px;">操作(operate)</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{code}}</td>
            <td>{{name}}</td>
 			<td>{{initials}}</td>
            <td>{{brand}}</td>
			<td>{{model}}</td>
            <td>{{version}}</td>
<td>{{formatAdjust adjust}}</td>
<td>{{outcolor}}</td>
<td>{{incolor}}</td>
            <td>{{num}}</td>
 			<td>{{num2}}</td>
            <td>{{supplyname}}</td>
			<td>{{totalprice}}</td>
<td>{{_formatDatetime createtime}}</td>
            <td>{{_formatStatus status}}</td>
            <td>{{operate id status}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jnd/applypaylst.js?v=<%=new Date()%>");
</script>