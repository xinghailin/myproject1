<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
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
							<span class="oder" style="padding-left: 100px">订单编号： ${sealApply.orderids}</span>
							<input type="hidden" id="orderids" name="orderids" value="${sealApply.orderids}">
						</li>
						<li>
							<span class="oder" style="padding-left: 100px"> 海外直采合同编号： ${sealApply.code}</span>
							<input type="hidden" id="code" name="code" value="${sealApply.code}">
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
							<span class="oder" style="padding-left: 100px">备注：</span>
							<textarea style="margin-left: 50px" cols="45" rows="3" placeholder="请填写备注" name="remarks"
								id="remarks"></textarea>
						</li>
						<li>
							<span class="oder seal" style="padding-left: 100px"> 申请人： ${sealApply.applyer}</span>
							<input type="hidden" id="applyer" name="applyer" value="${sealApply.applyer}">
						</li>

						<li>
							<span class="oder" style="padding-left: 100px"> 盖章的文件： </span>
							<input type="file" name="contractfile" id="contractfile" style="margin-top: 6px" />
							</span>
							&nbsp;
						</li>

					</div>
				</ul>
			</div>
		</form>
		<div class="btnlist">
			<div style="width: 400px; margin: auto; margin-top: 80px;">
			    <a id='saveBtn' href="javascript:void(0);" class="btn63_01 margin_let10">保存并申请盖章</a>
				<a id='backBtn' href="javascript:void(0);" class="btn63_01 margin_let10">返回</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/mallOrder/addContract.js?r=<%=new Date()%>");
</script>
