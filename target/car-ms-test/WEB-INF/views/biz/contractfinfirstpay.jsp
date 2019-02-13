<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>销售合同客户支付定金（首付）</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizcontract.css" />
<input type="hidden" id="currpage" name="currpage" value="${currpage}">
<input type="hidden" id="node" value="${node}">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="bizcontractindex" namespace="car-ms"/>">
</head>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container">
				<h3 class="title">销售合同客户支付定金（首付）</h3>
				<h4 style="padding: 10px 0;" class="list-group-item-danger">合同档案编号：<span>${co.filecode}</span></h4>
				<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">基本信息</h4>
				<form name="editForm" id="editForm" method="POST" enctype="multipart/form-data" class="upload" action="<ufa:url namespace="car-ms" fieldName="bizcontractfinfirstpay"/>"><input type="hidden" id="id" name="id" value="${co.id}"> <input type="hidden" id="riskid" name="riskid"
					value="${risk.id}"> <input type="hidden" id="ret" name="ret" value=""> <input type="hidden" id="downpay" name="downpay" value="${firstpay}"> <input type="hidden" id="currpage" name="currpage" value="${currpage}">
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
						<div class="form-group newInput" style="width: 33%;"><label>金融购车：</label>${co.finance eq '1'?'是':'否'}</div>
				</div>
					<div class="form-inline"><div class="form-group newInput" style="width: 33%;"><label>车辆销售合同：</label> <a href="${contextPath}${co.salecontract}" download="${salecontractname}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${salecontractname}</a>
					</div>
						<div class="form-group newInput" style="width: 33%;"><label>报价单：</label> <a href="${contextPath}${co.reportbill}" download="${reportbillname}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${reportbillname}</a></div>
						<div class="form-group newInput" style="width: 33%;"><label>定金POS单：</label> <a href="${contextPath}${co.downposbill}" download="${downposbillname}" style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${downposbillname}</a></div></div>
					<div class="form-inline">
						<div class="form-group newInput"><label>合同补充信息：</label> ${co.note}</div>
				</div>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>是否零采：</label>${co.zeropur eq '1'?'是':co.zeropur eq '2'?'否':''}</div>
						<div class="form-group newInput" style="width: 33%;"><label>门店部审核：</label>通过</div>
				</div>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>风控进件初审：</label>通过</div>
						<div class="form-group newInput" style="width: 33%;"><label>状态：</label>风控进件复审通过</div>
				</div>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>审批金额：</label>${risk.aproveprice}</div>
						<div class="form-group newInput" style="width: 33%;"><label>缺少金额：</label>${risk.missmoney}</div>
						<div class="form-group newInput" style="width: 33%;"><label>消费贷贷审会审批表：</label> <c:if test="${not empty risk.approvaltableurl}">
								<a href="${contextPath}${risk.approvaltableurl}" download="${texturlname}" style="text-decoration: underline; margin-right: 10px; color: #4d90fe;" title="点击下载">${texturlname}</a>
							</c:if></div>
				</div>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>动态监管费：</label>${dyp}</div>
						<div class="form-group newInput" style="width: 33%;"><label>履约险：</label>${promise}</div>
						<div class="form-group newInput" style="width: 33%;"><label>交强险：</label>${co.insurance}</div>
				</div>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>商业险：</label>${co.cinsurance}</div>
						<div class="form-group newInput" style="width: 33%;"><label>质保费：</label>${co.qualityprice}</div>
						<div class="form-group newInput" style="width: 33%; color: red;"><label>定金（首付）：</label>${firstpay} 元</div>
				</div>
					<div class="form-inline"><label>上传定金POS单：</label>
						<div class="form-group"><input id="file-01" class="file-loading" type="file" name="fdownposbill"></div></div>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>不同意原因：</label><textarea class="form-control" rows="4" style="resize: none; min-width: 300px" id="du-reason1" name="dontagreereason"></textarea></div>
				</div></form>
				<div class="du-btn"><a href="javascript:;" class="btn btn-danger" role="button" style="padding: 6px 30px" id="saveBtn">客户同意支付定金（首付）</a> <a href="javascript:;" class="btn btn-warning" role="button" style="padding: 6px 30px" id="savenotBtn">客户不同意支付定金（首付）</a> <a href="javascript:;"
					class="btn btn-warning" role="button" style="padding: 6px 30px" id="backBtn">返回</a></div>
		</div>
	</div>
</div>
</body>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script>
seajs.use("${scriptBasePath}/biz/contractfinfirstpay.js?r=<%=new Date()%>");
</script>
</html>