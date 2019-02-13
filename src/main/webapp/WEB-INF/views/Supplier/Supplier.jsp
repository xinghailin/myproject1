<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="supplierlist" namespace="car-ms"/>">
<input type="hidden" id="addUrl" value="<ufa:url fieldName="supplieradd" namespace="car-ms"/>">
<input type="hidden" id="deleteUrl" value="<ufa:url fieldName="supplierdelete" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="supplieredit" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;">
	<div class="rg_list">
	 <input type="hidden" id="currpage" name="currpage" value="${currpage }"/>
		<div class="tb_list">
		  <form name="searchForm" id="searchForm">	    
<ul class="tb_ul02"> 
<li> 
<div class="tbul02_right02" style="width:30%">
	<div class="tab_txt01">
<span class="td_01" style="width: 160px;">供应方名称(supplierName)：</span> <span
	class="td_02" style="margin-top: 4px;"><input name="name" id="name"
class="input_text01" type="text" style="width:180px;"></span>
</div>
</div>
<div class="tbul02_left02" style="width:30%">
<div class="tab_txt01">
	<span class="td_01" style="width: 160PX;">联系方式(ContactPhoneNo)：</span> <span
		class="td_02" style="margin-top: 4px;"><input name="phone" id="phone"
class="input_text01" type="text" style="width:180px;"></span>
</div></div>
<div class="tab_txt01" style="width:30%">
	<span class="td_01">区域(area)：</span> <span
		class="td_02" style="margin-top: 4px;"><select id="type" name="type" style="width:100px;">
<option value="">--请选择(please select)--</option><option value="1">加拿大</option><option value="2">中东</option>
</select></span>
</div>
</div>				
</li>
</ul>
<div class="btnlist" style="margin-bottom: 20px;">
<div style="text-align: center;">
<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询(search)</a>
<a href="javascript:void(0);" id="add" class="btn63_01">添加(add)</a>
<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置(reset)</a>
</div>
</div>
</form>
</div>
<div class="clear"></div>
<div class="hide" id="J_DataList"></div>
<div class="nodata hide" id="J_NoDataMsg">
	<p>暂无数据。</p>
</div>
</div>
</div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">供应方名称(supplier name)</th>
            <th style="text-align:center">供应方地址(supplier address)</th>
            <th style="text-align:center">证件类型(ID Type)</th>
            <th style="text-align:center">证件号(ID No)</th>
            <th style="text-align:center">联系方式(Contact Phone No)</th>
            <th style="text-align:center">区域(area)</th>
 			<th style="text-align:center">操作(operate)</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{name}}</td>
  			<td>{{address}}</td>
  			<td>{{idtype}}</td>
  			<td>{{idcode}}</td>
			<td>{{phone}}</td>
<td>{{formatadd type}}</td>
            <td>{{_operate id}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/Supplier/Supplier.js?r=<%=new Date()%>");
</script>