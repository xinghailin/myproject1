<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>车源</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizcontract.css" />
<link rel="stylesheet" href="${contextPath}/resources/style/jquery.css" />
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<input type="hidden" id="carAccessorypageUrl"
	value="<ufa:url fieldName="carAccessorypage" namespace="car-ms"/>">
</head>
<style>
.letter {
	width: 200px;
}

.brand {
	width: 200px;
}

.model {
	width: 200px;
}

.version {
	width: 200px;
}
</style>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container">
				<input id="currpage" hidden value="${currpage }"><input hidden id="type"
					value="${type }">
				<h3 class="title">随车附件详情</h3>
				<form name="searchForm" id="searchForm"
					action="<ufa:url fieldName="newaddCarAccessorySave" namespace="car-ms"/>"
					enctype="multipart/form-data" method="post">
					<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">车源信息</h4>
					<div class="form-inline">
						<div id="car">

							<div class="form-group newInput select-box" style="width: 33%;">
								<label>品牌：</label>${carAccessory.brand }
							</div>
							<div class="form-group newInput select-box" style="width: 33%;">
								<label>型号：</label>${carAccessory.model }
							</div>
							<div class="form-group newInput select-box" style="width: 33%;">
								<label>版本：</label>${carAccessory.version }
							</div>
							<div class="form-group newInput select-box" style="width: 33%;">
								<label>车架号：</label> ${carAccessory.vin }
							</div>
						</div>
						<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">
							车源信息<label style="color:red;">(黑色是未提交,绿色是未接收,蓝色已接收,紫色领取审核中,红色已经领取)</label>
						</h4> 
						<div class="form-inline">
							<div id="car">
								<input name="id" id="id" hidden value="${car.id }">
								<!-- 车架号id -->
								<input name="carid" hidden value="${id }">
								<!--车架号详情id  -->
								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">

									<c:if test="${carAccessory.certificateofquality==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">合格证</label>
									</c:if>

									<c:if test="${carAccessory.certificateofquality==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">合格证</label>
									</c:if>

									<c:if test="${carAccessory.certificateofquality==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">合格证</label>
									</c:if>
										<c:if test="${carAccessory.certificateofquality==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">合格证</label>
									</c:if>
									<c:if test="${carAccessory.certificateofquality==null}">
										<input type="checkbox" disabled="disabled" />
										<label>合格证</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${carAccessory.customspermit==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">关单</label>
									</c:if>
									<c:if test="${carAccessory.customspermit==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">关单</label>
									</c:if>
									<c:if test="${carAccessory.customspermit==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">关单</label>
									</c:if>
									<c:if test="${carAccessory.customspermit==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">关单</label>
									</c:if>
									<c:if test="${carAccessory.customspermit==null}">
										<input type="checkbox" disabled="disabled" />
										<label>关单</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${carAccessory.commodityinspectionform==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">商检单</label>
									</c:if>
									<c:if test="${carAccessory.commodityinspectionform==2}">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">商检单</label>
									</c:if>
									<c:if test="${carAccessory.commodityinspectionform==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">商检单</label>
									</c:if>
									<c:if test="${carAccessory.commodityinspectionform==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">商检单</label>
									</c:if>
									<c:if test="${carAccessory.commodityinspectionform==null}">
										<input type="checkbox" disabled="disabled" />
										<label>商检单</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${carAccessory.environmentalcertificate==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">环保证书</label>
									</c:if>
									<c:if test="${carAccessory.environmentalcertificate==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">环保证书</label>
									</c:if>
									<c:if test="${carAccessory.environmentalcertificate==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">环保证书</label>
									</c:if>
									<c:if test="${carAccessory.environmentalcertificate==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">环保证书</label>
									</c:if>
									<c:if test="${carAccessory.environmentalcertificate==null}">
										<input type="checkbox" disabled="disabled" />
										<label>环保证书</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${carAccessory.certificateofconformity==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">一致性证书</label>
									</c:if>
									<c:if test="${carAccessory.certificateofconformity==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">一致性证书</label>
									</c:if>
									<c:if test="${carAccessory.certificateofconformity==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">一致性证书</label>
									</c:if>
									<c:if test="${carAccessory.certificateofconformity==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">一致性证书</label>
									</c:if>
									<c:if test="${carAccessory.certificateofconformity==null}">
										<input type="checkbox" disabled="disabled" />
										<label>一致性证书</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${carAccessory.remotekey==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">遥控钥匙</label>
									</c:if>
									<c:if test="${carAccessory.remotekey==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">遥控钥匙</label>
									</c:if>
									<c:if test="${carAccessory.remotekey==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">遥控钥匙</label>
									</c:if>
									<c:if test="${carAccessory.remotekey==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">遥控钥匙</label>
									</c:if>
									<c:if test="${carAccessory.remotekey==null}">
										<input type="checkbox" disabled="disabled" />
										<label>遥控钥匙</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${carAccessory.manualkey==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">手动钥匙</label>
									</c:if>
									<c:if test="${carAccessory.manualkey==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">手动钥匙</label>
									</c:if>
									<c:if test="${carAccessory.manualkey==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">手动钥匙</label>
									</c:if>
									<c:if test="${carAccessory.manualkey==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">手动钥匙</label>
									</c:if>
									<c:if test="${carAccessory.manualkey== null}">
										<input type="checkbox" disabled="disabled" />
										<label>手动钥匙</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${carAccessory.chipcard==1 }">
										<input disabled="disabled" checked type="checkbox" />
										<label style="color: green;">芯片卡</label>
									</c:if>
									<c:if test="${carAccessory.chipcard==2 }">
										<input disabled="disabled" checked type="checkbox" />
										<label style="color: blue;">芯片卡</label>
									</c:if>
									<c:if test="${carAccessory.chipcard==3 }">
										<input disabled="disabled" checked type="checkbox" />
										<label style="color: purple;">芯片卡</label>
									</c:if>
									<c:if test="${carAccessory.chipcard==4 }">
										<input disabled="disabled" checked type="checkbox" />
										<label style="color: red;">芯片卡</label>
									</c:if>
									<c:if test="${carAccessory.chipcard==null}">
										<input type="checkbox" disabled="disabled" />
										<label>芯片卡</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${carAccessory.maintenancemanual==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">保养手册</label>
									</c:if>
									<c:if test="${carAccessory.maintenancemanual==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">保养手册</label>
									</c:if>
									<c:if test="${carAccessory.maintenancemanual==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">保养手册</label>
									</c:if>
									<c:if test="${carAccessory.maintenancemanual==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">保养手册</label>
									</c:if>
									<c:if test="${carAccessory.maintenancemanual==null}">
										<input type="checkbox" disabled="disabled" />
										<label>保养手册</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${carAccessory.operationinstruction==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">使用说明书</label>
									</c:if>
									
									<c:if test="${carAccessory.operationinstruction==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">使用说明书</label>
									</c:if>
									<c:if test="${carAccessory.operationinstruction==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">使用说明书</label>
									</c:if>
									<c:if test="${carAccessory.operationinstruction==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">使用说明书</label>
									</c:if>
									<c:if test="${carAccessory.operationinstruction==null}">
										<input type="checkbox" disabled="disabled" />
										<label>使用说明书</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${carAccessory.shopticket==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">店票</label>
									</c:if>
									<c:if test="${carAccessory.shopticket==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">店票</label>
									</c:if>
									<c:if test="${carAccessory.shopticket==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">店票</label>
									</c:if>
									<c:if test="${carAccessory.shopticket==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">店票</label>
									</c:if>
									<c:if test="${carAccessory.shopticket==null}">
										<input type="checkbox" disabled="disabled" />
										<label>店票</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${carAccessory.valueaddedtaxspecialinvoice==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">增票</label>
									</c:if>
									<c:if test="${carAccessory.valueaddedtaxspecialinvoice==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">增票</label>
									</c:if>
									<c:if test="${carAccessory.valueaddedtaxspecialinvoice==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">增票</label>
									</c:if>
									<c:if test="${carAccessory.valueaddedtaxspecialinvoice==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">增票</label>
									</c:if>
									<c:if test="${carAccessory.valueaddedtaxspecialinvoice==null}">
										<input type="checkbox" disabled="disabled" />
										<label>增票</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${carAccessory.carphotos==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">车照片</label>
									</c:if>
									<c:if test="${carAccessory.carphotos==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">车照片</label>
									</c:if>
									<c:if test="${carAccessory.carphotos==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">车照片</label>
									</c:if>
									<c:if test="${carAccessory.carphotos==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">车照片</label>
									</c:if>
									<c:if test="${carAccessory.carphotos==null}">
										<input type="checkbox" disabled="disabled" />
										<label>车照片</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${carAccessory.vehiclesrubbing==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">车辆拓印</label>
									</c:if>
									<c:if test="${carAccessory.vehiclesrubbing==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">车辆拓印</label>
									</c:if>
									<c:if test="${carAccessory.vehiclesrubbing==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">车辆拓印</label>
									</c:if>
									<c:if test="${carAccessory.vehiclesrubbing==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">车辆拓印</label>
									</c:if>
									<c:if test="${carAccessory.vehiclesrubbing==null}">
										<input type="checkbox" disabled="disabled" />
										<label>车辆拓印</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${carAccessory.shopinsurancepolicy==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">店保保单</label>
									</c:if>
									<c:if test="${carAccessory.shopinsurancepolicy==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">店保保单</label>
									</c:if>
									<c:if test="${carAccessory.shopinsurancepolicy==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">店保保单</label>
									</c:if>
									<c:if test="${carAccessory.shopinsurancepolicy==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">店保保单</label>
									</c:if>
									<c:if test="${carAccessory.shopinsurancepolicy==null}">
										<input type="checkbox" disabled="disabled" />
										<label>店保保单</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${carAccessory.purchasetaxreturns==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">购置税申请表</label>
									</c:if>
									<c:if test="${carAccessory.purchasetaxreturns==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">购置税申请表</label>
									</c:if>
									<c:if test="${carAccessory.purchasetaxreturns==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">购置税申请表</label>
									</c:if>
									<c:if test="${carAccessory.purchasetaxreturns==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">购置税申请表</label>
									</c:if>
									<c:if test="${carAccessory.purchasetaxreturns==null}">
										<input type="checkbox" disabled="disabled" />
										<label>购置税申请表</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${carAccessory.threepacketsofprooves==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">三包凭证</label>
									</c:if>
									<c:if test="${carAccessory.threepacketsofprooves==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">三包凭证</label>
									</c:if>
									<c:if test="${carAccessory.threepacketsofprooves==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">三包凭证</label>
									</c:if>
									<c:if test="${carAccessory.threepacketsofprooves==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">三包凭证</label>
									</c:if>
									<c:if test="${carAccessory.threepacketsofprooves==null}">
										<input type="checkbox" disabled="disabled" />
										<label>三包凭证</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${carAccessory.cigarettelighter==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">点烟器</label>
									</c:if>
									<c:if test="${carAccessory.cigarettelighter==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">点烟器</label>
									</c:if>
									<c:if test="${carAccessory.cigarettelighter==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">点烟器</label>
									</c:if>
									<c:if test="${carAccessory.cigarettelighter==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">点烟器</label>
									</c:if>
									<c:if test="${carAccessory.cigarettelighter==null}">
										<input type="checkbox" disabled="disabled" />
										<label>点烟器</label>
									</c:if>
								</div>
								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${carAccessory.linkline==1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: green;">连接线</label>
									</c:if>
									<c:if test="${carAccessory.linkline==2 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: blue;">连接线</label>
									</c:if>
									<c:if test="${carAccessory.linkline==3 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: purple;">连接线</label>
									</c:if>
									<c:if test="${carAccessory.linkline==4 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">连接线</label>
									</c:if>
									<c:if test="${carAccessory.linkline==null}">
										<input type="checkbox" disabled="disabled" />
										<label>连接线</label>
									</c:if>
								</div>

							</div>
				</form>
				<div class="du-btn">
					<a href="javascript:;" class="btn btn-warning" role="button" onclick="back()"> 返回 </a>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function back() {
		location.href = $('#carAccessorypageUrl').val() + "?currpage="
				+ $('#currpage').val() + "&type=" + $('#type').val();
	}
</script>