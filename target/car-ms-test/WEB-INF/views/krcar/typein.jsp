<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="addcarUrl" value="<ufa:url fieldName="KRCAR_TYPEIN_SUBMIT" namespace="car-ms"/>">
<input type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input type="hidden" id="modelUrl" value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="versionUrl" value="<ufa:url fieldName="QUERY_VERSION" namespace="car-ms"/>">
<input type="hidden" id="krcarlistUrl" value="<ufa:url fieldName="LOOK_KRCARENTER_LOOKPAGE" namespace="car-ms"/>">
<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
			<ul class="tb_ul02">
				<form name="editForm" id="editForm" method="POST" >
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>品牌首字母：</span> <span
								class="" style="line-height: 35px; margin-top: 8px; width: 200px;"> <select
									id="brandinitial" name="" style="line-height: 35px; width: 159px;">
									<option>--请选择--</option>
									<c:forEach var="item" items="${brand}">
										<option value="<c:out value="${item.brandinitial}"></c:out>"><c:out
												value="${item.brandinitial}"></c:out></option>
									</c:forEach>
								</select>
							</span> <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>品牌：</span> <span
								style="line-height: 35px; margin-top: 8px; width: 200px;"> <select id="brand"
									name="brand" style="line-height: 35px; width: 159px;">
								</select>
							</span> <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>型号：</span> <span
								style="line-height: 35px; margin-top: 8px; width: 200px;"> <select id="model"
									name="model" style="line-height: 35px; width: 159px;">
								</select>
							</span> <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>版别：</span> <span
								style="line-height: 35px; margin-top: 8px; width: 200px;"> <select id="version"
									name="version" style="line-height: 35px; width: 159px;">
								</select>
							</span>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label>车架号：
							</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" id="vin" name="vin" value="" width="280px" />
								&nbsp;
							</span>
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label>价格(元)：
							</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" id="price" name="price" value="" />
								&nbsp;
							</span>
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label>折扣价(元)：
							</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" id="disprice" name="disprice" value="" />
								&nbsp;
							</span>
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label>库融池：
							</span>
							<span class="" style="margin-top: 8px; width: 200px;">
								<select id="poolid" name="poolid" style="width: 159px;">
								    <option value="">--请选择--</option>
									<c:forEach var="item" items="${poolList}">
										<option value="<c:out value="${item.id}"></c:out>"><c:out value="${item.name}"></c:out></option>
									</c:forEach>

								</select>
							</span>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">外观颜色：</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" id="outcolor" name="outcolor" value="" />
								&nbsp;
							</span>
							<span class="td_01" style="width: 120px;">内饰颜色：</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" id="incolor" name="incolor" value="" />
								&nbsp;
							</span>
							<span class="td_01" style="width: 200px;">
								<input type="checkbox" id="cert1" name="cert1" value="1">
								合格证 
							</span>
							<span class="td_01" style="width: 200px;">
								<input type="checkbox" id="cert2" name="cert2" value="1">
								一致性证书 
							</span>
							<span class="td_01" style="width: 200px;">
								<input type="checkbox" id="cert3" name="cert3" value="1">
								环保清单
							</span>
						</div>
					</li>
				</form>
			</ul>
		</div>
		<div class="btnlist">
			<div style="width: 200px; margin: auto; margin-top: 80px;">
				<a href="javascript:void(0);" class="btn63_01" id="saveBtn">提交审核</a>
				<a id='resetBtn' href="javascript:void(0);" class="btn63_02 margin_let10">重置</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/krcar/typein.js?r=<%=new Date()%>");
</script>
