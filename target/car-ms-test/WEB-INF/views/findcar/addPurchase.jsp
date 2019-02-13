<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input type="hidden" id="modelUrl" value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="versionUrl" value="<ufa:url fieldName="QUERY_VERSION" namespace="car-ms"/>">
<input id="hideMsg" type="hidden" value='${message}'/>
<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
		<ul class="tb_ul02">
		<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="addPurchaseBill"/>" enctype="multipart/form-data">
		<li>
<div class="tab_txt01">
<span class="td_01" style="width: 120px;margin-top: 8px;"><label class="fc_red">*</label>品牌首字母：</span>
<span class="" style="line-height: 35px;margin-top: 8px;">
<select id="brandinitial" name="brandinitial" style="line-height: 35px;width:150px;height: 38px;">
<option value="">--请选择--</option>
<c:forEach var="item" items="${brand}">  
<option value="<c:out value="${item.brandinitial}"></c:out>"><c:out value="${item.brandinitial}"></c:out></option>
</c:forEach>
</select>
</span></div>
<div class="tab_txt01">
<span class="td_01" style="width: 120px;margin-top: 8px;"><label class="fc_red">*</label>品&nbsp;&nbsp;&nbsp;牌：</span>
<span style="line-height: 35px;margin-top: 8px;"> 
<select id="brand" name="brand" style="line-height: 35px;width:150px;height: 38px;">
</select>
</span></div>
<div class="tab_txt01">
<span class="td_01" style="width: 120px;margin-top: 8px;"><label class="fc_red">*</label>型&nbsp;&nbsp;&nbsp;号：</span>
<span style="line-height: 35px;margin-top: 8px;width:400px;"> 
<select id="model" name="model" style="line-height: 35px;width:150px;height: 38px;">
</select>
</span></div>
<div class="tab_txt01">
<span class="td_01" style="width: 120px;margin-top: 8px;"><label class="fc_red">*</label>版&nbsp;&nbsp;&nbsp;别：</span>
<span style="line-height: 35px;margin-top: 8px;">
<select id="version" name="version" style="line-height: 35px;width:150px;height: 38px;">
</select>
</span> 
</div>
<div class="tab_txt01">
<div >
<span class="td_01" style="width: 120px;margin-top: 4px;">车辆&nbsp;情况：</span>
<span class="td_02" style="margin-top: 14px;">	
<input type="radio"  name="nowhave" value="1" onclick="document.getElementById('gmwp').style.display='none'; document.getElementById('gmwp').value=''" checked />现车
<input type="radio"  name="nowhave" value="2" onclick="document.getElementById('gmwp').style.display=''; " />期货&nbsp;</span>
<span style="line-height: 35px;margin-top: 8px;height: 30px;">
<input  type="text" name="f" id="gmwp" style="display:none" placeholder="期货时间" />
</span>
</div> 
</div>  
<div class="tab_txt01">
<span class="td_01" style="width: 120px;margin-top: 6px;"><label class="fc_red">*</label>采购报价有效期：</span>
<span style="line-height: 35px;margin-top: 8px;"><input type="text" id="validtime" name="v"/>&nbsp;</span>
</div>
<div class="tab_txt01">
<span class="td_01" style="width: 120px;margin-top: 6px;"><label class="fc_red">*</label>裸车价(元)：</span>
<span style="line-height: 35px;margin-top: 8px;"><input type="text" id="bodyprice" name="bodyprice"/>&nbsp;</span>
</div>
<div class="tab_txt01">
<span class="td_01" style="width: 120px;margin-top: 6px;">服务费票点(元)：</span> 
<span style="line-height: 35px;margin-top: 8px;"><input type="text" name="tpprice" id="tpprice" />&nbsp;</span>
</div>
<div class="tab_txt01">
<span class="td_01" style="width: 120px;margin-top: 6px;">中文系统(元)：</span>
<span style="line-height: 35px;margin-top: 8px;"><input type="text" id="cnsystem" name="cnsystem"/>&nbsp;</span>
</div>
<div class="tab_txt01">
 <span  class="td_01" style="width: 120px;margin-top: 4px;">中间商：</span>
<span class="td_02" style="margin-top: 14px;">
<input type="radio"  name="middleman" value="1"  onclick="document.getElementById('channelprice').style.display='none'; document.getElementById('channelprice').value=''" checked />无
<input type="radio"  name="middleman" value="2" onclick="document.getElementById('channelprice').style.display=''; "/>有      
<!--  <input type="radio" name="middleman" value="1" checked>无
 <input type="radio" name="middleman" value="2">有 -->
             </span>
</div>
	<div class="tab_txt01" id="channelprice" style="display:none">
<span class="td_01" style="width: 120px;margin-top: 6px;">渠道费(元)：</span>
<span style="line-height: 35px;margin-top: 8px;">
<input type="text" name="channelprice" value="" width="280px"/>&nbsp;</span>
</div>
<div class="tab_txt01">
  <span class="td_01" style="width: 120px;margin-top: 6px;">供应商名称：</span>
<span style="line-height: 35px;margin-top: 8px;">
	<input type="text" id="supplyname" name="supplyname" value=""  width="280px"/>&nbsp;</span>
</div>
 	</li>
</form>
</ul>
</div>
<div class="btnlist">
<div style="width: 200px; margin: auto;margin-top:80px;">
	<a href="javascript:void(0);" class="btn63_01" id="saveBtn">保存</a> 
	<a id='resetBtn' href="javascript:void(0);" class="btn63_02 margin_let10">重置</a>
	</div>
	</div>
</div>		
</div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/findcar/addPurchase.js?v=<%=new Date()%>");
</script>