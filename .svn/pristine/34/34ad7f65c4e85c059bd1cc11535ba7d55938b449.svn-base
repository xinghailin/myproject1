<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="SHOP_CARS" namespace="car-ms"/>">
<input type="hidden" id="checkUrl" value="<ufa:url fieldName="UPDATE_CAR_STATUS" namespace="car-ms"/>">
<input id="currpage" type="hidden" value='${currpage}'/>
<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="UPDATE_CAR_STATUS"/>" enctype="multipart/form-data">
		<div class="tb_list">
		<ul class="tb_ul02">
		<li>
		  	  <div class="tab_txt01">
		  	  <input type="hidden" id="id" name="id" value="${car.id}" />
		  	   <input type="hidden" id="shopId" name="shopId" value="${car.shopId}" />
		  	  <span class="td_01" style="width: 120px;">品牌：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.brand}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">型号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.model}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">车架号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.vin}&nbsp;</span>
			 </div>
		   	</li>
		<li>
		  	  <div class="tab_txt01">
		  	  <span class="td_01" style="width: 120px;">发动机号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.engineNum}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">长宽高：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.lenWidHei}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">排量：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.displacement}&nbsp;</span>
			 </div>
		   	</li>
		<li>
		  	  <div class="tab_txt01">
		  	  <span class="td_01" style="width: 120px;">工信部综合油耗：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.oilWear}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">排放：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.discharge}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">整体质量：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.weight}&nbsp;</span>
			 </div>
		   	</li>
		<li>
		  	  <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;">外观颜色：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.outlookColor}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">内饰颜色：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.innerColor}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">车身级别：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.level}&nbsp;</span>
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;">变速箱：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.gearbox}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">能源类型：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.energyType}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">出厂日期：</span>
		  	  	<span style="line-height: 35px;width:300px;"><fmt:formatDate pattern="yyyy-MM-dd" value="${car.leaveFactoryTime}" />&nbsp;</span>
			 </div>
		   	</li>
		<li>
		  	  <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;">采购价：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.buyPrice}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">最低销售价：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.lowPrice}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">采购商名称：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.buyName}&nbsp;</span>
			 </div>
		   	</li>
		<li>
		  	  <div class="tab_txt01">
		  	  <span class="td_01" style="width: 120px;">采购商名称：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.buyName}&nbsp;</span>
		       <span class="td_01" style="width: 120px;">仓库：</span> 
		       <span style="line-height: 35px;width:300px;">
				<select id="address" name="address" style="width:100px;">
			           <c:forEach var="item" items="${storeLst}">  
			             <option value="<c:out value="${item.id}"></c:out>"><c:out value="${item.name}"></c:out></option>
			           </c:forEach>
		          </select>
								</span>
		        <span class="td_01" style="width: 120px;">加装：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.decorate}&nbsp;</span>
			 </div>
		   	</li>
		<li style="width:240px; float:left;">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.iden1}" style="width:100px;height:100px;" id="productImg1">
			  		</span>
			  	</div><div class="tab_txt01">		  	   
			  		<span class="td_02" style="margin-left:90px">关单<br/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			  <li style="width:240px; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.iden2}" style="width:100px;height:100px;" id="productImg2">
			  		</span>
			  	</div><div class="tab_txt01">		  	   
			  		<span class="td_02" style="margin-left:90px">商检单<br/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			  <li style="width:240px; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.iden3}" style="width:100px;height:100px;" id="productImg3">
			  		</span>
			  	</div><div class="tab_txt01">		  	   
			  		<span class="td_02" style="margin-left:90px">车辆一致性证书(正面)<br/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			   <li style="width:240px; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.iden5}" style="width:100px;height:100px;" id="productImg3">
			  		</span>
			  	</div><div class="tab_txt01">		  	   
			  		<span class="td_02" style="margin-left:90px">车辆一致性证书(反面)<br/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			  <li style="width:240px; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.iden4}" style="width:100px;height:100px;" id="productImg4">
			  		</span>
			  	</div><div class="tab_txt01">		  	   
			  		<span class="td_02" style="margin-left:90px">环保清单<br/>&nbsp;
			  		</span>
			  	</div>
			  </li>
		</ul>
		</div>
		<div class="btnlist">
		<div style="width: 450px; margin: auto;margin-top:80px;">
		<a href="javascript:void(0);"  onclick="mysubmit()" class="btn63_01" id="yesBtn">审核通过车辆入库</a>
		 <a href="${contextPath}/shop/cars?shopId=${car.shopId}"  class="btn63_01" id="yesBtn">返回</a>
		</div>
		</div>
		 </form>
	</div>		

<script type="text/javascript">

function mysubmit()
{
  document.getElementById("editForm").submit();
};
function imagePreview(obj,imgObj){
	var f = obj[0];
	var src = window.URL.createObjectURL(f);
	$('#'+imgObj).attr('src',src) ;
}
   /*  seajs.use("${scriptBasePath}/assetRepository/audit.js?r=${ts}"); */
</script>
