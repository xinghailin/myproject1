<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css" />
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="sbforcasechoosequery" namespace="car-ms"/>">
<input type="hidden" id="case1addurl" value="<ufa:url fieldName="case1toadd" namespace="car-ms"/>">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="caselst" namespace="car-ms"/>">
<%-- <input type="hidden" id="currpage" name="currpage" value="${currpage }" /> --%>
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01"><span class="td_01">销售合同编号：</span> <span class="td_02" style="margin-top: 4px;"><input name="filecode" id="filecode" class="input_text01" type="text" style="width: 180px;"></span></div>
					</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01"><span class="td_01">乙方：</span> <span class="td_02" style="margin-top: 4px;"><input name="bname" id="bname" class="input_text01" type="text" style="width: 180px;"></span></div>
					</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01"><span class="td_01">第一年合同编号：</span> <span class="td_02" style="margin-top: 4px;"><input name="firstyearccode" id="firstyearccode" class="input_text01" type="text" style="width: 180px;"></span></div>
					</div>
				</li>
			</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="width: 400px; margin: auto;"><a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a> <a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a></div>
			</div>
		</form>
	</div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
	</div>
		<div class="btnlist">
			<div style="width: 250px; margin: auto;"><a id='backBtn' href="javascript:void(0);" class="btn63_01">返回</a></div>
	</div>
</div>
</div>
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">销售合同编号</th>
			<th style="text-align:center">甲方</th>
			<th style="text-align:center">甲方电话</th>
			<th style="text-align:center">乙方</th>
			<th style="text-align:center">乙方电话</th>
            <th style="text-align:center">第一年合同编号</th>
            <th style="text-align:center">第一年租赁物货款</th>
 			<th style="text-align:center">第一年动态监管费</th>
 			<th style="text-align:center">第一年履约险</th>
			<th style="text-align:center">第一年开户行</th>
			<th style="text-align:center">第一年账户名</th>
			<th style="text-align:center">第一年账号</th>
            <th style="text-align:center">后三年合同编号</th>
 			<th style="text-align:center">后三年租赁物货款</th>
			<th style="text-align:center">后三年动态监管费</th>
			<th style="text-align:center">后三年履约险</th>
			<th style="text-align:center">后三年开户行</th>
			<th style="text-align:center">后三年账户名</th>
			<th style="text-align:center">后三年账号</th>
            <th style="text-align:center;width:60px;">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{filecode}}</td>
  			<td>{{principle}}</td>
  			<td>{{phone}}</td>
			<td>{{bname}}</td>
			<td>{{bphone}}</td>
			<td>{{firstyearccode}}</td>
			<td>{{leaseprice}}</td>
			<td>{{superviseprice}}</td>
			<td>{{promiseprice}}</td>
  			<td>{{openbank}}</td>
			<td>{{accountname}}</td>
			<td>{{accountcode}}</td>
			<td>{{secondyearccode}}</td>
			<td>{{sleaseprice}}</td>
			<td>{{ssuperviseprice}}</td>
			<td>{{spromiseprice}}</td>
			<td>{{sopenbank}}</td>
			<td>{{saccountname}}</td>
			<td>{{saccountcode}}</td>
            <td>{{_operate id caseid}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
	seajs.use("${scriptBasePath}/biz/saleborrowlistforcasechoose.js?r=<%=new Date()%>");
</script>