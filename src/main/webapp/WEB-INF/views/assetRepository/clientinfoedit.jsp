<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="CLIENT_INFO_LST" namespace="car-ms"/>">
<input type="hidden" id="commuAddQueryUrl" value="<ufa:url fieldName="COMMU_ADD_DO_LST" namespace="car-ms"/>">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="COMMU_LISTDO" namespace="car-ms"/>">
<input type="hidden" id="saveUrl" value="<ufa:url fieldName="CLIENT_INFO_EDIT_DO" namespace="car-ms"/>">
<input type="hidden" id="realsaleUrl" value="<ufa:url fieldName="CAR_ASSET_LST_REALSALE_FORCHOOSE" namespace="car-ms"/>">
<input type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input type="hidden" id="modelUrl" value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="versionUrl" value="<ufa:url fieldName="QUERY_VERSION" namespace="car-ms"/>">
<input type="hidden" id="stepflow" value="1">

<div class="mian_right-new" id="EA">
	<div class="rg_list">
		<h1 class="tt_h1" id="He">客户信息表编辑</h1>
		<div class="tb_list">
		<ul class="tb_ul02">
		<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="CLIENT_INFO_EDIT_DO"/>">
		<input id="shopId" type="hidden" name="shopId" value='${shop.id}'/>
		<input id="filenum" type="hidden" name="filenum" value='${buyer.filenum}'/>
		<input id="id" type="hidden" name="id" value='${buyer.id}'/>
		<input id="carId" type="hidden" name="carId" value='${buyer.carId}'/>
		<input id="sellerId" type="hidden" name="sellerId" value='${buyer.sellerId}'/>
		<input id="type" type="hidden" name="type" value='2'/>
		<input type="hidden" id="worktype" name="worktype" value="${worktype }">
		<input type="hidden" id="currpage" name="currpage" value="${currpage }">
		<li>
		<div class="tab_txt01">
			<span class="td_01" style="width: 120px;">门店名称：</span>
			<span style="line-height: 35px;width:300px;"><input type="hidden" id="shopName" name="shopName" value="${shop.name}" />${shop.name}&nbsp;</span>
			<span class="td_01" style="width: 120px;">档案编号：</span>
	  	  	<span style="line-height: 35px;width:300px;">${buyer.filenum}&nbsp;</span>
	  	  	<span class="td_01" style="width: 120px;">客户类别：</span>
	  	  	<span style="line-height: 35px;width:300px;">${buyer.workType eq '1'?"个人":"单位"}&nbsp;</span>
		</div>
		</li>
		
		<div id="clientTypeArea"><c:if test="${buyer.workType eq '1'}">
		<li>
		  	 <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>客户姓名：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="name" name="name" value="${buyer.name}" />&nbsp;</span>
		        <span class="td_01" style="width: 120px;">客户身份证：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="identify" name="identify" value="${buyer.identify}" />&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">联系电话：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="phone" name="phone" value="${buyer.phone}" />&nbsp;</span>
			 </div>
		</li>
		</c:if>
		<c:if test="${buyer.workType eq '2'}">
		<li>
		  	 <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>单位名称：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="name" name="name" value="${buyer.name}" />&nbsp;</span>
		        <span class="td_01" style="width: 120px;">营业执照号：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="bizLicense" name="bizLicense" value="${buyer.bizLicense}" />&nbsp;</span>
			 </div>
		</li>
		<li>
		  	 <div class="tab_txt01">
		  	 <span class="td_01" style="width: 120px;">负责人姓名：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="principal" name="principal" value="${buyer.principal}" />&nbsp;</span>
		        <span class="td_01" style="width: 120px;">负责人电话：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="phone" name="phone" value="${buyer.phone}" />&nbsp;</span>
			 </div>
		</li></c:if>
		</div>
		<li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">进店日期：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="comeshopTime" name="comeshopTime" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${buyer.comeshopTime}"/>" />&nbsp;</span>
		       
		       <%--  <span class="td_01" style="width: 120px;">意向品牌：</span>
		  	  	<span style="line-height: 35px;width:300px;">
		  	  	<select id="wantBrand" name="wantBrand" style="margin-top: 6px;">
		  	  	<option value="">--请选择--</option>
			           <c:forEach var="item" items="${brandLst}">  
			             <option value="<c:out value="${item.name}"></c:out>" <c:if test="${item.name eq buyer.wantBrand}">selected="selected"</c:if>><c:out value="${item.name}"></c:out></option>
			           </c:forEach>
		          </select></span>
		  	  	<span class="td_01" style="width: 120px;">意向型号：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="wantcar" name="wantcar" value="${buyer.wantcar}" />&nbsp;</span>
			 --%>
			 <div class="tab_txt01">
		 <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>品牌首字母：</span>
		        <span class="" style="line-height: 35px;margin-top: 8px;width:300px;">
		  	  	  <select id="brandinitial" name="" style="line-height: 35px;width:150px;">
		  	  	    <option value=''>--请选择--</option>
			           <c:forEach var="item" items="${brand}">  
			             <option value="<c:out value="${item.brandinitial}">
			             </c:out>"><c:out value="${item.brandinitial}"></c:out></option>
			           </c:forEach>
		          </select>
		        </span>
		       
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>品牌：</span>
		  	  	<span style="line-height: 35px;margin-top: 8px;width:300px;" > 
		  	  	<select id="wantBrand" name="wantBrand" style="line-height: 35px;width:150px;" >
		  	  	<option>${buyer.wantBrand}</option>
		          </select>
		          </span>
		  	 
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>型号：</span>
		       <span style="line-height: 35px;margin-top: 8px;width:300px;"> 
		  	  	<select id="wantcar" name="wantcar" style="line-height: 35px;width:150px;">
		  	  	  <option value=''>--请选择--</option>
		  	  	 <c:forEach var="item" items="${model}">  
			             <option value="<c:out value="${item.model}"></c:out>" <c:if test="${item.model eq buyer.wantcar}">selected="selected"</c:if>><c:out value="${item.model}"></c:out></option>
			           </c:forEach>
		          </select>
		          </span>
			 </div>
		   	</li>
		<li>
		  	  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>版本：</span>
		       <span style="line-height: 35px;margin-top: 8px;width:300px;"> 
		  	  	<select id="version" name="version" style="line-height: 35px;width:150px;">
		  	  	  <option value=''>--请选择--</option>
		  	  	<c:forEach var="item" items="${version}">  
			             <option value="<c:out value="${item.version}"></c:out>" <c:if test="${item.version eq buyer.version}">selected="selected"</c:if>><c:out value="${item.version}"></c:out></option>
			           </c:forEach>
		          </select>
		          </span>
		  	  	<span class="td_01" style="width: 120px;">心里价位：</span>
		  	  	<span style="line-height: 35px;width:300px;">
		  	  	<select id="heartPrice" name="heartPrice" style="margin-top: 6px;">
			           <c:forEach var="item" items="${priceLst}">  
			             <option value="<c:out value="${item.value.value}"></c:out>" <c:if test="${item.value.value eq buyer.heartPrice}">selected="selected"</c:if>><c:out value="${item.value.value}"></c:out></option>
			           </c:forEach>
		          </select></span>
		  	  	<span class="td_01" style="width: 120px;">配置/颜色：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="color" name="color" value="${buyer.color}" />&nbsp;</span>
		       
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">现有交通工具：</span>
		  	  	<span style="line-height: 35px;width:300px;">
			  	  	<input type="radio"  name="nowCar" value="首次购车" <c:if test="${buyer.nowCar eq '首次购车'}">checked="checked"</c:if>/>首次购车&nbsp;&nbsp;
			  	  	<input type="radio"  name="nowCar" value="添置" <c:if test="${buyer.nowCar eq '添置'}">checked="checked"</c:if>/>添置&nbsp;&nbsp;
			  	  	<input type="radio"  name="nowCar" value="置换" <c:if test="${buyer.nowCar eq '置换'}">checked="checked"</c:if>/>置换
		  	  	</span>
		  	  	<span class="td_01" style="width: 120px;">熟客介绍：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="radio"  name="oldIntroduce" value="是" <c:if test="${buyer.oldIntroduce eq '是'}">checked="checked"</c:if>/>是&nbsp;&nbsp;
			  	  	<input type="radio"  name="oldIntroduce" value="否" <c:if test="${buyer.oldIntroduce eq '否'}">checked="checked"</c:if>/>否</span>
		  	  	<span class="td_01" style="width: 120px;">可用牌照：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="radio"  name="haveCard" value="有" <c:if test="${buyer.haveCard eq '有'}">checked="checked"</c:if>/>有&nbsp;&nbsp;
			  	  	<input type="radio"  name="haveCard" value="无" <c:if test="${buyer.haveCard eq '无'}">checked="checked"</c:if>/>无</span>
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01" style="">
		  	   <span class="td_01" style="width: 120px;">客户级别：</span>
		  	  	<span style="line-height: 35px;width:300px;">
			  	  	<input type="radio"  name="clientLevel" value="H" <c:if test="${buyer.clientLevel eq 'H'}">checked="checked"</c:if>/>H&nbsp;
			  	    <input type="radio"  name="clientLevel" value="A" <c:if test="${buyer.clientLevel eq 'A'}">checked="checked"</c:if>/>A&nbsp;
			  	    <input type="radio"  name="clientLevel" value="B" <c:if test="${buyer.clientLevel eq 'B'}">checked="checked"</c:if>/>B&nbsp;
			     	<input type="radio"  name="clientLevel" value="C" <c:if test="${buyer.clientLevel eq 'C'}">checked="checked"</c:if>/>C&nbsp;
			    	<input type="radio"  name="clientLevel" value="N" <c:if test="${buyer.clientLevel eq 'N'}">checked="checked"</c:if>/>N&nbsp;
			    	<input type="radio"  name="clientLevel" value="G" <c:if test="${buyer.clientLevel eq 'G'}">checked="checked"</c:if>/>G&nbsp;
			    	<a href="javascript:void(0);" class="btn63_01" id="chooseCarBtn" <c:if test="${buyer.clientLevel ne 'G'}">style="display:none;"</c:if>>选车</a>
		  	  	</span>
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
		  </form>
		</ul>
		</div>
		<div class="btnlist">
		<div style="width: 500px; margin: auto;"><a href="javascript:void(0);" class="btn63_01" id="saveBtn">保存</a>
		<a id='resetBtn' href="javascript:void(0);" class="btn63_02 margin_let10">重置</a>
		<a id='backBtn' href="javascript:void(0);" class="btn63_01 margin_let10">返回</a>
		<a id='addClientInfoBtn' href="javascript:void(0);" class="btn63_01 margin_let10">添加沟通</a>
		</div>
		</div>
	</div>		
