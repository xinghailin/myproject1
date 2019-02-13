<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl"
	value="<ufa:url fieldName="ClearanceOfGoodsCarList" namespace="car-ms"/>">
<input type="hidden" id="editUrl"
	value="<ufa:url fieldName="fileDownloadAndUpload" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
			<input type="hidden" id="userCountry" name="userCountry" value="${userCountry }">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="ClearanceOfGoodsCarList" namespace="car-ms"/>" method="post"
				target="hideiframe">
				<ul class="tb_ul02">
					<li>
						<input type="hidden" id="currpage" name="currpage" value="${currpage }" />
						<div class="tbul02_left02" style="width: 30%;">
							<div class="tab_txt01">
								<span class="td_01" style="width: 180px">合同编号(contractNo)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="contractname" id="contractname" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 180px;">车架号(vin)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="vin" id="vin" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 180px;">车辆品牌(brand)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="brand" id="brand" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 180px;">车辆型号(model)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input type="text" id="model" name="model" class="input_text01" style="width: 180px;" />&nbsp;
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%;">
							<div class="tab_txt01">
								<span class="td_01" style="width: 180px;">仓库(warehouse)：</span>
								<select id="instoreid" name="instoreid" style="width: 180px; margin-top: 5px;">
									<option value="">--请选择(please select)--</option>
									<c:forEach var="item" items="${store}">
										<option value="<c:out value="${item.id}"></c:out>"><c:out value="${item.name}"></c:out></option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 180px;">供应商姓名(supplier)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="buyername" id="buyername" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>

					</li>
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 180px;">运输时间(startShipDate)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="sstarttime" id="sstarttime" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>

						<c:if test="${userCountry==null }">
							<div class="tbul02_left02" style="width: 30%;">
								<div class="tab_txt01">
									<span class="td_01" style="width: 180px;">采购地址(PurchaseAddress)：</span>
									<span class="td_02" style="margin-top: 4px;">
										<select id="country" name="country" style="width: 180px;">
											<option value="">--请选择(please select)--</option>
											<c:forEach var="item" items="${site}">
												<option value="<c:out value="${item.country}"></c:out>"><c:out
														value="${item.name}"></c:out></option>
											</c:forEach>
										</select>
									</span>
								</div>
							</div>
						</c:if>
						<div class="tbul02_left02" style="width: 30%;margin-left: -30px;">
							<div class="tab_txt01">
								<span class="td_01" style="width: 210px;">商城合同编号(MallContractNumber)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="mallcontractcode" id="mallcontractcode" class="input_text01" type="text"
										style="width: 180px;">
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
		<div>
			<span id="carp1" style="color: red; font-family:"新宋体""> </span>
			<span id="carp2" style="color: red; font-family:"新宋体"" > </span>
		</div>
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
			<th style="text-align:center;word-wrap:break-word;">合同编号(contractNo)</th>
            <th style="text-align:center;word-wrap:break-word;">车架号(vin)</th>
			<th style="text-align:center;word-wrap:break-word;">品牌(brands)</th>
			<th style="text-align:center;word-wrap:break-word;">型号(model)</th>
			<th style="text-align:center;word-wrap:break-word;">版别(version)</th>
			<th style="text-align:center;word-wrap:break-word;">排量(displacement)</th>
			<th style="text-align:center;word-wrap:break-word;">内饰颜色(inColor)</th>
			<th style="text-align:center;word-wrap:break-word;">外观颜色(outColor)</th>
			<th style="text-align:center;word-wrap:break-word;">检验结果(inspectReport)</th>
			<th style="text-align:center;word-wrap:break-word;">车价(carPrices)</th>
			<th style="text-align:center;word-wrap:break-word;">成本价(costPrice)</th>
			<th style="text-align:center;word-wrap:break-word;">供应商姓名(supplier)</th>
			<th style="text-align:center;word-wrap:break-word;">仓库(warehouse)</th>
			<th style="text-align:center;word-wrap:break-word;">运输日期(startShipDate)</th>
			<th style="text-align:center;word-wrap:break-word;">到港时间(arrivalTime)</th>
			<th style="text-align:center;word-wrap:break-word;">商城合同编号(MallContractNumber)</th>
			<th style="text-align:center;word-wrap:break-word;width:180px;">操作(operate)</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
			<td>{{contractname}}</td>
            <td>{{vin}}</td>
  			<td>{{brand}}</td>
  			<td>{{model}}</td>
  			<td>{{version}}</td>
<td>{{displacement}}</td>
<td>{{incolor}}</td>
<td>{{outcolor}}</td>
<td>{{_checkstatus checkstatus}}</td>
<td>{{price}}</td>
<td>{{costprice}}</td>
<td>{{buyername}}</td>
<td>{{roughweight}}</td>
<td>{{_formatDatetime starttime}}</td>
<td>{{_formatarrivetime arrivetime}}</td>
<td>{{mallcontractcode}}</td>  
             <td>{{_operate id fstatus}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
	seajs
			.use("${scriptBasePath}/jndAssetlibrarylist/ClearanceOfGoodsCarList.js");
</script>