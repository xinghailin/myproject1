<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>销售合同填写车架号</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizcontract.css" />
<link rel="stylesheet" type="text/css" href="${cssBasePath}/swiper-3.4.2.min.css" />
<script src="${scriptBasePath}/base/swiper-3.4.2.min.js"></script>
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<input type="hidden" id="backUrl"
	value="<ufa:url fieldName="MALL_LOOKCARBYORDER_PAGE" namespace="car-ms"/>">
<input type="hidden" id="saveUrl"
	value="<ufa:url fieldName="saveMallCarStatus" namespace="car-ms"/>">
</head>
<style>
.swiper-container {
	width: 300px; height: 300px; background: #ddd; margin-left: 0px;
}
.input_text01 {
    border: 1px solid #e1e1e1;
    width: 180px;
}
</style>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container">
				<h3 class="title">当地杂费审核</h3>
				<div class="form-inline">
					<div class="form-group newInput" style="width: 33%;">
						<label>海外直采合同编号：</label>${orderDetail.sealapplycode}
					</div>
					<div class="form-group newInput" style="width: 33%;">
						<label>用户账号：</label>${orderDetail.username}
					</div>
					<br>
					<div class="form-group newInput" style="width: 33%;">
						<label>订单编号：</label>${orderDetail.id}
					</div>
					<div class="form-group newInput" style="width: 33%;">
						<label>车辆唯一编号：</label>${carorderDetail.skucode}
					</div>
				</div>
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<c:forEach items="${carsourceFile1 }" var="items">
							<div class="swiper-slide">
								<img alt="" src="${ftpFileUrl}${items.picurl}">
							</div>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
				<h4
					style="padding: 8px 0; font-size: 30px; float: left; margin-left: 375px; margin-top: -300px;">${carsource.brand }&nbsp;${carsource.model }&nbsp;${carsource.version }</h4>
				<div class="form-inline" style="float: left; margin-left: 300px; margin-top: -250px;">
					<div class="form-group newInput" style="width: 12%;">
						<label>车身价：</label>${orderDetail.carprice}&nbsp;${carorderDetail.unit }
					</div>
					<div class="form-group newInput" style="width: 400px;">
						<label>商品总价：</label>${totalprice}
					</div>
					<br>
					<div class="form-group newInput" style="width: 12%;">
						<label>加装：</label>${orderDetail.decorateprice}
					</div>
					<div class="form-group newInput" style="width: 12%;">
						<label>数量：</label>1
					</div>
					<br>
				</div>
				<div class="form-inline">
					<div class="form-group newInput" style="width: 12%;color: red;">
						<label>①购车定金：</label>待支付
					</div>
					<br>
					<div class="form-group newInput" style="width: 12%;">
						<label>②当地杂费：</label>待支付
					</div>
					<br>
					<div class="form-group newInput" style="width: 12%;">
						<label>③海运费用：</label>待支付
					</div>
					<br>
					<div class="form-group newInput" style="width: 12%;">
						<label>④报关费用：</label>待支付
					</div>
					<br>
					<div class="form-group newInput" style="width: 12%;">
						<label>⑤提车尾款：</label>待支付
					</div>
				</div>
				<input type="hidden" id="currpage" name="currpage" value="${currpage}">
				<input type="hidden" id="code" name="code" value="${carorderDetail.subordercode}">
				<h4 style="padding: 8px 0; font-size: 20px;color: red;float: left; margin-left: 355px; margin-top: -220px;">预计支付当地杂费：${incidentals }&nbsp;${carorderDetail.unit }</h4>
				<form name="editForm" id="editForm" method="POST"
					action="<ufa:url namespace="car-ms" fieldName="UPDATE_CAR_MODEL"/>"
					enctype="multipart/form-data" style="float: left; margin-left: 400px; margin-top: -180px;">
					<div class="form-inline">
					<input name="id" type="hidden" value="${carorderDetail.id }">
					<input name="status" value="2" hidden>
					<div class="form-group newInput" style="width: 500px;">
						<label>实际收款币种：</label>
						<input type="radio" value="1" name="currency" checked="checked" onchange="currencyunit1()">人民币
						<input type="radio" value="2" name="currency" onchange="currencyunit1()" style="margin-left: 20px;" >当地货币
					</div><br>
					<div class="form-group newInput" style="width: 500px;">
						<label>实际到账金额：</label><input type="text" class="input_text01" name="receivedmoney" id="receivedmoney" >
					</div><br>
					<div id="exchangeRate" class="form-group newInput" style="width: 500px;">
						<label>汇率：</label><input type="text" class="input_text01" readonly name="rate" id="rate" value="${site.exchangerate }" >
					</div>
				</div>
				</form>
				<div>
				<div>
					<div class="form-inline">
					<div class="form-group newInput" style="width: 12%;">
						<label>操作人：</label>${name}
					</div>
				</div>
					<div class="form-inline" style="float: left;margin-left: 400px;margin-top: -45px;">
					<div class="form-group newInput" style="width: 12%;">
						<label>操作时间：</label>${time}
					</div>
				</div>
				<div class="du-btn">
					<a href="javascript:;" class="btn btn-danger" role="button" style="padding: 6px 30px"
						onclick="save()">确定</a>
					<a href="javascript:;" class="btn btn-warning" role="button" style="padding: 6px 30px"
						onclick="back()">返回</a>
				</div>
			</div>
		</div>
	</div>
</body>

<script language="javascript" >

function back(){
	window.history.go(-1);
	location.href=$('#backUrl').val()+"?currpage="+$('#currpage').val()+"&code="+$('#code').val();
}
function save(){
	var reg = /(^\-?[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^\-?(0){1}$)|(^\-?[0-9]\.[0-9]([0-9])?$)/;
	var currencyunit=$('input[name="currency"]:checked').val();
	if(currencyunit==2){//当地货币时清空当地货币符号还汇率
		$("#rate").val("");
	}
	if(!reg.test($('#receivedmoney').val())){
		alert("实际到账金额格式不正确！");
		return false;
	}
	var saveUrl=$('#saveUrl').val();
	$.ajax({
	    url: saveUrl,
	    type: 'POST',
	    cache: false,
	    data:new FormData($('#editForm')[0]),
	    processData: false,
	    contentType: false
	}).done(function(data) {
		if(data.status){
			alert("保存成功！")
			location.href=$('#backUrl').val()+"?currpage="+$('#currpage').val()+"&code="+$('#code').val();
		}else{
			alert(data.msg);
		}
	})  
}
function currencyunit1(){
	var currencyunit=$('input[name="currency"]:checked').val();
	if(currencyunit==1){
		document.getElementById("exchangeRate").style.display="block";
	}else if(currencyunit==2){
		document.getElementById("exchangeRate").style.display="none";
	}
}
	var mySwiper = new Swiper('.swiper-container', {
		/*   pagination : '.swiper-pagination', */
		autoplay : 5000,//可选选项，自动滑动
		//pagination : '#swiper-pagination1',
		paginationClickable : true,
		prevButton : '.swiper-button-prev',
		nextButton : '.swiper-button-next',
	})
</script>
</html>