</div>

<div id="clientType1" style="display: none;">
		<li>
		  	 <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>客户姓名：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="name" name="name" value="" />&nbsp;</span>
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>客户身份证：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="identify" name="identify" value="" />&nbsp;</span>
			 </div>
		</li>
		<li>
		  	 <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>联系电话：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="phone" name="phone" value="" />&nbsp;</span>
			 </div>
		</li>
		</div>
<div id="clientType2" style="display: none;">
		<li>
		  	 <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>单位名称：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="companyName" name="companyName" value="" />&nbsp;</span>
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>营业执照号：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="bizLicense" name="bizLicense" value="" />&nbsp;</span>
			 </div>
		</li>
		<li>
		  	 <div class="tab_txt01">
		  	 <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>负责人姓名：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="name" name="name" value="" />&nbsp;</span>
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>负责人电话：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="phone" name="phone" value="" />&nbsp;</span>
			 </div>
		</li>
		</div>
<style type="text/css">
    #middle{
        filter: alpha(opacity=50); 
        opacity:0.5;
        -moz-opacity:0.5;
        z-index:3;
        background-color:#e4eaf3;
    }
    #msg{
        position:fixed;
        float: left;
        z-index:999;
        width:300px;height:180px;
        border:2px solid #828d97;
        background-color:#e4eaf3;
        display:none;
    }
</style>		
<div id="middle"></div>
<div id="msg">
    <div style="width:100%;font-size:13px;text-align:center;margin-top: 5px;margin-bottom: 5px;font-size: 18">请输入内容:</div>
    <div><form id="contentForm"><textarea id="content" name="content" rows="4" cols="28" style="margin-left: 10px;"></textarea></form></div>
    <div style="text-align:center;">
        <button id="btn1">确定</button>&nbsp;
        <button id="btn2">取消</button>
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
    seajs.use("${scriptBasePath}/assetRepository/clientEdit.js");
</script>
