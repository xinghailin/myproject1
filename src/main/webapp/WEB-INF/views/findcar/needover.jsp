<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="saveUrl" value="<ufa:url fieldName="needblsave" namespace="car-ms"/>">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="needbilllist" namespace="car-ms"/>">
<input id="currpage" type="hidden" value='${currpage}'/>
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 120%;">
<div class="rg_list">
<div class="tb_list" >
<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="needblsave"/>">
<input id="currpage" type="hidden" name="currpage" value='${currpage}'/>
<li style="margin-top: 10px;">
<div class="tab_txt01" >
<span style="position: relative ;left:35px;"><font size="4">客户需求单</font></span>
</div>
<input id="needid" name="needid" type="hidden" value='${need.id}'/>
<div class="tab_txt01">
<span class="td_01" style="width: 120px;">姓名：</span>
<span style="line-height: 35px;width:300px;">${need.name}&nbsp;</span>
<span class="td_01" style="width: 120px;">手机号：</span>
<span style="line-height: 35px;width:300px;">${need.tel}&nbsp;</span>
<span class="td_01" style="width: 120px;">地区：</span>
<span style="line-height: 35px;width:300px;">${need.city}&nbsp;</span>
</div>
<div class="tab_txt01">
 	  <span class="td_01" style="width: 120px;">品牌车系：</span>
<span style="line-height: 35px;width:300px;">${need.brand}&nbsp;${need.model}&nbsp;${need.version}</span>
<span class="td_01" style="width: 120px;">提车时间：</span>
<span style="line-height: 35px;width:300px;">
<fmt:formatDate value="${need.takecartime}" pattern="yyyy-MM-dd"/>&nbsp;</span>
<span class="td_01" style="width: 120px;">是否置换：</span>
<span style="line-height: 35px;width:300px;">${need.ischange eq '1'?'是':'否'}&nbsp;</span>
</div>
<div class="tab_txt01">
<span class="td_01" style="width: 120px;">是否需要金融服务：</span>
<span style="line-height: 35px;width:300px;">${need.isfinance eq '1'?'是':'否'}&nbsp;</span>
<span class="td_01" style="width: 120px;">加装需求：</span>
<span style="line-height: 35px;width:300px;">${need.decorate}&nbsp;</span>
<span class="td_01" style="width: 120px;">发起时间：</span>
<span style="line-height: 35px;width:300px;"><fmt:formatDate value="${need.createtime}" pattern="yyyy-MM-dd"/>&nbsp;</span>
</div>
</li>
<li>
<div class="tab_txt01" >
<span style="position: relative;left:35px;"><font size="4">采购单</font></span>
</div>
<div class="tab_txt01" >
 	  <span class="td_01" style="width: 120px;">品牌车系：</span>
<span style="line-height: 35px;width:300px;">${need.brand}&nbsp;${need.model}&nbsp;${need.version}</span>
</div><input id="buybillid" name="buybillid" type="hidden" value='${purchase.id}'/>
<div class="tab_txt01">
	<span class="td_01" style="width: 120px;">车辆情况：</span><span
style="margin-top: 10px;">	
<input type="radio"  name="nowhave" value="1" <c:if test="${purchase.nowhave eq '1' or empty purchase.nowhave}">checked="checked"</c:if>/>现车
<input type="radio"  name="nowhave" value="2" <c:if test="${purchase.nowhave eq '2'}">checked="checked"</c:if>/>期货&nbsp;</span><span
style="line-height: 35px;margin-top: 4px;height: 30px;">
<input type="text"  name="futuretime" id="futuretime" placeholder="期货时间" <c:if test="${purchase.nowhave eq '1' or empty purchase.nowhave}">style="display: none;"</c:if> value="<fmt:formatDate value="${purchase.futuretime}" pattern="yyyy-MM-dd"/>"/></span>
</span></div>
<div class="tab_txt01">
	<span class="td_01" style="width: 120px;">裸车价：</span><span
class="td_02" style="margin-top: 4px;">
<input type="text"  name="bodyprice" id="bodyprice" value="${ob.bodyprice}"/>元</span>
</div>
<div class="tab_txt01">
	<span class="td_01" style="width: 120px;">服务费票点：</span> <span
class="td_02" style="margin-top: 4px;">	
<input type="text"  name="tpprice" id="tpprice" value="${ob.tpprice}"/>元</span>
</div>
<div class="tab_txt01">
	<span class="td_01" style="width: 120px;">中文系统：</span><span
class="td_02" style="margin-top: 4px;">
<input type="text"  name="cnsystem" id="cnsystem" value="${ob.cnsystem}"/>元</span>
</div>
<div class="tab_txt01">
	<span class="td_01" style="width: 120px;">加装费用：</span><span
class="td_02" style="margin-top: 4px;">
<input type="text"  name="decorateprice" id="decorateprice" value="${ob.decorateprice}"/>元</span>
</div>
<div class="tab_txt01">
	<span class="td_01" style="width: 120px;">采购报价有效期：</span> <span
class="td_02" style="margin-top: 4px;">	
<input type="text" name="validtime" id="validtime" value="<fmt:formatDate value="${purchase.validtime}" pattern="yyyy-MM-dd"/>"/></span>
</div>
<div class="tab_txt01">
	<span class="td_01" style="width: 120px;">中间商：</span> <span
class="td_02" style="margin-top: 11px;">	
<input type="radio"  name="middleman" value="1" <c:if test="${purchase.middleman eq '1' or empty purchase.middleman}">checked="checked"</c:if>/>无
<input type="radio"  name="middleman" value="2" <c:if test="${purchase.middleman eq '2'}">checked="checked"</c:if>/>有</span>
</div>
<div class="tab_txt01" <c:if test="${purchase.middleman eq '1' or empty purchase.middleman}">style="display: none;"</c:if> id="qudaofei">
<span class="td_01" style="width: 120px;">渠道费：</span> <span
class="td_02" style="margin-top: 4px;">
<input type="text"  name="channelprice" id="channelprice" value="${ob.channelprice}"/>元</span>
</div>
<div class="tab_txt01">
	<span class="td_01" style="width: 120px;">供应商名称：</span> <span
class="td_02" style="margin-top: 4px;">
<input type="text"  name="supplyname" id="supplyname" value="${purchase.supplyname}"/></span>
</div>
<div class="tab_txt01">
	<span class="td_01" style="width: 120px;">区域定价：</span> <span
class="td_02" style="margin-top: 4px;">
<input type="text"  name="areaprice" id="areaprice" value="${ob.areaprice}"/>元</span>
		</div>
</li>
</form>
</div>
</div>
<div class="btnlist" style="margin-bottom: 20px;">
<div style="width: 400px; margin: auto;">
		<a href="javascript:void(0);" id="btnBack" class="btn63_01">返回</a>
	</div>
</div>
<script type="text/javascript">
seajs.use("${scriptBasePath}/findcar/needdeal.js?r=<%=new Date()%>");
</script>