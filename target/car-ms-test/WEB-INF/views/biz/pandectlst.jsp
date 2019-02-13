<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css"/>
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="bizcontractpandectquery" namespace="car-ms"/>">
<input type="hidden" id="baseUrl"
	value="<ufa:url fieldName="bizcontractpandectbaseview" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">档案编号：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="filecode" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">乙方：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="bname" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">客户电话：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="bphone" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">身份证号：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="identify" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
					</li>
				</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="width: 300px; margin: auto;">
						<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
						<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a>
					</div>
				</div>
			</form></div>
<div class="clear"></div>
<div class="hide" id="J_DataList"></div>
<div class="nodata hide" id="J_NoDataMsg">
	<p>暂无数据。</p>
</div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
<th style="text-align:center">档案编号</th>
            <th style="text-align:center">甲方</th>
            <th style="text-align:center">甲方门店</th>
            <th style="text-align:center">乙方</th>
            <th style="text-align:center">客户类别</th>
            <th style="text-align:center">客户电话</th>
			<th style="text-align:center">客户身份证</th>
<th style="text-align:center">品牌</th>
			<th style="text-align:center">型号</th>
			<th style="text-align:center">车架号（vin）</th>
			<th style="text-align:center">销售价（元）</th>
            <th style="text-align:center">定金（元）</th>
<th style="text-align:center">金融</th>
			<th style="text-align:center">创建者</th>
<th style="text-align:center">创建时间</th>
            <th style="text-align:center">状态</th>
			<th style="text-align:center;width:80px;">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{filecode}}</td>
            <td>{{name}}</td>
            <td>{{shopname}}</td>
            <td>{{bname}}</td>
            <td>{{formatclienttype clientype}}</td>
            <td>{{bphone}}</td>
            <td>{{identify}}</td>
<td>{{brand}}</td>
            <td>{{model}}</td>
 	 		<td>{{vin}}</td>
            <td>{{saleprice}}</td>
            <td>{{downpay}}</td>
<td>{{formatfinance finance}}</td>
            <td>{{sellername}}</td>
<td>{{_formatDatetime createtime}}</td>
            <td>{{formatstatus status status2 finance}}</td>
<td>{{_operate id status finance status2}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/biz/pandectlst.js?r=<%=new Date()%>");
</script>