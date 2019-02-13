<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="addUrl" value="<ufa:url fieldName="CONTROL_REPOSITORY_CAR_MOVE_APPLY" namespace="car-ms"/>">
<input type="hidden" id="listUrl" value="<ufa:url fieldName="CONTROL_REPOSITORY_LIST_PAGE" namespace="car-ms"/>">
<div class="mian_right-new" id="EA" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He">车辆移库-门店提出申请</h1>
		<div class="tb_list">
		<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="CONTRACT_SUBMIT"/>" enctype="multipart/form-data">
		  <input type="hidden" id="cId" name="cId" value="${carInfo.cId }" />
		  <input type="hidden" id="shop_id" value="${shop.id }" />
		<ul class="tb_ul02">
		
		<li><input id="currpage" value="${currpage }" name="currpage" type="hidden"/>
		   	  <div class="tab_txt01"><span class="td_01" style="width: 120px;font-weight: bold;">门店信息</span></div>
		   	</li>
		
		<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">门店名称：</span>
		  	  	<span style="line-height: 35px;width:200px;">${shop.name }&nbsp;</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">门店地址：</span>
		  	  	<span style="line-height: 35px;width:200px;">${shop.address }&nbsp;</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">门店电话：</span>
		  	  	<span style="line-height: 35px;width:200px;">${shop.tel }&nbsp;</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">负责人：</span>
		  	  	<span style="line-height: 35px;width:200px;">${shop.principal }&nbsp;</span>
			 </div>
		   	</li>
		   	
		   	<li>
		   	  <div class="tab_txt01"><span class="td_01" style="width: 120px;font-weight: bold;">车辆信息</span></div>
		   	</li>
		   	
		<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">车辆品牌：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.brand }&nbsp;</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">车辆型号：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.model }&nbsp;</span>
		  	  	
		  	  		<span class="td_01" style="width: 120px;">车辆版别：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.version }&nbsp;</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">发动机号：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.enginNum }&nbsp;</span>
		  	  	
		  	  
			 </div>
		   	</li>
		
		
		
		   			   	
		   	
		   	<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">车架号：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.vin }&nbsp;</span>
		  	   <span class="td_01" style="width: 120px;">车辆出厂日期：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.lfDate}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">采购日期：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.purchaseTime}&nbsp;</span>
		  	  		
		  	  	<span class="td_01" style="width: 120px;">外观颜色：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.outColor }&nbsp;</span>
		  	  
		  	  	
			 </div>
		   	</li>
		   	
		   	
		  <li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">内饰颜色：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.innerColor }&nbsp;</span>		
		  	  <span class="td_01" style="width: 120px;">采购价：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.buyPrice }&nbsp;元</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">成本价：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.lowPrice }&nbsp;元</span>
		  	  	<span class="td_01" style="width: 120px;">销售价：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.sellerprice }&nbsp;元</span>
			 </div>
		   	</li><li>
		  	  <div class="tab_txt01">
		  	  <span class="td_01" style="width: 120px;">采购商名称：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.buyName }&nbsp;</span>  	  	
		  	  	<span class="td_01" style="width: 120px;">仓库地点：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.storeAddress }&nbsp;</span>
		        <span class="td_01" style="width: 120px;">加装：</span>
		  	  	<span style="line-height: 35px;width:300px;">${carInfo.decorate}&nbsp;</span>
			 </div>
		   	</li>
		   	<li style="width:240px; float:left;">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${carInfo.IDEN1}" style="width:100px;height:100px;" id="productImg1">
			  		</span>
			  	</div><div class="tab_txt01">		  	   
			  		<span class="td_02" style="margin-left:90px">关单<br/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			  <li style="width:240px; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${carInfo.IDEN2}" style="width:100px;height:100px;" id="productImg2">
			  		</span>
			  	</div><div class="tab_txt01">		  	   
			  		<span class="td_02" style="margin-left:90px">商检单<br/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			  <li style="width:240px; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${carInfo.IDEN3}" style="width:100px;height:100px;" id="productImg3">
			  		</span>
			  	</div><div class="tab_txt01">		  	   
			  		<span class="td_02" style="margin-left:90px">车辆一致性证书(正面)<br/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			  <li style="width:240px; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${carInfo.iden5}" style="width:100px;height:100px;" id="productImg3">
			  		</span>
			  	</div><div class="tab_txt01">		  	   
			  		<span class="td_02" style="margin-left:90px">车辆一致性证书(反面)<br/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			  <li style="width:240px; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${carInfo.IDEN4}" style="width:100px;height:100px;" id="productImg4">
			  		</span>
			  	</div><div class="tab_txt01">		  	   
			  		<span class="td_02" style="margin-left:90px">环保清单<br/>&nbsp;
			  		</span>
			  	</div>
			  </li>
		   	<li>
		   	  <div class="tab_txt01">
		   	    <span class="td_01" style="">移库原因：</span>
		   	    <textarea style="margin-left:100px" cols="80" rows="3"  placeholder="请填写移库原因"  name="remark" id="remark"></textarea>
		      </div>
		   	</li>
		</ul>
		
		</form>
		</div>
		<div class="btnlist">
		<div style="width: 300px; margin: auto;"><a href="javascript:void(0);" class="btn63_01" id="addBtn">提交审核</a>
		<a id='backBtn' href="javascript:history.back();"  class="btn63_02 margin_let10">返回上一页</a>
		</div>
		</div>
	</div>		
</div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/controlRepository/apply.js?r=<%=new Date()%>");
</script>
