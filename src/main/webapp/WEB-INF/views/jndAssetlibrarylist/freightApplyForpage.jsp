<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="freightApply" namespace="car-ms"/>">
<input type="hidden" id="freightUrl" value="<ufa:url fieldName="freightAdd" namespace="car-ms"/>">
<input type="hidden" id="deletefreightUrl"
	value="<ufa:url fieldName="deletefreight" namespace="car-ms"/>">
	<input type="hidden" id="selectJndCar"
	value="<ufa:url fieldName="selectJndCar" namespace="car-ms"/>">
<input type="hidden" id="freightindexUrl"
	value="<ufa:url fieldName="freightApplypage" namespace="car-ms"/>">
<input type="hidden" id="detailsUrl" value="<ufa:url fieldName="jndcardetails" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">
	<div class="rg_list">
		<input type="hidden" id="currpage" name="currpage" value="${currpage }" /> <input type="hidden"
			id="userCountry" name="userCountry" value="${userCountry }">
		<div class="tb_list">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="freightApply" namespace="car-ms"/>" method="post"
				target="hideiframe">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_left02" style="width: 25%;">
							<div class="tab_txt01">
								<span class="td_01">车架号(vin)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="vin" id="vin" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">船名(shipsName)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="shipname" id="shipname" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						
						<div class="tbul02_left02" style="width: 25%; margin-left: -40px;">
							<div class="tab_txt01">
								<span class="td_01" style="width: 180px;">航次(voyageNumber)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="voyage" id="voyage" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
						
						<div class="tbul02_left02" style="width: 430px; margin-left: -10px;">
							<div class="tab_txt01">
								<span class="td_01" style="width: 210px;">柜号(containerNumber)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="containernum" id="containernum" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 25%;">
							<div class="tab_txt01">
								<span class="td_01">订舱号(bookingNumber)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="bookingnum" id="bookingnum" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 25%;">
							<div class="tab_txt01">
								<span class="td_01">仓库(warehouse)：</span>
								<select id="instoreid" name="instoreid" style="width: 180px; margin-top: 5px;">
									<option value="">--请选择(please select)--</option>
									<c:forEach var="item" items="${store}">
										<option value="<c:out value="${item.id}"></c:out>"><c:out value="${item.name}"></c:out></option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 25%; margin-left: -40px;">
							<div class="tab_txt01">
								<span class="td_01" style="width: 180px;">起运时间(startShipDate)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="sstarttime" id="starttime" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 430px; margin-left: -10px;">
							<div class="tab_txt01">
								<span class="td_01" style="width: 210px;">商城合同编号(MallContractNumber)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="mallcontractcode" id="mallcontractcode" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
						<%-- <div class="tbul02_left02" style="width:25%;margin-left: 10px;">
						<div class="tab_txt01">
							<span class="td_01" style="width:170px;">采购地址(PurchaseAddress)：</span> <span
								class="td_02" style="margin-top: 4px;">
				<select id="country" name="country" style="width:180px;" class="clear">
		  	  	  <option value="">--请选择--</option>
			       <c:forEach var="item" items="${site}">
				<option value="<c:out value="${item.country}"></c:out>"><c:out value="${item.name}"></c:out></option>
				</c:forEach>
		          </select>
					</span>
						</div>
					</div>
					<DIV style="margin-top: 10px;">
					<label style="margin-top: 10px;color: red;font-size:12px; ">请选择采购地址再申请(PleaseSelectThePurchaseAddressToApplyAgain) </label>
					</DIV>
					</li>  --%>
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
		<form name="searchForm1" id="searchForm1"
				action="<ufa:url fieldName="freightAdd" namespace="car-ms"/>" method="post"
				target="hideiframe">
				<input id="cartype" type="hidden">
		<li style="display: none;" class="hiddenDiv">
			<div class="tbul02_left02" style="width: 25%">
				<div class="tab_txt01">
					<span class="td_01" style="width: 180px">预估保险费EstimatePremium：</span>
					<span class="td_02" style="margin-top: 4px;margin-top:10px;color: red;" id="preinsuranceprice"></span>
				</div>
			</div>
			<div class="tbul02_left02" style="width: 25%">
				<div class="tab_txt01">
					<span class="td_01" style="width: 180px">预估短驳费EstimatedDrayage：</span>
					<span class="td_02" style="margin-top: 4px;margin-top:10px;color: red;" id="predrayageprice"></span>
				</div>
			</div>
			<div class="tbul02_left02" style="width: 25%">
				<div class="tab_txt01" style="margin-left: -20px;">
					<span class="td_01" style="width: 200px">预估执照费EstimatedLicenceFee：</span>
					<span class="td_02" style="margin-top: 4px;margin-top:10px;color: red;" id="prelicenseprice"></span>
				</div>
			</div>
			<div class="tbul02_left02" style="width: 25%">
				<div class="tab_txt01" style="margin-left: -20px;">
					<span class="td_01" style="width: 200px">预估燃油费EstimatedFuelCharge：</span>
					<span class="td_02" style="margin-top: 4px;margin-top:10px;color: red;" id="preoilprice"></span>
				</div>
			</div>
		
		</li>
		<li>
		<div class="tbul02_left02" style="width:25%">
			<div class="tab_txt01">
				<span class="td_01" style="width: 180px"><label class="fc_red">*</label>申请名称applyName：</span> <span
					class="td_02" style="margin-top: 4px;"><input name="name" id="name" class="input_text01" type="text"></span>
			</div>
		</div>
		<div class="tbul02_left02" style="width:25%">
			<div class="tab_txt01">
			<span class="td_01" style="width: 180px"><label class="fc_red">*</label>4s店到仓库运费reachStore：</span> <span
				class="td_02" style="margin-top: 4px;"><input name="fourtorep" id="fourtorep"
				class="input_text01" type="text"></span>
			</div>
		</div>
		<div class="tbul02_left02" style="width:25%">
			<div class="tab_txt01">
			<span class="td_01" style="width: 180px"><label class="fc_red">*</label>仓库到港口运费drayage：</span> <span
				class="td_02" style="margin-top: 4px;"><input name="drayage" id="drayage"
				class="input_text01" type="text"></span>
			</div>
		</div>
		<div class="tbul02_left02" style="width:25%">
			<div class="tab_txt01">
			<span class="td_01" style="width: 180px"><label class="fc_red">*</label>海运费oceanFreight：</span> <span
				class="td_02" style="margin-top: 4px;"><input name="oceanfreight" id="oceanfreight"
				class="input_text01" type="text"></span>
			</div>
		</div>
		<div class="tbul02_left02" style="width:25%">
			<div class="tab_txt01">
			<span class="td_01" style="width: 180px"><label class="fc_red">*</label>牌照费LicenseFees：</span> <span
				class="td_02" style="margin-top: 4px;"><input name="brandprice" id="brandprice"
				class="input_text01" type="text"></span>
			</div>
		</div>	
			<div class="tbul02_left02 hiddenDiv" style="width: 25%">
				<div class="tab_txt01">
					<span class="td_01" style="width: 180px">
						<label class="fc_red">*</label>保险费 Premium：
					</span>
					<span class="td_02" style="margin-top: 4px;">
						<input name="surepreinsuranceprice" id="surepreinsuranceprice" class="input_text01" type="text">
					</span>
				</div>
			</div>
			<div class="tbul02_right02 hiddenDiv" style="width: 25%">
				<div class="tab_txt01">
					<span class="td_01" style="width: 180px"><label class="fc_red">*</label>燃油费fuelCharge：</span>
					<span class="td_02" style="margin-top: 4px;">
						<input type="text" id="surepreoilprice" name="surepreoilprice" class="input_text01" />&nbsp;
					</span>
				</div>
			</div>				
		<div class="tbul02_right02" style="width:25%">
			<div class="tab_txt01">
				<span class="td_01" style="width: 180px" >其他费用1otherCost1：</span> <span
					class="td_02" style="margin-top: 4px;">
					<input type="text" id="elsecost1" name="elsecost1" class="input_text01"/>&nbsp;</span>
			</div>
		</div>
		<div class="tbul02_right02" style="width:25%">
			<div class="tab_txt01">
			<span class="td_01" style="width: 180px">其他费用2otherCost2：</span> <span
			class="td_02" style="margin-top: 4px;">
			<input type="text" id="elsecost2" name="elsecost2" class="input_text01"/>&nbsp;</span>
			</div>
		</div>
					</li> </form>
					<div class="btnlist" style="margin-bottom: 20px;">
					<div style="text-align: center;">
					<a href="javascript:void(0);" id="submit"  class="btn63_01">提交(submit)</a>
				</div></div>

