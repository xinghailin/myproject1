<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<form id="fileuploadForm" action="<ufa:url namespace="car-ms" fieldName="krcarbatchtypeindo"/>" method="POST" enctype="multipart/form-data"
	target="hideiframe">
	<div class="main_right">
		<div class="rg_list">
			<div class="tb_list">
				<ul class="tb_ul">
					<li>
						<div class="tbul02_left">
							<div class="tab_txt01"><span class="td_01"><label class="fc_red">*</label>上传文件</span> <span class="td_02" style="margin-top: 5px;"><input
									id="excelFile" type="file" name="excelFile" /></span></div>
					</div>
				</li>
			</ul>
		</div>
			<div class="btnlist"><a href="javascript:void(0);" id="submitButton" class="btn_131 margin_let" style="color: red; font-weight: bold;">导入</a>
				<a href="${contextPath}/downLoad?type=3" id='resetBtn' class="btn_131 margin_let10">模板下载</a></div>
	</div>
</form>
<iframe name="hideiframe" style="width: 60%; margin-top: 10px;"></iframe>
<script type="text/javascript">
seajs.use("${scriptBasePath}/krcar/product_Excel.js?r=<%=new Date()%>");
</script>