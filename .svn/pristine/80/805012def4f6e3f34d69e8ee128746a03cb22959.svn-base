<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="addcarUrl"
	value="<ufa:url fieldName="KRCAR_TYPEIN_SUBMIT" namespace="car-ms"/>">
<input type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input type="hidden" id="modelUrl"
	value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="checkUrl" value="<ufa:url fieldName="MALL_ORDERDETAILUPDATE_STATUS" namespace="car-ms"/>">
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
		<form name="editForm" id="editForm" method="POST"
			action="<ufa:url namespace="car-ms" fieldName="MALL_SEALAPPLY_ADD"/>"
			enctype="multipart/form-data">
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
							<span class="oder" style="padding-left: 100px"> 需盖章的文件： </span>
							<span style="line-height: 35px; width: 500px;">
								<a href="${ftpFileUrl}${sealApply.finalcontractfilename == null ? sealApply.tempcontractfilename == null ? sealApply.contractfilename : sealApply.tempcontractfilename : sealApply.finalcontractfilename}"
								
									download="${sealApply.finalcontractfilename == null ? sealApply.tempcontractfilename == null ? sealApply.contractfilename : sealApply.tempcontractfilename : sealApply.finalcontractfilename}"
									style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${sealApply.finalcontractfilename == null ? sealApply.tempcontractfilename == null ? sealApply.contractfilename : sealApply.tempcontractfilename : sealApply.finalcontractfilename}</a>
								&nbsp;
							</span>
						</li>
						<li>
							<span class="oder" style="padding-left: 100px">备注：</span>
							<textarea style="margin-left: 50px" cols="45" rows="3" name="remarks" id="remarks" readonly>${sealApply.remarks}</textarea>
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
							<form name="editForm" id="editForm" method="POST">
								<input id="id" type="hidden" name="id" value='${sealApply.id}' />
								<input id="sealstatus" type="hidden" name="sealstatus" value='${sealApply.sealstatus}' />
								<input id="contractfilename" type="hidden" name="contractfilename"
									value='${sealApply.contractfilename}' />
								<span class="oder" style="padding-left: 100px">不通过原因：</span>
								<textarea style="margin-left: 50px" cols="45" rows="3" name="reason" id="reason" readonly>${sealApply.reason}</textarea>
							</form>
						</li>
					</div>
				</ul>
			</div>
		</form>
		<div class="btnlist">
			<div style="width: 400px; margin: auto; margin-top: 80px;">
				<a id='backBtn' href="javascript:void(0);" class="btn63_01 margin_let10">返回</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/mallSeal/sealApplyLook.js?r=<%=new Date()%>");
</script>
