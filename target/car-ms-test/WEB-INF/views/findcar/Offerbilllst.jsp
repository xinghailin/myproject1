<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="queryOfferbill" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="queryOfferbilldetails" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 190%;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm">	    
			<ul class="tb_ul02">
				<li>
				<input id="currpage" type="hidden" value="${currpage }"/>
				<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">品牌：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="brand" id="brand"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">型号：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="model" id="model"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_right02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">版别：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="version" id="version"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
				</li>
				<li>
				<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">姓名：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="name" id="name"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">区域：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="city" id="city"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">报价有效期：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="validtime" id="validtime"
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
		</div>
</div>
</div>
<div id="imgLayer" class="ele_img_item clearfix" style="position:absolute;z-index:1;width: 260px; solid;display:none;" ></div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">品牌</th>
            <th style="text-align:center">型号</th>
            <th style="text-align:center">版别</th>
			<th style="text-align:center">姓名</th>
			<th style="text-align:center">手机号</th>
            <th style="text-align:center">区域</th>
          	<th style="text-align:center">全款报价</th>
            <th style="text-align:center">报价有效期</th>
            <th style="text-align:center">金融第一个月月供</th>
            <th style="text-align:center">金融第二个月月供</th>
  			<th style="text-align:center">金融第十三个月月供</th>
   			<th style="text-align:center">金融第十四个月月供</th>
            <th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{brand}}</td>
            <td>{{model}}</td>
            <td>{{version}}</td>
			<td>{{name}}</td>
            <td>{{tel}}</td>
            <td>{{city}}</td>
			<td>{{allprice}}</td>
<td>{{_formatSimpleDatetime validtime}}</td>
			<td>{{firstPay}}</td>
			<td>{{secondPay}}</td>
			<td>{{thirteenthPay}}</td>
			<td>{{fourteenthPay}}</td>
            <td>{{operate id}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/findcar/Offerbilllst.js?r=<%=new Date()%>");
</script>