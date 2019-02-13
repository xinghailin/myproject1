<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="taskUrl" value="<ufa:url fieldName="CAR_MOVEW_SHOP_VERIFY_AUDIT" namespace="car-ms"/>">
<input id="taskListUrl" type="hidden" value="<ufa:url namespace="car-ms" fieldName="SNAKER_TASK_LIST_PAGE"/>">
<div class="mian_right-new" id="EA" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He">车辆移库-门店确认（车辆到店）</h1>
		<div class="tb_list">
		<form name="editForm" id="editForm" method="POST" action="">
		    <input type="hidden" name="processId" value="${processId }" />
			<input type="hidden" name="orderId" value="${orderId }" />
			<input type="hidden" name="taskId" value="${taskId }" />
			<input type="hidden" name="applyId" value="${applyId }" />
			<input type="hidden" name="carId" value="${carInfo.cId }" />
			<input type="hidden" id="shopId" name="shopId" value="${shop.id }" />
			<input type="hidden" id="method" name="method" value="1" />
			<input type="hidden" id="carAddress" name="carAddress" value="${shop.address }" />
			
			<h2>物流任务：车辆已送达，等待门店确认</h2>
			<div style="display:inline;margin-left:20px;height:74px;width: 150px;">
			  <textarea readonly="readonly" style="resize:none;font: 15px;line-height:65px;vertical-align:middle;height:74px;width: 150px;cursor:pointer;">接受任务开始物流</textarea>
			</div>
			<div style="display:inline;margin-left:220px;width: 150px;">
			  <textarea readonly="readonly" style="resize:none;font: 15px;line-height:65px;vertical-align:middle;height:74px;width: 150px;cursor:pointer;">运送到店，确认送达</textarea>
			</div>
			<div style="display:inline;margin-left:250px;width: 150px;">
			  <textarea readonly="readonly" style="resize:none;color:red;font: 15px;line-height:65px;vertical-align:middle;height:74px;width: 150px;cursor:pointer;">*门店确认，任务完成</textarea>
			</div>
		<ul class="tb_ul02">
		
		<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">车辆所在地址：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.carAddress }&nbsp;</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">目的地：</span>
		  	  	<span style="line-height: 35px;width:200px;">${shop.address }&nbsp;</span>
		  	  	
			 </div>
		</li>
		
		<li>
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
		  	  <%-- 	<span class="td_01" style="width: 120px;">长宽高：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.lwh }&nbsp;</span> --%>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">车辆出厂日期：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.lfDate}&nbsp;</span>
		  	  	
		  	  <%-- 	<span class="td_01" style="width: 120px;">排量：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.displaceMent }&nbsp;</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">工信部综合耗油：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.oil }&nbsp;</span> --%>
		  	  		<span class="td_01" style="width: 120px;">外观颜色：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.outColor }&nbsp;</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">内饰颜色：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.innerColor }&nbsp;</span>	
			 </div>
		   	</li>
		
		<%-- <li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">排放：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.discharge }&nbsp;</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">整体质量：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.weight }&nbsp;</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">车身级别：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.cLevel }&nbsp;</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">变速箱：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.gearbox }</span>
			 </div>
		   	</li> --%>
		   			   	
		   	
		  <%--  	<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">车辆能源类型：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.energyType }&nbsp;</span>
		  	  	
		  	  	  	  	
			 </div>
		   	</li>
		   	 --%>
		   	
		  <li>
		  	  <div class="tab_txt01">
		  	   	<span class="td_01" style="width: 120px;">采购商名称：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.buyName }&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">采购价：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.buyPrice }&nbsp;元</span>
		  	  	<span class="td_01" style="width: 120px;">成本价：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.lowPrice }&nbsp;元</span>
		  	  		<span class="td_01" style="width: 120px;">销售价：</span>
		  	  	<span style="line-height: 35px;width:200px;">${carInfo.sellerprice }&nbsp;元</span>
		  	  		
			 </div>
		   	</li><li>
		  	  <div class="tab_txt01">
		  	  	
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
		   	    <span class="td_01" style="width: 240px;">移库原因：</span>
		   	    <textarea style="margin-left:100px;background-color: #ccc;" cols="80" rows="3"  placeholder="请填写移库原因" readonly="readonly"  name="remark" id="remark">${moveReason }</textarea>
		      </div>
		   	</li>
		   	
		   	<!-- <li>
		   	  <div class="tab_txt01">
		   	    <span class="td_01" style="width: 240px;">操作类型：</span>
		   	    <input type="radio" id="method" name="method" value="1" style="margin-top:10px;" />&nbsp;&nbsp;审核通过&nbsp;&nbsp;&nbsp;&nbsp;
		   	    <input type="radio" id="method" name="method" value="0" style="margin-top:10px;" />&nbsp;&nbsp;审核不通过
		      </div>
		   	</li> -->
		   	
		   	<!-- <li>
		   	  <div id="noApprove" class="tab_txt01" style="display:none;">
		   	    <input type="hidden" id="method" name="method" value="1" />
		   	    <span class="td_01" style="width: 240px;">请填写审核不通过原因：</span>
		   	    <textarea style="margin-left:100px" cols="80" rows="3"  placeholder="请填写审核不通过原因"   name="reason" id="reason"></textarea>
		      </div>
		   	</li> -->
		</ul>
		
		</form>
		</div>
		<div class="btnlist">
			<div style="width: 500px; margin: auto;">
				<a href="javascript:void(0);" class="btn63_01" id="btnOk">确认车辆到店</a>
				<a id='backBtn' href="javascript:history.back();"  class="btn63_02 margin_let10">返回上一页</a>
			</div>
		</div>
	</div>		
</div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/controlRepository/car_trans_begin_audit.js?r=<%=new Date()%>");
</script>
