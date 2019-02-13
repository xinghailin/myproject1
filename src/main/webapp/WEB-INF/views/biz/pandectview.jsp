<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>销售合同查看</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizrisk.css" />
<input type="hidden" id="backUrl" value="<ufa:url fieldName="bizcontractpandect" namespace="car-ms"/>">
</head>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container kv-main">
				<h3 class="title">销售合同查看</h3>
				<h4 style="padding: 10px 0;" class="list-group-item-danger">销售合同编号：<span>${co.filecode }</span></h4>
				<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">基本信息</h4>
				<form name="editForm" id="editForm" method="POST" enctype="multipart/form-data" class="upload" action="<ufa:url namespace="car-ms" fieldName="bizcontractdownpay"/>"><input type="hidden" id="id" name="id" value="${co.id}">
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
						<%-- <div class="form-group newInput" style="width:33%;">
                <label>品牌首字母：</label>${in.initials}
            </div> --%>
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
				</div>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>车辆销售价格（结算价）：</label>${co.saleprice}</div>
						<div class="form-group newInput" style="width: 33%;"><label>定金金额：</label>${co.downpay}</div>
				</div>
					<div class="form-inline">
						<div class="form-group newInput du-choose-category"><label>金融购车：</label>${co.finance eq '1'?'是':'否'}</div>
				</div>
					<div class="form-inline"><div class="form-group newInput" style="width: 33%;"><label>车辆销售合同：</label> <a href="${contextPath}${co.salecontract}" download="${salecontractname}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${salecontractname}</a>
					</div>
						<div class="form-group newInput" style="width: 33%;"><label>报价单：</label> <a href="${contextPath}${co.reportbill}" download="${reportbillname}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${reportbillname}</a></div>
						<div class="form-group newInput" style="width: 33%;"><label>定金POS单：</label> <a href="${contextPath}${co.downposbill}" download="${downposbillname}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${downposbillname}</a></div></div>
					<div class="form-inline">
						<div class="form-group newInput"><label>合同补充信息：</label> ${co.note}</div>
				</div>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>是否零采：</label>
						<c:if test="${co.zeropur eq '1'}">是</c:if>
							<c:if test="${co.zeropur eq '2'}">否</c:if></div>
						<div class="form-group newInput" style="width: 33%;"><label>门店部审核：</label>通过</div>
				</div> 
					<div class="form-inline"><c:if test="${co.status eq '54' or co.status eq '55' or co.status eq '56'}">
							<div class="form-group newInput" style="width: 33%;"><label>风控进件初审：</label>通过</div>
						</c:if>
						<%-- <div class="form-group newInput" style="width: 33%;"><label>状态：</label>${co.status eq '4'?"风控进件待审核":co.status eq '51'?"风控进件初审通过":co.status eq '52'?"风控进件初审补件":co.status eq '53'?"风控进件初审拒单":co.status eq '54'?"风控进件复审通过":co.status eq '55'?"风控进件复审补件":co.status eq '56'?"风控进件复审拒单":""}</div> --%>
						<div class="form-group newInput" style="width: 33%;"><label>状态：</label>${co.status eq '3'?"定金已到账":co.status eq '6'?"金融合同已经添加":co.status eq '7'?"金融合同审核通过":co.status eq '8'?"车辆保险已经添加 ":co.status eq '51'?"风控初审通过":co.status eq '52'?"初审补件":co.status eq '53'?"初审不通过":co.status eq '54'?"复审通过":co.status eq '55'?"复审补件":co.status eq '56'?"复审不通过":co.status eq '61'?"门店确认审批":co.status eq '62'?"选车完毕":co.status eq '63'?"门店确认不通过":""}</div>
						<div class="form-group newInput" style="width: 33%;"><label>${status}  审批金额：</label>${risk.aproveprice}</div></div>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>缺少金额：</label>${risk.missmoney}</div>
						<div class="form-group newInput" style="width: 33%;"><label>消费贷贷审会审批表：</label> <c:if test="${not empty risk.approvaltableurl}">
								<a href="${contextPath}${risk.approvaltableurl}" download="${texturlname}" style="text-decoration: underline; margin-right: 10px; color: #4d90fe;" title="点击下载">${texturlname}</a>
							</c:if></div>
				</div> <c:if test="${not empty risk.repairreason}">
						<div class="form-inline">
							<div class="form-group newInput"><label>补件原因：</label>${risk.repairreason}</div>
						</div>
					</c:if> <c:if test="${not empty risk.refusereason}">
						<div class="form-inline">
							<div class="form-group newInput"><label>拒单原因：</label>${risk.refusereason}</div>
						</div>
					</c:if>
					<h4 class="du-title" style="margin-top: 30px">1.申请表（1张 正面 必选）</h4>
					<div class="form-inline"><img src="${contextPath}${risk.applybill}" alt="点击放大" class="img-thumbnail"></div>
					<h4 class="du-title">2.身份证（2张 正反面 必选）</h4>
					<div class="form-inline"><c:forEach var="item" items="${filelst2}">
							<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
						</c:forEach></div>
					<h4 class="du-title">3.驾驶证（1张 必选）</h4>
					<div class="form-inline"><img src="${contextPath}${risk.driverprove}" alt="点击放大" class="img-thumbnail"></div>
					<h4 class="du-title">4.工作证明（1张 必选）</h4>
					<div class="form-inline"><img src="${contextPath}${risk.workprove}" alt="点击放大" class="img-thumbnail"></div>
					<h4 class="du-title">5.征信报告（多张 必选）</h4>
					<div class="form-inline"><c:forEach var="item" items="${filelst5}">
							<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
						</c:forEach></div>
					<h4 class="du-title">6.工资卡或经营走账卡（多张 正面 必选）</h4>
					<div class="form-inline"><c:forEach var="item" items="${filelst6}">
							<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
						</c:forEach></div>
					<h4 class="du-title">7.流水（多张 必选）</h4>
					<div class="form-inline"><c:forEach var="item" items="${filelst7}">
							<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
						</c:forEach></div>
					<h4 class="du-title">8.房产证（多张 必选）</h4>
					<div class="form-inline"><c:forEach var="item" items="${filelst8}">
							<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
						</c:forEach></div>
					<h4 class="du-title">9.结婚证（1张 非必选）</h4>
					<div class="form-inline"><c:if test="${not empty risk.marryprove}">
							<img src="${contextPath}${risk.marryprove}" alt="点击放大" class="img-thumbnail">
						</c:if></div>
					<h4 class="du-title">10.担保人身份证（多张 正反面 非必选）</h4>
					<div class="form-inline"><c:forEach var="item" items="${filelst10}">
							<img src="${contextPath}${item.address}" alt="..." class="img-thumbnail">
						</c:forEach></div>
					<div class="du-btn"><a href="javascript:;" class="btn btn-warning" role="button" id="backBtn" style="padding: 6px 38px">返回</a></div>
		</div>
	</div>
</div>
</body>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script>
	seajs.use("${scriptBasePath}/biz/pandectview.js");
</script>
</html>