<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="addcarUrl"
	value="<ufa:url fieldName="KRCAR_TYPEIN_SUBMIT" namespace="car-ms"/>">
<input type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input type="hidden" id="modelUrl"
	value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="checkintomethodUrl" value="<ufa:url fieldName="CHECKINTOMETHOD_KRCARENTER_URL" namespace="car-ms"/>">
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
								<input type="text" id="price" name="brand" value="${krcar.brand}" readonly="readonly"/>
							</span>
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label>型号：
							</span>
							<span style="line-height: 35px; margin-top: 8px; width: 200px;">
								<input type="text" id="model" value="${krcar.model}" name="model" readonly="readonly"/>
							</span>
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label>版别：
							</span>
							<span style="line-height: 35px; margin-top: 8px; width: 400px;">
								<input type="text" value="${krcar.version}" name="version" id="version"
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
								<input type="text" id="vin" name="vin" value="${krcar.vin}" width="280px" readonly="readonly" />
								&nbsp;
							</span>
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label> 价格(元)：
							</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" id="price" name="price" value="${krcar.price}" readonly="readonly"/>
								&nbsp;
							</span>
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label> 折扣价(元)：
							</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" id="disprice" name="disprice" value="${krcar.disprice}" readonly="readonly"/>
								&nbsp;
							</span>
							<%-- <span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label> 池分类：
							</span>
							<span class="" style="margin-top: 8px; width: 200px;">					
								<input type="text" id="disprice" name="disprice" value="${item.id}" />							
							</span> --%>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">外观颜色：</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" id="outcolor" name="outcolor" value="${krcar.outcolor}"  />
								&nbsp;
							</span>
							<span class="td_01" style="width: 120px;">内饰颜色：</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" id="incolor" name="incolor" value="${krcar.incolor}"  />
								&nbsp;
							</span>
							<span class="td_01" style="width: 200px;">
								<input type="checkbox" id="cert1" name="cert1" value="1" checked="checked" >
								关单
							</span>
							<span class="td_01" style="width: 200px;">
								<input type="checkbox" id="cert2" name="cert2" value="1" checked="checked" >
								商检单
							</span>
							<span class="td_01" style="width: 200px;">
								<input type="checkbox" id="cert3" name="cert3" value="1" checked="checked" >
								证三
							</span>
						</div>
					</li>
				<form name="editForm" id="editForm" method="POST" >
					<input id="id" type="hidden" name="id" value='${krcar.id}' />
					<input id="status" type="hidden" name="status" value='${krcar.status}' />
					
					<div style="">
						<textarea style="margin-left: 50px" cols="45" rows="3" placeholder="审核不通过的理由" name="nopassreason"
							id="nopassreason" value=""></textarea>
					</div>
				</form>
			</ul>
		</div>
		<div class="btnlist">
			<div style="width: 400px; margin: auto; margin-top: 80px;">
				<a id="yesBtn" href="javascript:void(0);" class="btn63_01" >审核通过</a>
				<a id='noBtn'  href="javascript:void(0);" class="btn63_02 margin_let10">不通过</a>
				<a id='backBtn' href="javascript:void(0);" class="btn63_01 margin_let10">返回</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/krcar/checkinto.js?r=<%=new Date()%>");
</script>
