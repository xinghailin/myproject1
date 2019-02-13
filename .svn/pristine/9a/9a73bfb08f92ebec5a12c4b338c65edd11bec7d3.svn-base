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
<input type="hidden" id="getCarAccessorySaveUrl"
	value="<ufa:url fieldName="getCarAccessorySave" namespace="car-ms"/>">

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
				<input id="currpage" hidden value="${currpage }">
				<h3 class="title">随车附件添加</h3>
				<form name="searchForm" id="searchForm"
					action="<ufa:url fieldName="newaddCarAccessorySave" namespace="car-ms"/>"
					enctype="multipart/form-data" method="post">
					<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">车源信息</h4>
					<div class="form-inline">
						<div id="car">

							<div class="form-group newInput select-box" style="width: 33%;">
								<label>品牌：</label>${car.brand }

							</div>
							<div class="form-group newInput select-box" style="width: 33%;">
								<label>型号：</label>${car.model }

							</div>
							<div class="form-group newInput select-box" style="width: 33%;">
								<label>版本：</label>${car.version }

							</div>
							<div class="form-group newInput select-box" style="width: 33%;">
								<label>车架号：</label> ${car.vin }
							</div>
						</div>

						<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">车源信息</h4>
						<div class="form-inline">
							<div id="car">
								<input name="carid" id="id" hidden value="${car.id }">
								<!-- 车架号id -->
								<c:if test="${car.certificateofquality>1 }">
									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.certificateofquality==2 }">
											<input class="car" name="certificateofquality" type="checkbox" value="3">
											<label>合格证</label>
										</c:if>
										<c:if test="${car.certificateofquality==3||car.certificateofquality==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">合格证</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.customspermit>1 }">
									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.customspermit==2 }">
											<input class="car" type="checkbox" name="customspermit" value="3" />
											<label>关单</label>
										</c:if>
										<c:if test="${car.customspermit==3||car.customspermit==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">关单</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.commodityinspectionform>1 }">
									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.commodityinspectionform==2 }">
											<input class="car" type="checkbox" name="commodityinspectionform" value="3" />
											<label>商检单</label>
										</c:if>
										<c:if test="${car.commodityinspectionform==3||car.commodityinspectionform==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">商检单</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.environmentalcertificate>1 }">
									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.environmentalcertificate==2 }">
											<input class="car" type="checkbox" name="environmentalcertificate" value="3" />
											<label>环保证书</label>
										</c:if>
										<c:if test="${car.environmentalcertificate==3||car.environmentalcertificate==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">环保证书</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.certificateofconformity>1 }">
									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.certificateofconformity==2 }">
											<input class="car" type="checkbox" name="certificateofconformity" value="3" />
											<label>一致性证书</label>
										</c:if>
										<c:if test="${car.certificateofconformity==3||car.certificateofconformity==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">一致性证书</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.remotekey>1 }">
									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.remotekey==2 }">
											<input class="car" type="checkbox" name="remotekey" value="3" />
											<label>遥控钥匙</label>
										</c:if>
										<c:if test="${car.remotekey==3||car.remotekey==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">遥控钥匙</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.manualkey>1 }">
									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.manualkey==2 }">
											<input class="car" type="checkbox" name="manualkey" value="3" />
											<label>手动钥匙</label>
										</c:if>
										<c:if test="${car.manualkey==3||car.manualkey==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">手动钥匙</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.chipcard>1 }">
									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.chipcard==2 }">
											<input class="car" type="checkbox" name="chipcard" value="3" />
											<label>芯片卡</label>
										</c:if>
										<c:if test="${car.chipcard==3||car.chipcard==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">芯片卡</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.maintenancemanual>1 }">
									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.maintenancemanual==2 }">
											<input class="car" type="checkbox" name="maintenancemanual" value="3" />
											<label>保养手册</label>
										</c:if>
										<c:if test="${car.maintenancemanual==3||car.maintenancemanual==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">保养手册</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.operationinstruction>1 }">
									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.operationinstruction==2 }">
											<input class="car" type="checkbox" name="operationinstruction" value="3" />
											<label>使用说明书</label>
										</c:if>
										<c:if test="${car.operationinstruction==3||car.operationinstruction==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">使用说明书</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.shopticket>1 }">
									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.shopticket==2 }">
											<input class="car" type="checkbox" name="shopticket" value="3" />
											<label>店票</label>
										</c:if>
										<c:if test="${car.shopticket==3||car.shopticket==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">店票</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.valueaddedtaxspecialinvoice>1 }">

									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.valueaddedtaxspecialinvoice==2 }">
											<input class="car" type="checkbox" name="valueaddedtaxspecialinvoice" value="3" />
											<label>增票</label>
										</c:if>
										<c:if test="${car.valueaddedtaxspecialinvoice==3||car.valueaddedtaxspecialinvoice==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">增票</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.carphotos>1 }">

									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.carphotos==2 }">
											<input class="car" type="checkbox" name="carphotos" value="3" />
											<label>车照片</label>
										</c:if>
										<c:if test="${car.carphotos==3||car.carphotos==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">车照片</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.vehiclesrubbing>1 }">

									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.vehiclesrubbing==2 }">
											<input class="car" type="checkbox" name="vehiclesrubbing" value="3" />
											<label>车辆拓印</label>
										</c:if>
										<c:if test="${car.vehiclesrubbing==3||car.vehiclesrubbing==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">车辆拓印</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.shopinsurancepolicy>1 }">
									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.shopinsurancepolicy==2 }">
											<input class="car" type="checkbox" name="shopinsurancepolicy" value="3" />
											<label>店保保单</label>
										</c:if>
										<c:if test="${car.shopinsurancepolicy==3||car.shopinsurancepolicy==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">店保保单</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.purchasetaxreturns>1 }">
									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.purchasetaxreturns==2 }">
											<input class="car" type="checkbox" name="purchasetaxreturns" value="3" />
											<label>购置税申请表</label>
										</c:if>
										<c:if test="${car.purchasetaxreturns==3||car.purchasetaxreturns==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">购置税申请表</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.threepacketsofprooves>1 }">

									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.threepacketsofprooves==2 }">
											<input class="car" type="checkbox" name="threepacketsofprooves" value="3" />
											<label>三包凭证</label>
										</c:if>
										<c:if test="${car.threepacketsofprooves==3||car.threepacketsofprooves==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">三包凭证</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.cigarettelighter>1 }">

									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.cigarettelighter==2 }">
											<input class="car" type="checkbox" name="cigarettelighter" value="3" />
											<label>点烟器</label>
										</c:if>
										<c:if test="${car.cigarettelighter==3||car.cigarettelighter==4}">
											<input type="checkbox" disabled="disabled" checked />
											<label style="color: red;">点烟器</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<c:if test="${car.linkline>1 }">
									<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
										<c:if test="${car.linkline==2 }">
											<input class="car" type="checkbox" name="linkline" value="3" />
											<label>连接线</label>
										</c:if>
										<c:if test="${car.linkline==3||car.linkline==4}">
											<input type="checkbox" disabled="disabled" checked checked />
											<label style="color: red;">连接线</label>
										</c:if>
									</div>
									<br />
								</c:if>
								<div class="form-group newInput select-box" style="width: 66%;">
									<label>接收备注：</label>
									<textarea class="form-control" rows="4" readonly="readonly"  style="resize: none; min-width: 600px" >${remarks1 }</textarea>
								</div>
							</div>
				</form>
				<div class="du-btn">
					<a type="button" class="btn btn-danger" onclick="get()">领取</a>
					<a href="javascript:;" class="btn btn-warning" role="button" onclick="back()"> 返回 </a>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function check() {
		for (var i = 0; i < $('.car').length; i++) {
			if ($('.car').eq(i).prop('checked')) {
				return false;
			}
		}
		return true;
	}
	var status=true;
	function get() {
		if (check()) {
			alert("请至少选择一个")
			return false;
		}
		var getCarAccessorySaveUrl = $('#getCarAccessorySaveUrl').val();
		if (status) {
			status = false;
		$.ajax({
			//几个参数需要注意一下
			type : "POST",//方法类型
			dataType : "json",//预期服务器返回的数据类型
			url : getCarAccessorySaveUrl,//url
			data : $('#searchForm').serialize(),
			success : function(data) {
				if (data.status) {
					alert("保存成功");
					location.href = $('#carAccessorypageUrl').val()
							+ "?currpage=" + $('#currpage').val() + "&type=3";
				} else {
					alert(data.msg);
				}
			}
		});
		}
	};
	function back() {
		location.href = $('#carAccessorypageUrl').val() + "?currpage="
				+ $('#currpage').val() + "&type=3";
	};
</script>