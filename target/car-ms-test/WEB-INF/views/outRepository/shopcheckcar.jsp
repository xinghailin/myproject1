<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="SNAKER_TASK_LIST_PAGE" namespace="car-ms"/>">
<input type="hidden" id="auditUrl" value="<ufa:url fieldName="SNAKER_CLIENTCHECKCARDO" namespace="car-ms"/>">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="COMMU_LISTDO" namespace="car-ms"/>">
<input type="hidden" id="realsaleUrl" value="<ufa:url fieldName="CAR_ASSET_LST_REALSALE_FORCHOOSE" namespace="car-ms"/>">
<input type="hidden" id="stepflow" value="2">
<div class="mian_right-new" id="EA">
	<div class="rg_list">
		<h1 class="tt_h1" id="He">客户验车</h1>
		<div class="tb_list">
		<ul class="tb_ul02">
		<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="SNAKER_CLIENTCHECKCARDO"/>">
		<input id="orderId" name="orderId" type="hidden" value='${orderId}'/>
		<input id="taskId" name="taskId" type="hidden" value='${taskId}'/>
		<input id="carId" name="carId" type="hidden" value='${car.id}'/>
		<input id="infoId" name="infoId" type="hidden" value='${buyer.id}'/>
		<input id="contractId" name="contractId" type="hidden" value='${contract.id}'/>
		<input id="startUserId" name="startUserId" type="hidden" value='${startUserId}'/>
		<li>
		  	<div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;font-weight: bold;">客户信息表</span>
			</div>
		</li>
		<li>
		  	<div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">门店名称：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.shopName}&nbsp;</span>
			</div>
		</li>
		<li>
		  	  <div class="tab_txt01">
				<span class="td_01" style="width: 120px;">档案编号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.infoNum}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">客户类别：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.workType eq '1'?'个人':'单位'}&nbsp;</span>
			 </div>
		   	</li>
		<c:if test="${buyer.workType eq '1'}">
		<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">客户姓名：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.name}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">客户身份证：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.identify}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">联系电话：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.phone}&nbsp;</span>
			 </div>
		   	</li></c:if><c:if test="${buyer.workType eq '2'}">
		<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">单位名称：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.companyName}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">营业执照号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.bizLicense}&nbsp;</span>
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">负责人姓名：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.name}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">负责人电话：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.phone}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">进店日期：</span>
		  	  	<span style="line-height: 35px;width:300px;"><fmt:formatDate pattern="yyyy-MM-dd" 
            value="${buyer.comeshopTime}" />&nbsp;</span>
			 </div>
		   	</li>
		   	</c:if>
		<li>
		  	  <div class="tab_txt01">
		  	  	
		        <span class="td_01" style="width: 120px;">意向品牌：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.wantBrand}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">意向车型：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.wantcar}&nbsp;</span>
		  	  	 <span class="td_01" style="width: 120px;">意向版别：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.version}&nbsp;</span>
			 </div>
		   	</li>
		<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">心里价位：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.heartPrice}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">配置/颜色：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.color}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">现有交通工具：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.nowCar}&nbsp;</span>
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">熟客介绍：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.oldIntroduce}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">可用牌照：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.haveCard}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">客户级别：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.clientLevel}&nbsp;</span>
			 </div>
		   	</li>
		<li>
		  	  <div class="tab_txt01" style="">
		  	  	<span class="td_01" style="width: 120px;font-weight: bold;">沟通详情</span></div></li>
		<li>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无沟通详情。</p>
		</div>
		   	</li>
		<li>
		  	<div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;font-weight: bold;">车辆销售合同</span>
						
			</div>
		</li>
		<li>
		  	<div class="tab_txt01">
		  	  	
		  	  	<span class="td_01" style="width: 120px;">甲方（卖方）：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.parta}&nbsp;</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">住所（地址）：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.addressa}&nbsp;</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">邮政编码：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.postcodea}&nbsp;</span>
  	  			
  	  		</div>
  	  	</li>
  	  	<li>
  	  			<div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">联系电话：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.phonea}&nbsp;</span>
		  	  	
		        
			 </div>
		</li>
		
		<li>
		  	  <div class="tab_txt01">
		  	  
		  	  	<span class="td_01" style="width: 120px;">乙方（买方）：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.buyerName}&nbsp;</span>
		        
		  	  	<span class="td_01" style="width: 120px;">住所（地址）：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.addressb}&nbsp;</span>
		        
		        <span class="td_01" style="width: 120px;">邮政编码：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.postcodeb}&nbsp;</span>
		 	</div>
		 </li>     
		 <li>
		  	  	<div class="tab_txt01">  
		        <span class="td_01" style="width: 120px;">联系电话：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.phone}&nbsp;</span>
		        
		        <span class="td_01" style="width: 120px;">证件类型：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.idenType}&nbsp;</span>
		        
		        <span class="td_01" style="width: 120px;">证件号码：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.idenCode}&nbsp;</span>
		  	</div>
		 </li> <li>
		  	  <div class="tab_txt01"> 	
		  	  	<span class="td_01" style="width: 120px;">身份证号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.identify}&nbsp;</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">委托代理人：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.agent}&nbsp;</span>
		  	  	
		        <span class="td_01" style="width: 120px;">联系电话：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.agentPhone}&nbsp;</span>
		       
			 </div>
		   	</li>
		
		<li>
		  	  <div class="tab_txt01"><span class="td_01" style="width: 120px;">车辆信息</span>
		  	  </div>
		   	</li><li>
		  	  <div class="tab_txt01">
		  	 
		  	  	<span class="td_01" style="width: 120px;">车辆品牌：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.brand}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">车辆型号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.model}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">车辆版别：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.version}&nbsp;</span>
			 </div>
		   	</li><li>
		  	  <div class="tab_txt01">
		  	   
		  	  	  <span class="td_01" style="width: 120px;">发动机号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.engineNum}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">车架号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.vin}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">长宽高：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.lenWidHei}&nbsp;</span>
		  	  	
		        
			 </div>
		   	</li><li>
		  	  <div class="tab_txt01">
		  	  <span class="td_01" style="width: 120px;">出厂日期：</span>
		  	  	<span style="line-height: 35px;width:300px;"><fmt:formatDate pattern="yyyy-MM-dd" 
            value="${car.leaveFactoryTime}" />&nbsp;</span>
		  	   <span class="td_01" style="width: 120px;">排量：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.displacement}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">工信部综合油耗：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.oilWear}&nbsp;</span>
		  	  	
		        
			 </div>
		   	</li><li>
		  	  <div class="tab_txt01">
		  	  <span class="td_01" style="width: 120px;">排放：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.discharge}&nbsp;</span>
		  	   <span class="td_01" style="width: 120px;">整体质量：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.weight}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">车身级别：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.level}&nbsp;</span>
		  	  
		        
			 </div>
		   	</li><li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">变速箱：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.gearbox}&nbsp;</span>
		  	   <span class="td_01" style="width: 120px;">车辆能源类型：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.energyType}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">外观颜色：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.outlookColor}&nbsp;</span>
		  	  	
		        
			 </div>
		   	</li><li>
		  	  <div class="tab_txt01">
		  	  <span class="td_01" style="width: 120px;">内饰颜色：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.innerColor}&nbsp;</span>
		  	   <span class="td_01" style="width: 120px;">采购价：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.buyPrice}&nbsp;元</span>
		        <span class="td_01" style="width: 120px;">采购商名称：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.buyName}&nbsp;</span>
		  	  
		        
			 </div>
		   	</li><li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">仓库地点：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.address}&nbsp;</span>
		  	  <span class="td_01" style="width: 120px;">销售价：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.sellerprice}&nbsp;元</span>
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
			  </li><li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">车辆销售价：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.salePrice}&nbsp;元</span>
		  	  	<span class="td_01" style="width: 120px;">定金金额：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.downpay}&nbsp;元</span>
			 </div>
		   	</li>
		   	
		   	<%-- <li>
		  	  <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;">保险费：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.insurePrice}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">购置税：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.buyTax}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">上牌费：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.cardPrice}&nbsp;</span>
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;">质保费：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.qualityguarPrice}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">延保费：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.delayguarPrice}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">装潢费：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.decoratePrice}&nbsp;</span>
			 </div>
		   	</li> 
		   	
		   	<li>
		  	  <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;">合同补充条款：</span>
		  	  	<span style="line-height: 35px;width:300px;"><textarea style="margin-left:100px;background-color: #ccc;" cols="60" rows="3"  value="" readonly="readonly">${contract.otherCont}</textarea>&nbsp;</span>
			 </div>
		   	</li>--%>
		   	<li>
		  	  <div class="tab_txt01"><span class="td_01" style="width: 120px;">验车结果：</span>
		  	  <span style="line-height: 35px;width:300px;">
				<input type="radio" name="pass" value="1"  checked="checked"/>通过
		  	  	<input type="radio" name="pass" value="2" />不通过&nbsp;</span>
		  	  	<div id="nopasstypediv" style="display: none;">
		  	  	<span class="td_01" style="width: 120px;">不通过类型：</span>
		  	  	<span style="line-height: 35px;">
				<input type="radio" name="nopasstype" value="1"  checked="checked"/>换车&nbsp;&nbsp;车架号：
				<input type="hidden" id="changeCarId" name="changeCarId" value="" />
				<input type="text" id="changeCarVin"  name="changeCarVin" value="" readonly="readonly" style="width:250px;" placeholder="请勿手填，选完车车架号自动填充"/>
				<a id="chooseBtn" class="btn63_01" href="javascript:void(0);">选车</a>
		  	  	<input type="radio" name="nopasstype" value="2" />退定金&nbsp;&nbsp;退款原因：
		  	  	<textarea cols="25" rows="2" name="refundReason" id="refundReason"></textarea>
		  	  	</span></div>
		  	  </div>
		   	</li>
		  </form>
		</ul>
		</div>
		<div class="btnlist">
		<div style="width: 300px; margin: auto;"><a href="javascript:void(0);" class="btn63_01" id="saveBtn">提交验车结果</a>
		<a id='backBtn' href="javascript:history.back();" class="btn63_02 margin_let10">返回</a>
		</div>
		</div>
	</div>		
</div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center">沟通内容</th>
            <th style="text-align:center">时间</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{content}}</td>
            <td>{{_formatDatetime createTime}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/outRepository/shopcheckcar.js?r=<%=new Date()%>");
</script>
