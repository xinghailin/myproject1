<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="freightlist" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="freightCar" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">
	<div class="rg_list">
		<input type="hidden" id="currpage" name="currpage" value="${currpage }" />
		<div class="tb_list">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="freightlist" namespace="car-ms"/>" method="post" target="hideiframe">
				<ul class="tb_ul02">
					<li>
						<input id="username" type="hidden" value="${username }">
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">申请名称(applyName)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="name" id="name" class="input_text01" type="text" style="width: 150px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">申请人(proposer)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="proposer" id="proposer" class="input_text01" type="text" style="width: 150px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">审核人(verifier)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input type="text" id="verifier" name="verifier" class="input_text01" style="width: 150px;" />&nbsp;
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 420px;margin-left: -40px">
							<div class="tab_txt01">
								<span class="td_01" style="width: 210px;">商城合同编号(MallContractNumber)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input type="text" id="mallcontractcode" name="mallcontractcode" class="input_text01" style="width: 150px;" />&nbsp;
								</span>
							</div>
						</div>
					</li>
				</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="text-align: center;">
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

		</div>

	</div>
</div>
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
 			<th style="text-align:center;word-wrap:break-word;">申请名称(applyName)</th>
            <th style="text-align:center;word-wrap:break-word;">短驳费(drayage)</th>
			<th style="text-align:center;word-wrap:break-word;">海运费(oceanFreight)</th>
			<th style="text-align:center;word-wrap:break-word;">其他费用1(otherCost1)</th>
			<th style="text-align:center;word-wrap:break-word;">其他费用2(otherCost2)</th>
			<th style="text-align:center;word-wrap:break-word;">申请人(proposer)</th>
			<th style="text-align:center;word-wrap:break-word;">申请时间(applyTime)</th>
			<th style="text-align:center;word-wrap:break-word;">审核人(verifier)</th>
			<th style="text-align:center;word-wrap:break-word;">审核时间(verifierTime)</th>
			<th style="text-align:center;word-wrap:break-word;">申请数量(applyNumber)</th>
			<th style="text-align:center;word-wrap:break-word;">申请状态(applyStatus)</th>
			<th style="text-align:center;word-wrap:break-word;">商城合同编号(MallContractNumber)</th>
			<th style="text-align:center;word-wrap:break-word;">操作(operate)</th>
			
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
 			
            <td>{{name}}</td>
  			<td>{{drayage}}</td>
  			<td>{{oceanfreight}}</td>
  			<td>{{elsecost1}}</td>
<td>{{elsecost2}}</td>
<td>{{proposer}}</td>
<td>{{_formatDatetime proposertime}}</td>
<td>{{verifier}}</td>
<td>{{_formatDatetime verifiertime}}</td>
<td>{{num}}</td>
<td>{{_type type}}</td>
<td>{{mallcontractcode}}</td>  
<td>{{_operate id type}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jndAssetlibrarylist/freightpage.js?v=<%=new Date()%>");
</script>