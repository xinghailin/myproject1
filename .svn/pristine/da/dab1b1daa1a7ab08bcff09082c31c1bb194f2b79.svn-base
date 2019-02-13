<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input id="editUrl" type="hidden" value='<ufa:url namespace="decorate-portal-ms" fieldName="SYS_BRAND_EDIT_URL"/>'/>
<input id="oldbrandName" type="hidden" value='${brandName }'/>
<form name="editForm" id="editForm" >
<input id="id" name="id" type="hidden" value='${id }'/>
<div class="table_list2">
	<div class="tablist_margin0">
		<div class="tablist">
		  <p class="title_p2 fz_14px">编辑品牌</p>
			<ul class="tb_ul">
			  <li>
			  	<div class="tab_txt01"><span class="td_01"><label class="fc_red">*</label>品牌名：</span>
			  		<span class="td_02"><input name="brandName" id="brandName" type="text" class="input_text" value="${brandName }"  maxlength="20" minlength="1"/></span>
			  	</div>
			  </li>
			  <li>
			  	<div class="tab_txt01"><span class="td_01">供应商：</span>
			  		<span class="">${memberNames }</span>
			  	</div>
			  </li>
			</ul>
		</div>
		<div class="btnlist">
			<a href="javascript:void(0);" id="editBtn" class="btn63_01" style="margin-left:15%">确定</a>
			<a id='resetBtn' href="javascript:void(0);" class="btn63_02 margin_let10">重置</a> 
			<a href="javascript:window.close();" class="btn63_02 margin_let10">关闭</a>
		</div>
	</div>
</div>
</form>
<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/system/brand/edit.js");
</script>
