<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>销售合同填写车架号</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizcontract.css" />
<input type="hidden" id="backUrl" value="<ufa:url fieldName="bizcontractindex" namespace="car-ms"/>">
<input type="hidden" id="bizcontractfinancepageUrl" value="<ufa:url fieldName="bizcontractfinancepage" namespace="car-ms"/>">
<input type="hidden" id="back1Url" value="<ufa:url fieldName="financialcontracts" namespace="car-ms"/>">
</head>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container">
				<h3 class="title">查看</h3> <input type="hidden" id="currpage" name="currpage" value="${currpage}"> <input type="hidden" id="all" name="all" value="${all}"> <input
				type="hidden" id="type" name="type" value="${type}">
				<h4 style="padding: 10px 0; color: red;" class="list-group-item-danger">合同档案编号： <span>${co.filecode}</span>
			</h4>
				<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">基本信息</h4> <input type="hidden" id="id" name="id" value="${co.id}"> <input
				type="hidden" id="insurance" name="insurance" value="${insurance}">
				<div class="form-inline">
					<div class="form-group newInput" style="width: 33%;"><label>甲方（卖方）：</label>${co.name}</div>
					<div class="form-group newInput" style="width: 33%;"><label>住所（址）：</label>${co.address}</div>
					<div class="form-group newInput" style="width: 33%;"><label>联系人：</label>${co.principle}</div>
					<div class="form-group newInput" style="width: 33%;"><label>联系电话：</label>${co.phone}</div>
			</div>
				<div class="form-inline">
					<div class="form-group newInput" style="width: 33%;"><label>乙方（买方）：</label>${co.bname}</div>
					<div class="form-group newInput" style="width: 33%;"><label>住所（址）：</label>${co.baddress}</div>
					<div class="form-group newInput" style="width: 33%;"><label>公司名称：</label>${co.companyname}</div>
					<div class="form-group newInput" style="width: 33%;"><label>联系电话：</label>${co.bphone}</div>
					<div class="form-group newInput" style="width: 33%;"><label>身份证号：</label>${co.identify}</div>
					<div class="form-group newInput" style="width: 33%;"><label>企业代码：</label>${co.corpcode}</div>
			</div>
				<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">合同信息</h4>
				<div class="form-inline">
					<div class="form-group newInput" style="width: 33%;"><label>品牌：</label>${co.brand}</div>
					<div class="form-group newInput" style="width: 33%;"><label>型号：</label>${co.model}</div>
					<div class="form-group newInput" style="width: 33%;"><label>版本：</label>${co.version}</div>
					<div class="form-group newInput" style="width: 33%;"><label>外观颜色：</label>${co.outcolor}</div>
					<div class="form-group newInput" style="width: 33%;"><label>内饰颜色：</label>${co.incolor}</div>
					<div class="form-group newInput" style="width: 33%;"><label>配置：</label>${co.config}</div>
					<div class="form-group newInput" style="width: 33%;"><label>运费：</label>${co.transprice}</div>
					<div class="form-group newInput" style="width: 33%;"><label>上牌费：</label>${co.plateprice}</div>
					<div class="form-group newInput" style="width: 33%;"><label>商业险：</label>${co.cinsurance}</div>
					<div class="form-group newInput" style="width: 33%;"><label>交强险：</label>${co.insurance}</div>
					<div class="form-group newInput" style="width: 33%;"><label>购置税：</label>${co.purchasetax}</div>
					<div class="form-group newInput" style="width: 33%;"><label>质保费：</label>${co.qualityprice}</div>
					<div class="form-group newInput" style="width: 33%;"><label>延保费：</label>${co.delayprice}</div>
					<div class="form-group newInput" style="width: 33%;"><label>装潢费：</label>${co.decorateprice}</div>
					<div class="form-group newInput" style="width: 33%; margin-left: -45px;"><label>车辆销售价格（结算价）：</label>${co.saleprice}</div>
			</div>
				<div class="form-inline">
					<div class="form-group newInput" style="width: 33%;"><label>车辆销售合同：</label> <a href="${contextPath}${co.salecontract}" download="${salecontractname}"
						style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${salecontractname}</a></div>
					<div class="form-group newInput" style="width: 33%;"><label>报价单：</label> <a href="${contextPath}${co.reportbill}" download="${reportbillname}"
						style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${reportbillname}</a></div>
					<div class="form-group newInput" style="width: 33%;"><label>定金POS单：</label> <a href="${contextPath}${co.downposbill}" download="${downposbillname}"
						style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${downposbillname}</a></div>
			</div>
				<div class="form-inline">
					<div class="form-group newInput"><label>合同补充信息：</label> ${co.note}</div>
			</div>
				<div class="form-inline">
					<div class="form-group newInput du-choose-category" style="width: 33%;"><label>金融购车：</label>${co.finance eq '1'?'是':'否'}</div>
					<div class="form-group newInput" style="width: 33%;"><label>是否零采：</label>${co.zeropur eq '1'?'是':'否'}</div>
					<div class="form-group newInput" style="width: 33%;"><label>门店部审核结果：</label>通过</div>
			</div> <c:if test="${co.finance==1 }">
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>风控进件初审：</label>通过</div>
						<div class="form-group newInput" style="width: 33%;"><label>风控进件复审：</label>通过</div>
						<div class="form-group newInput" style="width: 33%;"><label>审批金额：</label>${risk.aproveprice}</div>
						<div class="form-group newInput" style="width: 33%;"><label>风控缺额：</label>${risk.missmoney}</div>
					</div>
				</c:if> <c:if test="${co.finance==2 }">
					<!--全款  -->
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>定金到账审核：</label>定金已到账</div>
						<div class="form-group newInput" style="width: 33%;"><label>定金金额：</label>${co.downpay}</div>
						<div class="form-group newInput" style="width: 33%; color: red;"><label>实到定金金额：</label>${co.realdownpay}</div>
					</div>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label style="color: red;">选车结果：</label><label style="color: red;">已选车</label></div>
						<div class="form-group newInput" style="width: 33%;"><label style="color: red;">车架号：</label><label style="color: red;">${co.vin}</label></div> <c:if
							test="${co.changevin!=null}">
							<div class="form-group newInput" style="width: 33%;"><label style="color: red;">验车换车前的车架号：</label><label style="color: red;">${co.changevin}</label></div>
						</c:if>
					</div>
				</c:if> <c:if test="${co.status>2&&co.finance==1&&co.status!=22 }">
					<!-- 金融 -->
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>定金到账审核：</label>定金已到账</div>
						<div class="form-group newInput" style="width: 33%;"><label>定金金额：</label>${co.downpay}</div>
						<div class="form-group newInput" style="width: 33%; color: red;"><label>实到定金金额：</label>${co.realdownpay}</div>
					</div>
					<c:if test="${co.vin!=null }">
						<div class="form-inline">
							<div class="form-group newInput" style="width: 33%;"><label style="color: red;">选车结果：</label><label style="color: red;">已选车</label></div>
							<div class="form-group newInput" style="width: 33%;"><label style="color: red;">车架号：</label><label style="color: red;">${co.vin}</label></div> <c:if
								test="${co.changevin!=null}">
								<div class="form-group newInput" style="width: 33%;"><label style="color: red;">验车换车前的车架号：</label><label style="color: red;">${co.changevin}</label></div>
							</c:if>
						</div>
					</c:if>
				</c:if> <%-- <c:if test="${co.status==62}">
					<!--金融选车结果  -->
					<div class="form-group newInput" style="width: 33%;">
						<label style="color: red;">选车结果：</label><label style="color: red;">已选车</label>
					</div>
					<div class="form-group newInput" style="width: 33%;">
						<label style="color: red;">车架号：</label><label style="color: red;">${co.vin}</label>
					</div>
					<c:if test="${co.changevin!=null}">
						<div class="form-group newInput" style="width: 33%;">
							<label style="color: red;">验车换车前的车架号：</label><label style="color: red;">${co.changevin}</label>
						</div>
					</c:if>
				</c:if>  --%> <c:if test="${co.finance==1&&co.status>5&&co.status<9 }">
					<!-- 金融合同添加后-->
					<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">金融合同信息</h4>
					<div class="form-inline"><c:if test="${co.status>5}">
							<div class="form-group newInput" style="width: 33%;"><label>金融合同添加：</label>已经添加</div>
						</c:if> <c:if test="${co.status>6}">
							<div class="form-group newInput" style="width: 33%; margin-left: 50px;"><label>金融合同审核：</label>通过</div>
						</c:if></div>
				</c:if> <c:if test="${co.status==8 }">
					<!-- 保险报价后 -->
					<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">保险报价信息</h4>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>商业险总价：</label>${co.cinsurance1}</div>
						<div class="form-group newInput" style="width: 33%;"><label>交强险：</label>${co.insurance1}</div>
						<div class="form-group newInput" style="width: 33%;"><label>交强险类型：</label>${co.insurance1type eq '1'?'店保':co.qualitypriceyear eq '2'?'非店保':''}</div>
						<div class="form-group newInput" style="width: 33%;"><label>交强险交保时间：</label>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${co.insurance1time}" /></div>
						<div class="form-group newInput" style="width: 33%;"><label>车船税：</label>${co.vehicleandvesseltax}</div>
						<div class="form-group newInput" style="width: 33%;"><label>车损险：</label>${co.cardamageinsurance}</div>
						<div class="form-group newInput" style="width: 33%;"><label>盗抢险：</label>${co.theftrobberyinsurance}</div>
						<div class="form-group newInput" style="width: 33%;"><label>第三方责任险：</label>${co.thirdinsurance}</div>
						<div class="form-group newInput" style="width: 33%;"><label>划横险：</label>${co.scratchinsurance}</div>
						<div class="form-group newInput" style="width: 33%;"><label>玻璃险：</label>${co.glassinsurance}</div>
						<div class="form-group newInput" style="width: 33%;"><label>自燃险：</label>${co.catacausisinsurance}</div>
						<div class="form-group newInput" style="width: 33%;"><label>车上人员责任险：</label>${co.carpersonnelinsurance}</div>
						<div class="form-group newInput" style="width: 33%;"><label>涉水险：</label>${co.wadinginsurance}</div>
						<div class="form-group newInput" style="width: 33%;"><label>不计免赔：</label>${co.accidentExcessReduction}</div>
						<div class="form-group newInput" style="width: 33%;"><label>质保总价：</label>${co.qualityprice1}</div>
						<div class="form-group newInput" style="width: 33%;"><label>质保类型：</label>${co.qualitypricenature eq '1'?'整年':co.qualitypricenature eq '2'?'三大件':''}</div>
						<div class="form-group newInput" style="width: 33%;"><label>质保年限：</label>${co.qualitypriceyear eq '1'?'一年':co.qualitypriceyear eq '2'?'二年':co.qualitypriceyear eq '3'?'三年':''}
					</div>
					</div>
				</c:if> <c:if test="${co.status2!=2&&co.status2!=null }">
					<!--验车通过时  -->
					<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">验车信息</h4>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>车架号：</label>${co.vin}</div>
						<div class="form-group newInput" style="width: 33%;"><label style="color: red;">验车结果：</label><label style="color: red;">通过</label></div>
					</div>
				</c:if> <c:if test="${co.status2==2}">
					<!--验车不通过时  -->
					<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">验车信息</h4>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>车架号：</label>${co.vin}</div>
						<div class="form-group newInput" style="width: 33%;"><label style="color: red;">验车结果：</label><label style="color: red;">不通过</label></div>
					</div>
				</c:if> <c:if test="${co.status2>2&&co.finance==2}">
					<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">全款尾款与结算</h4>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%; margin-left: -10px;"><label style="color: red;">车价尾款：</label><label style="color: red;">${co.finalpay}</label></div>
						<div class="form-group newInput" style="width: 33%; margin-left: 10px;"><label style="color: red;">实到尾款：</label><label style="color: red;">${co.realfinalpay}</label></div> <c:if
							test="${co.status2==5 }">
							<div class="form-group newInput" style="width: 33%;"><label style="color: red;">结算金额：</label><label style="color: red;">${co.balance}</label></div>
						</c:if>
					</div>
				</c:if> <c:if test="${co.status2>2&&co.finance==1}">
					<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">金融首付与结算信息</h4>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%; margin-left: -10px;"><label style="color: red;">金融购车应交首付：</label><label style="color: red;">${co.financerealdownpay}</label>
					</div>
						<div class="form-group newInput" style="width: 33%; margin-left: 10px;"><label style="color: red;">金融首付款补额：</label><label style="color: red;">${co.repairmoney}</label>
					</div> <c:if test="${co.status2==5 }">
							<div class="form-group newInput" style="width: 33%;"><label style="color: red;">结算金额：</label><label style="color: red;">${co.balance}</label></div>
						</c:if>
					</div>
				</c:if> <c:if test="${co.status2>3 }">
					<!-- 材料出库后 -->
					<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">材料出库信息</h4>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%; margin-left: -50px;"><label>车主手册宝（保养手册）：</label>${co.handbook eq '1'?'是':'否'}</div>
						<div class="form-group newInput" style="width: 33%; margin-left: 50px;"><label>车钥匙：</label>${co.carkey eq '1'?'是':'否'}</div>
						<div class="form-group newInput" style="width: 33%;"><label>车辆三证：</label>${co.threecer eq '1'?'是':'否'}</div>
						<div class="form-group newInput" style="width: 33%;"><label>四联发票：</label>${co.billthree eq '1'?'是':'否'}</div>
						<div class="form-group newInput" style="width: 33%; margin-left: -48px;"><label>车辆保单（如购买保单）：</label>${co.insurancebill eq '1'?'是':'否'}</div>
						<div class="form-group newInput" style="width: 33%;"><label>延保保单（如购买延保）：</label>${co.delaybill eq '1'?'是':'否'}</div>
						<div class="form-group newInput" style="width: 33%; margin-left: -48px;"><label>质保保单（如购买质保）：</label>${co.qualitybill eq '1'?'是':'否'}</div>
						<div class="form-group newInput" style="width: 33%; margin-left: 48px;"><label>车辆产证：</label>${co.productcer eq '1'?'是':'否'}</div>
						<div class="form-group newInput" style="width: 33%;"><label>牌照：</label>${co.carplate eq '1'?'是':'否'}</div>
						<div class="form-group newInput" style="width: 33%;"><label>牌照发票：</label>${co.platebill eq '1'?'是':'否'}</div>
					</div>
				</c:if>
				<div class="du-btn"><a href="javascript:;" class="btn btn-warning" role="button" style="padding: 6px 30px" id="backBtn"> 返回 </a></div>
		</div>
	</div>
</div>
</body>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script>
	seajs.use("${scriptBasePath}/biz/contractshoppass.js");
</script>