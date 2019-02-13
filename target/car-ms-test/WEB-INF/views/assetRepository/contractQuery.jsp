<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="CONTRACT_SELLCAR" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="CONTRACT_QUERY_DETAILS" namespace="car-ms"/>">
<input id="currpage" type="hidden" value='${currpage}'/>
<input id="hideMsg" type="hidden" value='${message}'/>
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm">	    
			<ul class="tb_ul02">
				<li>
				<input id="currpage" value="${currpage }" type="hidden"/>
					<div class="tbul02_left02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">档案编号：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="infoNum" id="infoNum"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_right02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">销售人员：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="sellerName" id="sellerName"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_right02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">甲方：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="parta" id="parta"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">乙方：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="buyerName" id="buyerName"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
				</li>
				<li>
				<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">客户类型：</span> <span class="td_02" style="margin-top: 10px;">
		  	  	<input type="radio"  name="workType" value="1"/>个人 &nbsp;
		  	    <input type="radio"  name="workType" value="2"/>企业 &nbsp;
		  	 </span>
						</div>
					</div>
				</li>
			</ul>
			<div class="btnlist" style="margin-bottom: 20px;">
				<div style="width: 300px; margin: auto;">
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
</div>	
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list">
<table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
      <tr>
            <th style="text-align:center">档案编号</th>
            <th style="text-align:center">甲方</th>
    		<th style="text-align:center">销售人员</th>
            <th style="text-align:center">甲方门店</th>
			<th style="text-align:center">乙方</th>
            <th style="text-align:center">证件号码</th>
			<th style="text-align:center">联系电话</th>
            <th style="text-align:center">客户类别</th>
            <th style="text-align:center">车架号</th>
            <th style="text-align:center">销售价(元)</th>
            <th style="text-align:center">定金(元)</th>
            <th style="text-align:center">保险费(元)</th>
            <th style="text-align:center">购置税(元)</th>
			<th style="text-align:center">上牌费(元)</th>
            <th style="text-align:center">延保费(元)</th>
            <th style="text-align:center">装潢费用(元)</th>
            <th style="text-align:center">质保费(元)</th>
			<th style="text-align:center;width:100px;">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{infoNum}}</td>
            <td>{{parta}}</td>
			<td>{{sellerName}}</td>
			<td>{{shopName}}</td>
            <td>{{buyerName}}</td>
			<td>{{idenCode}}</td>
			<td>{{phone}}</td>
            <td>{{workType}}</td>  
            <td>{{vin}}</td>
            <td>{{salePrice}}</td>
			<td>{{downpay}}</td>
            <td>{{insurePrice}}</td>
            <td>{{buyTax}}</td>
            <td>{{cardPrice}}</td>
			<td>{{delayguarPrice}}</td>
            <td>{{decoratePrice}}</td>
            <td>{{qualityguarPrice}}</td>
            <td>{{_operate id}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/assetRepository/contractQuery.js");
</script>