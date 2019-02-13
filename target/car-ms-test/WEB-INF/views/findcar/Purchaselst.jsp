<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="queryPurchaseBill" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="editneedbill" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm">	    
			<ul class="tb_ul02">
				<li>
				<div class="tbul02_left02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">品牌：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="brand" id="brand"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">型号：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="model" id="model"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_right02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">版别：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="version" id="version"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">供应商名称：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="supplyname" id="supplyname"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
				</li>
				<li>
						<div class="tbul02_left02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">采购报价有效期：</span> <span
								class="td_02" style="margin-top: 4px;">
								<input name="vtime" id="vtime"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">是否匹配过：</span> <span
								class="td_02" style="margin-top: 8px;">	
						<input type="radio"  name="isused" value="1"/>是&nbsp;
		  	             <input type="radio"  name="isused" value="2"/>否&nbsp;</span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">现车或期货：</span> <span
								class="td_02" style="margin-top: 8px;">	
						<input type="radio"  name="nowhave" value="1"/>现车&nbsp;
		  	            <input type="radio"  name="nowhave" value="2"/>期货&nbsp;</span>
						</div>
					</div>
				</li>
			</ul>
			<div class="btnlist" style="margin-bottom: 20px;">
				<div style="width: 400px; margin: auto;">
					<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
					<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a>
					<%-- <a href="<ufa:url fieldName="addPurchaseBillPage" namespace="car-ms"/>" id="btnReset" class="btn63_01 margin_let10">添加</a> --%>
				</div>
			</div>
			</form>
		</div>
		<div class="clear"></div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
		</div>
</div>
</div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">供应商名称</th>
			<th style="text-align:center">品牌</th>
            <th style="text-align:center">型号</th>
            <th style="text-align:center">版别</th>
<th style="text-align:center">现车或期货</th>
<th style="text-align:center">期货时间</th>
<th style="text-align:center">报价有效期</th>
<th style="text-align:center">采购报价有效期</th>
		    <th style="text-align:center">裸车价</th>
			<th style="text-align:center">服务费票点</th>
			<th style="text-align:center">中文系统</th>
            <th style="text-align:center">中间商</th>
            <th style="text-align:center">渠道费</th>
   			<th style="text-align:center">成本价</th>
		    <th style="text-align:center">是否匹配过</th>
   			<th style="text-align:center">创建时间</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
 			<td>{{supplyname}}</td>
            <td>{{brand}}</td>
            <td>{{model}}</td>
            <td>{{version}}</td>
<td>{{formathave nowhave}}</td>
<td>{{_formatSimpleDatetime futuretime}}</td>
<td>{{_formatSimpleDatetime offertime}}</td>
<td>{{_formatSimpleDatetime validtime}}</td>
			<td>{{bodyprice}}</td>
<td>{{tpprice}}</td>
<td>{{cnsystem}}</td>
<td>{{formatmidman middleman}}</td>
<td>{{channelprice}}</td>
            <td>{{offerprice}}</td>
			<td>{{formatused isused}}</td>
			<td>{{_formatDatetime createtime}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/findcar/Purchaselst.js?r=<%=new Date()%>");
</script>