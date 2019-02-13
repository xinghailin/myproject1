<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="addcarUrl"
	value="<ufa:url fieldName="KRCAR_TYPEIN_SUBMIT" namespace="car-ms"/>">
<input type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input type="hidden" id="modelUrl"
	value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="financecheckUrl" value="<ufa:url fieldName="WHOLESALE_FINANCECHECKCAR_URL" namespace="car-ms"/>">
<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
			<ul class="tb_ul02">
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label>品牌：
							</span>
							<span style="line-height: 35px; margin-top: 8px; width: 200px;">
								<input type="text" id="price" name="brand" value="${wholesaleCar.brand}" readonly="readonly"/>
							</span>
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label>型号：
							</span>
							<span style="line-height: 35px; margin-top: 8px; width: 200px;">
								<input type="text" id="model" value="${wholesaleCar.model}" name="model" readonly="readonly"/>
							</span>
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label>版别：
							</span>
							<span style="line-height: 35px; margin-top: 8px; width: 400px;">
								<input type="text" value="${wholesaleCar.version}" name="version" id="version"
									style="width: 300px;" readonly="readonly"/>
							</span>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label> 车架号：
							</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" id="vin" name="vin" value="${wholesaleCar.vin}" width="280px" readonly="readonly" />
								&nbsp;
							</span>
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label> 价格(元)：
							</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" id="price" name="price" value="${wholesaleCar.price}" readonly="readonly"/>
								&nbsp;
							</span>
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label> 水单：
							</span>
							<span style="line-height: 35px; width: 200px;">
							   <a href="${contextPath}${wholesaleCar.monad}" download="${wholesaleCar.monad}"
							style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${wholesaleCar.monadname}</a>
								&nbsp;
							</span>						
						</div>
					</li>
				<form name="editForm" id="editForm" method="POST" >
					<input id="id" type="hidden" name="id" value='${wholesaleCar.id}' />
					<input id="status2" type="hidden" name="status2" value='${wholesaleCar.status2}' />
					
					<div style="">
						<textarea style="margin-left: 50px" cols="45" rows="3" placeholder="审核不通过的理由" name="reason2"
							id="reason2" value=""></textarea>
					</div>
				</form>
			</ul>
		</div>
		<div class="btnlist">
			<div style="width: 400px; margin: auto; margin-top: 80px;">
				<a id="yesBtn" href="javascript:void(0);" class="btn63_01" >审核通过</a>
				<a id='noBtn'  href="javascript:void(0);" class="btn63_02 margin_let10">驳回修改</a>
				<a id='nopassBtn'  href="javascript:void(0);" class="btn63_02 margin_let10">不通过</a>
				<a id='backBtn' href="javascript:void(0);" class="btn63_01 margin_let10">返回</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/wholesale/financeCheck.js?r=<%=new Date()%>");
</script>
