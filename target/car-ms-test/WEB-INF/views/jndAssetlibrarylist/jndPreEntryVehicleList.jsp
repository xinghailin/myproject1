<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl"
	value="<ufa:url fieldName="PreEntryVehicleList" namespace="car-ms"/>">
<input type="hidden" id="editUrl"
	value="<ufa:url fieldName="IncomingCheckListEntry" namespace="car-ms"/>">
<input type="hidden" id="currpage" name="currpage" value="${currpage }" />
<input type="hidden" id="userCountry" name="userCountry" value="${userCountry }">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="PreEntryVehicleList" namespace="car-ms"/>" method="post"
				target="hideiframe">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_left02" style="width: 30%;">
							<div class="tab_txt01">
								<span class="td_01" style="width: 220px">合同编号(contractNo)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="contractname" id="contractname" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 220px">采购计划编号(purchaseCode)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="buycode" id="buycode" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 220px">采购计划名称(purchaseName)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="buyname" id="buyname" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 30%;">
							<div class="tab_txt01">
								<span class="td_01" style="width: 220px">应入库时间(libraryTime)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="appointtimes" id="appointtimes" readonly class="input_text01" type="text"
										style="width: 180px;"
										value="<fmt:formatDate pattern="yyyy-MM-dd" value="${car.purchaseTime}" />">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 220px;">供应商姓名(supplier)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="buyername" id="buyername" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 220px;">入库状态(bePutInStorageStatus)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<select id="status" name="status" style="width: 180px;">
										<option value="">--请选择(please select)--</option>
										<option value="0">未入库(vehicle not in warehouse)</option>
										<option value="1">已入海外仓库(vehicle in overseas warehouse)</option>
										<option value="2">报关出库(customs clearance outbound)</option>
										<option value="3">退税文件已经上传(tax rebate file uploaded)</option>
										<option value="4">已到保税库(In bonded warehouse)</option>
										<option value="5">出库至中国资产库(Outbounded to China Asset Warehouse)</option>
										<option value="6">已到中国资产库(In China Asset Warehouse)</option>
									</select>
								</span>
							</div>
						</div>
					</li>
					<li>
						<c:if test="${userCountry==null }">
							<div class="tbul02_left02" style="width: 30%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 220px;">采购地址(PurchaseAddress)：</span>
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
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 220px;">商城合同编号(MallContractNumber)：</span>
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
			<span id="carp2" style="color: red; font-family:"新宋体""> </span>
		</div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
		</div>
	</div>
</div>
<!-- <th style="text-align:center;word-wrap:break-word;">需求单编号(requirementCode)</th>
<th style="text-align:center;word-wrap:break-word;">需求单名称(requirementName)</th>
<td>{{needcode}}</td>
  			<td>{{needname}}</td> -->
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
  			<th style="text-align:center;word-wrap:break-word;">合同编号(contractNo)</th>
			<th style="text-align:center;word-wrap:break-word;">品牌(brand)</th>
			<th style="text-align:center;word-wrap:break-word;">型号(model)</th>
			<th style="text-align:center;word-wrap:break-word;">版别(version)</th>
			<th style="text-align:center;word-wrap:break-word;">排量(displacement)</th>
			<th style="text-align:center;word-wrap:break-word;">车架号(vin)</th>
			<th style="text-align:center;word-wrap:break-word;">外观颜色(outColour)</th>
			<th style="text-align:center;word-wrap:break-word;">内饰颜色(InColor)</th>
			<th style="text-align:center;word-wrap:break-word;">应入库时间(LibrarTime)</th>
			<th style="text-align:center;word-wrap:break-word;">供应商姓名(supplier)</th>
			<th style="text-align:center;word-wrap:break-word;">采购计划编号(purchaseCode)</th>
			<th style="text-align:center;word-wrap:break-word;">采购计划名称(purchaseName)</th>
			<th style="text-align:center;word-wrap:break-word;">状态(status)</th>
			<th style="text-align:center;word-wrap:break-word;">新老数据(oldOrNewData)</th>
			<th style="text-align:center;word-wrap:break-word;">商城合同编号(MallContractNumber)</th>
			<th style="text-align:center;word-wrap:break-word;width:105px;">操作(operate)</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
			<td>{{contractname}}</td>
  			<td>{{brand}}</td>
  			<td>{{model}}</td>
  			<td>{{version}}</td>
			<td>{{displacement}}</td>
			<td>{{vin}}</td>
			<td>{{outcolor}}</td>
			<td>{{incolor}}</td>
			<td>{{_formatDatetime appointtime}}</td>
			<td>{{buyername}}</td>
  			<td>{{buycode}}</td>
			<td>{{buyname}}</td>
  			<td>{{_statuss status country datatype}}</td>
			<td>{{contracttype contractid}}</td>
			<td>{{mallcontractcode}}</td>
           	<td>{{_operate id status}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
	seajs.use("${scriptBasePath}/jndAssetlibrarylist/jndPreEntryVehicleList.js?r=<%=new Date()%>");
</script>