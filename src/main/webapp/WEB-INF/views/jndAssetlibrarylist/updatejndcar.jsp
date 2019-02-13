<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="backUrl"
	value="<ufa:url fieldName="jndAssetlibrarylistpage" namespace="car-ms"/>">
<input type="hidden" id="saveUrl"
	value="<ufa:url fieldName="CustomsDeclarationOutboundSave" namespace="car-ms"/>">
<input type="hidden" id="updatesave" value="<ufa:url fieldName="updatesave" namespace="car-ms"/>">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/jquery.jedate.js"></script>
<link href="${cssBasePath}/jedate.css" rel="stylesheet">
<div class="mian_right-new" id="EA">
	<div class="rg_list">
		<h1 class="tt_h1" id="He">出库单修改(Stock Out Edit)</h1>

		<form name="editForm" id="editForm" method="POST"
			action="<ufa:url namespace="car-ms" fieldName="updatesave"/>" enctype="multipart/form-data">
			<div class="tb_list">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">采购计划编号(purchasePlanNumber)：</span>
								<span class="td_02" style="margin-top: 10px;">${jnd.buycode }</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">采购计划名称(purchasePlanName)：</span>
								<span class="td_02" style="margin-top: 10px;">${jnd.buyname }</span>
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
						<input type="hidden" id="country" value="${jnd.country }"> <input type="hidden"
							id="id" value="${jnd.id}" name="id" /> <input id="currpage" value="${currpage }"
							type="hidden" name="currpage" />
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">品牌(brand)：</span>
								<span class="td_02" style="margin-top: 10px;">${jnd.brand}</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">型号(model)：</span>
								<span class="td_02" style="margin-top: 10px;">${jnd.model}</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01" style="width: 600px">
								<span class="td_01" style="width: 240px">版别(version)：</span>
								<span class="td_02" style="margin-top: 10px; width: 300px">${jnd.version}</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">
									<label class="fc_red">*</label>车架号(vin)：
								</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="vin" id="vin" class="" type="text" style="width: 150px;" value="${jnd.vin}">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">
									<label class="fc_red">*</label>发动机号(engineNumber)：
								</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="enginenum" id="enginenum" class="" type="text" style="width: 150px;"
										value="${jnd.enginenum }">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">
									<label class="fc_red">*</label>内饰颜色(incolor)：
								</span>
								<span class="td_02" style="margin-top: 4px;">
									<select id="incolor" name="incolor" style="width: 150px;">
										<c:forEach var="item" items="${list2}">
											<option value="<c:out value="${item}"></c:out>"
												<c:if test="${item eq jnd.incolor}">selected="selected"</c:if>><c:out
													value="${item}"></c:out></option>
										</c:forEach>
									</select>
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">
									<label class="fc_red">*</label>外饰颜色(outcolor)：
								</span>
								<span class="td_02" style="margin-top: 4px;">
									<select id="outcolor" name="outcolor" style="width: 150px;">
										<c:forEach var="item" items="${list1}">
											<option value="<c:out value="${item}"></c:out>"
												<c:if test="${item eq jnd.outcolor}">selected="selected"</c:if>><c:out
													value="${item}"></c:out></option>
										</c:forEach>
									</select>
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">
									<label class="fc_red">*</label>座位数(seatNum)：
								</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="seatnum" id="seatnum" class="" type="text" style="width: 150px;"
										value="${jnd.seatnum}">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">
									<label class="fc_red">*</label>轮胎型号(TireType)：
								</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="Tiretype" id="Tiretype" class="" type="text" style="width: 150px;"
										value="${jnd.tiretype}">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">供应商名称(supplierName)：</span>
								<span style="margin-top: 10px;">${jnd.buyername}&nbsp;</span>
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
									<fmt:formatDate pattern="yyyy-MM-dd" value="${jnd.appointtime}" />
									&nbsp;
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">付款时间(paymentTime)：</span>
								<span style="margin-top: 10px;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${jnd.createtime}" />
									&nbsp;
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01" style="width: 700px;">
								<span class="td_01" style="width: 240px;">配置(configuration)：</span>
								<span style="margin-top: 10px;">
									<textarea rows="5" cols="40"  disabled="disabled" style="resize: none;">${jnd.config}</textarea>
									&nbsp;
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01" style="width: 700px;">
								<span class="td_01" style="width: 240px;">备注(remarks)：</span>
								<span style="margin-top: 10px;">
									<textarea rows="5" cols="40"  disabled="disabled" style="resize: none;">${jnd.note}</textarea>
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
								<span class="td_02" style="margin-top: 10px;">${jnd.price}&nbsp;<c:if
										test="${jnd.currency==1 }">C$</c:if>
									<c:if test="${jnd.currency==2 }">$</c:if>
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">成本价(costPrice)：</span>
								<span class="td_02" style="margin-top: 10px;">${jnd.costprice }&nbsp;<c:if
										test="${jnd.currency==1 }">C$</c:if>
									<c:if test="${jnd.currency==2 }">$</c:if>
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
					<li style="width: 20%; float: left;" class="file">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${jnd.iden1}" style="width: 100px; height: 100px;" id="productImg1">
							</span>
						</div>
						<div class="tab_txt01" id="divPL">
							<span class="td_02" style="margin-left: 20px">
								<label class="fc_red">*</label>
								<c:if test="${jnd.datatype!=2}">拥有证carCredentials</c:if>
								<c:if test="${jnd.datatype==2}">国际提货单InternationalBillOfLading</c:if>
								<br /> <input type="file" name="siden1"
									id="iden1" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg1')" />&nbsp;
							</span>
						</div>
					</li>
					<c:if test="${jnd.country!=2 }">
						<li style="width: 20%; float: left" class="file">
							<div class="tab_txt01">
								<span class="td_01" style="margin-left: 50px">
									<img src="${contextPath}${jnd.iden2}" style="width: 100px; height: 100px;" id="productImg2">
								</span>
							</div>
							<div class="tab_txt01" id="divPD">
								<span class="td_02" style="margin-left: 20px">
									<label class="fc_red">*</label>Invoice<br /> <input type="file" name="siden2" id="iden2"
										style="margin-top: 6px" onchange="imagePreview(this.files,'productImg2')" />&nbsp;
								</span>
							</div>
						</li>
					</c:if>
					<li style="width: 20%; float: left" class="file">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${jnd.iden3}" style="width: 100px; height: 100px;" id="productImg3">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<span class="td_02" style="margin-left: 20px">
							汽车名牌照片PicturesOfCarBrands<br /> <input type="file" name="siden3" id="iden3"
									style="margin-top: 6px" onchange="imagePreview(this.files,'productImg3')" />&nbsp;
							</span>
						</div>

					</li>
					<li style="width: 20%; float: left" class="file">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${jnd.iden4}" style="width: 100px; height: 100px;" id="productImg5">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<span class="td_02" style="margin-left: 20px">
								<c:if test="${jnd.datatype!=2}">证件4CredentialsFour</c:if>
								<c:if test="${jnd.datatype==2}">装货柜照片ContainerLoadingPhotograph</c:if><br /> <input type="file" name="siden4" id="iden4" style="margin-top: 6px"
									onchange="imagePreview(this.files,'productImg5')" />
							</span>
							&nbsp;
							</span>
						</div>
					</li>
					<li style="width: 20%; float: left" class="file">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${jnd.iden5}" style="width: 100px; height: 100px;" id="productImg4">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<span class="td_02" style="margin-left: 20px">
								<c:if test="${jnd.datatype!=2}">证件5CredentialsFive</c:if>
								<c:if test="${jnd.datatype==2}">货柜信息TheContainerInformation</c:if><br /> <input type="file" name="siden5" id="iden5" style="margin-top: 6px"
									onchange="imagePreview(this.files,'productImg4')" />
							</span>
							&nbsp;
							</span>
						</div>
					</li>
					<div class="btnlist" style="text-align: center; height: 40px;">
						<a href="javascript:void(0);" id="mysubmit1" class="btn63_01 margin_let10">save</a>
						<a href="javascript:void(0);" id="back" class="btn63_01 margin_let10">return</a>
					</div>
		</form>
		</ul>
	</div>
</div>
</div>
</div>
<script type="text/javascript">
	function imagePreview(obj, imgObj) {
		var f = obj[0];
		var src = window.URL.createObjectURL(f);
		$('#' + imgObj).attr('src', src);
	}
	seajs.use("${scriptBasePath}/jndAssetlibrarylist/CustomsDeclarationOutbound.js");
</script>