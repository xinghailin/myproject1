<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link rel="stylesheet" href="${cssBasePath}/common/index.css" />
<link rel="stylesheet" href='${cssBasePath}/common/common.css' />
<link rel="stylesheet" href="${cssBasePath}/common/default.css">
<link rel="stylesheet" href="${contextPath}/resources/style/jquery.css" />
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="canadarequirementlist" namespace="car-ms"/>">
<input type="hidden" id="addUrl" value="<ufa:url fieldName="canadaaddneed" namespace="car-ms"/>">
<input type="hidden" id="deleteUrl" value="<ufa:url fieldName="jndneeddelete" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="updatejndsuneed" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">
	<div class="rg_list"><input type="hidden" id="currpage" name="currpage" value="${currpage }" /> <input type="hidden" id="loginId" value="${loginId }" />
		<div class="tb_list">
			<form name="searchForm" id="searchForm" action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>" method="post" target="hideiframe">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01"><span class="td_01">需求单编号：</span> <span class="td_02" style="margin-top: 4px;"><input name="code" id="code" class="input_text01"
									type="text" style="width: 180px;"></span></div>
					</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01"><span class="td_01">需求单名称：</span> <span class="td_02" style="margin-top: 4px;"><input name="name" id="name" class="input_text01"
									type="text" style="width: 180px;"></span></div>
					</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01"><span class="td_01">需求单填写日期：</span> <span class="td_02" style="margin-top: 4px;"> <input type="text" id="createtime" name="createtimes"
									readonly value="<fmt:formatDate pattern="yyyy-MM-dd" value="${car.purchaseTime}" />" />&nbsp;
							</span></div>
					</div>
				</li>
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01"><span class="td_01">需求车辆数量：</span> <span class="td_02" style="margin-top: 4px;"><input name="num" id="num" class="input_text01"
									type="text" style="width: 180px;"></span></div>
					</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01"><span class="td_01">商城合同编号：</span> <span class="td_02" style="margin-top: 4px;"><input name="mallcontractcode" id="mallcontractcode"
									class="input_text01" type="text" style="width: 180px;"></span></div>
					</div> <!-- <div class="tbul02_right02" style="width:30%">
							<div class="tab_txt01">
								<span class="td_01">状态(status)：</span>
								<span class="td_02" style="margin-top: 4px;">
									<select id="status" name="status">
										<option value="">--请选择--</option>
											<option value="2">正常</option>
											<option value="1">作废</option>
									</select>
								</span>
							</div>
						</div> -->
				</li>
			</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="text-align: center;"><a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a> <a href="javascript:void(0);" id="btnReset"
						class="btn63_02 margin_let10">重置</a></div>
			</div>
		</form>
	</div>
		<div class="clear"></div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
	</div></div>
</div>
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">需求单编号</th>
            <th style="text-align:center">需求单名称</th>
            <th style="text-align:center">需求单填写日期</th>
			<th style="text-align:center">商城合同车辆</th>
            <th style="text-align:center">匹配车辆</th>
			<th style="text-align:center">剩余车辆</th>
			<th style="text-align:center">状态</th>
			<th style="text-align:center">主动采购方</th>
			<th style="text-align:center">商城合同编号</th>
            <th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{code}}</td>
  			<td>{{name}}</td>
  			<td>{{_formatDatetime createtime}}</td>
  			<td>{{formattotalnum num2 num}}</td>
			<td>{{num3}}</td>
			<td>{{num}}</td>
			<td>{{formatstatus status}}</td>
			<td>{{needer}}</td>
			<td>{{mallcontractcode}}</td>
            <td>{{_operate id status}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js" id="seajsnode"></script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jndneed/mallneedAuditLst.js?r=<%=new Date()%>");
</script>