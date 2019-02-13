<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="checkUrl" value="<ufa:url fieldName="CAR_PARAM_CHECK" namespace="car-ms"/>">
<input type="hidden" id="BondedWarehouseEntryListPage" value="<ufa:url fieldName="BondedWarehouseEntryListPage" namespace="car-ms"/>">
<input type="hidden" id="tempsaveUrl" value="<ufa:url fieldName="jndtempsavecar" namespace="car-ms"/>">
<input type="hidden" id="templstUrl" value="<ufa:url fieldName="tempsavecarListPage" namespace="car-ms"/>">
<input id="hideMsg" type="hidden" value='${message}'/>
<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
		<ul class="tb_ul02">
		<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="jndcartypein"/>" enctype="multipart/form-data">
		<li>
		  <div class="tab_txt01">
		<input type="hidden"  name="carss" value="1"  width="280px"/>
		<input type="hidden"  name="carid" value="${car.id }"  width="280px"/>
		<input type="hidden" id="currpage" name="currpage" value="${currpage }"  width="280px"/>
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>品牌：</span>
		  	  	<span style="line-height: 35px;margin-top: 8px;width:230px;"> 
		  	  	<input type="text"  name="brand" value="${car.brand }"  width="280px"/>
		          </span>
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>型号：</span>
		       <span style="line-height: 35px;margin-top: 8px;width:230px;"> 
		  	  	<input type="text"  name="model" value="${car.model }"  width="280px"/>
		          </span>
		           <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>版别：</span>
		       <span style="line-height: 35px;margin-top: 8px;width:230px;"> 
		  	  	<input type="text"  name="version" value="${car.version }"  width="280px"/>
		          </span>
		           <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>车架号：</span>
		  	  <span style="line-height: 35px;width:230px;"><input type="text" name="vin" value="${car.vin }"  width="280px"/>&nbsp;</span>
			 </div>
		   	</li>
		<li>
		  	  <div class="tab_txt01">
		  	  <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>发动机号：</span>
		  	  	<span style="line-height: 35px;width:230px;"><input type="text" id="engineNum" name="engineNum" value="${car.enginenum }"  width="280px"/>&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>出厂日期：</span>
		  	  	<span style="line-height: 35px;width:230px;"><input type="text" id="leaveFactoryTime" name="leaveFactoryTime" 
		  	  	value="<fmt:formatDate pattern="yyyy-MM-dd" value="${car.leavefactime}" />" />&nbsp;</span>
		   		<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>采购日期：</span>
		  	  	<span style="line-height: 35px;width:230px;"><input type="text" id="purchaseTime" name="purchaseTime" 
		  	  	value="<fmt:formatDate pattern="yyyy-MM-dd" value="${car.purchasetime}" />" />&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>外观颜色：</span>
		  	  	<span style="line-height: 35px;width:230px;"><input type="text" id="outlookColor" name="outlookColor" value="${car.outcolor }" />&nbsp;</span>
			 </div>
		   	</li>
		<li>
		  	  <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>内饰颜色：</span>
		  	  	<span style="line-height: 35px;width:230px;"><input type="text" id="innerColor" name="innerColor" value="${car.incolor }" />&nbsp;</span>
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>可售：</span>
		  	  	<span style="line-height: 35px;width:230px;"><input type="text" id="realSale" name="realSale" placeholder="是可售填1,否则不填" value="${car.realsale}" />&nbsp;</span>
		       <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>采购价(元)：</span>
		  	  	<span style="line-height: 35px;width:230px;"><input type="text" id="buyPrice" name="buyPrice" value="${car.price }" />&nbsp;</span>
		  	  		<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>成本价(元)：</span>
		  	  	<span style="line-height: 35px;width:270px;"><input type="text" id="lowPrice" name="lowPrice" value="${car.costprice }" />&nbsp;<c:if test="${car.status1!=2 }"><label style="color: red;">未加运费申请价格</label></c:if> </span>
			 </div>
	</li>
		   	<li><div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>销售价(元)：</span>
		  	  	<span style="line-height: 35px;width:230px;"><input type="text" id="sellerprice" name="sellerprice" value="${car.sellerprice}" />&nbsp;</span>
		   	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>采购商名称：</span>
		  	  	<span style="line-height: 35px;width:230px;"><input type="text" id="buyName" name="buyName" value="${car.buyername }" />&nbsp;</span>
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>原始地址：</span>
		        <span class="" style="margin-top: 8px;width:230px;">
		  	  	  <select id="address" name="address" style="width:159px">
			           <c:forEach var="item" items="${storeLst}">  
			            <option value="<c:out value="${item.id}"></c:out>" <c:if test="${item.id ==car.address}">selected="selected"</c:if>><c:out value="${item.name}"></c:out></option>
			           </c:forEach>
		          </select>
		        </span>
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>车辆所在地：</span>
		        <span class="" style="margin-top: 8px;width:230px;">
		  	  	  <select id="energyType" name="energyType" style="width:159px">
			           <c:forEach var="item" items="${shop}">  
			             <option value="<c:out value="${item.id}"></c:out>"<c:if test="${item.id ==car.energytype}">selected="selected"</c:if>><c:out value="${item.name}"></c:out></option>
			           </c:forEach>
		          </select>
		        </span>
			 </div>
		   	</li>
		   	<li><div class="tab_txt01">
		   	 <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>采购人：</span>
		        <span class="" style="margin-top: 8px;width:230px;">
		  	  	  <select id="buyerName" name="buyerName " style="width:159px">
			           <c:forEach var="item" items="${user}">  
			             <option value="<c:out value="${item.name}"></c:out>"<c:if test="${item.name ==car.buyeruser}">selected="selected"</c:if>><c:out value="${item.name}"></c:out></option>
			           </c:forEach>
		          </select>
		        </span>
		   	 <span class="td_01" style="width: 120px;">备注：</span>
		  	  	<span style="width:230px;">
		  	  	<textarea  cols="40" rows="3"  placeholder=""  name="decorate" id="decorate" value="">${car.decorate}</textarea></span>
		   	 </div>
		   	</li>
		<li style="width:20%; float:left;">
			  	<div class="tab_txt01">	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.niden1}" style="width:100px;height:100px;" id="productImg1">
			  		</span>
			  	</div><input type="hidden" name="iden11" id="iden11" value="${car.niden1}">
			  		<div class="tab_txt01" id="divPL">		  	   
			  		<span class="td_02" style="margin-left:20px"><label class="fc_red">*</label>关单<br/>
			  		  <input type="file" name="iden1" id="iden1" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg1')"/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			  
			  <li style="width:20%; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.niden2}" style="width:100px;height:100px;" id="productImg2">
			  		</span><input type="hidden" name="iden22" id="iden22"  value="${car.niden2}">
			  	</div>
			  		<div class="tab_txt01" id="divPD">		  	   
			  		<span class="td_02" style="margin-left:20px"><label class="fc_red">*</label>商检单<br/>
			  		<input type="file" name="iden2" id="iden2" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg2')"/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			  <li style="width:20%; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.niden3}" style="width:100px;height:100px;" id="productImg3">
			  		</span><input type="hidden" name="iden33" id="iden33"  value="${car.niden3}">
			  	</div>
			  		<div class="tab_txt01" id="divPD">		  	   
			  		<span class="td_02" style="margin-left:20px"><label class="fc_red">*</label>车辆一致性证书(正面)<br/>
			  		  <input type="file" name="iden3" id="iden3" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg3')"/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			    <li style="width:20%; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.niden5}" style="width:100px;height:100px;" id="productImg5">
			  		</span><input type="hidden" name="iden55" id="iden55"  value="${car.niden5}">
			  	</div>
			  		<div class="tab_txt01" id="divPD">		  	   
			  		<span class="td_02" style="margin-left:20px">车辆一致性证书(反面)<br/>
			  		  <input type="file" name="iden5" id="iden5" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg5')"/></span>&nbsp;
			  		</span>
			  	</div>
			  </li>
			  <li style="width:20%; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.niden4}" style="width:100px;height:100px;" id="productImg4">
			  		</span><input type="hidden" name="iden44" id="iden44"  value="${car.niden4}">
			  	</div>
			  		<div class="tab_txt01" id="divPD">		  	   
			  		<span class="td_02" style="margin-left:20px"><label class="fc_red">*</label>环保清单<br/>
			  		  <input type="file" name="iden4" id="iden4" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg4')"/></span>&nbsp;
			  		</span>
			  	</div>
			  </li>
		  </form>
		</ul>
		</div>
		<div class="btnlist">
		<div style="width: 500px; margin: auto;margin-top:80px;">
		<a href="javascript:void(0);" class="btn63_01" id="tempsaveBtn">待入中国库</a>
		<a href="javascript:void(0);" class="btn63_01" id="saveBtn">提交审核</a>
		<a id='resetBtn' href="javascript:void(0);" class="btn63_02 margin_let10">重置</a>
		<a id='backjnd' href="javascript:void(0);" class="btn63_01">返回</a>
		</div>
	</div>
</div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jndAssetlibrarylist/typein.js?r=<%=new Date()%>");
</script>
