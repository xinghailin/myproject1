<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet"><div class="main_right" style="margin-top: 10px;margin-bottom: 10px;">
<form id="fileuploadForm" action="<ufa:url namespace="car-ms" fieldName="ADJUSTPRICE_DO"/>?type=1" method="POST" enctype="multipart/form-data" class="cleanform"  target="hideiframe">
	<div class="rg_list">
		<div class="tb_list">
			<ul class="tb_ul">
			  <li>
			   	<div class="tbul02_left">
				  	<div class="tab_txt01">
				  	   <span class="td_01"><label class="fc_red">*</label>上传文件（按车型）：</span>
					   <span class="td_02"><input type="file" name="file1" /></span>
				  	</div>
			  	</div>
			  </li>
			</ul>
		</div>
		<div class="btnlist">
			<a href="javascript:void(0);" id="submitButton" class="btn_131 margin_let">确定导入</a> 
			<a href="${contextPath}/downLoad?type=1" id='resetBtn' class="btn_131 margin_let10">模板下载</a>
		</div>
	</div></form>
</div>
<div class="main_right">
<form id="fileuploadForm1" action="<ufa:url namespace="car-ms" fieldName="ADJUSTPRICE_DO"/>?type=2" method="POST" enctype="multipart/form-data" class="cleanform"  target="hideiframe1">
	<div class="rg_list">
		<div class="tb_list">
			<ul class="tb_ul">
			  <li>
			   	<div class="tbul02_left">
				  	<div class="tab_txt01">
				  	   <span class="td_01"><label class="fc_red">*</label>上传文件（按车架号）：</span>
					   <span class="td_02"><input type="file" name="file2" /></span>
				  	</div>
			  	</div>
			  </li>
			</ul>
		</div>
		<div class="btnlist">
			<a href="javascript:void(0);" id="submitButton1" class="btn_131 margin_let">确定导入</a> 
			<a href="${contextPath}/downLoad?type=2" id='resetBtn' class="btn_131 margin_let10">模板下载</a>
		</div>
	</div>
</form>
</div>
<iframe name="hideiframe" style="display: none;"></iframe>
<iframe name="hideiframe1" style="display: none;"></iframe>
<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/price_Excel.js");
</script>