<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input id="addUrl" type="hidden" value='<ufa:url namespace="decorate-portal-ms" fieldName="SYS_BRAND_ADD_URL"/>' />
<form name="addForm" id="addForm" >
<div class="table_list2">
	<div class="tablist_margin0">
		<div class="tablist">
		  <p class="title_p2 fz_14px">新增品牌</p>
			<ul class="tb_ul">
			  <li>
			  	<div class="tab_txt01"><span class="td_01"><label class="fc_red">*</label>品牌名：</span>
			  		<span class="td_02"><input name="brandName" id="brandName" type="text" class="input_text"  maxlength="20" minlength="1"/></span>
			  	</div>
			  </li>
			</ul>
		</div>
		<div class="btnlist">
			<a href="javascript:void(0);" id="addBtn" class="btn63_01" style="margin-left:15%">确定</a>
			<a id='resetBtn' href="javascript:void(0);" class="btn63_02 margin_let10">重置</a>  
			<a href="javascript:window.close();" class="btn63_02 margin_let10">关闭</a>
		</div>
	</div>
</div>
</form>
<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/system/brand/add.js");
</script>
