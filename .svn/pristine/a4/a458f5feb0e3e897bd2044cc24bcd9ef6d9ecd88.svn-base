<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css" />
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="bizzeropurquery" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="bizzeropuroperate" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm">
				<ul class="tb_ul02">
					<li><input type="hidden" id="currpage" value="${currpage }">
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01"><span class="td_01">车辆品牌：</span> <span class="td_02" style="margin-top: 4px;"><input name="brand" class="input_text01" type="text" style="width: 180px;"></span></div>
					</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01"><span class="td_01">车架号：</span> <span class="td_02" style="margin-top: 4px;"><input class="input_text01" name="vin" class="input_text01" type="text" style="width: 180px;"></span></div>
					</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01"><span class="td_01">合同编号：</span> <span class="td_02" style="margin-top: 4px;"> <input name="code" class="input_text01" type="text" style="width: 180px;"></span></div>
					</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01"><span class="td_01">状态：</span> <span class="td_02" style="margin-top: 4px;"> <select id="status" name="status" style="width: 100px;">
										<option value="">--请选择--</option>
										<option value="0">未流转车辆部门</option>
										<option value="1">已流转车辆部门</option>
										<option value="2">已提交入库审核</option>
										<option value="3">审核通过已入库</option>
										<option value="4">审核不通过未入库</option>
								</select></div>
					</div></li>
			</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="width: 300px; margin: auto;"><a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a> <a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a></div>
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
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
<th style="text-align:center">车辆品牌</th>
            <th style="text-align:center">型号</th>
<th style="text-align:center">版别</th>
            <th style="text-align:center">零采成本价（元）</th>
            <th style="text-align:center">门店结算价（元）</th>
<th style="text-align:center">门店</th>
			<th style="text-align:center">车架号</th>
<th style="text-align:center">合同编号</th>
<th style="text-align:center">创建时间</th>
            <th style="text-align:center">状态</th>
			<th style="text-align:center;width:60px;">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{brand}}</td>
            <td>{{model}}</td>
            <td>{{version}}</td>
            <td>{{costprice}}</td>
            <td>{{settleprice}}</td>
            <td>{{shopname}}</td>
            <td>{{vin}}</td>
<td>{{filecode}}</td>
<td>{{_formatDatetime createtime}}</td>
            <td>{{formatstatus status}}</td>
<td>{{_operate id status}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/biz/zeropurchaselst.js?r=<%=new Date()%>");
</script>