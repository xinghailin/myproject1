<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="CONTROL_REPOSITORY_LIST_PAGE" namespace="car-ms"/>">
<div class="mian_right-new" id="EA">
	<div class="rg_list">
		<h1 class="tt_h1" id="He">填写客户信息表</h1>
		<div class="tb_list">
		<ul class="tb_ul02">
		<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="CLIENT_INFO_SUBMIT"/>" enctype="multipart/form-data">
		<input id="shopId" type="hidden" name="shopId" value='${shopId}'/>
		<input id="carId" type="hidden" name="carId" value='${carId}'/>
		<input id="filenum" type="hidden" name="filenum" value='${filenum}'/>
		<input id="id" type="hidden" name="id" value='${id}'/>
		<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 100px;">门店名称：</span>
		  	  	<span style="line-height: 35px;width:240px;"><input type="hidden" id="shopName" name="shopName" value="${shop.name}" />${shop.name}&nbsp;</span>
			 </div>
		   	</li>
		<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 100px;">档案编号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${filenum}&nbsp;</span>
		        <span class="td_01" style="width: 100px;"><label class="fc_red">*</label>客户姓名：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="name" name="name" value="" />&nbsp;</span>
		        <span class="td_01" style="width: 100px;"><label class="fc_red">*</label>客户身份证：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="identify" name="identify" value="" />&nbsp;</span>
		        
			 </div>
		   	</li>
		
		<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 100px;"><label class="fc_red">*</label>联系电话：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="phone" name="phone" value="" />&nbsp;</span>
		  	  	<span class="td_01" style="width: 100px;"><label class="fc_red">*</label>进店日期：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="comeshopTime" name="comeshopTime" value="" />&nbsp;</span>
		        <span class="td_01" style="width: 100px;">客户类别：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="radio"  name="workType" value="个人"  checked="checked"/>个人
		  	  	<input type="radio"  name="workType" value="单位" />单位&nbsp;</span>
		        
			 </div>
		   	</li>
		
		<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 100px;">单位名称：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="companyName" name="companyName" value="" />&nbsp;</span>
		        <!-- <span class="td_01" style="width: 100px;">意向车型：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="wantcar" name="wantcar" value="" />&nbsp;</span> -->
		        <span class="td_01" style="width: 100px;">配置/颜色：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="color" name="color" value="" />&nbsp;</span>
			 </div>
		   	</li>
		<li>
		  	  <div class="tab_txt01">
		        <span class="td_01" style="width: 100px;">车辆用途：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="radio" name="usefor" value="个人"  checked="checked"/>个人
		  	  	<input type="radio"  name="usefor" value="单位" />单位&nbsp;</span>
		        <span class="td_01" style="width: 100px;">现有交通工具：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="radio" name="nowCar" value="首次购车"  checked="checked"/>首次购车
		  	  	<input type="radio"  name="nowCar" value="添置" />添置
		  	  	<input type="radio"  name="nowCar" value="置换" />置换&nbsp;</span>
			 </div>
		   	</li>
		  </form>
		</ul>
		</div>
		<div class="btnlist">
		<div style="width: 400px; margin: auto;"><a href="javascript:void(0);" class="btn63_01" id="saveBtn">下一步</a>
		<a id='resetBtn' href="javascript:void(0);" class="btn63_02 margin_let10">重置</a>
		<a id='backBtn' href="javascript:void(0);" class="btn63_01 margin_let10">返回</a>
		</div>
		</div>
	</div>		
</div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/outRepository/clientinfo.js?r=<%=new Date()%>");
</script>
