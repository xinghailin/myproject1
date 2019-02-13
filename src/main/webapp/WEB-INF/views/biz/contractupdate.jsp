<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>修改销售合同</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizcontract.css" />
<link rel="stylesheet" href="${cssBasePath}/common/index.css" />
<%-- 	<input type="hidden" id="worktype" name="worktype" value="${worktype}">
	<input type="hidden" id="realworktype"  value="${realworktype}"> --%>
<input type="hidden" id="backUrl" value="<ufa:url fieldName="bizcontractindex" namespace="car-ms"/>">
<input type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input type="hidden" id="modelUrl" value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="versionUrl" value="<ufa:url fieldName="QUERY_VERSION" namespace="car-ms"/>">
</head>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container">
				<h3 class="title">修改车辆销售合同</h3>
				<h4 style="padding: 10px 0;" class="list-group-item-danger">合同档案编号：<span>${co.filecode}</span></h4>
				<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">基本信息</h4>
				<form name="editForm" id="editForm" method="POST" enctype="multipart/form-data" class="upload" action="<ufa:url namespace="car-ms" fieldName="bizcontractsave"/>"><input
					type="hidden" id="id" name="id" value="${co.id }"> <%--   <input type="hidden" id="infoid" name="infoid" value="${clientInfoDto.id }">
        <input type="hidden" id="filecode" name="filecode" value="${clientInfoDto.filenum }"> --%>
        <input type="hidden" id="currpage" name="currpage" value="${currpage}">
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>甲方（卖方）：</label> <input type="text" class="form-control" name="name" value="${co.name}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>住所（址）：</label> <input type="text" class="form-control" name="address" value="${co.address}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>联系人：</label> <input type="text" class="form-control" name="principle" value="${co.principle}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>联系电话：</label> <input type="text" class="form-control" name="phone" value="${co.bphone}"></div>
				</div>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>乙方（买方）：</label> <input type="text" class="form-control" name="bname" value="${co.bname}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>住所（址）：</label> <input type="text" class="form-control" name="baddress" value="${co.baddress}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>公司名称：</label> <input type="text" class="form-control" name="companyname" value="${co.companyname}">
					</div>
						<div class="form-group newInput" style="width: 33%;"><label>联系电话：</label> <input type="text" class="form-control" name="bphone" value="${co.phone}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>身份证号：</label> <input type="text" class="form-control" name="identify" value="${co.identify}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>企业代码：</label> <input type="text" class="form-control" name="corpcode" value="${co.corpcode}"></div>
				</div>
					<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">合同信息</h4>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>品牌首字母：</label> <%-- <input type="text" class="form-control" name="initials" value=""> --%> <select
							id="initials" name="initials" style="line-height: 35px; width: 150px;">
								<option value=''>--请选择--</option>
								<c:forEach var="item" items="${initials}">
									<option value="<c:out value="${item.brandinitial}">
			             </c:out>" <c:if test="${item.brandinitial eq bc.initials}">selected="selected"</c:if>><c:out
											value="${item.brandinitial}"></c:out></option>
								</c:forEach>
						</select></div>
						<div class="form-group newInput" style="width: 33%;"><label>品牌：</label> <%-- <input type="text" class="form-control" name="brand" value="${co.brand}" readonly="readonly"> --%>
							<select id="brand" name="brand" style="line-height: 35px; width: 150px;">
								<option value=''>--请选择--</option>
								<c:forEach var="item" items="${brands}">
									<option value="<c:out value="${item.brand}"></c:out>" <c:if test="${item.brand eq co.brand}">selected="selected"</c:if>><c:out value="${item.brand}"></c:out></option>
								</c:forEach>
						</select></div>
						<div class="form-group newInput" style="width: 33%;"><label>型号：</label> <%-- <input type="text" class="form-control" name="model" value="${co.model}" readonly="readonly" > --%>
							<select id="model" name="model" style="line-height: 35px; width: 150px;">
								<option value=''>--请选择--</option>
								<c:forEach var="item" items="${models}">
									<option value="<c:out value="${item.model}"></c:out>" <c:if test="${item.model eq co.model}">selected="selected"</c:if>><c:out value="${item.model}"></c:out></option>
								</c:forEach>
						</select></div>
						<div class="form-group newInput" style="width: 33%;"><label>版本：</label> <%-- <input type="text" class="form-control" name="version" value="${co.version}" readonly="readonly"> --%>
							<select id="version" name="version" style="line-height: 35px; width: 150px;">
								<option value=''>--请选择--</option>
								<c:forEach var="item" items="${versions}">
									<option value="<c:out value="${item.version}"></c:out>" <c:if test="${item.version eq co.version}">selected="selected"</c:if>><c:out value="${item.version}"></c:out></option>
								</c:forEach>
						</select></div>
						<div class="form-group newInput" style="width: 33%;"><label>外观颜色：</label> <input type="text" class="form-control" name="outcolor" value="${co.outcolor}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>内饰颜色：</label> <input type="text" class="form-control" name="incolor" value="${co.incolor}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>配置：</label> <input type="text" class="form-control" name="config" value="${co.config}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>运费：</label> <input type="text" class="form-control" placeholder="单位：元" name="transprice"
							value="${co.transprice}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>上牌费：</label> <input type="text" class="form-control" placeholder="单位：元" name="plateprice"
							value="${co.plateprice}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>商业险：</label> <input type="text" class="form-control" placeholder="单位：元" name="cinsurance"
							value="${co.cinsurance}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>交强险：</label> <input type="text" class="form-control" placeholder="单位：元" name="insurance"
							value="${co.insurance}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>购置税：</label> <input type="text" class="form-control" placeholder="单位：元" name="purchasetax"
							value="${co.purchasetax}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>质保费：</label> <input type="text" class="form-control" placeholder="单位：元" name="qualityprice"
							value="${co.qualityprice}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>延保费：</label> <input type="text" class="form-control" placeholder="单位：元" name="delayprice"
							value="${co.delayprice}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>装潢费：</label> <input type="text" class="form-control" placeholder="单位：元" name="decorateprice"
							value="${co.decorateprice}"></div>
				</div>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>车辆销售价格（结算价）：</label> <input type="text" class="form-control" placeholder="单位：元" name="saleprice"
							value="${co.saleprice}"></div>
						<div class="form-group newInput" style="width: 33%;"><label>定金金额：</label> <input type="text" class="form-control" placeholder="单位：元" name="downpay"
							value="${co.downpay}"></div>
				</div>
					<div class="form-inline">
						<div class="form-group newInput du-choose-category"><label>金融购车：</label> <label class="radio-inline" style="margin-right: 20px"> <input type="radio"
								name="finance" id="inlineRadio1" value="1" <c:if test="${co.finance eq '1'}"> checked="checked"</c:if>>是
						</label> <label class="radio-inline"> <input type="radio" name="finance" id="inlineRadio2" value="2" <c:if test="${co.finance eq '2'}"> checked="checked"</c:if>>否
						</label></div>
				</div>
					<div class="form-inline"><label>上传车辆销售合同：</label>
						<div class="form-group"><a style="display: inline-block" href="${contextPath}${co.salecontract}" download="${salecontractname}"
							style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${salecontractname}</a> <input id="file-01" class="file-loading" type="file"
							name="fsalecontract" value="${salecontractname}"></div></div>
					<div class="form-inline"><label>上传报价单：</label>
						<div class="form-group"><a style="display: inline-block" href="${contextPath}${co.reportbill}" download="${reportbillname}"
							style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${reportbillname}</a> <input id="file-02" class="file-loading" type="file"
							name="freportbill"></div></div>
					<div class="form-inline"><label>上传定金POS单：</label>
						<div class="form-group"><a style="display: inline-block" href="${contextPath}${co.downposbill}" download="${downposbillname}"
							style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${downposbillname}</a> <input id="file-03" class="file-loading" type="file"
							name="fdownposbill"></div></div>
					<div class="form-inline" style="margin-top: 20px">
						<div class="form-group newInput"><label>合同补充信息：</label> <textarea class="form-control" rows="5" style="resize: none; min-width: 500px" id="du-reason" name="note"></textarea>
					</div>
				</div>
					<div class="form-inline" style="margin-top: 20px">
						<div class="form-group newInput"><label>驳回原因：</label> <textarea class="form-control" rows="5" style="resize: none; min-width: 500px">${co.shopnopassreason}</textarea></div>
				</div></form>
				<div class="du-btn"><a href="javascript:;" class="btn btn-danger" role="button" id="saveBtn">合同提交审核</a> <a href="javascript:;" class="btn btn-warning" role="button"
					style="padding: 6px 30px" id="backBtn"> 取消 </a></div>
		</div>
	</div>
</div>
</body>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script>
seajs.use("${scriptBasePath}/biz/contractupdate.js?r=<%=new Date()%>");
</script>
</html>