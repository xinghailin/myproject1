<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
		
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>车源</title>
<link rel="stylesheet" href="${cssBasePath}/jedate1.css">
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizcontract.css" />
<link rel="stylesheet" href="${contextPath}/resources/style/jquery.css" />
<input class="car" type="hidden" id="BrandinitiaUrl"
	value="<ufa:url fieldName="queryBrandinitia" namespace="car-ms"/>">
<input class="car" type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input class="car" type="hidden" id="modelUrl"
	value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input class="car" type="hidden" id="versionUrl" value="<ufa:url fieldName="QUERY_VERSION" namespace="car-ms"/>">
<input class="car" type="hidden" id="cityUrl" value="<ufa:url fieldName="shopcity" namespace="car-ms"/>">
<input class="car" type="hidden" id="carAccessorypage"
	value="<ufa:url fieldName="carAccessorypage" namespace="car-ms"/>">
<input class="car" type="hidden" id="addCarAccessorySaveUrl"
	value="<ufa:url fieldName="addCarAccessorySave" namespace="car-ms"/>">
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
				<h3 class="title">随车附件添加</h3>
				<form name="searchForm" id="searchForm"
					action="<ufa:url fieldName="addCarAccessorySave" namespace="car-ms"/>" enctype="multipart/form-data"
					method="post">
					<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">车源信息</h4>
					<div class="form-inline">
						<input  name="creatorname" value="${username }" hidden> 
						<div id="car">
							<div class="form-group newInput select-box" style="width: 33%;">
								<label>品牌首字母：</label>
								<select class="letter" id="letter" type="text">
									<option>请选择</option>
								</select>
							</div>
							<div class="form-group newInput select-box" style="width: 33%;">
								<label>品牌：</label>
								<select class="brand" name="brand" id="brand" type="text">
									<option>请选择</option>
								</select>
							</div>
							<div class="form-group newInput select-box" style="width: 33%;">
								<label>型号：</label>
								<select class="model" name="model" id="model" type="text">
									<option>请选择</option>
								</select>
							</div>
							<div class="form-group newInput select-box" style="width: 33%;">
								<label>版本：</label>
								<select class="version" name="version" id="version" type="text">
									<option>请选择</option>
								</select>
							</div>
							<div class="form-group newInput select-box" style="width: 33%;">
								<label>车架号：</label> <input  class="vin" name="vin" id="vin" type="text" style="width: 200px;" />
							</div>
						</div>
						
						<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">车源信息</h4>
						<div class="form-inline">
							<div id="car">
								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<input class="car" class="vin" name="certificateofquality" id="certificateofquality" type="checkbox" value="1" /><label>合格证</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%;">
									<input class="car" class="vin" name="customspermit" id="customspermit" type="checkbox" value="1" /><label>关单</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<input class="car" class="vin" name="commodityinspectionform" id="commodityinspectionform" type="checkbox" value="1" /><label>商检单</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%; ">
									<input class="car" class="vin" name="environmentalcertificate" id="environmentalcertificate" type="checkbox" value="1" /><label>环保证书</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<input class="car" class="vin" name="certificateofconformity" id="certificateofconformity" type="checkbox" value="1" /><label>一致性证书</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%;">
									<input class="car" class="vin" name="remotekey" id="remotekey" type="checkbox" value="1" /><label>遥控钥匙</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<input class="car" class="vin" name="manualkey" id="manualkey" type="checkbox" value="1" /><label>手动钥匙</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%; ">
									<input class="car" class="vin" name="chipcard" id="chipcard" type="checkbox" value="1" /><label>芯片卡</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<input class="car" class="vin" name="maintenancemanual" id="maintenancemanual" type="checkbox" value="1" /><label>保养手册</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%;">
								<input class="car" class="vin" name="operationinstruction" id="operationinstruction" type="checkbox" value="1" /><label>使用说明书</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<input class="car" class="vin" name="shopticket" id="shopticket" type="checkbox" value="1" /><label>店票</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%;">
									<input class="car" class="vin" name="valueaddedtaxspecialinvoice" id="valueaddedtaxspecialinvoice" type="checkbox" value="1" /><label>增票</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<input class="car" class="vin" name="carphotos" id="carphotos" type="checkbox" value="1" /><label>车照片</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%;">
									<input class="car" class="vin" name="vehiclesrubbing" id="vehiclesrubbing" type="checkbox" value="1" /><label>车辆拓印</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<input class="car" class="vin" name="shopinsurancepolicy" id="shopinsurancepolicy" type="checkbox" value="1" /><label>店保保单</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%;">
									<input class="car" class="vin" name="purchasetaxreturns" id="purchasetaxreturns" type="checkbox" value="1" /><label>购置税申请表</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<input class="car" class="vin" name="threepacketsofprooves" id="threepacketsofprooves" type="checkbox" value="1" /><label>三包凭证</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%;">
									<input class="car" class="vin" name="cigarettelighter" id="cigarettelighter" type="checkbox" value="1" /><label>点烟器</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%; margin-left: 100px;">
									<input class="car" class="vin" name="linkline" id="linkline" type="checkbox" value="1" /><label>连接线</label>
								</div>
								
								<div class="form-group newInput select-box" style="width: 33%;margin-left: -100px;">
									<label>备注：</label>
									<textarea class="form-control" rows="4" style="resize: none; min-width: 220px" id="remarks"
										name="remarks"></textarea>
								</div>
								
							</div>
							
				</form>
				<div class="du-btn">
					<button type="button" class="btn btn-danger submit" style="padding: 6px 30px" onclick="save()">提交并流转财务</button>
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
function check(){
	for(var i=0;i<$('.car').length;i++){
		if($('.car').eq(i).prop('checked')){
			return false;
		}
	}
	return true;
}
var status=true;
	function save() {
		
		if(check()){
			alert("请至少选择一个")
			return false;
		}
		var brand = $('#brand').val();
		var model = $('#model').val();
		var version = $('#version').val();
		var vin = $('#vin').val();
		if (brand == '请选择') {
			alert("请选择品牌！");
			return false;
		}
		if (model == '请选择') {
			alert("请选择型号！");
			return false;
		}
		if (version == '请选择') {
			alert("请选择版别！");
			return false;
		}
		if (vin == '') {
			alert("请添加车架号！");
			return false;
		}
		if(check()){
			alert("请至少选择一个")
			return false;
		}
		var carSourcesave = $('#addCarAccessorySaveUrl').val()+"?type=1";
		if(status){
			status=false;
		$.ajax({
			//几个参数需要注意一下
			type : "POST",//方法类型
			dataType : "json",//预期服务器返回的数据类型
			url : carSourcesave,//url
			data : $('#searchForm').serialize(),
			success : function(data) {
				if (data.status) {
					alert("保存成功");
					location.href = $('#carAccessorypage').val()+"?type=1";
				} else {
					alert(data.msg);
				}
			}
		});
		}
	};
	function back() {
		location.href = $('#carAccessorypage').val() +"?type=1";
	}
	var BrandinitiaUrl = $('#BrandinitiaUrl').val();
	var brandUrl = $('#brandUrl').val();
	var modelUrl = $('#modelUrl').val();
	var versionUrl = $('#versionUrl').val();
	$.ajax({
		url : BrandinitiaUrl,
		type : 'get',
		datatype : 'json',
		success : function(data) {
			var $letter = $('#letter');
			$.each(data.result, function() {
				$letter.append($("<option>" + this.brandInitial + "</option>"))
			});
			$(document).delegate(
					'#letter',
					'change',
					function() {//首字母改变时触发
						var $this = $(this);
						$this.parent().siblings().find('select').html(
								"<option>请选择</option>");
						$.ajax({
							url : brandUrl,
							type : 'post',
							data : {
								brandinitial : $this.val()
							},
							datatype : 'json',
							success : function(data) {
								var $brand = $('#brand');
								$.each(data.abrand, function() {
									$brand.append($("<option>" + this.brand
											+ "</option>"))
								});
							}
						})
					})
			$(document).delegate(
					'#brand',
					'change',
					function() {
						var $this = $(this);
						$('#model').html("<option>请选择</option>");
						$('#version').html("<option>请选择</option>");
						$.ajax({
							url : modelUrl,
							type : 'post',
							data : {
								brand : $this.val()
							},
							datatype : 'json',
							success : function(data) {
								var $model = $('#model');
								$.each(data.model, function() {
									$model.append($("<option>" + this.model
											+ "</option>"))
								});
							}
						})
					})
			$(document).delegate(
					'#model',
					'change',
					function() {
						$('#version').html("<option>请选择</option>");
						var $this = $(this);
						$.ajax({
							url : versionUrl,
							type : 'post',
							data : {
								model : $this.val()
							},
							datatype : 'json',
							success : function(data) {
								var $version = $('#version');
								$.each(data.version, function() {
									$version.append($("<option>" + this.version
											+ "</option>"))
								});
							}
						})
					})
		}
	});
</script>