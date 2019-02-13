<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link rel="stylesheet" href="${cssBasePath}/common/index.css" />
<link rel="stylesheet" href='${cssBasePath}/common/common.css' />
<link rel="stylesheet" href="${cssBasePath}/common/default.css">
<link rel="stylesheet" href="${contextPath}/resources/style/jquery.css"/>
</head>
<body>
	<input type="hidden" id="searchUrl" value="<ufa:url fieldName="mallcarsourcequery" namespace="car-ms"/>">
	<input type="hidden" id="editUrl" value="<ufa:url fieldName="mallcarsourceaudit" namespace="car-ms"/>">
	<input type="hidden" id="currpage" value="${currpage }">
	<input type="hidden" id="country" value="${country }">
	<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px;">
		<div class="rg_list">
			<div class="tb_list">
				<form name="searchForm" id="searchForm">
					<ul class="tb_ul02">
						<li><c:if test="${empty country}">
								<div class="tbul02_left02" style="width: 30%">
									<div class="tab_txt01"><span class="td_01">区域：</span> <span class="td_02" style="margin-top: 4px;"> <input name="area" class="input_text01" type="text"
											style="width: 180px;">
									</span></div>
								</div>
							</c:if>
							<div class="tbul02_left02" style="width: 30%">
								<div class="tab_txt01"><span class="td_01">品牌：</span> <span class="td_02" style="margin-top: 4px;"> <input name="brand" class="input_text01" type="text"
										style="width: 180px;">
								</span></div>
						</div></li>
				</ul>
					<div class="btnlist" style="margin-bottom: 20px;">
						<div style="width: 400px; margin: auto;"><a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a><a href="javascript:void(0);" id="btnReset"
							class="btn63_02 margin_let10">重置</a></div>
				</div>
			</form>
		</div>
			<div class="hide" id="J_DataList"></div>
			<div class="nodata hide" id="J_NoDataMsg">
				<p>暂无数据。</p>
		</div> <script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
<th style="text-align:center">区域</th>
<th style="text-align:center">品牌</th>
            <th style="text-align:center">型号</th>
<th style="text-align:center">车价</th>
<th style="text-align:center">库存</th>
<th style="text-align:center">开证公司</th>
<th style="text-align:center">状态</th>
<th style="text-align:center">创建时间</th>
<th style="text-align:center">审核状态</th>
<th style="text-align:center">审核时间</th>
			<th style="text-align:center;">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{areaname}}</td>
<td>{{brand}}</td>
            <td>{{model}}</td>
            <td>{{carprice}}</td>
<td>{{storagenum}}</td>
<td>{{issuingcompany}}</td>
<td>{{formatstatus status}}</td>
<td>{{_formatDatetime createtime}}</td>
<td>{{formatstatus1 auditstatus}}</td>
<td>{{_formatDatetime updatetime1}}</td>
<td>{{_operate id auditstatus}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script> <script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js" id="seajsnode"></script> <script
			type="text/javascript">
    seajs.use("${scriptBasePath}/mall/carsourceauditlst.js?r=<%=new Date()%>");
			</script>
</body>
</html>