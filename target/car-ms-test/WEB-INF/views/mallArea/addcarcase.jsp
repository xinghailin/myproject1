<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
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
<script src="${scriptBasePath}/base/swiper-3.4.2.min.js"></script>
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<input type="hidden" id="currpage" name="currpage" value="${currpage}">
<input type="hidden" id="node" value="${node}">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="financialselectcar" namespace="car-ms"/>">
<input type="hidden" id="realsaleUrl" value="<ufa:url fieldName="carrealsalechoose" namespace="car-ms"/>">
<input type="hidden" id="contractUrl" value="<ufa:url fieldName="bizquerycontractbyid" namespace="car-ms"/>">
</head>
<style>
.swiper-container {
	width: 300px;
	height: 300px;
	background: #ddd;
	margin-left: 0px;
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
				<h3 class="title">海运费审核</h3>
				<div class="form-inline">
					<div class="form-group newInput" style="width: 33%;"><label>海外直采合同编号：</label>${co.name}</div>
					<div class="form-group newInput" style="width: 33%;"><label>用户账号：</label>${co.address}</div> <br>
					<div class="form-group newInput" style="width: 33%;"><label>订单编号：</label>${co.principle}</div>
					<div class="form-group newInput" style="width: 33%;"><label>车辆唯一编号：</label>${co.phone}</div>
			</div>
				<div class="swiper-container">
					<div class="swiper-wrapper"><c:forEach items="${list }" var="items">
							<div class="swiper-slide"><img alt="" src="${ftpFileUrl}${items.logourl}"></div>
						</c:forEach></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
			</div>
				<h4 style="padding: 8px 0; font-size: 30px; float: left; margin-left: 310px; margin-top: -300px;">品牌+型号+版本</h4>
				<div class="form-inline" style="float: left; margin-left: 300px; margin-top: -250px;">
					<div class="form-group newInput" style="width: 12%;"><label>车身价：</label>${co.name}</div>
					<div class="form-group newInput" style="width: 12%;"><label>加装：</label>${co.address}</div> <br>
					<div class="form-group newInput" style="width: 12%;"><label>商品价格：</label>${co.principle}</div>
					<div class="form-group newInput" style="width: 12%;"><label>定金：</label>${co.phone}</div> <br>
					<div class="form-group newInput" style="width: 12%;"><label>数量：</label>1</div>
			</div>
				<div class="form-inline">
					<div class="form-group newInput" style="width: 12%;"><label>①购车定金：</label>已支付</div> <br>
					<div class="form-group newInput" style="width: 12%;"><label>②当地杂费：</label>已支付</div> <br>
					<div class="form-group newInput" style="width: 12%; color: red;"><label>③海运费用：</label>待支付</div> <br>
					<div class="form-group newInput" style="width: 12%;"><label>④报关费用：</label>待支付</div> <br>
					<div class="form-group newInput" style="width: 12%;"><label>⑤提车尾款：</label>待支付</div>
			</div>
				<h4 style="padding: 8px 0; font-size: 20px; color: red; float: left; margin-left: 400px; margin-top: -220px;">预计支付海运费：海运费+海运保险</h4>
				<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="UPDATE_CAR_MODEL"/>" enctype="multipart/form-data"
				style="float: left; margin-left: 400px; margin-top: -180px;">
					<div class="form-inline">
						<div class="form-group newInput" style="width: 500px;"><label>实际收款币种：</label> <input type="radio" value="1" name="currencyunit" onchange="currencyunit1(this)">人民币
							<input type="radio" value="2" name="currencyunit" onchange="currencyunit1(this)" style="margin-left: 20px;">当地货币</div>
					<br>
						<div class="form-group newInput" style="width: 500px;"><label>实际到账金额：</label><input type="text" class="input_text01"></div> <br>
						<div id="exchangeRate" class="form-group newInput" style="width: 500px;"><label>汇率：</label><input type="text" class="input_text01"></div>
				</div>
			</form>
				<div class="form-inline">
					<div class="form-group newInput" style="width: 12%;"><label>操作人：</label></div>
			</div>
				<div class="form-inline" style="float: left; margin-left: 400px; margin-top: -45px;">
					<div class="form-group newInput" style="width: 12%;"><label>操作时间：</label></div>
			</div>
				<div class="du-btn"><a href="javascript:;" class="btn btn-danger" role="button" style="padding: 6px 30px" id="saveBtn">确定</a> <a href="javascript:;"
					class="btn btn-warning" role="button" style="padding: 6px 30px" id="backBtn">返回</a></div>
		</div>
	</div>
</div>
</body>
<script language="javascript">
	function currencyunit1(){
		var currencyunit=$('input[name="currencyunit"]:checked').val();
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
	paginationClickable:true,prevButton:'.swiper-button-prev',nextButton:'.swiper-button-next',})
</script>
</html>