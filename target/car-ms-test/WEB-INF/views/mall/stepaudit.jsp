<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>费用审核</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizcontract.css" />
<link rel="stylesheet" href="${cssBasePath}/swiper-3.4.2.min.css" />
<input type="hidden" id="currpage" name="currpage" value="${currpage}">
<input type="hidden" id="subcode" name="subcode" value="${order.code}">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="MALL_LOOKCARBYORDER_PAGE" namespace="car-ms"/>">
<input type="hidden" id="auditUrl" value="<ufa:url fieldName="contractordercarsave" namespace="car-ms"/>">
</head>
<style>
.swiper-container {
	width: 540px;
	height: 340px;
	background: #ddd;
	margin-left: 0px;
	background: #ddd;
	margin-left: 0px;
	border:1px solid black;
}
.swiper-container img{width:100%;height:100%;}
</style>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container">
				<h3 class="title"><c:choose>
						<c:when test="${empty car.verifystatus}">定金审核</c:when>
						<c:when test="${1 eq car.verifystatus}">杂费审核</c:when>
						<c:when test="${2 eq car.verifystatus}">海运费审核</c:when>
						<c:when test="${3 eq car.verifystatus}">报关费审核</c:when>
						<c:when test="${4 eq car.verifystatus}">尾款审核</c:when>
						<c:when test="${5 eq car.verifystatus}">查看</c:when>
					</c:choose></h3>
				<div class="form-inline">
					<div class="form-group newInput" style="width: 33%;"><label>海外直采合同编号：</label>${order.sealapplycode}</div>
					<div class="form-group newInput" style="width: 33%;margin-left: 50px;"><label>用户账号：</label>${order.username}</div> <br>
					<div class="form-group newInput" style="width: 33%;"><label>订单编号：</label>${order.code}</div>
					<div class="form-group newInput" style="width: 33%;margin-left: 50px;"><label>车辆唯一编号：</label>${car.skucode}</div>
			</div>
				<div class="swiper-container ">
					<div class="swiper-wrapper"><c:forEach items="${pics}" var="item">
							<div class="swiper-slide"><img src="${ftpFileUrl}${item.picurl}"></div>
						</c:forEach></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
			</div>
				<h4 style="padding: 8px 0; font-size: 30px; float: left; margin-left: 600px; margin-top: -340px;">${order.brand}&nbsp;${order.model}&nbsp;${order.version}</h4>
				<div class="form-inline" style="float: left; margin-left: 550px; margin-top: -220px;">
				<div class="form-group newInput" style="width:100%;"><label>车架号：</label>${car.vin}</div>
					<div class="form-group newInput" style="width: 12%;"><label>车身价：</label>${order.carprice}&nbsp;${site.currencyunit }</div>
					<div class="form-group newInput" style="width: 12%;"><label>加装：</label>${order.decorateprice}&nbsp;${site.currencyunit }</div> <br>
					<div class="form-group newInput" style="width: 12%;"><label>商品总价：</label>${car.totalprice}￥</div>
					<div class="form-group newInput" style="width: 12%;"><label>数量：</label>1</div>
			</div>
			<c:if test="${(not empty car.verifystatus) and (car.verifystatus gt 0)}">
					<c:forEach items="${steps}" var="item" varStatus="vs">
						<c:if test="${vs.index==0}">
							<h4 style="padding: 10px 0;" class="list-group-item-danger">①购车定金：已支付</h4>
							<div class="form-group newInput"><label>收款币种：</label> <input type="radio" value="1" name="currency0" <c:if test="${1 eq item.currency}">checked="checked"</c:if>
								disabled="disabled">人民币 <input type="radio" value="2" name="currency0" <c:if test="${2 eq item.currency}">checked="checked"</c:if> disabled="disabled">当地货币<label>&nbsp;&nbsp;&nbsp;&nbsp;到账金额：</label>${item.receivedmoney}
								<c:if test="${1 eq item.currency}">
									<label>&nbsp;&nbsp;&nbsp;&nbsp;到账汇率：</label> ${item.rate}
							</c:if></div>
						</c:if>
						<c:if test="${vs.index==1}">
							<h4 style="padding: 10px 0;" class="list-group-item-danger">②当地杂费：已支付</h4>
							<div class="form-group newInput"><label>收款币种：</label> <input type="radio" value="1" name="currency1" <c:if test="${1 eq item.currency}">checked="checked"</c:if>
								disabled="disabled">人民币 <input type="radio" value="2" name="currency1" <c:if test="${2 eq item.currency}">checked="checked"</c:if> disabled="disabled">当地货币<label>&nbsp;&nbsp;&nbsp;&nbsp;到账金额：</label>${item.receivedmoney}
								<c:if test="${1 eq item.currency}">
									<label>&nbsp;&nbsp;&nbsp;&nbsp;到账汇率：</label> ${item.rate}
							</c:if></div>
						</c:if>
						<c:if test="${vs.index==2}">
							<h4 style="padding: 10px 0;" class="list-group-item-danger">③海运费用：已支付</h4>
							<div class="form-group newInput"><label>收款币种：</label> <input type="radio" value="1" name="currency2" <c:if test="${1 eq item.currency}">checked="checked"</c:if>
								disabled="disabled">人民币 <input type="radio" value="2" name="currency2" <c:if test="${2 eq item.currency}">checked="checked"</c:if> disabled="disabled">当地货币<label>&nbsp;&nbsp;&nbsp;&nbsp;到账金额：</label>${item.receivedmoney}
								<c:if test="${1 eq item.currency}">
									<label>&nbsp;&nbsp;&nbsp;&nbsp;到账汇率：</label> ${item.rate}
							</c:if></div>
						</c:if>
						<c:if test="${vs.index==3}">
							<h4 style="padding: 10px 0;" class="list-group-item-danger">④报关费用：已支付</h4>
							<div class="form-group newInput"><label>到账金额：</label>${item.receivedmoney}</div>
						</c:if>
						<c:if test="${vs.index==4}">
							<h4 style="padding: 10px 0;" class="list-group-item-danger">⑤提车尾款：已支付</h4>
							<div class="form-group newInput"><label>到账金额：</label>${item.receivedmoney}</div>
						</c:if>
					</c:forEach>
				</c:if>
				<div class="form-inline" style="margin-top: 20px;"><c:if test="${empty car.verifystatus}">
						<div class="form-group newInput" style="width: 12%; color: red;"><label>①购车定金：</label>待支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%;"><label>②当地杂费：</label>待支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%;"><label>③海运费用：</label>待支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%;"><label>④报关费用：</label>待支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%;"><label>⑤提车尾款：</label>待支付</div>
					</c:if> <c:if test="${1 eq car.verifystatus}">
						<div class="form-group newInput" style="width: 12%;"><label>①购车定金：</label>已支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%; color: red;"><label>②当地杂费：</label>待支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%;"><label>③海运费用：</label>待支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%;"><label>④报关费用：</label>待支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%;"><label>⑤提车尾款：</label>待支付</div>
					</c:if> <c:if test="${2 eq car.verifystatus}">
						<div class="form-group newInput" style="width: 12%;"><label>①购车定金：</label>已支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%;"><label>②当地杂费：</label>已支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%; color: red;"><label>③海运费用：</label>待支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%;"><label>④报关费用：</label>待支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%;"><label>⑤提车尾款：</label>待支付</div>
					</c:if> <c:if test="${3 eq car.verifystatus}">
						<div class="form-group newInput" style="width: 12%;"><label>①购车定金：</label>已支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%;"><label>②当地杂费：</label>已支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%;"><label>③海运费用：</label>已支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%; color: red;"><label>④报关费用：</label>待支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%;"><label>⑤提车尾款：</label>待支付</div>
					</c:if> <c:if test="${4 eq car.verifystatus}">
						<div class="form-group newInput" style="width: 12%;"><label>①购车定金：</label>已支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%;"><label>②当地杂费：</label>已支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%;"><label>③海运费用：</label>已支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%;"><label>④报关费用：</label>已支付</div>
						<br>
						<div class="form-group newInput" style="width: 12%; color: red;"><label>⑤提车尾款：</label>待支付</div>
					</c:if></div> <c:choose>
					<c:when test="${empty car.verifystatus}">
						<h4 style="padding: 8px 0; font-size: 20px; float: left; margin-left: 507px; margin-top: -220px;">预计支付定金金额：${downpay }&nbsp;${site.currencyunit }</h4>
						<form name="editForm" id="editForm" method="POST" style="float: left; margin-left: 550px; margin-top: -180px;">
							<div class="form-inline"><input name="id" id="id" type="hidden" value="${car.id }"> <input name="status" id="status" value="" hidden>
								<div class="form-group newInput" style="width: 500px;"><label>实际收款币种：</label> <input type="radio" value="1" name="currency" checked="checked"
									onclick="currencyunit1()">人民币 <input type="radio" value="2" name="currency" onclick="currencyunit1()" style="margin-left: 20px;">当地货币</div> <br>
								<div class="form-group newInput" style="width: 500px;"><label>实际到账金额：</label><input type="text" class="form-control" name="receivedmoney" id="receivedmoney">
							</div> <br>
								<div id="exchangeRate" class="form-group newInput" style="width: 500px;"><label>汇率：</label><input type="text" class="form-control" name="rate" id="rate" value=""></div></div>
						</form>
					</c:when>
					<c:when test="${1 eq car.verifystatus}">
						<h4 style="padding: 8px 0; font-size: 20px; float: left; margin-left: 507px; margin-top: -220px;">预计支付当地杂费：${incidentals}&nbsp;${site.currencyunit}</h4>
						<form name="editForm" id="editForm" method="POST" style="float: left; margin-left: 550px; margin-top: -180px;">
							<div class="form-inline"><input name="id" id="id" type="hidden" value="${car.id }"> <input name="status" id="status" value="1" hidden>
								<div class="form-group newInput" style="width: 500px;"><label>实际收款币种：</label> <input type="radio" value="1" name="currency" checked="checked"
									onclick="currencyunit1()">人民币 <input type="radio" value="2" name="currency" onclick="currencyunit1()" style="margin-left: 20px;">当地货币</div> <br>
								<div class="form-group newInput" style="width: 500px;"><label>实际到账金额：</label><input type="text" class="form-control" name="receivedmoney" id="receivedmoney">
							</div> <br>
								<div id="exchangeRate" class="form-group newInput" style="width: 500px;"><label>汇率：</label><input type="text" class="form-control" name="rate" id="rate" value=""></div></div>
						</form>
					</c:when>
					<c:when test="${2 eq car.verifystatus}">
						<h4 style="padding: 8px 0; font-size: 20px; float: left; margin-left: 587px; margin-top: -220px;">预计支付：海运费&nbsp;${source.seatransportprice }&nbsp;${site.currencyunit }&nbsp;+&nbsp;海运保险&nbsp;${source.seatransportinsurance }&nbsp;¥</h4>
						<form name="editForm" id="editForm" method="POST" style="float: left; margin-left: 550px; margin-top: -180px;">
							<div class="form-inline"><input name="id" id="id" type="hidden" value="${car.id }"> <input name="status" id="status" value="2" hidden>
								<div class="form-group newInput" style="width: 500px;"><label>实际收款币种：</label> <input type="radio" value="1" name="currency" checked="checked"
									onclick="currencyunit1()">人民币 <input type="radio" value="2" name="currency" onclick="currencyunit1()" style="margin-left: 20px;">当地货币</div> <br>
								<div class="form-group newInput" style="width: 500px;"><label>实际到账金额：</label><input type="text" class="form-control" name="receivedmoney" id="receivedmoney">
							</div> <br>
								<div id="exchangeRate" class="form-group newInput" style="width: 500px;"><label>汇率：</label><input type="text" class="form-control" name="rate" id="rate" value=""></div></div>
						</form>
					</c:when>
					<c:when test="${3 eq car.verifystatus}">
						<h4 style="padding: 8px 0; font-size: 20px; float: left; margin-left: 507px; margin-top: -220px;">预计支付报关费：报关费+港杂费等</h4>
						<form name="editForm" id="editForm" method="POST" style="float: left; margin-left: 550px; margin-top: -180px;"><input type="hidden" id="id" name="id" value="${car.id}">
							<input type="hidden" id="status" name="status" value="3">
							<div class="form-inline">
								<div class="form-group newInput" style="width: 500px;"><label>实际到账金额：</label><input type="text" id="receivedmoney" name="receivedmoney" class="form-control">￥</div>
						</div></form>
					</c:when>
					<c:when test="${4 eq car.verifystatus}">
						<h4 style="padding: 8px 0; font-size: 20px; float: left; margin-left: 507px; margin-top: -220px;">预计支付尾款：${remainprice }<c:if test="${interest eq 1}">+利息（全款*8.5%/365*天）</c:if></h4>
						<form name="editForm" id="editForm" method="POST" style="float: left; margin-left: 550px; margin-top: -180px;"><input type="hidden" id="id" name="id" value="${car.id}">
							<input type="hidden" id="status" name="status" value="4">
							<div class="form-inline">
								<div class="form-group newInput" style="width: 500px;"><label>实际到账金额：</label><input type="text" id="receivedmoney" name="receivedmoney" class="form-control">￥</div>
						</div></form>
					</c:when>
				</c:choose>
				<div>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 12%;"><label>当前操作人：</label>${name}</div>
				</div>
					<div class="du-btn"><c:if test="${empty car.verifystatus or 5 gt car.verifystatus}">
							<a href="javascript:;" class="btn btn-danger" role="button" style="padding: 6px 30px" id="saveBtn">确定</a>
						</c:if> <a href="javascript:;" class="btn btn-warning" role="button" style="padding: 6px 30px" id="backBtn">返回</a></div>
			</div>
		</div>
	</div>
