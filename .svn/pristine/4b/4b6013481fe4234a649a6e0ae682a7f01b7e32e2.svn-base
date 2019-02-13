<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<input id="movelibrarylistUrl" type="hidden"
	value='<ufa:url namespace="car-ms" fieldName="movelibrarylist"/>' />
<input id="movelibraryauditlistpageUrl" type="hidden"
	value='<ufa:url namespace="car-ms" fieldName="movelibraryauditlistpage"/>' />
<input id="movelibraryauditpassUrl" type="hidden"
	value='<ufa:url namespace="car-ms" fieldName="movelibraryauditpass"/>' />
<input id="movelibraryauditnopassUrl" type="hidden"
	value='<ufa:url namespace="car-ms" fieldName="movelibraryauditnopass"/>' />
<input id="movestartUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="movestart"/>' />
<input id="moveaffirmUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="moveaffirm"/>' />
<input id="shopconfirmedlistpageUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="shopconfirmedlistpage"/>' />
<input id="shopconfirmedUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="shopconfirmed"/>' />
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
			<h3 class="title">配车单详情</h3>

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
							<th>移动后位置</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${supplycar }">
							<tr>
								<th>${item.vin }</th>
								<th>${item.brand }</th>
								<th>${item.model }</th>
								<th>${item.version }</th>
								<th>${item.outcolor }</th>
								<th>${item.settlementprice }</th>
								<th>${item.nowaddress }</th>
								<th>${item.moveaddress }</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<input id="currpage" name="currpage" value="${currpage }" type="hidden"> <input id="id"
					name="id" value="${id }" type="hidden"> <input id="loginid" name="loginid"
					value="${loginid }" type="hidden">
				<div style="overflow: hidden;">
					<div style="width: 500px; float: left;">
						<span style="text-align: center; margin-left: 100px; font-size: 20px; color: red">送达门店信息
						</span>
						<div class="form-group newInput" style="width: 400px;">

							<label> 门店名称:</label> ${shop.name }
						</div>
						<div class="form-group newInput" style="width: 405px;">
							<label> 门店地址: </label> ${shop.address }
						</div>
						<div class="form-group newInput" style="width: 400px;">
							<label>门店电话:</label> ${shop.tel }
						</div>
						<div class="form-group newInput" style="width: 400px;">
							<label>省市:</label> ${shop.province }&nbsp;${shop.city }
						</div>

						<div class="form-group newInput" style="width: 400px;">
							<label>负责人:</label> ${shop.principal }
						</div>

					</div>
					<div style="float: right; width: 500px;">
						<span style="text-align: center; margin-left: 100px; font-size: 20px; color: red">配车单信息
						</span>
						<div class="form-group newInput" style="width: 400px; margin-left: 45px;">
							<label> 配车单名称: ${supplycartable.name } 
						</div>
						<c:if test="${type1==2&&type2==1 }">
							<!-- 是合伙人移库 -->
							<div class="form-group newInput" style="width: 405px;">
								<label> 展销协议(盖章版): </label>
								<a href="${contextPath}${supplycartable.protocolurl }" class="btn btn-primary" download="${supplycartable.protocolurl }" role="button">
									展销协议下载 </a>
							</div>
							<div class="form-group newInput" style="width: 400px;">
								<label>展销协议起始日期:</label>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${supplycartable.signingdate}" />
							</div>
							<div class="form-group newInput" style="width: 400px;">
								<label>展销协议结束日期:</label>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${supplycartable.duedate}" />
							</div>
							<c:if test="${supplycartable.status==9 }">
								<!-- 审核不通过 -->
								<div class="form-group newInput" style="width: 400px;">
									<label>审核不通过原因:</label>
									<textarea class="form-control" name="nopasscause" id="nopasscause"
										style="width: 300px; float: right; margin-right: 800px; resize: none;" rows="5" cols="7">${supplycartable.nopasscause }</textarea>
								</div>
							</c:if>
						</c:if>
					</div>
				</div>
				<c:if test="${type==3 }">
					<div class="form-group newInpu" style="margin-left: 30px; overflow: hidden;">
						<label> <span style="color: red">*</span> 审核不通过原因:
						</label>
						<textarea class="form-control" name="nopasscause" id="nopasscause"
							style="width: 300px; float: right; margin-right: 800px; resize: none;" rows="5" cols="7"></textarea>
					</div>
				</c:if>
				<div class="du-btn">
					<c:if test="${type==3 }">
						<!-- 3是配车超额审核 -->
						<a href="#" class="btn btn-danger" onclick="submitBtn()" style="padding: 6px 38px">审核通过</a>
						<a href="#" class="btn btn-danger" onclick="submitBtn2()" style="padding: 6px 38px">审核不通过</a>
						<a href="#" class="btn btn-warning" onclick="back1()" style="padding: 6px 38px">返回</a>
					</c:if>
					<c:if test="${type==1 }">
						<!-- 1 是配车超额审核查看返回  -->
						<a href="#" class="btn btn-warning" onclick="back1()" style="padding: 6px 38px">返回</a>
					</c:if>
					<c:if test="${type==2 }">
						<!--2 配车发起运输查看返回  -->
						<a href="#" class="btn btn-warning" onclick="back2()" style="padding: 6px 38px">返回</a>
					</c:if>
					<c:if test="${type==4 }">
						<!--发起配车 -->
						<a href="#" class="btn btn-danger" onclick="move()" style="padding: 6px 38px">接收任务开始物流</a>
						<a href="#" class="btn btn-warning" onclick="back2()" style="padding: 6px 38px">返回</a>
					</c:if>
					<c:if test="${type==5 }">
						<!--发起配车 -->
						<a href="#" class="btn btn-danger" onclick="affirm()" style="padding: 6px 38px">物流确认到店</a>
						<a href="#" class="btn btn-warning" onclick="back2()" style="padding: 6px 38px">返回</a>
					</c:if>
					<c:if test="${type==6 }">
						<!--门店确认到店 -->
						<a href="#" class="btn btn-warning" onclick="back3()" style="padding: 6px 38px">返回</a>
					</c:if>
					<c:if test="${type==7}">
						<!--门店确认到店 -->
						<a href="#" class="btn btn-danger" onclick="confirmed()" style="padding: 6px 38px">确认到店</a>
						<a href="#" class="btn btn-warning" onclick="back3()" style="padding: 6px 38px">返回</a>
					</c:if>
				</div>
			</div>
		</form>
	</div>
