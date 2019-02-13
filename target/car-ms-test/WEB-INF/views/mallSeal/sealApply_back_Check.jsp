<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="updateUrl"	value="<ufa:url fieldName="MALL_SEALAPPLY_UPDATESTATUS_SUBMIT" namespace="car-ms"/>">
<input type="hidden" id="backUrl"	value="<ufa:url fieldName="MALL_SEALAPPLY_BACKCHECK_LISTPAGE" namespace="car-ms"/>">
<style>
.oder {
	line-height: 35px;
	margin-right: 20px;
	padding: 6px 0;
}

.seal {
	width: 240px;
	text-align: left;
}
</style>
<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
			<ul class="tb_ul02">
				<div class="tab_txt01">
					<li>
						<span class="oder" style="padding-left: 100px"> 海外直采合同编号： ${sealApply.code}</span>
					</li>
					<li>
						<span class="oder" style="padding-left: 100px">订单编号： ${sealApply.orderids}</span>
					</li>
					<li>
						<span class="oder" style="padding-left: 100px">合同类型：</span>
						<span class="oder" style="margin-top: 10px;">
							<select id="contracttype" name="contracttype" style="width: 100px;">
								<option value="3">海外直采合同</option>
							</select>
						</span>
					</li>
					<li>
						<span class="oder" style="padding-left: 100px"> 盖完章的文件： </span>
						<span style="line-height: 35px; width: 500px;">
							<a href="${ftpFileUrl}${sealApply.finalcontractfilename}" download="${sealApply.finalcontractfilename}"
								style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${sealApply.finalcontractfilename}</a>
							&nbsp;
						</span>
					</li>
					<form name="editForm" id="editForm" method="POST"  action="<ufa:url namespace="car-ms" fieldName="MALL_SEALAPPLY_BACKCHECK_UPDAT"/>"
		               	enctype="multipart/form-data" >
						<input id="id" type="hidden" name="id" value='${sealApply.id}' />
						<li>
							<span class="oder" style="padding-left: 100px"> 更改盖章文件： </span>
							<input type="file" name="backcheckfile" id="backcheckfile" style="margin-top: 6px" />
							</span>
							&nbsp;
						</li>
					</form>
					<li>
						<span class="oder" style="padding-left: 100px">备注：</span>
						<textarea style="margin-left: 50px" cols="45" rows="3" name="remarks" id="remarks">${sealApply.remarks}</textarea>
					</li>
					<li>
						<span class="oder seal" style="padding-left: 100px"> 申请人： ${sealApply.applyer}</span>
						<span class="oder seal"> 审核人： ${sealApply.auditer1}</span>
						<span class="oder seal"> 盖章人： ${sealApply.sealer}</span>
					</li>
					<li>
						<span class="oder seal" style="padding-left: 100px">
							申请时间：
							<fmt:formatDate value="${sealApply.applytime}" pattern="yyyy-MM-dd HH:mm:ss" />
						</span>
						<span class="oder seal" style="width: 220px;">
							申核时间：
							<fmt:formatDate value="${sealApply.auditime1}" pattern="yyyy-MM-dd HH:mm:ss" />
						</span>
					</li>
					<li>
						<span class="oder" style="padding-left: 100px">不通过原因：</span>
						<textarea style="margin-left: 50px" cols="45" rows="3" name="reason"
							id="reason">${sealApply.reason}</textarea>

					</li>
				</div>
			</ul>
		</div>

		<div class="btnlist">
			<div style="width: 400px; margin: auto; margin-top: 80px;">
				<button id='saveBtn' href="javascript:void(0);" class="btn63_01 margin_let10">审核通过</button>
				<a id='backBtn' href="javascript:void(0);" class="btn63_01 margin_let10">返回</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	seajs.use("${scriptBasePath}/mallSeal/sealApply_back_Check.js?r=<%=new Date()%>");
</script>
