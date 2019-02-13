<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input id="actionUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="CAR_BATCH_DO"/>'/>
<form id="fileuploadForm" action="<ufa:url namespace="car-ms" fieldName="CAR_BATCH_DO"/>" method="POST" enctype="multipart/form-data" class="cleanform"  target="hideiframe">
<div class="main_right">
	<div class="rg_list">
		<div class="tb_list">
			<ul class="tb_ul">
			  <li>
			   	<div class="tbul02_left">
				  	<div class="tab_txt01">
				  	   <span class="td_01"><label class="fc_red">*</label>上传文件</span>
					   <span class="td_02"><input id="excelFile" type="file" name="excelFile" /></span>
				  	</div>
			  	</div>
			  </li>
			</ul>
		</div>
		<div class="btnlist">
			<a href="javascript:void(0);" id="submitButton" class="btn_131 margin_let">确定导入</a> 
			<a href="${contextPath}/downLoad?type=0" id='resetBtn' class="btn_131 margin_let10">模板下载</a>
		</div>
</div>
</form>
<div  style="right: 100px;">
<form id="fileuploadForm1" action="<ufa:url namespace="car-ms" fieldName="addAreaPrice"/>" method="POST" enctype="multipart/form-data" class="cleanform"  target="hideiframe1">
	<div class="rg_list">
		<div class="tb_list">
			<ul class="tb_ul">
			  <li>
			   	<div class="tbul02_left">
				  	<div class="tab_txt01">
				  	   <span class="td_01"><label class="fc_red">*</label>上传文件区域价格：</span>
					   <span class="td_02"><input id="excelFile2" type="file" name="file" /></span>
				  	</div>
			  	</div>
			  </li>
			</ul>
		</div>
		<div class="btnlist">
	<a href="javascript:void(0);" id="submitButton1" class="btn_131 margin_let">确定导入</a> 
		<!-- 	<a href="javascript:void(0);" onclick="myfile()" class="btn_131 margin_let">确定导入</a> -->
		</div>
	</div>
</form>
</div>
<iframe name="hideiframe" style="display: none;"></iframe>
<iframe name="hideiframe1" style="display: none;"></iframe> 
<script type="text/javascript">
    // 加载入口模块
  /*  function myfile() {
    	document.getElementById("fileuploadForm1").submit();
	}  */
    seajs.use("${scriptBasePath}/product_Excel.js?r=<%=new Date()%>");
</script>