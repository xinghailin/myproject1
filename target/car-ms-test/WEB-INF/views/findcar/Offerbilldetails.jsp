<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="queryOfferbillpage" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="editneedbill" namespace="car-ms"/>">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;">
	<div class="rg_list">
		<div class="tb_list" >
		<ul class="tb_ul02" >
				<li >
		 <div style="text-align:center;">
				  <span style="position: relative ;left:35px;"><font size="5">客户报价单</font></span>
			</div>
			</li>
			<input id="currpage" type="hidden" value="${currpage }"/>
				</ul>
		  <form name="searchForm" id="searchForm">	    
		<c:if test="${need.status ==2}">
			<ul class="tb_ul02" >
				<li >		
 				 <div class="tab_txt01" >
				  <span style="position: relative ;left:35px;"><font size="5">全款报价</font></span>
			</div>
			 <div class="tab_txt01" >
		  	   <span class="td_01" style="width: 120px;">客户姓名：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.supplyname}</span>
			 </div>
			  <div class="tab_txt01" >
		  	   <span class="td_01" style="width: 120px;">客户电话：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.color}</span>
			 </div>
				 <div class="tab_txt01" >
		  	   <span class="td_01" style="width: 120px;">客户需求：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.brand}&nbsp;${need.model}&nbsp;${need.version}</span>
			 </div>
				<div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">加装需求：</span><span style="line-height: 35px;">${need.createman}</span></div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">报&nbsp;&nbsp;价：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.offerprice}
		  	  	</span>
			 </div>
			  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">报价有效期：</span>
		  	  	<span style="line-height: 35px;width:300px;"><fmt:formatDate value="${need.createtime}" pattern="yyyy-MM-dd"/>&nbsp;</span>
			 </div>
					</li>
					</ul>
					</c:if>
						<c:if test="${need.status ==1}">
			<ul class="tb_ul02" >
				<li >	
			<div style="float: left;width: 50%">
				 <div class="tab_txt01" >
				  <span style="position: relative ;left:35px;"><font size="5">全款报价</font></span>
			</div>
			 <div class="tab_txt01" >
		  	   <span class="td_01" style="width: 120px;">客户姓名：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.supplyname}</span>
			 </div>
			  <div class="tab_txt01" >
		  	   <span class="td_01" style="width: 120px;">客户电话：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.color}</span>
			 </div>
				 <div class="tab_txt01" >
		  	   <span class="td_01" style="width: 120px;">客户需求：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.brand}&nbsp;${need.model}&nbsp;${need.version}</span>
			 </div>
				<div class="tab_txt01">

		  	   <span class="td_01" style="width: 120px;">加装需求：</span><span style="line-height: 35px;">${need.createman}</span></div>

			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">报&nbsp;&nbsp;价：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.offerprice}
		  	  	</span>
			 </div>
			  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">报价有效期：</span>
		  	  	<span style="line-height: 35px;width:300px;"><fmt:formatDate value="${need.createtime}" pattern="yyyy-MM-dd"/>&nbsp;</span>
			 </div>
			 </div>
					<div style="float: right;width: 50%">
				<div class="tab_txt01" >
				  <span style="position: relative ;left:35px;"><font size="5">金融报价</font></span>
			</div>
				 <div class="tab_txt01" >
		  	   <span class="td_01" style="width: 120px;">客户姓名：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.supplyname}</span>
			 </div>
			  <div class="tab_txt01" >
		  	   <span class="td_01" style="width: 120px;">客户电话：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.color}</span>
			 </div>
				 <div class="tab_txt01" >
		  	  <span class="td_01" style="width: 120px;">客户需求：</span>
		  	  <span style="line-height: 35px;width:300px;">${need.brand}&nbsp;${need.model}&nbsp;${need.version}</span>
			 </div>
				<div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">加装需求：</span><span style="line-height: 35px;">${need.createman}</span>
			 </div>
			 
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">金融本金：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.profit}</span>
			 </div>
			  <div class="tab_txt01" >
		  	   <span class="td_01" style="width: 120px;">第1月月供：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.firstmonthpay}</span>
			 </div>
			  <div class="tab_txt01" >
		  	   <span class="td_01" style="width: 120px;">第2至12月每月供：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.everymonthpay}</span>
			 </div>
			 <div class="tab_txt01" >
		  	   <span class="td_01" style="width: 120px;">第13月月供：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.channelprice}</span>
			 </div>
			  <div class="tab_txt01" >
		  	   <span class="td_01" style="width: 120px;">第14至48月每月供：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.decorateprice}</span>
			 </div>
			  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">报价有效期：</span>
		  	  	<span style="line-height: 35px;width:300px;"><fmt:formatDate value="${need.createtime}" pattern="yyyy-MM-dd"/>&nbsp;</span>
			 </div>
				</div>
				</li>
					</ul>
					</c:if>
				</form>
					</div>
				</div>
 					<div class="btnlist" style="margin-bottom: 20px;">
				<div style="width: 400px; margin: auto;">
					<a href="javascript:void(0);" onclick="back()" class="btn63_01">返回</a>
				</div>
			</div>
<script type="text/javascript">
function back(){
	location.href=$("#searchUrl").val()+"?currpage="+$('#currpage').val();
}

</script>
