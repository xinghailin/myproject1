<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css" />
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="caseotherquery" namespace="car-ms"/>">
<input type="hidden" id="flowUrl" value="<ufa:url fieldName="riskcaseflow" namespace="car-ms"/>">
<input type="hidden" id="operateUrl" value="<ufa:url fieldName="riskcaseoperate" namespace="car-ms"/>">
<input type="hidden" id="currpage" value="${currpage }">
<input type="hidden" id="backadd" value="${backadd }">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01"><span class="td_01">案件名称：</span> <span class="td_02" style="margin-top: 4px;"> <input name="name" class="input_text01" type="text" style="width: 180px;">
							</span></div>
					</div>
				</li>
			</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="width: 300px; margin: auto;"><a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a> <a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a>
					</div>
			</div>
		</form>
	</div>
		<div class="clear"></div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
	</div> <script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
<th style="text-align:center">案件名称</th>
<th style="text-align:center">情况描述</th>
            <th style="text-align:center">状态</th>
			<th style="text-align:center">创建者</th>
<th style="text-align:center">创建时间</th>
			<th style="text-align:center;">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{casename}}</td>
            <td>{{note}}</td>
            <td>{{formatstatus status}}</td>
            <td>{{creator}}</td>
<td>{{_formatDatetime createtime}}</td>
<td>{{_operate id finished}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script> <script type="text/javascript">
    seajs.use("${scriptBasePath}/biz/caselawlst.js?r=<%=new Date()%>");
</script>