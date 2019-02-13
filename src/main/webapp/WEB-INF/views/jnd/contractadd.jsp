<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/jndapplypay.css" rel="stylesheet">
<style>
.file-box {
	width: 260px; overflow: hidden; position: relative;
	
}

.file-box input {
	width: 100%; position: absolute; z-index: 1;opacity: 0; cursor: pointer;left:0;top:0;
}

.file-box p {
	width: 100%; text-align: center; font-size: 16px;
}
</style>
<input type="hidden" id="indexUrl"
	value="<ufa:url fieldName="jndcontractindex" namespace="car-ms"/>">
<input type="hidden" id="choosepurUrl"
	value="<ufa:url fieldName="jndPurchaseLstForContractIndex" namespace="car-ms"/>">
<input type="hidden" id="subpurUrl"
	value="<ufa:url fieldName="jndSubPurchaseForContractById" namespace="car-ms"/>">
<input type="hidden" id="currpage" value="${currpage}">
<input type="hidden" id="userCountry" value="${userCountry}">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">
	<head>
<meta charset="UTF-8">
<title>合同新增提交审核(Submission of New Contract)</title>
	</head>
	<body>
		<div class="box">
			<h2 class="buy-title">
				合同新增提交审核(Submission of New Contract)
				<span style="color: red; font-size: 14px; margin-left: 50px;">操作提示：第一步选择采购计划，合同编号会自动生成(Operation hint: the first step is to select the purchase plan, and the contract number will be automatically generated)</span>
			</h2>
			<div class="content">
				<form name="editForm" id="editForm" method="POST"
					action="<ufa:url namespace="car-ms" fieldName="jndContractsave"/>"
					enctype="multipart/form-data">
					<input type="hidden" name="subbuyid" id="subbuyid" value=""> <input type="hidden"
						name="buyid" id="buyid" value=""> <input type="hidden" name="id" id="idkey" value="">
					<input type="hidden" name="newadd" value="1"><input type="hidden" id="activepurchaser"
						name="activepurchaser" value=""> <input type="hidden" id="mallcode" name="mallcode"
						value="">
					<div class="rightbox" style="width: 100%; padding-left: 0px; border-left: 0px;">
						<div class="right-title">
							<p>
								<span>
									<i>合同编号:</i> <i>(contract code)</i>
								</span>
								<input id="contractcode" type="text" name="code" value="${contractcode}" readonly="readonly"
									style="background-color: #ccc; width: 260px;">
							</p>
							<p>
								<span>
									<i><label class="fc_red">*</label>采购文件上传:</i><i>(purchase file upload)</i>
								</span>
						<!-- <div class="file-box" style="margin-top:-20px; float: right;"> -->
								<input id="purfile" name="purfile" type="file">
								<!-- <p>No files selected</p> -->
					<!-- 	</div> -->
							</p>
							<p
								<span>
									<i><label class="fc_red">*</label>合同文件上传:</i> <i>(contract file upload)</i>
								</span>
								<!-- <div class="file-box" style="margin-top:-20px; float: right;"> -->
								<input id="texturl" name="texturl" type="file">
								<!-- <p>No files selected</p>
							</div> -->
							</p>
						</div>
						<div class="right" style="padding-top: 5px;">
							<div class="brand">
								<span style="width: 100%; margin-left: 15%;">
									<a href="javascript:void(0);" id="choseBtn" class="addgoon">选择采购计划(choose purchase
										plan)</a>
								</span>
							</div>
							<div class="detail">
								<div>
									<span>
										<i>采购计划编号：</i> <i>(purchase number)</i>
									</span>
									<span id="pcode"></span>
								</div>
								<div>
									<span>
										<i>采购计划名称：</i> <i>(purchase name)</i>
									</span>
									<span id="pname"></span>
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i>主动采购方：</i> <i>(Active Purchaser)</i>
									</span>
									<span id="pactivepurchaser"></span>
								</div>
							</div>
							<div style="font-weight: bold; margin-top: 5px; margin-bottom: 5px;">基本信息(Basic
								Information)</div>
							<div class="detail">
								<div>
									<span>
										<i><label class="fc_red">*</label>供应方名称：</i> <i>(Agent Name)</i>
									</span>
									<select id="psupplyname" name="sname"></select>
								</div>
								<div>
									<span>
										<i>供应方地址：</i> <i>(Agent address)</i>
									</span>
									<input id="sadd" type="text" name="sadd" value="">
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i><label class="fc_red">*</label>证件类型：</i> <i>(ID Type)</i>
									</span>
									<input id="sidtype" type="text" name="sidtype" value="">
								</div>
								<div>
									<span>
										<i><label class="fc_red">*</label>证件号：</i> <i>(ID No)</i>
									</span>
									<input id="sno" type="text" name="sno" value="">
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i>联系方式：</i> <i>(Contact Phone No)</i>
									</span>
									<input id="sphone" type="text" name="sphone" value="">
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i><label class="fc_red">*</label>采购方名称：</i> <i>(Purchaser name)</i>
									</span>
									<input type="text" name="pname" value="">
								</div>
								<div>
									<span>
										<i><label class="fc_red">*</label>采购方地址：</i> <i>(Purchaser address)</i>
									</span>
									<input id="padd" type="text" name="padd" value="">
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i><label class="fc_red">*</label>证件类型：</i> <i>(ID Type)</i>
									</span>
									<input id="pidtype" type="text" name="pidtype" value="">
								</div>
								<div>
									<span>
										<i><label class="fc_red">*</label>证件号：</i> <i>(ID No)</i>
									</span>
									<input id="pno" type="text" name="pno" value="">
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i>联系方式：</i> <i>(Contact Phone No)</i>
									</span>
									<input id="pphone" type="text" name="pphone" value="">
								</div>
							</div>
							<div style="font-weight: bold; margin-top: 5px; margin-bottom: 5px;">车辆描述(Vehicle
								Description)</div>
							<div class="detail">
								<div>
									<span>
										<i><label class="fc_red">*</label>品牌:</i> <i>(brand)</i>
									</span>
									<span>
										<input id="pbrand" type="text" name="brand" value="">
									</span>
								</div>
								<div>
									<span>
										<i><label class="fc_red">*</label>型号:</i> <i>(model)</i>
									</span>
									<span>
										<input id="pmodel" type="text" name="model" value="">
									</span>
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i>版别:</i> <i>(version)</i>
									</span>
									<span>
										<input id="pversion" type="text" name="version" value="" style="width: 400px;">
									</span>
								</div>
								<div>
									<span>
										<i>排量:</i> <i>(displacement)</i>
									</span>
									<span>
										<input id="displacement" type="text" name="displacement" value="">
									</span>
								</div>
							</div>
							<div class="info">
								<div class="set">
									<span>
										<i><label class="fc_red">*</label>配置：</i> <i>(Configuration)</i>
									</span>
									<textarea id="pconfig" name="config"></textarea>
								</div>
								<div class="color">
									<div>
										<span>
											<i><label class="fc_red">*</label>外观颜色：</i> <i>(Exterior Color)</i>
										</span>
										<input id="outcolor" type="text" name="outcolor" value="">
									</div>
									<div>
										<span>
											<i><label class="fc_red">*</label>内饰颜色：</i> <i>(Interior Color)</i>
										</span>
										<input id="incolor" type="text" name="incolor" value="">
									</div>
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i>改装:</i> <i>(Trim)</i>
									</span>
									<span>
										<input id="trim" type="text" name="trim" value="">
									</span>
								</div>
								<div>
									<span>
										<i><label class="fc_red">*</label>数量：</i> <i>(amount)</i>
									</span>
									<input id="pnum" type="text" name="num" value="">
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i><label class="fc_red">*</label>价格:</i> <i>(Price)</i>
									</span>
									<input id="ptotalprice" type="text" name="price" value=""><label name="currency"></label>
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i>货物运送地点：</i> <i>(delivery address)</i>
									</span>
									<select id="apponitadd" name="apponitadd">
										<%-- <c:forEach var="ite" items="${stores}">
		             <option value="<c:out value="${ite.id}"></c:out>"><c:out value="${ite.name}"></c:out></option>
		           </c:forEach> --%>
									</select>
								</div>
								<div>
									<span>
										<i><label class="fc_red">*</label>约定入库时间：</i> <i>(Scheduled delivery)</i>
									</span>
									<input id="appointtime" name="appointtime" type="text" placeholder="请选择时间"
										readonly="readonly">
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i>运输方名称：</i> <i>(Shipping name)</i>
									</span>
									<input id="transname" type="text" name="transname" value="">
								</div>
								<div>
									<span>
										<i>运输费用：</i> <i>(Shipping Fee)</i>
									</span>
									<input id="transprice" type="text" name="transprice" value=""><label
										name="currency"></label>
								</div>
							</div>
							<div class="detail">
								<div class="selfpur">
									<span>
										<i>4S店杂费：</i> <i>(4S Shop Charges)</i>
									</span>
									<input id="othercost" type="text" name="othercost" value=""><label name="currency"></label>
								</div>
								<div>
									<span>
										<i>消费税：</i> <i>(Consumption Tax)</i>
									</span>
									<input id="expensetax" type="text" name="expensetax" value=""><label
										name="currency"></label>
								</div>
							</div>
							<div class="selfpur">
								<div class="detail">
									<div>
										<span>
											<i>保险：</i> <i>(Insurance)</i>
										</span>
										<input id="insurance" type="text" name="insurance" value=""><label name="currency"></label>
									</div>
									<div>
										<span>
											<i>总加装费：</i> <i>(Total Configuration Price)</i>
										</span>
										<input id="trimprice" type="text" name="trimprice" value=""><label name="currency"></label>
									</div>
								</div>
								<div class="detail">
									<div>
										<span>
											<i>加装描述1：</i> <i>(config1 description)</i>
										</span>
										<input type="text" name="trim1" id="trim1">
									</div>
									<div>
										<span>
											<i>加装费1：</i> <i>(config1 price)</i>
										</span>
										<input type="text" name="t1price" id="t1price">
									</div>
								</div>
								<div class="detail">
									<div>
										<span>
											<i>加装描述2：</i> <i>(config2 description)</i>
										</span>
										<input type="text" name="trim2" id="trim2">
									</div>
									<div>
										<span>
											<i>加装费2：</i> <i>(config2 price)</i>
										</span>
										<input type="text" name="t2price" id="t2price">
									</div>
								</div>
								<div class="detail">
									<div>
										<span>
											<i>加装描述3：</i> <i>(config3 description)</i>
										</span>
										<input type="text" name="trim3" id="trim3">
									</div>
									<div>
										<span>
											<i>加装费3：</i> <i>(config3 price)</i>
										</span>
										<input type="text" name="t3price" id="t3price">
									</div>
								</div>
								<div class="detail">
									<div>
										<span>
											<i>加装描述4：</i> <i>(config4 description)</i>
										</span>
										<input type="text" name="trim4" id="trim4">
									</div>
									<div>
										<span>
											<i>加装费4：</i> <i>(config4 price)</i>
										</span>
										<input type="text" name="t4price" id="t4price">
									</div>
								</div>
								<div class="detail">
									<div>
										<span>
											<i>加装描述5：</i> <i>(config5 description)</i>
										</span>
										<input type="text" name="trim5" id="trim5">
									</div>
									<div>
										<span>
											<i>加装费5：</i> <i>(config5 price)</i>
										</span>
										<input type="text" name="t5price" id="t5price">
									</div>
								</div>
								<div class="detail">
									<div>
										<span>
											<i>加装描述6：</i> <i>(config6 description)</i>
										</span>
										<input type="text" name="trim6" id="trim6">
									</div>
									<div>
										<span>
											<i>加装费6：</i> <i>(config6 price)</i>
										</span>
										<input type="text" name="t6price" id="t6price">
									</div>
								</div>
								<div class="detail">
									<div>
										<span>
											<i>加装描述7：</i> <i>(config7 description)</i>
										</span>
										<input type="text" name="trim7" id="trim7">
									</div>
									<div>
										<span>
											<i>加装费7：</i> <i>(config7 price)</i>
										</span>
										<input type="text" name="t7price" id="t7price">
									</div>
								</div>
								<div class="detail">
									<div>
										<span>
											<i>加装描述8：</i> <i>(config8 description)</i>
										</span>
										<input type="text" name="trim8" id="trim8">
									</div>
									<div>
										<span>
											<i>加装费8：</i> <i>(config8 price)</i>
										</span>
										<input type="text" name="t8price" id="t8price">
									</div>
								</div>
								<div class="detail">
									<div>
										<span>
											<i>加装描述9：</i> <i>(config9 description)</i>
										</span>
										<input type="text" name="trim9" id="trim9">
									</div>
									<div>
										<span>
											<i>加装费9：</i> <i>(config9 price)</i>
										</span>
										<input type="text" name="t9price" id="t9price">
									</div>
								</div>
								<div class="detail">
									<div>
										<span>
											<i>加装描述10：</i> <i>(config10 description)</i>
										</span>
										<input type="text" name="trim10" id="trim10">
									</div>
									<div>
										<span>
											<i>加装费10：</i> <i>(config10 price)</i>
										</span>
										<input type="text" name="t10price" id="t10price">
									</div>
								</div>
								<div class="detail">
									<div>
										<span>
											<i>加装描述11：</i> <i>(config11 description)</i>
										</span>
										<input type="text" name="trim11" id="trim11">
									</div>
									<div>
										<span>
											<i>加装费11：</i> <i>(config11 price)</i>
										</span>
										<input type="text" name="t11price" id="t11price">
									</div>
								</div>
								<div class="detail">
									<div>
										<span>
											<i>加装描述12：</i> <i>(config12 description)</i>
										</span>
										<input type="text" name="trim12" id="trim12">
									</div>
									<div>
										<span>
											<i>加装费12：</i> <i>(config12 price)</i>
										</span>
										<input type="text" name="t12price" id="t12price">
									</div>
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i>佣金1：</i> <i>(commission1)</i>
									</span>
									<input type="text" name="cmsn1" id="cmsn1"><label name="currency"></label>
								</div>
								<div>
									<span>
										<i>佣金2：</i> <i>(commission2)</i>
									</span>
									<input type="text" name="cmsn2" id="cmsn2"><label name="currency"></label>
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i>佣金3：</i> <i>(commission3)</i>
									</span>
									<input type="text" name="cmsn3" id="cmsn3"><label name="currency"></label>
								</div>
								<div>
									<span>
										<i>佣金4：</i> <i>(commission4)</i>
									</span>
									<input type="text" name="cmsn4" id="cmsn4"><label name="currency"></label>
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i>其他费用1：</i> <i>(other Fee1)</i>
									</span>
									<input type="text" name="other1" id="other1"><label name="currency"></label>
								</div>
								<div>
									<span>
										<i>其他费用2：</i> <i>(other Fee2)</i>
									</span>
									<input type="text" name="other2" id="other2"><label name="currency"></label>
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i>其他费用3：</i> <i>(other Fee3)</i>
									</span>
									<input type="text" name="other3" id="other3"><label name="currency"></label>
								</div>
								<div>
									<span>
										<i>其他费用4：</i> <i>(other Fee4)</i>
									</span>
									<input type="text" name="other4" id="other4"><label name="currency"></label>
								</div>
							</div>
							<div id="prediv" style="display: none;">
								<div class="detail">
									<div>
										<span>
											<i>预估保险费：</i> <i>(forecast insurance price)</i>
										</span>
										<input type="text" name="preinsuranceprice" id="preinsuranceprice"><label
											name="currency"></label>
									</div>
									<div>
										<span>
											<i>预估短驳费：</i> <i>(forecast drayage price)</i>
										</span>
										<input type="text" name="predrayageprice" id="predrayageprice"><label
											name="currency"></label>
									</div>
								</div>
								<div class="detail">
									<div>
										<span>
											<i>预估执照费：</i> <i>(forecast license price)</i>
										</span>
										<input type="text" name="prelicenseprice" id="prelicenseprice"><label
											name="currency"></label>
									</div>
									<div>
										<span>
											<i>预估燃油费：</i> <i>(forecast oil price)</i>
										</span>
										<input type="text" name="preoilprice" id="preoilprice"><label name="currency"></label>
									</div>
								</div>
							</div>
							<div style="font-weight: bold; margin-top: 5px; margin-bottom: 5px;">合同支付概述(Contract
								Payment Summarize)</div>
							<div class="detail">
								<div style="width: 100%;">
									<span>
										<i><label class="fc_red">*</label>合同总金额：</i> <i>(Contract Total Amount)</i>
									</span>
									<input type="hidden" name="autotprice" id="autotprice"> <input type="text"
										name="totalprice" id="totalprice">
									<a href="javascript:void(0);" id="autocalc" class="btn63_01">自动计算(auto calc)</a>
									注：本合同涉及的所有金额单位均为(all monetary unit of the contract is):<label name="currency"
										id="moneyunit"></label>
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i><label class="fc_red">*</label>是否定金：</i> <i>(Is Down Payment)</i>
									</span>
									<input type="radio" name="paytype" value="1">否(No)<input type="radio"
										name="paytype" value="2" style="margin-left: 33px;">是(Yes)
								</div>
								<div id="selfbuy">
									<span>
										<i><label class="fc_red">*</label>采购方式：</i> <i>(Purchase Type)</i>
									</span>
									<input type="radio" name="selfbuy" value="1">自采(self-purchase)<input type="radio"
										name="selfbuy" value="2" style="margin-left: 33px;">代采(agency-purchase)
								</div>
							</div>
							<div class="detail" id="downfinal">
								<div>
									<span>
										<i>定金：</i> <i>(Down Payment)</i>
									</span>
									<input type="text" name="downpay" id="downpay"><label name="currency"></label>
								</div>
								<div>
									<span>
										<i>尾款：</i> <i>(Final Payment)</i>
									</span>
									<input type="text" name="finalpay" id="finalpay"><label name="currency"></label>
								</div>
							</div>
							<div class="detail">
								<div>
									<span>
										<i>开证价：</i> <i>(Issuing Price)</i>
									</span>
									<input type="text" name="issuingprice" id="issuingprice"><label name="currency"></label>
								</div>
								<div class="set">
									<span>
										<i>备注:</i> <i>(Remark)</i>
									</span>
									<span>
										<textarea id="remark" name="remark"></textarea>
									</span>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="sell-button">
				<a href="javascript:void(0);" id="savenewBtn">提交(submit)</a>
				<a href="javascript:void(0);" id="cancelBtn" style="color: #666;">返回(back)</a>
			</div>
		</div>
	</body>
</div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jnd/contractadd.js?r=<%=new Date()%>");
</script>