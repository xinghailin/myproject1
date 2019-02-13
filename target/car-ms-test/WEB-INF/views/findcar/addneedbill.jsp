<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="checkUrl" value="<ufa:url fieldName="CAR_PARAM_CHECK" namespace="car-ms"/>">
<input type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input type="hidden" id="modelUrl" value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="versionUrl" value="<ufa:url fieldName="QUERY_VERSION" namespace="car-ms"/>">
<input type="hidden" id="provinceUrl" value="<ufa:url fieldName="citys" namespace="car-ms"/>">
<input id="hideMsg" type="hidden" value='${message}'/>
<div class="mian_right-new" style="height: 100%;">
<div class="rg_list">
	<h1 class="tt_h1" id="He"></h1>
	<div class="tb_list">
	<ul class="tb_ul02">
	<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="addneedbill"/>" enctype="multipart/form-data">
<li>
 	  <div class="tab_txt01">
 	  <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>姓名：</span>
<span style="line-height: 35px;width:440px;">
	<input type="text" id="name" name="name" width="280px"/>&nbsp;</span>
</div>
<div class="tab_txt01">
	  	 <span  class="td_01" style="width: 120px;">性别：</span>
<span class="td_02" style="margin-top: 10px;">	
	 <input type="radio" name="sex" value="1" checked >男
             <input type="radio" name="sex" value="2" >女
             </span>
</div>
	<div class="tab_txt01">
	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>手机号：</span>
<span style="line-height: 35px;width:400px;">
<input type="text" id="tel" name="tel" />&nbsp;</span>
</div><div class="tab_txt01">
<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>性别：</span>
<span style="line-height: 35px;width:400px;">
<input type="radio" name="sex" value="1" checked="checked"/>男&nbsp;<input type="radio" name="sex" value="2"/>女</span>
</div>
<div class="tab_txt01">
<span class="td_01" style="width: 120px;margin-top: 8px;"><label class="fc_red">*</label>省：</span>
<span class="" style="line-height: 35px;margin-top: 8px;width:400px;">
<select id="province" name="province" style="line-height: 35px;width:150px;height: 38px;">
<option value=''>--请选择--</option>
  <c:forEach var="item" items="${weblocations}">  
<c:if test="${item.parent==0 }">
<option value="${item.name}"><c:out value="${item.name}"></c:out></option>
</c:if>
</c:forEach>
  </select>
</span>
</div>
<div class="tab_txt01">
<span class="td_01" style="width: 120px;margin-top: 8px;"><label class="fc_red">*</label>市：</span>
<span style="line-height: 35px;margin-top: 8px;width:400px;"> 
<select id="citys" name="citys" style="line-height: 35px;width:150px;height: 38px;">
</select>
</span>
</div>
	<!--   <div class="tab_txt01">
	  	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>省：</span>
	  	<span style="line-height: 35px;width:200px;">
	  	<input type="text" id="province"  name="province" value=""
	  	 />&nbsp;</span>
</div>
 <div class="tab_txt01">
	  	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>市：</span>
	  	<span style="line-height: 35px;width:200px;">
	  	<input type="text" id="citys"  name="citys" value=""
	  	 />&nbsp;</span>
</div> -->
 <div class="tab_txt01">
<span class="td_01" style="width: 120px;margin-top: 8px;"><label class="fc_red">*</label>品牌首字母：</span>
<span class="" style="line-height: 35px;margin-top: 8px;width:400px;">
<select id="brandinitial" name="" style="line-height: 35px;width:150px;height: 38px;">
<option value=''>--请选择--</option>
  <c:forEach var="item" items="${brand}">  
<option value="<c:out value="${item.brandinitial}">
</c:out>"><c:out value="${item.brandinitial}"></c:out></option>
</c:forEach>
</select>
</span>
</div>
<div class="tab_txt01">
<span class="td_01" style="width: 120px;margin-top: 8px;"><label class="fc_red">*</label>品牌：</span>
<span style="line-height: 35px;margin-top: 8px;width:400px;"> 
<select id="brand" name="brand" style="line-height: 35px;width:150px;height: 38px;">
</select>
</span>
</div>
<div class="tab_txt01">
<span class="td_01" style="width: 120px;margin-top: 8px;"><label class="fc_red">*</label>型号：</span>
<span style="line-height: 35px;margin-top: 8px;width:400px;"> 
<select id="model" name="model" style="line-height: 35px;width:150px;height: 38px;">
</select>
</span>
</div>
<div class="tab_txt01">
<span class="td_01" style="width: 120px;margin-top: 8px;"><label class="fc_red">*</label>版本：</span>
<span style="line-height: 35px;margin-top: 8px;width:400px;"> 
<select id="version" name="version" style="line-height: 35px;width:150px;height: 38px;">
      </select>
        </span>
</div>
 <div class="tab_txt01">
	  	<span class="td_01" style="width: 120px;margin-top: 7px;">提车时间：</span>
<span style="line-height: 35px;width:400px;margin-top: 8px;"><input type="text" id="time" name="time" value="" />&nbsp;</span>
</div>
	<div class="tab_txt01">
	  	 <span  class="td_01" style="width: 120px;">是否置换：</span>
<span class="td_02" style="margin-top: 10px;">	
	 <input type="radio" name="ischange" value="1" >是
             <input type="radio" name="ischange" value="2" checked>否
             </span>
</div>
<div class="tab_txt01">
	 <span  class="td_01" style="width: 120px;">是否需要金融服务：</span>
<span class="td_02" style="margin-top: 10px;">	
  	 <input type="radio" name="isfinance" value="1" >是
               <input type="radio" name="isfinance" value="2" checked>否
               </span>
  </div>
<div class="tab_txt01">
  	<span class="td_01" style="width: 120px;">加装需求：</span>
<span style="line-height: 35px;width:200px;">
<textarea style="" cols="40" rows="3"  placeholder=""  name="decorate" id="decorate"></textarea>&nbsp;</span>
</div>
 	</li>
</form>
</ul>
</div>
<div class="btnlist">
<div style="width: 200px; margin: auto;margin-top:80px;"><a href="javascript:void(0);" class="btn63_01" id="saveBtn">保存</a>
		<a id='resetBtn' href="javascript:void(0);" class="btn63_02 margin_let10">重置</a>
		</div>
		</div>
	</div>		
</div>
<%-- <script src="${contextPath}/scripts/base/jquery-2.1.4.min.js"></script>
<script src="${contextPath}/scripts/base/jquery-weui.min.js"></script>
<script type="text/javascript" src="${contextPath}/scripts/base/city-picker.min.js" charset="utf-8"></script> --%>
<script type="text/javascript">
/* function check(temp){
	var re = /^1[3-9]\d{9}$/
	if(!re.test(temp.value)){
		alert("手机号码格式不正确，请重新输入!");
		return;
	}
} */
seajs.use("${scriptBasePath}/findcar/addneedbill.js?v=<%=new Date()%>"); 
</script>
