<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/index.css">
<input type="hidden" id="searchUrl"
	value="<ufa:url fieldName="Poolmanagementlist" namespace="car-ms"/>">
<input type="hidden" id="addpoolUrl" value="<ufa:url fieldName="addpool" namespace="car-ms"/>">
<input type="hidden" id="deleteUrl" value="<ufa:url fieldName="pooldelete" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="addpool" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">
	<div class="rg_list">
		<input type="hidden" id="currpage" name="currpage" value="${currpage }" /> <input type="hidden"
			id="loginid" value="${loginid }" /> <input type="hidden" id="type" value="${type }" />
		<div class="tb_list">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>" method="post"
				target="hideiframe">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01">库融名称 ：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="name" id="name" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01">负责人：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="principal" id="principal" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01">电话：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input type="text" id="phone" name="phone">&nbsp;
								</span>
							</div>
						</div>
					</li>
				</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="text-align: center;">
						<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
						<c:if test="${type==1 }">
						<a href="javascript:void(0);" id="addpool" class="btn63_01">添加库融池</a></c:if>
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
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">库融名称</th>
            <th style="text-align:center">库融地址</th>
            <th style="text-align:center">负责人</th>
            <th style="text-align:center">电话</th>
            <th style="text-align:center">总额度(万)</th>
			<th style="text-align:center">放款时间</th>
			<th style="text-align:center">创建时间</th>
			<th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{name}}</td>
  			<td>{{address}}</td>
			<td>{{principal}}</td>
			<td>{{phone}}</td>
			<td>{{totalmoney}}</td>
			<td>{{_formatDatetime loantime}}</td>
  			<td>{{_formatDatetime createtime}}</td>
             <td>{{_operate id loantime}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/krcar/Poolmanagementpage.js?r=<%=new Date()%>");
</script>