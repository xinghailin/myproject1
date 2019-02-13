<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="backUrl"
	value="<ufa:url fieldName="jndAssetlibrarylistpage" namespace="car-ms"/>">
<input type="hidden" id="saveUrl"
	value="<ufa:url fieldName="CustomsDeclarationOutboundSave" namespace="car-ms"/>">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/jquery.jedate.js"></script>
<link href="${cssBasePath}/jedate.css" rel="stylesheet">
<style>
.out {
	overflow: hidden;
}

.out-title {
	font-size: 16px;
}

.out-box input {
	margin: 10px 0; width: 227px;
}

.out-box {
	padding: 20px 0; overflow: hidden;
}

.out-title {
	font-size: 16px;
}

.out-box {
	padding: 20px 0; overflow: hidden;
}

.up-box {
	width: 250px;
	/*height:;*/ padding: 20px 30px; float: left;
}

.out-box input {
	margin: 10px 0;
	/*border: 1px solid #ccc;*/
}

.out-box .delete {
	width: 60px; height: 25px; line-height: 25px; color: #fff; background: #4d90fe; text-align: center;
	cursor: pointer; margin-left: 54px;
}

.out-add {
	width: 100px; height: 30px; line-height: 30px; color: #fff; background: #4d90fe; text-align: center;
	cursor: pointer; margin-left: 30px; margin-bottom: 50px;
}

