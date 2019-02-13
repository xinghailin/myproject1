<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="leasebacklist" namespace="car-ms"/>">
<input type="hidden" id="searchshopgroupUrl" value="<ufa:url fieldName="leasebackshopgrouplist" namespace="car-ms"/>">
<input type="hidden" id="addUrl" value="<ufa:url fieldName="canadaaddneed" namespace="car-ms"/>">
<input type="hidden" id="deleteUrl" value="<ufa:url fieldName="jndneeddelete" namespace="car-ms"/>">
<input type="hidden" id="leasebackdetails" value="<ufa:url fieldName="leasebackdetails" namespace="car-ms"/>">
<input type="hidden" id="leasebackUrl" value="<ufa:url fieldName="addleasebackcontract" namespace="car-ms"/>">
<input type="hidden" id="updateleasebackUrl" value="<ufa:url fieldName="updateleaseback" namespace="car-ms"/>">
<input type="hidden" id="repealleasebackUrl" value="<ufa:url fieldName="repealleaseback" namespace="car-ms"/>">
<input type="hidden" id="addinsuranceUrl" value="<ufa:url fieldName="addinsurance" namespace="car-ms"/>">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="leasebackListpage" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;">
	<div class="rg_list">
	<input type="hidden" id="loginId" name="loginId" value="${loginId }">
	 <input type="hidden" id="currpage" name="currpage" value="${currpage }"/>
	  <input type="hidden" id="shopid" name="shopid" value="${shopid }"/>
	  <input type="hidden" id="type" name="type" value="${type }"/><!--1 修改编辑列表 2 是审核列表  -->
		<div class="tb_list">
		  <form name="searchForm" id="searchForm" action="<ufa:url fieldName="leasebacklist" namespace="car-ms"/>" method="post" target="hideiframe">	    
					<ul class="tb_ul02"> 
				 <li> 
									<div class="tbul02_right02" style="width:30%">
								<div class="tab_txt01">
							<span class="td_01">销售合同编号：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="filecode" id="filecode"
								class="input_text01" type="text" style="width:180px;"></span>
								</div>
								</div>
								<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">第一年合同编号：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="firstyearccode" id="firstyearccode"
								class="input_text01" type="text" style="width:180px;"></span>
								</div></div>
									<div class="tbul02_right02" style="width:30%">
								<div class="tab_txt01">
							<span class="td_01">二到四年合同编号：</span> <span
								class="td_02" style="margin-top: 4px;">
								<input type="text" id="secondyearccode" name="secondyearccode"  />&nbsp;</span>
						</div>
						</div>
					</li> 
					 <li> 
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">乙方姓名：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="bname" id="bname"
								class="input_text01" type="text" style="width:180px;"></span>
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
</div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">合同编号</th>
			<th style="text-align:center">甲方联系人</th>
			<th style="text-align:center">甲方电话</th>
			<th style="text-align:center">乙方联系人</th>
			<th style="text-align:center">乙方电话</th>
            <th style="text-align:center">第一年合同编号</th>
            <th style="text-align:center">第一年租赁物货款</th>
 			<th style="text-align:center">第一年动态监管费</th>
 			<th style="text-align:center">第一年履约险</th>
			<th style="text-align:center">第一年开户行</th>
			<th style="text-align:center">第一年账户名</th>
			<th style="text-align:center">第一年账号</th>
            <th style="text-align:center">二到四年合同编号</th>
 			<th style="text-align:center">二到四年租赁物货款</th>
			<th style="text-align:center">二到四年动态监管费</th>
			<th style="text-align:center">二到四年履约险</th>
			<th style="text-align:center">二到四年开户行</th>
			<th style="text-align:center">二到四年账户名</th>
			<th style="text-align:center">二到四年账号</th>
			<th style="text-align:center">审核状态</th>
            <th style="text-align:center;width:100px;">操作</th>
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
			<td>{{_status status}}</td>
             <td>{{_operate id status}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/addleasebackcontract/leasebackListpage.js?r=<%=new Date()%>");
</script>