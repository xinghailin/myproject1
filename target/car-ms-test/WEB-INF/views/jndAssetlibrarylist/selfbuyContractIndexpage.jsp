<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="contractIndex" namespace="car-ms"/>">
<input type="hidden" id="njndApplyPayAddUrl" value="<ufa:url fieldName="njndApplyPayAdd" namespace="car-ms"/>">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="njndPurchaseLstForApayIndex" namespace="car-ms"/>">
<input type="hidden" id="currpage" value="${currpage}">
<input type="hidden" id="buyid" value="${buyid}"><!-- 采购计划id -->
<input type="hidden" id="cbuyid" value="${cbuyid}"><!-- 编辑时采购计划id  -->
<input type="hidden" id="cid" value="${cid}"><!-- 编辑时付款申请单id -->
<input type="hidden" id="paytype" value="${paytype}"><!--定金还是全款  -->
<input type="hidden" id="selfbuy" value="${selfbuy}"><!--定金时1 自采 2 带采  -->
<div class="main_right" id="viewList" style="margin-left: 40px; width: 95%; height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
		</div>
		<div class="clear"></div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
		</div>
		<div class="btnlist">
			<div style="width: 400px; margin: auto;">
				<a id="sureBtn" href="javascript:void(0);" class="btn63_01 margin_let10">提交(submit)</a>
				<a id="back" href="javascript:void(0);" class="btn63_02 margin_let10">返回(back)</a>
				<a id="closeBtn" href="javascript:void(0);" class="btn63_02 margin_let10">关闭(close)</a>
			</div>
		</div>
	</div>
</div>
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr><th style="text-align:center">&nbsp;请选择(choose)&nbsp;</th>
			<th style="text-align:center">采购计划编号(purchaseCode)</th>
			<th style="text-align:center">合同编号(contractCode)</th>
			<th style="text-align:center">车辆品牌(brand)</th>
            <th style="text-align:center">车辆型号(model)</th>
            <th style="text-align:center">车辆版别(version)</th>
			<th style="text-align:center">车辆排量(displacement)</th>
			<th style="text-align:center">车价(price)</th>
			<th style="text-align:center">成本价(totalprice)</th>
			<th style="text-align:center">数量(num)</th>
            <th style="text-align:center">加装费用(addCost)</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
       <td><input type="radio" name="buyID" id="checkbox1" value="{{id}}" ></td>
			<td>{{code}}</td>
            <td>{{ccode}}</td>
			<td>{{brand}}</td>
            <td>{{model}}</td>
            <td>{{version}}</td>
            <td>{{displacement}}</td>
 			<td>{{price}}</td>
			<td>{{totalprice}}</td>
			<td>{{num}}</td> 
            <td>{{trimprice}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jndAssetlibrarylist/contractIndexpage.js?v=<%=new Date()%>");
</script>