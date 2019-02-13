<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/index.css">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="MALL_ORDERDETAIL_METHOD" namespace="car-ms"/>">
<input type="hidden" id="checkUrl" value="<ufa:url fieldName="MALL_ORDERDETAILCHECK_PAGE" namespace="car-ms"/>">
<input type="hidden" id="lookUrl" value="<ufa:url fieldName="MALL_ORDERDETAILLOOK_PAGE" namespace="car-ms"/>">
<%-- <input type="hidden" id="addContractUrl" value="<ufa:url fieldName="MALL_ORDERDETAIL_ADDCONTRACT_PAGE" namespace="car-ms"/>"> --%>
<input type="hidden" id="addContractUrl" value="<ufa:url fieldName="MALL_ORDERDETAIL_ADD_LISTPAGE" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">

<input type="hidden" id="addUrl" value="<ufa:url fieldName="WEB_PURCHASE_AREA_ADD_PAGE" namespace="car-ms"/>">
	<div class="rg_list">
		<input type="hidden" id="currpage" name="currpage" value="${currpage}" /> 
		<div class="tb_list">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="freightApply" namespace="car-ms"/>" method="post"
				target="hideiframe">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_left02" style="width: 25%;">
							<div class="tab_txt01">
								<span class="td_01">订单编号：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="code" id="code" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">下单人手机号码：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="username" id="username" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">订单状态：</span>
								<span class="td_02" style="margin-top: 10px;">
									<select id="orderstatus" name="orderstatus" style="width:100px;">
										<option value="">请选择</option>
										<option value="1">待核实</option>
										<option value="3">未完成</option>
										<option value="5">已完成</option>
									</select>
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">区域：</span>
								<span class="td_02" style="margin-top: 10px;">
									<select id="areaid" name="areaid" style="width:100px;">
										<option value="">请选择</option>
										<c:forEach var="jndSite" items ="${jndSiteList}">
										   <option value="<c:out value="${jndSite.id}"></c:out>"><c:out value="${jndSite.name}"></c:out></option>
										 </c:forEach>
									</select>
								</span>
							</div>
						</div>						
					</li>
				</ul>
				<div class="btnlist" style="margin-bottom: 20px;">

					<div style="text-align: center;">
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
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian" id="001">
        <thead>
        <tr>
            <th style="text-align:center;word-wrap:break-word;">批次号</th>
            <th style="text-align:center;word-wrap:break-word;">订单编号</th>
            <th style="text-align:center;word-wrap:break-word;">下单人手机号</th>
            <th style="text-align:center;word-wrap:break-word;">订单车辆数量</th>
            <th style="text-align:center;word-wrap:break-word;">订单总价</th>
            <th style="text-align:center;word-wrap:break-word;">订单状态</th>
            <th style="text-align:center;word-wrap:break-word;">操作</th>
      </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{orderid}}</td>
            <td>{{code}}</td>
            <td>{{username}}</td>
            <td>{{num}}</td>
            <td>{{totalprice}}</td>
            <td>{{_formatOrderstatus orderstatus}}</td>
            <td>{{_addButton id orderstatus issealapply}}</td> 
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/mallOrder/orderDetail.js?r=<%=new Date()%>");
</script>