</body>
<script src="${scriptBasePath}/base/swiper-3.4.2.min.js"></script>
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script>
	function currencyunit1(){
		var currencyunit=$('#editForm :radio:checked').val();//console.log(currencyunit);
		if(currencyunit == 1){
			document.getElementById("exchangeRate").style.display="block";
		}else if(currencyunit == 2){
			document.getElementById("exchangeRate").style.display="none";
		}
	}
	var mySwiper=new Swiper('.swiper-container',{
	/*   pagination : '.swiper-pagination', */
	autoplay:5000,//可选选项，自动滑动
	//pagination : '#swiper-pagination1',
	paginationClickable:true,prevButton:'.swiper-button-prev',nextButton:'.swiper-button-next',});
	var reg=/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,reg1=/((^[1-9](\d+)?(\.\d{1,4})?$)|(^(0){1}$)|(^\d\.\d{1,4}?$))/;
	$("#saveBtn").click(function(){
		var status=$("#status").val();
		if(!status || status < 3){
			var my=$("#receivedmoney").val();
			if(!reg.test(my)){
				alert("请输入正确的实际到账金额!");
				return false;
			}
			var currencyunit=$('#editForm :radio:checked').val();
			if(currencyunit == 1){
				var rate=$.trim($('#rate').val());
				if(!reg1.test(rate)){
					alert("请输入正确的到账汇率!");
					return false;
				}
			}
			var up={id:$("#id").val(),status:$("#status").val(),realmoney:my,currency:currencyunit,rate:rate};
			$.ajax({url:$("#auditUrl").val(),type:'post',dataType:'json',data:up,success:function(data){
				if(data.status){
					alert("审核成功！");
					back();
				}else{
					alert(data.message);
				}
			},error:function(a,b,c){
				alert(a.responseText)
			}})
		}else if(3 <= status){
			var my=$("#receivedmoney").val();
			if(!reg.test(my)){
				alert("请输入正确的实际到账金额!");
				return false;
			}
			var up={id:$("#id").val(),status:$("#status").val(),realmoney:my};
			$.ajax({url:$("#auditUrl").val(),type:'post',dataType:'json',data:up,success:function(data){
				if(data.status){
					alert("审核成功！");
					back();
				}else{
					alert(data.message);
				}
			},error:function(a,b,c){
				alert(a.responseText)
			}})
		}
	})
	function back(){
		location.href=$("#backUrl").val() + "?code=" + $("#subcode").val()+"&contract_code=${car.contractcode}&currpage=" + $('#currpage').val();
	}
	$("#backBtn").bind("click",back);
</script>
</html>