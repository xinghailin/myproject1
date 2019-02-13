<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="backUrl"
	value="<ufa:url fieldName="BondedWarehouseEntryListPage" namespace="car-ms"/>">
<input type="hidden" id="back2Url"
	value="<ufa:url fieldName="freightApplypage" namespace="car-ms"/>">
<input type="hidden" id="back3Url" value="<ufa:url fieldName="freightCar" namespace="car-ms"/>">
<input type="hidden" id="back4Url" value="<ufa:url fieldName="Updatefreight" namespace="car-ms"/>">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<style>
*[hidefocus],input,textarea,a {
	outline: none;
}

body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,textarea,p,blockquote,th,td {
	padding: 0; margin: 0;
}

fieldset,img,html,body,iframe {
	border: 0;
}

table {
	border-collapse: collapse; border-spacing: 0;
}

li {
	list-style: none;
}

i {
	font-style: normal;
}

h1,h2,h3,h4,h5,h6 {
	font-size: 100%;
}

caption,th {
	font-weight: normal; font-style: normal; text-align: left;
}

em,strong {
	font-weight: bold; font-style: normal;
}

body,textarea,select,input,pre {
	font-family: arial, microsoft yahei, helvetica, sans-serif; font-size: 14px; color: #555;
}

body {
	background: #f8f8f8; line-height: 1.5em; -webkit-text-size-adjust: none;
}

a,p {
	cursor: pointer;
}

textarea {
	resize: none; overflow: auto;
}

pre {
	white-space: pre-wrap;
}

a {
	color: #333; text-decoration: none;
}

.box {
	width: 1524px; overflow: hidden; color: #555; margin-left: 50px;
}

.flie-title {
	font-size: 24px; padding: 10px 0 30px;
}

.apply {
	overflow: hidden; padding-bottom: 50px;
}

.apply-title {
	font-size: 16px; padding-bottom: 10px;
	/*font-weight: bold;*/
}

.apply a {
	display: block; text-align: center; width: 150px; height: 200px; float: left; padding: 10px 30px;
}

.apply-box img {
	display: block; width: 150px; height: 150px; padding: 10px 0;
}

.apply-box p {
	border: 1px solid #ccc; background: #4d90fe; width: 120px; height: 30px; color: #fff;
	border-radius: 15px; line-height: 30px;
}

