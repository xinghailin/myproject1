<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link rel="stylesheet" href="${cssBasePath}/common/index.css" />
<link rel="stylesheet" href='${cssBasePath}/common/common.css' />
<link rel="stylesheet" href="${cssBasePath}/common/default.css">
<link rel="stylesheet" href="${contextPath}/resources/style/jquery.css" />
<style>
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 88);
}

.white_content {
	display: none;
	position: absolute;
	top: 5%;
	left: 40%;
	width: 20%;
	height: 15%;
	padding: 20px;
	border: 5px solid orange;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>
</head>
<body>
	<input type="hidden" id="searchUrl" value="<ufa:url fieldName="mallcarsourcequery" namespace="car-ms"/>">
	<input type="hidden" id="delUrl" value="<ufa:url fieldName="mallcarsourcedel" namespace="car-ms"/>">
	<input type="hidden" id="vUrl" value="<ufa:url fieldName="mallcarsourcevalid" namespace="car-ms"/>">
	<input type="hidden" id="toaddUrl" value="<ufa:url fieldName="mallcarsourcetoadd" namespace="car-ms"/>">
	<input type="hidden" id="viewUrl" value="<ufa:url fieldName="mallcarsourceview" namespace="car-ms"/>">
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
							class="btn63_02 margin_let10">重置</a><a href="javascript:void(0);" id="addBtn" class="btn63_01 margin_let10">新建车源</a></div>
				</div>
			</form>
		</div>
			<div class="hide" id="J_DataList"></div>
			<div class="nodata hide" id="J_NoDataMsg">
				<p>暂无数据。</p>
		</div>
			<div id="light" class="white_content"><div style="margin-top: 5%; margin-left: 20%; margin-bottom: 38%;">请选择车源区域：<select name="areaid" id="areaid">
						<option value="">--请选择--</option>
						<c:if test="${not empty country}">
							<option value="${country}">${countryBean.name}</option>
						</c:if>
						<c:if test="${empty country}">
							<c:forEach var="item" items="${countryList}">
								<option value="${item.id}">${item.name}</option>
							</c:forEach>
						</c:if>
				</select></div>
				<div style="margin-left: 28%;"><a href="javascript:void(0)" id="surea" class="btn63_01">确定</a><a href="javascript:void(0)"
					onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'" class="btn63_02 margin_let10" style="margin-left: 20%;">关闭</a></div></div>
			<div id="fade" class="black_overlay"></div> <script id="dataListTemplate" type="text/x-handlebars-template">
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
<td>{{_operate id status}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script> <script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js" id="seajsnode"></script> <script
			type="text/javascript">
    seajs.use("${scriptBasePath}/mall/carsource.js?r=<%=new Date()%>");
			</script>
</body>
</html>