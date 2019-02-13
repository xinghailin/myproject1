<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/index.css">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="WHOLESALE_NOPASSLISTFORSTORE_METHOD" namespace="car-ms"/>">
<input type="hidden" id="viewUrl" value="<ufa:url fieldName="WHOLESALE_UPDATEMESSAGE_PAGE" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">
	<div class="rg_list">
		<input type="hidden" id="currpage" name="currpage" value="${currpage }" /> 
		<input type="hidden" id="loginName" name="loginName" value="${loginName }" /> 
		<div class="tb_list">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="freightApply" namespace="car-ms"/>" method="post"
				target="hideiframe">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_left02" style="width: 25%;">
							<div class="tab_txt01">
								<span class="td_01">车架号：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="vin" id="vin" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">品牌：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="brand" id="brand" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">型号：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="model" id="model" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">版别：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input type="text" id="version" name="version" class="input_text01"
										style="width: 180px;" />&nbsp;
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
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center;word-wrap:break-word;">车架号</th>
			<th style="text-align:center;word-wrap:break-word;">品牌</th>
			<th style="text-align:center;word-wrap:break-word;">型号</th>
			<th style="text-align:center;word-wrap:break-word;">版别</th>
            <th style="text-align:center;word-wrap:break-word;">价格</th>
            <th style="text-align:center;word-wrap:break-word;">状态</th>
            <th style="text-align:center;word-wrap:break-word;">不通过原因</th>
            <th style="text-align:center;word-wrap:break-word;">操作</th>
			
			
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{vin}}</td>
  			<td>{{brand}}</td>
  			<td>{{model}}</td>
  			<td>{{version}}</td>
            <td>{{price}}</td>
            <td>{{_formatstatus status2}}</td>
            <td>{{reason1}}</td>
            <td>{{addButton status2 id}}</td>   
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/wholesale/storeNoPassList.js?r=<%=new Date()%>");
</script>