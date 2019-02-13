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
<input type="hidden" id="newAddCarAccessorySaveUrl"
	value="<ufa:url fieldName="newAddCarAccessorySave" namespace="car-ms"/>">
<input type="hidden" id="CarAccessoryDetailsListPageUrl"
	value="<ufa:url fieldName="CarAccessoryDetailsListPage" namespace="car-ms"/>">
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
				<input id="currpage" hidden value="${currpage }"><input hidden id="carid"
					value="${car.id }">
				<h3 class="title">随车附件添加</h3>
				<form name="searchForm" id="searchForm"
					action="<ufa:url fieldName="newaddcarSave" namespace="car-ms"/>" enctype="multipart/form-data"
					method="post">
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
								<input name="carid" hidden value="${car.id }">
								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${car.certificateofquality>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">合格证</label>
									</c:if>
									<c:if test="${car.certificateofquality==null}">
										<input class="car" name="certificateofquality" id="certificateofquality" type="checkbox"
											value="1" />
										<label>合格证</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${car.customspermit>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">关单</label>
									</c:if>
									<c:if test="${car.customspermit==null}">
										<input class="car" name="customspermit" id="customspermit" type="checkbox" value="1" />
										<label>关单</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${car.commodityinspectionform>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">商检单</label>
									</c:if>
									<c:if test="${car.commodityinspectionform==null}">
										<input class="car" name="commodityinspectionform" id="commodityinspectionform"
											type="checkbox" value="1" />
										<label>商检单</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${car.environmentalcertificate>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">环保证书</label>
									</c:if>
									<c:if test="${car.environmentalcertificate==null}">
										<input class="car" name="environmentalcertificate" id="environmentalcertificate"
											type="checkbox" value="1" />
										<label>环保证书</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${car.certificateofconformity>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">一致性证书</label>
									</c:if>
									<c:if test="${car.certificateofconformity==null}">
										<input class="car" name="certificateofconformity" id="certificateofconformity"
											type="checkbox" value="1" />
										<label>一致性证书</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${car.remotekey>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">遥控钥匙</label>
									</c:if>
									<c:if test="${car.remotekey==null}">
										<input class="car" name="remotekey" id="remotekey" type="checkbox" value="1" />
										<label>遥控钥匙</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${car.manualkey>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">手动钥匙</label>
									</c:if>
									<c:if test="${car.manualkey==null}">
										<input class="car" name="manualkey" id="manualkey" type="checkbox" value="1" />
										<label>手动钥匙</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${car.chipcard>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">芯片卡</label>
									</c:if>
									<c:if test="${car.chipcard==null}">
										<input class="car" name="chipcard" id="chipcard" type="checkbox" value="1" />
										<label>芯片卡</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${car.maintenancemanual>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">保养手册</label>
									</c:if>
									<c:if test="${car.maintenancemanual==null}">
										<input class="car" name="maintenancemanual" id="maintenancemanual" type="checkbox"
											value="1" />
										<label>保养手册</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${car.operationinstruction>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">使用说明书</label>
									</c:if>
									<c:if test="${car.operationinstruction==null}">
										<input class="car" name="operationinstruction" id="operationinstruction" type="checkbox"
											value="1" />
										<label>使用说明书</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${car.shopticket>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">店票</label>
									</c:if>
									<c:if test="${car.shopticket==null}">
										<input class="car" name="shopticket" id="shopticket" type="checkbox" value="1" />
										<label>店票</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${car.valueaddedtaxspecialinvoice>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">增票</label>
									</c:if>
									<c:if test="${car.valueaddedtaxspecialinvoice==null}">
										<input class="car" name="valueaddedtaxspecialinvoice" id="valueaddedtaxspecialinvoice"
											type="checkbox" value="1" />
										<label>增票</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${car.carphotos>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">车照片</label>
									</c:if>
									<c:if test="${car.carphotos==null}">
										<input class="car" name="carphotos" id="carphotos" type="checkbox" value="1" />
										<label>车照片</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${car.vehiclesrubbing>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">车辆拓印</label>
									</c:if>
									<c:if test="${car.vehiclesrubbing==null}">
										<input class="car" name="vehiclesrubbing" id="vehiclesrubbing" type="checkbox" value="1" />
										<label>车辆拓印</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${car.shopinsurancepolicy>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">店保保单</label>
									</c:if>
									<c:if test="${car.shopinsurancepolicy==null}">
										<input class="car" name="shopinsurancepolicy" id="shopinsurancepolicy" type="checkbox"
											value="1" />
										<label>店保保单</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${car.purchasetaxreturns>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">购置税申请表</label>
									</c:if>
									<c:if test="${car.purchasetaxreturns==null}">
										<input class="car" name="purchasetaxreturns" id="purchasetaxreturns" type="checkbox"
											value="1" />
										<label>购置税申请表</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${car.threepacketsofprooves>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">三包凭证</label>
									</c:if>
									<c:if test="${car.threepacketsofprooves==null}">
										<input class="car" name="threepacketsofprooves" id="threepacketsofprooves" type="checkbox"
											value="1" />
										<label>三包凭证</label>
									</c:if>
								</div>

								<div class="form-group newInput select-box" style="width: 33%;">
									<c:if test="${car.cigarettelighter>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">点烟器</label>
									</c:if>
									<c:if test="${car.cigarettelighter==null}">
										<input class="car" name="cigarettelighter" id="cigarettelighter" type="checkbox" value="1" />
										<label>点烟器</label>
									</c:if>
								</div>
								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<c:if test="${car.linkline>=1 }">
										<input type="checkbox" disabled="disabled" checked />
										<label style="color: red;">连接线</label>
									</c:if>
									<c:if test="${car.linkline==null}">
										<input class="car" name="linkline" id="linkline" type="checkbox" value="1" />
										<label>连接线</label>
									</c:if>
								</div>
								<div class="form-group newInput select-box" style="width: 33%; margin-left: -100px;">
									<label>备注：</label>
									<textarea class="form-control" rows="4" style="resize: none; min-width: 220px" id="remarks"
										name="remarks"></textarea>
								</div>
							</div>
				</form>
				<div class="du-btn">
					<button type="button" class="btn btn-danger submit" style="padding: 6px 30px" onclick="save()" >提交并流转财务</button>
					<a href="javascript:;" class="btn btn-warning" role="button" style="padding: 6px 30px"
						onclick="back()"> 返回 </a>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/jedate.min.js"></script>
<script>
var flag=true;
	function check() {
		for (var i = 0; i < $('.car').length; i++) {
			if ($('.car').eq(i).prop('checked')) {
				return false;
			}
		}
		return true;
	}
	function save() {
		if (check()) {
			alert("请至少选择一个")
			return false;
		}
		if(flag){
		flag=false;
		var carSourcesave = $('#newAddCarAccessorySaveUrl').val();
		$.ajax({
			//几个参数需要注意一下
			type : "POST",//方法类型
			dataType : "json",//预期服务器返回的数据类型
			url : carSourcesave,//url
			data : $('#searchForm').serialize(),
			success : function(data) {
				if (data.status) {
					alert("保存成功");
					location.href = $('#CarAccessoryDetailsListPageUrl').val()
							+ "?currpage=" + $('#currpage').val() + "&id="
							+ $('#carid').val() + "&type=1";
				} else {
					alert(data.msg);
				}
			}
		});}
	};
	function back() {
		location.href = $('#CarAccessoryDetailsListPageUrl').val()
				+ "?currpage=" + $('#currpage').val() + "&id="
				+ $('#carid').val() + "&type=1";
	}
</script>