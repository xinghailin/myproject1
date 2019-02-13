<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="indexUrl" value="<ufa:url fieldName="Supplier" namespace="car-ms"/>">
<%-- <link href="${contextPath}/resources/style/jquery.css" rel="stylesheet">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script> --%>
<input type="hidden" id="currpage" value="${currpage}">
<div class="mian_right-new" id="EA">
	<div class="rg_list">
		<h1 class="tt_h1" id="He">供应方添加(Supplier Addition)</h1>
		<div class="tb_list" >
		<ul class="tb_ul02">
		<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="supplierSave"/>">
			<li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right"><label class="fc_red">*</label>供应方名称(supplier name)</span><span style="line-height: 35px;">
		  	<input type="text" id="name" name="name" value="" style="width: 500px"/>&nbsp;
		  	</span></div>
		    </div>
		  </li>
		  <li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right"><label class="fc_red">*</label>供应方地址(supplier address)</span><span style="line-height: 35px;">
		  	<input type="text" id="address" name="address" value="" style="width: 500px"/>&nbsp;
		  	</span></div>
		    </div>
		  </li>
		  <li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right"><label class="fc_red">*</label>证件类型(ID Type)</span><span style="line-height: 35px;">
		  	<input type="text" id="idtype" name="idtype" value="" style="width: 500px"/>&nbsp;
		  	</span></div>
		    </div>
		  </li>
		  <li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right"><label class="fc_red">*</label>证件号(ID No)</span><span style="line-height: 35px;">
		  	<input type="text" id="idcode" name="idcode" value="" style="width: 500px"/>&nbsp;
		  	</span></div>
		    </div>
		  </li>
		  <li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right"><label class="fc_red">*</label>联系方式(Contact Phone No)</span><span style="line-height: 35px;">
		  	<input type="text" id="phone" name="phone" value="" style="width: 500px"/>&nbsp;
		  	</span></div>
		    </div>
		  </li><li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right"><label class="fc_red">*</label>区域(area)</span><span style="margin-top: 6px;">
		  	<select id="type" name="type"><option value="">--请选择(please select)--</option>
            <option value="1">加拿大</option><option value="2">中东</option>
            </select>
		  	</span></div>
		    </div>
		  </li>
		</form>
		</ul>
	</div><div class="btnlist" style="margin-top: 20px;">
	<div style="width: 250px; margin: auto;">
	<a href="javascript:void(0);" class="btn63_01" id="saveBtn" type="button">确定(Comfirm)</a>
	<a id='cancelBtn' href="javascript:void(0);" class="btn63_02 margin_let10">取消(Cancel)</a>
	</div>
	</div>
</div>
</div>
</div>
<script type="text/javascript">
	seajs.use("${scriptBasePath}/Supplier/add.js");
</script>