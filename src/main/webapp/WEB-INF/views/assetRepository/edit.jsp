<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="checkUrl" value="<ufa:url fieldName="CAR_PARAM_CHECK" namespace="car-ms"/>">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="CAR_ASSET_LST_EDIT" namespace="car-ms"/>">
<input type="hidden" id="saveUrl" value="<ufa:url fieldName="CAR_EDIT" namespace="car-ms"/>">
<input type="hidden" id="modelUrl" value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="versionUrl" value="<ufa:url fieldName="QUERY_VERSION" namespace="car-ms"/>">
<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
		<ul class="tb_ul02">
		<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="CAR_EDIT_SAVE"/>" enctype="multipart/form-data">
		<input id="currpage" type="hidden" name="currpage" value='${currpage}'/>
		<input type="hidden" id="id" name="id" value="${car.id}" />
		<li>
		  	  <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>品牌：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.brand}</span>
		  	  	
		  	  	 <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>型号：</span>
		       <span style="line-height: 35px;margin-top: 8px;width:300px;"> 
		  	  	<select id="model" name="model" style="line-height: 35px;width:156px;">
		  	  	<option value=''>--请选择--</option>
		  	  	 <c:forEach var="item" items="${model}">  
			             <option value="<c:out value="${item.model}"></c:out>" <c:if test="${item.model eq car.model}">selected="selected"</c:if>><c:out value="${item.model}"></c:out></option>
			           </c:forEach>
		          </select>
		          </span>
		  	  	
		  	  	 <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>版别：</span>
		       <span style="line-height: 35px;margin-top: 8px;width:300px;"> 
		  	  	<select id="version" name="version" style="line-height: 35px;width:156px;">
		  	  	<option value=''>--请选择--</option>
		  	  	<c:forEach var="item" items="${version}">
			             <option value="<c:out value="${item.version}"></c:out>" <c:if test="${item.version eq car.version}">selected="selected"</c:if>><c:out value="${item.version}"></c:out></option>
			           </c:forEach>
		          </select>
		          </span>
			 </div>
		   	</li>
		<li>
		  	  <div class="tab_txt01">
		  	  <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>车架号：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="vin" name="vin" value="${car.vin}"  width="280px"/>&nbsp;</span>
		  	  	
		  	  <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>发动机号：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="engineNum" name="engineNum" value="${car.engineNum}"  width="280px"/>&nbsp;</span>
			    
		  	  	 <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>出厂日期：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="leaveFactoryTime" name="leaveFactoryTime" 
		  	  	value="<fmt:formatDate pattern="yyyy-MM-dd" value="${car.leaveFactoryTime}" />" />&nbsp;</span>
		   		
		  	  	</div>
		   	</li>
		   	
		   	<li><div class="tab_txt01">
		   	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>采购日期：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="purchaseTime" name="purchaseTime" 
		  	  	value="<fmt:formatDate pattern="yyyy-MM-dd" value="${car.purchaseTime}" />" />&nbsp;</span>
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>外观颜色：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="outlookColor" name="outlookColor" value="${car.outlookColor}" />&nbsp;</span>
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>内饰颜色：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="innerColor" name="innerColor" value="${car.innerColor}" />&nbsp;</span>
		     	
		   	</div>
		   	</li>
		   	<li><div class="tab_txt01">
		   	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>可售：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="realSale" name="realSale" value="${car.realSale}" />&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>采购价(元)：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="buyPrice" name="buyPrice" value="${car.buyPrice}" />&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>成本价(元)：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="lowPrice" name="lowPrice" value="${car.lowPrice}" />&nbsp;</span>
		  	  	
			 </div>
		   	</li>
		   	<li>
		   	<div class="tab_txt01">
		   	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>销售价(元)：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="sellerprice" name="sellerprice" value="${car.sellerprice}" />&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>结算价(元)：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="typeinsettleprice" name="typeinsettleprice" value="${car.typeinsettleprice}" />&nbsp;</span>
		  	  	<span class="td_01" style="width: 130px;margin-left: -10px;"><label class="fc_red">*</label>采购金融结算价(元)：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="purchasesettlementprice" name="purchasesettlementprice" value="${car.purchasesettlementprice}" />&nbsp;</span>
		   	
		        </div>
		   	</li>
		   	<li>
		   	<div class="tab_txt01">
		   	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>采购商名称：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="buyName" name="buyName" value="${car.buyName}" />&nbsp;</span>
		   	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>原始地址：</span>
		        <span style="line-height: 35px;width:300px;">${st.name }
		  	  	 <%--  <select id="address" name="address" style="">
			           <c:forEach var="item" items="${storeLst}">  
			             <input value="${item.id}" <c:if test="${item.id == car.address}">selected='selected'</c:if>>${item.name}</option>
			           </c:forEach>
		          </select> --%>
		        </span>
		   	  <%-- <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>车辆所在地：</span>
		        <span style="line-height: 35px;margin-top: 8px;width:300px;">
		  	  	 <select id="address" name="address" style="width:150px;">
			           <c:forEach var="item" items="${storeLst}">  
			             <option  value="${item.id}" <c:if test="${item.id == car.storeId}">selected='selected'</c:if>>${item.name}</option>
			           </c:forEach>
		          </select>
		        </span> --%>
		   	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>采购人：</span>
		        <span style="line-height: 35px;margin-top: 8px;width:300px;">
		  	  	  <select id="buyerName" name="buyerName" style="">
			           <c:forEach var="item" items="${user}">  
			             <option value="${item.name}" <c:if test="${item.name eq car.buyerName}">selected='selected'</c:if> >${item.name}</option>
			           </c:forEach>
		          </select>
		        </span>
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>配置：</span>
		  	  	<span style="width:300px;">
		  	  	<textarea style="" cols="18" rows="3"  placeholder=""  name="config" id="config" value="">${car.config}</textarea>&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>备注：</span>
		  	  	<span style="width:300px;">
		  	  	<textarea style="" cols="18" rows="3"  placeholder=""  name="decorate" id="decorate" value="">${car.decorate}</textarea>&nbsp;</span>
			 </div>
		   	</li>
		<li style="width:20%; float:left;">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.iden1}" style="width:100px;height:100px;" id="productImg1">
			  		</span>
			  	</div>
			  		<div class="tab_txt01" id="divPL">		  	   
			  		<span class="td_02" style="margin-left:20px"><label class="fc_red">*</label>关单<br/>
			  		  <input type="file" name="iden1" id="iden1" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg1')"/></span>&nbsp;
			  		
			  	</div>
			  </li>
			  
			  <li style="width:20%; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.iden2}" style="width:100px;height:100px;" id="productImg2">
			  		</span>
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
			  		  <img src="${contextPath}${car.iden3}" style="width:100px;height:100px;" id="productImg3">
			  		</span>
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
			  		  <img src="${contextPath}${car.iden5}" style="width:100px;height:100px;" id="productImg5">
			  		</span>
			  	</div>
			  		<div class="tab_txt01" id="divPD">		  	   
			  		<span class="td_02" style="margin-left:20px"><label class="fc_red">*</label>车辆一致性证书(反面)<br/>
			  		  <input type="file" name="iden5" id="iden5" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg5')"/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			  <li style="width:20%; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.iden4}" style="width:100px;height:100px;" id="productImg4">
			  		</span>
			  	</div>
			  		<div class="tab_txt01" id="divPD">		  	   
			  		<span class="td_02" style="margin-left:20px">环保清单<br/>
			  		  <input type="file" name="iden4" id="iden4" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg4')"/>&nbsp;
			  		</span>
			  	</div>
			  </li>
		  </form>
		</ul>
		</div>
		<div class="btnlist">
		<div style="width: 200px; margin: auto;margin-top:80px;"><a href="javascript:void(0);" class="btn63_01" id="saveBtn">保存</a>
		<a id='backBtn' href="javascript:void(0);" class="btn63_02 margin_let10">返回</a>
		</div>
		</div>
	</div>		
</div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/assetRepository/edit.js");
</script>