.file-submit {
	width: 130px; height: 30px; line-height: 30px; color: #fff; background: #4d90fe; text-align: center;
	margin: 100px auto; cursor: pointer;
}
</style>
<div class="mian_right-new" id="EA">
	<div class="rg_list">
		<h1 class="tt_h1" id="He">出库单(Stock  Out Sheet)</h1>

		<form name="editForm" id="editForm" method="POST"
			action="<ufa:url namespace="car-ms" fieldName="CustomsDeclarationOutboundSave"/>"
			enctype="multipart/form-data">
			<div class="tb_list">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">采购计划编号(purchasePlanNumber)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.buycode }</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">采购计划名称(purchasePlanName)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.buyname }</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 350px;">
								<font size="5">车辆信息(vehicleInformation)</font>
							</span>
						</div>
					</li>
					<li>
						<input type="hidden" id="id" value="${car.id}" name="id" /> <input id="currpage"
							value="${currpage }" type="hidden" name="currpage" />
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">品牌(brand)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.brand}</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">型号(model)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.model}</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01" style="width: 600px">
								<span class="td_01" style="width: 240px">版别(version)：</span>
								<span class="td_02" style="margin-top: 10px; width: 300px">${car.version}</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">车架号(vin)：</span>
								<span style="margin-top: 10px;">${car.vin}&nbsp;</span>
							</div>
						</div>

						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">外观颜色(appearanceColor)：</span>
								<span style="margin-top: 10px;">${car.outcolor}&nbsp;</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">内饰颜色(configuration)：</span>
								<span style="margin-top: 10px;">${car.incolor}&nbsp;</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">供应商名称(supplierName)：</span>
								<span style="margin-top: 10px;">${car.buyername}&nbsp;</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">货物运送地点(repertoryLocation)：</span>
								<span style="margin-top: 10px;">${stor.name}&nbsp;</span>
							</div>
						</div>
						
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">约定入库时间(planArriveRepertoryTime)：</span>
								<span style="margin-top: 10px;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${car.appointtime}" />
									&nbsp;
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">付款时间(paymentTime)：</span>
								<span style="margin-top: 10px;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${car.createtime}" />
									&nbsp;
								</span>
							</div>
						</div>
						
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01" style="width: 700px;">
								<span class="td_01" style="width: 240px;">配置(configuration)：</span>
								<span style="margin-top: 10px;">
									<textarea rows="5" cols="40" readonly="readonly" style="resize: none;">${car.config}</textarea>
									&nbsp;
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01" style="width: 700px;">
								<span class="td_01" style="width: 240px;">备注(remarks)：</span>
								<span style="margin-top: 10px;">
									<textarea rows="5" cols="40" readonly="readonly" style="resize: none;">${car.note}</textarea>
									&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 450px;">
								<font size="5">车辆价格信息(vehiclePriceInformation)</font>
							</span>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">车价(carPrices)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.price}&nbsp;<c:if
										test="${car.currency==1 }">C$</c:if>
									<c:if test="${car.currency==2 }">$</c:if>
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">成本价(costPrice)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.costprice }&nbsp;<c:if
										test="${car.currency==1 }">C$</c:if>
									<c:if test="${car.currency==2 }">$</c:if>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 270px;">
								<font size="5">拥有证(carCredentials)</font>
							</span>
						</div>
					</li>
					<li style="width: 240px; float: left;">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${car.iden1}" style="width: 100px; height: 100px;" id="productImg1">
							</span>
						</div>
						<div class="tab_txt01">
							<span class="td_02" style="margin-left: 20px">
								<c:if test="${car.datatype!=2}">
									<span class="td_02" style="margin-left: 20px">拥有证(carCredentials) </span>
								</c:if>
								<c:if test="${car.datatype==2}">
									<span class="td_02" style="margin-left: 20px">国际提货单(Bill of Lading)</span>
								</c:if>
								<br />
							</span>
						</div>
					</li>
					<c:if test="${car.country!=2 }">
						<li style="width: 240px;height:135px; float: left">
							<div class="tab_txt01">
								<span class="td_01" style="margin-left: 50px">
									<img src="${contextPath}${car.iden2}" style="width: 100px; height: 100px;" id="productImg2">
								</span>
							</div>
							<div class="tab_txt01" id="divPD">
								<span class="td_02" style="margin-left: 20px">
									Invoice
								</span>
							</div>
						</li>
					</c:if>
					<li style="width: 20%; float: left">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${car.iden3}" style="width: 100px; height: 100px;" id="productImg3">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<span class="td_02" style="margin-left: 20px">
								<span class="td_02" style="margin-left: 20px">汽车名牌照片(PicturesOfCarBrands)</span>
							</span>
						</div>

					</li>
					<li style="width: 20%; float: left">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${car.iden4}" style="width: 100px; height: 100px;" id="productImg5">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<span class="td_02" style="margin-left: 20px">
							<c:if test="${car.datatype!=2}">
								<span class="td_02" style="margin-left: 20px">证件4(CredentialsFour)</span>
							</c:if>
							<c:if test="${car.datatype==2}">
								<span class="td_02" style="margin-left: 20px">装货柜照片(cargo container photo)</span>
							</c:if>
							</span>
						</div>
					</li>
					<li style="width: 20%; float: left">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${car.iden5}" style="width: 100px; height: 100px;" id="productImg4">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<span class="td_02" style="margin-left: 20px">
							<c:if test="${car.datatype!=2}">
								<span class="td_02" style="margin-left: 20px">证件5(CredentialsFive)</span>
							</c:if>
							<c:if test="${car.datatype==2}">
								<span class="td_02" style="margin-left: 20px">货柜信息(container information)</span>
							</c:if>
							</span>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 590px;">
								<font size="5">报关信息填写(enteringClearanceOfGoodsInformation)</font>
							</span>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">
									<label class="fc_red">*</label>船名(shipsName)：
								</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="shipname" id="shipname" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">
									<label class="fc_red">*</label>航次(VoyageNumber)：
								</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="voyage" id="voyage" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">
									<label class="fc_red">*</label>柜号(ContainerNumber)：
								</span>
								<span class="td_02" style="margin-top: 10px;">
									<input type="text" id="containernum" name="containernum" class="input_text01"
										style="width: 180px;" />&nbsp;
								</span>
							</div>
						</div>
					</li>

					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">
									<label class="fc_red">*</label>订舱号(BookingNumber)：
								</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="bookingnum" id="bookingnum" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">
									<label class="fc_red">*</label>出口单位名称(NameOfExporter)：
								</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="exportcorpname" id="exportcorpname" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">
									<label class="fc_red">*</label>收货单位名称(ReceivingUnit)：
								</span>
								<span class="td_02" style="margin-top: 10px;">
									<input type="text" id="receivingcorpname" name="receivingcorpname" class="input_text01"
										style="width: 180px;" />&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">
									<label class="fc_red">*</label>货物名称(GoodsName)：
								</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="goodname" id="goodname" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">
									<label class="fc_red">*</label>毛重(RoughWeight)：
								</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="roughweight" id="roughweight" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">
									<label class="fc_red">*</label>启运时间(StartShipDate)：
								</span>
								<span class="td_02" style="margin-top: 10px;">
									<input type="text" id="starttime" readonly name="starttimes" class="input_text01"
										style="width: 180px;" />&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">
									<label class="fc_red">*</label>到港时间(ArrivalTime)：
								</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="arrivetimes" id="arrivetime" class="input_text01" type="text" readonly
										style="width: 180px;" />
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">
									<label class="fc_red">*</label>目标港口(goalHaven)：
								</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="goalhaven" id="goalhaven" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="out">
							<div class="out-title">报关文件上传(clearance of goods files upload)</div>
							<div class="out-box">
								<div class="up-box">
									<input type="file" class="files" name="files">
									<div class="delete">delete</div>
								</div>
							</div>
							<div class="out-add">Continue to add</div>
						</div>

						<div class="btnlist" style="text-align: center;">
							<input type="button" value="save" name="buttonSplit" class="btn63_01 margin_let10"
								id="mysubmit">
							<a id="btnReset" class="btn63_02 margin_let10">reset</a>
							<a href="javascript:void(0);" id="back" class="btn63_01 margin_let10">return</a>
						</div>
					</li>
		</form>
		</ul>
	</div>
</div>
</div>
</div>
<script type="text/javascript">
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	$("#arrivetime").jeDate({
		format : "YYYY-MM-DD",
		isTime : false,
		isClear : false,
		/* minDate : year + "-" + month + "-" + day */
	});
	$("#starttime").jeDate({
		format : "YYYY-MM-DD",
		isTime : false,
		isClear : false,
		
	});

	seajs.use("${scriptBasePath}/jndAssetlibrarylist/CustomsDeclarationOutbound.js");
</script>