.out {
	overflow: hidden;
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
		<h1 class="tt_h1" id="He">车辆详情信息(Contract details)</h1>
		<input type="hidden" id="Updatefreight" value="${Updatefreight }">
		<!--审核修改是修改进人的详情查看还是查看进人详情的状态  -->
		<input type="hidden" id="username" value="${username }">
		<!--审核人姓名  -->
		<input id="currency" type="hidden" value="${car.currency }"> <input type="hidden"
			id="freightid" value="${freightid }">
		<!-- 运费申请单id -->
		<c:if test="${car.currency eq 1}">
			<c:set var="curr" value="C$" />
		</c:if>
		<c:if test="${car.currency eq 2}">
			<c:set var="curr" value="$" />
		</c:if>
		<form name="editForm" id="editForm" method="POST"
			action="<ufa:url namespace="car-ms" fieldName="taxRefundFileUpload"/>"
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
					<li style="border-bottom: none;">
						<input id="currpage" value="${currpage }" type="hidden" name="currpage" />
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
								<span class="td_02" style="margin-top: 10px;">${car.version}</span>
							</div>
						</div>
					</li>
					<li style="border-bottom: none;">
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">车架号(vin)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.vin}&nbsp;</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">发动机号(engineNumber)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.enginenum}&nbsp;</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">出厂日期(dateOfProduction)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${car.leavefactime}" />
									&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li style="border-bottom: none;">
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">外观颜色(outcolor)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.outcolor}&nbsp;</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">内饰颜色(incolor)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.incolor}&nbsp;</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">座位数(seatNum)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.seatnum}&nbsp;</span>
							</div>
						</div>
					</li>
					<li style="border-bottom: none;">
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">轮胎型号(TireType)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.tiretype}&nbsp;</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">成本价(costPrice)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.costprice}${curr}</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">供应商名称(supplierName)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.buyername}&nbsp;</span>
							</div>
						</div>
					</li>
					<li style="border-bottom: none;">
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">货物运送地点(repertoryLocation)：</span>
								<span class="td_02" style="margin-top: 10px;">${stor.name}&nbsp;</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">约定入库时间(planArriveRepertoryTime)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${car.appointtime}" />
									&nbsp;
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">付款时间(paymentTime)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${car.createtime}" />
									&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01" style="width: 650px">
								<span class="td_01" style="width: 240px;">配置(configuration)：</span>
								<span class="td_02" style="margin-top: 10px; resize: none;">
									<textarea rows="5" cols="40" readonly="readonly">${car.config}</textarea>
									&nbsp;
								</span>
							</div></div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01" style="width: 650px">
								<span class="td_01" style="width: 240px;">备注(remarks)：</span>
								<span class="td_02" style="margin-top: 10px; resize: none;">
									<textarea rows="5" cols="40" readonly="readonly">${car.note}</textarea>
									&nbsp;
								</span>
							</div>
						</div>
					</li>
					<%-- <li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px;">
								<font size="5">车辆价格信息</font>
							</span>
						</div>
					</li>
					<li style="border-bottom: none;">
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">车价：</span>
								<span class="td_02" style="margin-top: 10px;">${car.price}&nbsp; </span>
								<p style="float: left; margin-top: 10px;"></p>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">成本价：</span>
								<span class="td_02" style="margin-top: 10px;">${car.costprice }&nbsp; </span>
								<p style="float: left; margin-top: 10px;"></p>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">买手返佣：</span>
								<span class="td_02" style="margin-top: 10px;">${car.rebate}&nbsp; </span>
								<p style="float: left; margin-top: 10px;"></p>
							</div>
						</div>
					</li>
					<li style="border-bottom: none;">
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">4s店杂费：</span>
								<span class="td_02" style="margin-top: 10px;">${car.othercost }&nbsp; </span>
								<p style="float: left; margin-top: 10px;"></p>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">车辆保险：</span>
								<span class="td_02" style="margin-top: 10px;">${car.insurance}&nbsp; </span>
								<p style="float: left; margin-top: 10px;"></p>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">退保违约金：</span>
								<span class="td_02" style="margin-top: 10px;">${car.latecost }&nbsp; </span>
								<p style="float: left; margin-top: 10px;"></p>
							</div>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">消费税：</span>
								<span class="td_02" style="margin-top: 10px;">${car.expensetax}&nbsp;</span>
								<p style="float: left; margin-top: 10px;"></p>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">4s销售佣金：</span>
								<span class="td_02" style="margin-top: 10px;">${car.salecost }&nbsp;</span>
								<p style="float: left; margin-top: 10px;"></p>
							</div>
						</div>
					</li> --%>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 100px;">
								<font size="5">报关信息(informationAboutCustomsDeclaration)</font>
							</span>
						</div>
					</li>
					<li style="border-bottom: none;">
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">船名(shipsName)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.shipname } </span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">航次(VoyageNumber)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.voyage } </span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">柜号(ContainerNumber)：</span>
								<span class="td_02" style="margin-top: 10px;"> ${car.containernum } &nbsp;</span>
							</div>
						</div>
					</li>

					<li style="border-bottom: none;">
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">订舱号(BookingNumber)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.bookingnum } </span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">出口单位名称(NameOfExporter)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.exportcorpname } </span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">收货单位名称(ReceivingUnit)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.receivingcorpname } &nbsp;</span>
							</div>
						</div>
					</li>
					<li style="border-bottom: none;">
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">货物名称(GoodsName)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.goodname } </span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">毛重(RoughWeight)：</span>
								<span class="td_02" style="margin-top: 10px;">${car.roughweight } </span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">启运时间(StartShipDate)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${car.starttime}" />
									&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">到港时间(ArrivalTime)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${car.arrivetime}" />
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">目标港口(goalHaven)：</span>
								<span class="td_02" style="margin-top: 10px;">
									${car.goalhaven}
								</span>
							</div>
						</div>
					</li>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 75px;">
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
							<c:if test="${car.datatype!=2}">
								<span class="td_02" style="margin-left: 20px">拥有证 (carCredentials)</span>
							</c:if>
							<c:if test="${car.datatype==2}">
								<span class="td_02" style="margin-left: 20px">国际提货单(Bill of Lading)</span>
							</c:if>
						</div>
					</li>
					<c:if test="${car.country!=2 }">
						<li style="width: 20%; float: left">
							<div class="tab_txt01">
								<span class="td_01" style="margin-left: 50px">
									<img src="${contextPath}${car.iden2}" style="width: 100px; height: 100px;" id="productImg2">
								</span>
							</div>
							<div class="tab_txt01" id="divPD">
								<span class="td_02" style="margin-left: 20px">
									Invoice<br />
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
								<span class="td_02" style="margin-left: 20px">汽车名牌照片(PicturesOfCarBrands)</span>
						</div>
					</li>
					<li style="width: 20%; float: left">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${car.iden4}" style="width: 100px; height: 100px;" id="productImg5">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<c:if test="${car.datatype!=2}">
								<span class="td_02" style="margin-left: 20px">证件4(CredentialsFour)</span>
							</c:if>
							<c:if test="${car.datatype==2}">
								<span class="td_02" style="margin-left: 20px">装货柜照片(cargo container photo)</span>
							</c:if>
						</div>
					</li>
					<li style="width: 20%; float: left">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${car.iden5}" style="width: 100px; height: 100px;" id="productImg4">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<c:if test="${car.datatype!=2}">
								<span class="td_02" style="margin-left: 20px">证件5(CredentialsFive)</span>
							</c:if>
							<c:if test="${car.datatype==2}">
								<span class="td_02" style="margin-left: 20px">货柜信息(container information)</span>
							</c:if>
						</div>
					</li>

					<c:forEach var="file" items="${file }">
						<c:if test="${file.type==3}">
							<li style="width: 20%; float: left">
								<div class="tab_txt01">
									<span class="td_01" style="margin-left: 50px">
										<img src="${contextPath}${file.location}" style="width: 100px; height: 100px;"
											id="productImg4">
									</span>
								</div>
								<div class="tab_txt01" id="divPD">
									<span class="td_02" style="margin-left: 20px">
										海外检验单图片(testPicture)<br/>
									</span>
								</div>
							</li>
						</c:if>
						<c:if test="${file.type==4}">
							<li style="width: 20%; float: left">
								<div class="tab_txt01">
									<span class="td_01" style="margin-left: 50px">
										<img src="${contextPath}${file.location}" style="width: 100px; height: 100px;"
											id="productImg4">
									</span>
								</div>
								<div class="tab_txt01" id="divPD">
									<span class="td_02" style="margin-left: 20px">
										中国检验单图片<br />
									</span>
								</div>
							</li>
						</c:if>
					</c:forEach>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 100px;">
								<font size="5">报关文件(customsClearanceDocument)</font>
							</span>
						</div>
					</li>

					<c:forEach var="file" items="${file }">
						<c:if test="${file.type==1}">
							<li style="width: 20%; float: left">
								<div class="tab_txt01">
									<span class="td_01" style="margin-left: 50px">
										<img src="${contextPath}${file.location}" style="width: 100px; height: 100px;"
											id="productImg4">
									</span>
								</div>
							</li>
						</c:if>
					</c:forEach>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 100px;">
								<font size="5">退税文件(TaxRebateFile)</font>
							</span>
						</div>
					</li>
					<c:forEach var="file" items="${file }">
						<c:if test="${file.type==2}">
							<li style="width: 20%; float: left">
								<div class="tab_txt01">
									<span class="td_01" style="margin-left: 50px">
										<img src="${contextPath}${file.location}" style="width: 100px; height: 100px;"
											id="productImg4">
									</span>
								</div>
							</li>
						</c:if>
					</c:forEach>
			</div>
			</ul>
		</form>
	</div>
	<div class="btnlist" style="text-align: center;">
		<c:if test="${examine==1 }">
			<a href="javascript:void(0);" id="back1" class="btn63_01 margin_let10">back</a>
			<!-- 保税区入库列表查看返回 -->
		</c:if>
		<c:if test="${examine==2 }">
			<a href="javascript:void(0);" id="back2" class="btn63_01 margin_let10">back</a>
			<!-- 运费申请列表页面查看返回-->
		</c:if>
		<c:if test="${examine==3 }">
			<a href="javascript:void(0);" id="back3" class="btn63_01 margin_let10">back</a>
			<!--  运费申请审核时的列表查看返回 -->
		</c:if>
		<c:if test="${examine==4 }">
			<a href="javascript:void(0);" id="back4" class="btn63_01 margin_let10">back</a>
			<!-- 运费申请修改查看时列表查看返回 -->
		</c:if>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		if ($('#currency').val() == 1) {
			$('p').html('C$');
		} else if ($('#currency').val() == 2) {
			$('p').html('$');
		}
	});
	seajs.use("${scriptBasePath}/jndAssetlibrarylist/jndcardetails.js");
</script>