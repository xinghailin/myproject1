<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="jndSubPurchaseLstForApayQuery" namespace="car-ms"/>">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="jndPurchaseLstForApayIndex" namespace="car-ms"/>">
<input type="hidden" id="currpage" value="${currpage}"><input type="hidden" id="buyid" value="${buyid}">
<div class="main_right" id="viewList" style="margin-left:40px;width: 95%;height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm">	    
			<ul class="tb_ul02">
				<li>
				<div class="tbul02_right02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">品牌：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="brand" id="brand"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">创建时间：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="time" id="time"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
				</li>
			</ul>
			<div class="btnlist" style="margin-bottom: 20px;">
				<div style="width: 400px; margin: auto;">
					<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
					<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a>
				</div>
			</div>
			</form>
		</div>
		<div class="clear"></div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
		</div><div class="btnlist">
		<div style="width: 400px; margin: auto;">
		<a id="sureBtn" href="javascript:void(0);" class="btn63_01 margin_let10">确定(confirm)</a>
		<a id="backBtn" href="javascript:void(0);" class="btn63_02 margin_let10">返回(back)</a>
		<a id="closeBtn" href="javascript:void(0);" class="btn63_02 margin_let10">关闭(close)</a>
		</div>
		</div>
</div>
</div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr><th style="text-align:center">&nbsp;请选择&nbsp;</th>
            <th style="text-align:center">采购计划编号</th>
			<th style="text-align:center">采购计划名称</th>
<th style="text-align:center">首字母</th>
			<th style="text-align:center">品牌</th>
            <th style="text-align:center">型号</th>
			<th style="text-align:center">版别</th>
			<th style="text-align:center">调剂</th>
<th style="text-align:center;width:20%;max-width:30%;">配置</th>
			<th style="text-align:center">外观颜色</th>
			<th style="text-align:center">内饰颜色</th>
            <th style="text-align:center">数量</th>
<th style="text-align:center">付款锁定数量</th>
			<th style="text-align:center">供应方</th>
			<th style="text-align:center">总车价</th>
            <th style="text-align:center">创建时间</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr><td><input type="radio" name="carID" id="carID{{id}}" value="{{id}}" {{formatDisable num locknum}}></td>
            <td>{{code}}</td>
            <td>{{name}}</td>
<td>{{initials}}</td>
 			<td>{{brand}}</td>
            <td>{{model}}</td>
			<td>{{version}}</td>
            <td>{{adjust}}</td>
<td>{{config}}</td>
            <td>{{outcolor}}</td>
			<td>{{incolor}}</td>
 			<td>{{num}}</td>
<td>{{locknum}}</td>
			<td>{{supplyname}}</td>
            <td>{{totalprice}}</td>
            <td>{{_formatDatetime createtime}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jnd/subpurchaselstforapay.js?v=<%=new Date()%>");
</script>