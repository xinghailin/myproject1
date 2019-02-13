<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="needbilllistQuery" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="editneedbill" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;">
	<div class="rg_list">
		<div class="tb_list" >
		  <form name="searchForm" id="searchForm">	    
			<ul class="tb_ul02" >
				<li >
				 <div class="tab_txt01" >
				  <span style="position: relative ;left:35px;"><font size="5">客户需求</font></span>
			</div>
				 <div class="tab_txt01" >
		  	   <span class="td_01" style="width: 120px;">客户需求车辆：</span>
		  	  	<span style="line-height: 35px;width:300px;">品牌：${need.brand}&nbsp;${need.model}&nbsp;${need.version}</span>
			 </div>
				<div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">加装&nbsp;&nbsp;需求：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.decorate}&nbsp;</span>
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">提车&nbsp;&nbsp;时间：</span>
		  	  	<span style="line-height: 35px;width:300px;">
		  	  	<fmt:formatDate value="${need.takecartime}" pattern="yyyy-MM-dd"/>&nbsp;</span>
			 </div>
				</li>
			</ul>
			<li>
				 <div class="tab_txt01" >
				  <span style="position: relative ;left:35px;"><font size="5">采购报价单</font></span>
			</div>
			 <div class="tab_txt01" >
		  	   <span class="td_01" style="width: 120px;">客户需求车辆：</span>
		  	  	<span style="line-height: 35px;width:300px;">${need.brand}&nbsp;${need.model}&nbsp;${need.version}</span>
			 </div>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">车辆&nbsp;&nbsp;情况：</span> <span
								class="td_02" style="margin-top: 8px;">	
						<input type="radio"  name="nowhave" value="1"/>现车&nbsp;
		  	             <input type="radio"  name="nowhave" value="2"/>期货&nbsp;</span>
		  	               <input type="text"  name="futuretime" id="futuretime" value="期货时间"/>
						</div>
						
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">裸车&nbsp;&nbsp;&nbsp;价：</span> <span
								class="td_02" style="margin-top: 8px;">	</span>
		  	               <input type="text"  name="bodyprice" id="bodyprice"/>
						</div>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">服务费&nbsp;票点：</span> <span
								class="td_02" style="margin-top: 8px;">	
						<input type="radio"  name="ticketpoint" value="1"/>无&nbsp;
		  	             <input type="radio"  name="ticketpoint" value="2"/>有&nbsp;</span>
		  	               <input type="text"  name="tpprice" id="tpprice" />元
						</div>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">中文&nbsp;&nbsp;系统：</span> <span
								class="td_02" style="margin-top: 8px;">	</span>
		  	               <input type="text"  name="cnsystem" id="cnsystem"/>
						</div>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">加装&nbsp;&nbsp;费用：</span> <span
								class="td_02" style="margin-top: 8px;">	</span>
		  	               <input type="text"  name="decorateprice" id="decorateprice"/>
						</div>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">采购报价有效期：</span> <span
								class="td_02" style="margin-top: 8px;">	</span>
		  	               <input type="text"  name="validtime" id="validtime"/>
						</div>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">中间&nbsp;&nbsp;&nbsp;商：</span> <span
								class="td_02" style="margin-top: 8px;">	
						<input type="radio"  name="middleman" value="1"/>否&nbsp;
		  	             <input type="radio"  name="middleman" value="2"/>是&nbsp;</span>
						</div>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">渠道&nbsp;&nbsp;&nbsp;费：</span> <span
								class="td_02" style="margin-top: 8px;">	</span>
		  	               <input type="text"  name="channelprice" id="channelprice"/>
						</div>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">供应商&nbsp;名称：</span> <span
								class="td_02" style="margin-top: 8px;">	</span>
		  	               <input type="text"  name="supplyname" id="supplyname"/>
						</div>
				</li>
			</form>
</div>
</div>
<div class="btnlist" style="margin-bottom: 20px;">
				<div style="width: 400px; margin: auto;">
					<a href="javascript:void(0);" id="btnSearch" class="btn63_01">保存</a>
					<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">返回</a>
				</div>
			</div>
<script type="text/javascript">
seajs.use("${scriptBasePath}/findcar/needbilladd.js?r=<%=new Date()%>");
</script>