</div>
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
 			<th style="text-align:center;word-wrap:break-word;">请选择(choose)</th>
            <th style="text-align:center;word-wrap:break-word;">车架号(vin)</th>
			<th style="text-align:center;word-wrap:break-word;">品牌(brands)</th>
			<th style="text-align:center;word-wrap:break-word;">型号(model)</th>
			<th style="text-align:center;word-wrap:break-word;">版别(version)</th>
			<th style="text-align:center;word-wrap:break-word;">发动机号(engineNumber)</th>
			<th style="text-align:center;word-wrap:break-word;">仓库(warehouse)</th>
			<th style="text-align:center;word-wrap:break-word;">船名(shipsName)</th>
			<th style="text-align:center;word-wrap:break-word;">航次(voyageNumber)</th>
			<th style="text-align:center;word-wrap:break-word;">柜号(containerNumber)</th>
			<th style="text-align:center;word-wrap:break-word;">订舱号(bookingNumber)</th>
			<th style="text-align:center;word-wrap:break-word;">出口单位名称(exporterName)</th>
			<th style="text-align:center;word-wrap:break-word;">收货单位名称(receivingUnit)</th>
			<th style="text-align:center;word-wrap:break-word;">起运时间(startShipDate)</th>
			<th style="text-align:center;word-wrap:break-word;">到港日期(arrivalTime)</th>
			<th style="text-align:center;word-wrap:break-word;">车辆出厂日期(factoryDate)</th>
			<th style="text-align:center;word-wrap:break-word;">商城合同编号(MallContractNumber)</th>
			<th style="text-align:center;word-wrap:break-word;">操作(operate)</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
 			<td><input type="radio" name="carID" id="checkbox1" onchange="selectcar()" value="{{id}}"  ></td>
            <td>{{vin}}</td>
  			<td>{{brand}}</td>
  			<td>{{model}}</td>
  			<td>{{version}}</td>
<td>{{enginenum}}</td>
<td>{{roughweight}}</td>
<td>{{shipname}}</td>
<td>{{voyage}}</td>
<td>{{containernum}}</td>
<td>{{bookingnum}}</td>
<td>{{exportcorpname}}</td>
<td>{{receivingcorpname}}</td>
<td>{{_formatDatetime starttime}}</td>
<td>{{_formatDatetime arrivetime}}</td>
<td>{{_formatDatetime leavefactime}}</td>
<td>{{mallcontractcode}}</td>  
 	<td>{{_operate id}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jndAssetlibrarylist/freightApplyForpage.js?r=<%=new Date()%>");
</script>