</div>
<script>
var status=true;
function confirmed(){
	var loginid = $('#loginid').val();
	var id = $('#id').val();
	var shopconfirmedUrl = $('#shopconfirmedUrl').val();
	if(status){
	status=false;	
	$.ajax({
		//几个参数需要注意一下
		type : "POST",//方法类型
		dataType : "json",//预期服务器返回的数据类型
		url : shopconfirmedUrl,//url
		data : {
			id : id,loginid:loginid
		},
		success : function(data) {
			if (data.status) {
				alert("保存成功");
				location.href = $('#shopconfirmedlistpageUrl').val() + "?currpage="
				+ $('#currpage').val();
			} else {
				alert(data.msg);
			}
		}
	});
	}
}
function affirm(){
	var id = $('#id').val();
	var moveaffirmUrl = $('#moveaffirmUrl').val();
	if(status){
	status=false;	
	$.ajax({
		//几个参数需要注意一下
		type : "POST",//方法类型
		dataType : "json",//预期服务器返回的数据类型
		url : moveaffirmUrl,//url
		data : {
			id : id
		},
		success : function(data) {
			if (data.status) {
				alert("保存成功");
				location.href = $('#movelibrarylistUrl').val() + "?currpage="
				+ $('#currpage').val();
			} else {
				alert(data.msg);
			}
		}
	});
	}
};
	function move() {
		var id = $('#id').val();
		var movestartUrl = $('#movestartUrl').val();
		if(status){
		status=false;	
		$.ajax({
			//几个参数需要注意一下
			type : "POST",//方法类型
			dataType : "json",//预期服务器返回的数据类型
			url : movestartUrl,//url
			data : {
				id : id
			},
			success : function(data) {
				if (data.status) {
					alert("保存成功");
					location.href = $('#movelibrarylistUrl').val() + "?currpage="
					+ $('#currpage').val();
				} else {
					alert(data.msg);
				}
			}
		});
		}
	};
	function submitBtn() {
		var loginid = $('#loginid').val();
		var id = $('#id').val();
		var movelibraryauditpassUrl = $('#movelibraryauditpassUrl').val();
		if(status){
		status=false;	
		$.ajax({
			//几个参数需要注意一下
			type : "POST",//方法类型
			dataType : "json",//预期服务器返回的数据类型
			url : movelibraryauditpassUrl,//url
			data : {
				id : id,
				loginid : loginid
			},
			success : function(data) {
				if (data.status) {
					alert("保存成功");
					location.href = $('#movelibraryauditlistpageUrl').val()
							+ "?currpage=" + $('#currpage').val();
				} else {
					alert(data.msg);
				}
			}
		});
		}
	};
	function submitBtn2() {
		var loginid = $('#loginid').val();
		var id = $('#id').val();
		var nopasscause = $('#nopasscause').val();
		var movelibraryauditnopass = $('#movelibraryauditnopassUrl').val();
		if (nopasscause == "") {
			alert('审核不通过原因必填！');
			return false;
		}
		if(status){
		status=false;	
		$.ajax({
			//几个参数需要注意一下
			type : "POST",//方法类型
			dataType : "json",//预期服务器返回的数据类型
			url : movelibraryauditnopass,//url
			data : {
				id : id,
				loginid : loginid,
				nopasscause : nopasscause
			},
			success : function(data) {
				if (data.status) {
					alert("保存成功");
					location.href = $('#movelibraryauditlistpageUrl').val()
							+ "?currpage=" + $('#currpage').val();
				} else {
					alert(data.msg);
				}
			}
		});
		}
	}
	function back1() {
		location.href = $('#movelibraryauditlistpageUrl').val() + "?currpage="
				+ $('#currpage').val();
	};
	function back2() {
		location.href = $('#movelibrarylistUrl').val() + "?currpage="
				+ $('#currpage').val();
	};function back3() {
		location.href = $('#shopconfirmedlistpageUrl').val() + "?currpage="
		+ $('#currpage').val();
};
</script>