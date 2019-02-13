<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="SNAKER_TASK_LIST_PAGE" namespace="car-ms"/>">
<%-- <input type="hidden" id="backUrl" value="<ufa:url fieldName="CLIENT_INFO_INDEX" namespace="car-ms"/>">
<input type="hidden" id="auditUrl" value="<ufa:url fieldName="HQAUDIT" namespace="car-ms"/>"> --%>
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="COMMU_LISTDO" namespace="car-ms"/>">
<div class="mian_right-new" id="EA">
	<div class="rg_list">
		<h1 class="tt_h1" id="He">准备出库材料</h1>
		<div class="tb_list">
		<ul class="tb_ul02">
		<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="SNAKER_MATIERALDO"/>" enctype="multipart/form-data">
		<input id="orderId" name="orderId" type="hidden" value='${orderId}'/>
		<input id="taskId" name="taskId" type="hidden" value='${taskId}'/>
		<input id="carId" name="carId" type="hidden" value='${carId}'/>
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
		  	  	<span style="line-height: 35px;width:300px;">${buyer.name}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">营业执照号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.bizLicense}&nbsp;</span>
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">负责人姓名：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.principal}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">负责人电话：</span>
		  	  	<span style="line-height: 35px;width:300px;">${buyer.phone}&nbsp;</span>
			 </div>
		   	</li>
		   	</c:if>
		<li>
		  	  <div class="tab_txt01">
		  	  <span class="td_01" style="width: 120px;">进店日期：</span>
		  	  	<span style="line-height: 35px;width:300px;"><fmt:formatDate pattern="yyyy-MM-dd" 
            value="${buyer.comeshopTime}" />&nbsp;</span>
		  	   </div>
		   	</li>
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
		  	  	<span class="td_01" style="width: 120px;font-weight: bold;">车辆详情</span></div></li>
		  	  	<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">车辆品牌：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.brand}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">车辆型号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.model}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">车辆版别：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.version}&nbsp;</span>
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">发动机号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.engineNum}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">车架号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.vin}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">出厂日期：</span>
		  	  	<span style="line-height: 35px;width:300px;"><fmt:formatDate pattern="yyyy-MM-dd" 
               value="${car.leaveFactoryTime}" />&nbsp;</span></span>
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">外观颜色：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.outlookColor}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">内饰颜色：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.innerColor}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">采购商名称：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.buyName}&nbsp;</span></span>
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
		  	  	<span class="td_01" style="width: 120px;font-weight: bold;">准备车辆出库材料</span>
			</div>
		</li>
		<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 200px;"><input type="checkbox" id="cb1" name="manual" value="1">保养手册</span>
		  	  	<span class="td_01" style="width: 200px;"><input type="checkbox" id="cb2" name="carKey" value="1">车钥匙</span>
		  	  	<span class="td_01" style="width: 200px;"><input type="checkbox" id="cb3" name="threeIden" value="1">车辆三证</span>
		  	  	<span class="td_01" style="width: 200px;"><input type="checkbox" id="cb4" name="threeBill" value="1">三联发票</span>
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		  	  <c:if test="${not empty contract.insurePrice}">
		  	  	<span class="td_01" style="width: 200px;"><input type="checkbox" id="cb5" name="carGuar" value="1">车辆保单</span></c:if>
		  	  	<c:if test="${not empty contract.buyTax}">
		  	  	<span class="td_01" style="width: 200px;"><input type="checkbox" id="cb6" name="buytaxBill" value="1">购置税发票</span></c:if>
		  	  	<c:if test="${not empty contract.cardPrice}">
		  	  	<span class="td_01" style="width: 200px;"><input type="checkbox" id="cb7" name="productLicense" value="1">车辆产证</span>
		  	  	<span class="td_01" style="width: 200px;"><input type="checkbox" id="cb8" name="card" value="1">牌照</span></c:if>
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01"><c:if test="${not empty contract.cardPrice}">
		  	  	<span class="td_01" style="width: 200px;"><input type="checkbox" id="cb9" name="bill" value="1">牌照发票</span></c:if><c:if test="${not empty contract.qualityguarPrice}">
		  	  	<span class="td_01" style="width: 200px;"><input type="checkbox" id="cb10" name="qualityGuar" value="1">质保单</span></c:if><c:if test="${not empty contract.delayguarPrice}">
		  	  	<span class="td_01" style="width: 200px;"><input type="checkbox" id="cb11" name="delayGuar" value="1">延保保单</span></c:if><c:if test="${not empty contract.decoratePrice}">
		  	  	<span class="td_01" style="width: 200px;"><input type="checkbox" id="cb12" name="configBill" value="1">配置清单</span></c:if>
			 </div>
		   	</li>
		  </form>
		</ul>
		</div>
		<div class="btnlist">
		<div style="width: 300px; margin: auto;"><a href="javascript:void(0);" class="btn63_01" id="saveBtn">客户提车车辆出库</a>
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
    seajs.use("${scriptBasePath}/outRepository/matieral.js?r=<%=new Date()%>");
</script>
