<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<input id="supplycarsaveUrl" type="hidden"
	value='<ufa:url namespace="car-ms" fieldName="supplycarsave"/>' />
<input id="carlibrarylistpageUrl" type="hidden"
	value='<ufa:url namespace="car-ms" fieldName="carlibrarylistpage"/>' />
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/jquery.jedate.js"></script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${cssBasePath}/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${cssBasePath}/jedate.css">
</head>
<style>
@media ( min-width : 1330px) {
	.container {
		width: 1300px;
	}
}

table td,table th {
	text-align: center;
}

.box {
	/*width: 1524px;*/
	overflow: hidden; color: #555;
	/*margin-left: 50px;*/
}

.title {
	padding: 10px 0 30px;
}

.newInput {
	padding: 10px 15px 10px 15px; min-width: 100px;
}

.newInput label:first-child {
	min-width: 120px; text-align: right;
}

.du-btn {
	text-align: center; margin: 30px 0 50px;
}

.du-btn a {
	margin: 0 30px;
}
</style>
<div class="box">
	<div class="container">
		<form name="searchForm" id="searchForm"
			action="<ufa:url fieldName="supplycarsave" namespace="car-ms"/>" enctype="multipart/form-data"
			method="post">
			<h3 class="title">配车列表</h3>

			<div class="table-responsive">
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th class="success">车架号</th>
							<th>车辆品牌</th>
							<th>车辆型号</th>
							<th>车辆版本</th>
							<th>颜色</th>
							<th>结算价</th>
							<th>现所在地</th>
							<th>移动 后位置</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${listmap }">
							<tr>
								<th>${item.car.vin }</th>
								<th>${item.car.brand }</th>
								<th>${item.car.model }</th>
								<th>${item.car.version }</th>
								<th>${item.car.outlookColor }</th>
								<th>${item.car.settlementprice }</th>
								<th>${item.car.carAddress }</th>
								<th>${address }</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<input id="checkval" name="checkval" value="${checkval }" type="hidden"> <input id="id"
					name="id" value="${id }" type="hidden">
					<input id="money" name="money" value="${a }" type="hidden">
				<div class="form-group newInput" style="width: 400px; margin-left: 20px;">
					<label> <span style="color: red">*</span>配车单名称:
					</label> <input id="name" name="name" type="text" style="width: 180px; height: 34px;">
				</div>
				<c:if test="${a>0 }"><!-- 采购金融超额时显示超额钱数 -->
				
				<div class="form-group newInput" style="width: 400px; margin-left: 20px;">
					<label> <span style="color: red">*</span>超额钱数:
					</label> ${a }
				</div>
				</c:if>
				<c:if test="${type==2&&financeype==1 }">
					<div class="form-group newInput" style="width: 405px;">
						<label> <span style="color: red">*</span>展销协议(盖章版):
						</label> <input style="float: right;" id="protocolurlfiles" name="protocolurlfiles" type="file">
					</div>
					<div class="form-group newInput" style="width: 28%;">
						<label><span style="color: red">*</span>展销协议起始日期:</label> <input type="text" id="signingdate"
							name="signingdate" style="width: 180px; float: right;" class="form-control required mesTime"
							placeholder="请选择时间" readonly="">
					</div>
					<div class="form-group newInput" style="width: 28%;">
						<label><span style="color: red">*</span>展销协议结束日期:</label> <input type="text" id="duedate"
							name="duedate" style="width: 180px; float: right;" class="form-control required mesTime"
							placeholder="请选择时间" readonly="">
					</div>
				</c:if>
				<div class="du-btn">
					<c:if test="${type!=2||financeype==2 }"><!-- 非城市合伙人门店或者采购金融城市合伙人 -->
						<a href="#" class="btn btn-danger" onclick="submitBtn1()" style="padding: 6px 38px">确认</a>
					</c:if>
					<c:if test="${type==2&&financeype==1 }"><!--样车采购金融合伙人  -->
						<a href="#" class="btn btn-danger" onclick="submitBtn()" style="padding: 6px 38px">确认</a>
					</c:if>
					<a href="#" class="btn btn-warning" onclick="back()" style="padding: 6px 38px">取消</a>
				</div>
			</div>
		</form>
	</div>
</div>
<script>
	$('.mesTime').jeDate({
		//  isinitVal:true,
		format : "YYYY-MM-DD",
		isTime : false,
		isClear : false,
		minDate : "2014-09-19 00:00:00"
	});
	var status=true;
	function submitBtn1() {
		if ($('#name').val() == "") {
			$('#name').focus();
			return false;
		}
		var supplycarsave = $('#supplycarsaveUrl').val();
		var formData = new FormData($("#searchForm")[0]);
		if(status){
			status=false;
		$.ajax({
			//几个参数需要注意一下
			type : "POST",//方法类型
			dataType : "json",//预期服务器返回的数据类型
			url : supplycarsave,//url
			data : formData,
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function(data) {
				if (data.status) {
					alert("保存成功");
					location.href = $('#carlibrarylistpageUrl').val();
				} else {
					alert(data.msg);
				}
			}
		});
		}
	};
	function submitBtn() {
		if ($('#name').val() == "") {
			$('#name').focus();
			return false;
		}
		if ($('#protocolurlfiles').val() == "") {
			$('#protocolurlfiles').focus();
			return false;
		}
		if ($('#signingdate').val() == "") {
			$('#signingdate').focus();
			return false;
		}
		if ($('#duedate').val() == "") {
			$('#duedate').focus();
			return false;
		}
		if ($('#signingdate').val() > $('#duedate').val()) {
			alert("开始日期不能大于结束日期");
			return false;
		}

		var supplycarsave = $('#supplycarsaveUrl').val();
		var formData = new FormData($("#searchForm")[0]);
		if(status){
			status=false;
		$.ajax({
			//几个参数需要注意一下
			type : "POST",//方法类型
			dataType : "json",//预期服务器返回的数据类型
			url : supplycarsave,//url
			data : formData,
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function(data) {
				if (data.status) {
					alert("保存成功");
					location.href = $('#carlibrarylistpageUrl').val();
				} else {
					alert(data.msg);
				}
			}
		});
		}
	}
	function back() {
		location.href = $('#carlibrarylistpageUrl').val();
	}
</script>