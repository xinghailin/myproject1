<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="carlibrarylist" namespace="car-ms"/>">
<input type="hidden" id="addcaseUrl" value="<ufa:url fieldName="addcarcase" namespace="car-ms"/>">
<input type="hidden" id="shopUrl" value="<ufa:url fieldName="supplycarshop" namespace="car-ms"/>">

<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">
	<div class="rg_list">
		<input type="hidden" id="currpage" name="currpage" value="${currpage }" /> 
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
					<li>
						<div class="tbul02_left02" style="width: 25%;">
							<div class="tab_txt01">
								<span class="td_01">门店类型：</span>
								<select id="type" name="type" style="width: 180px; margin-top: 5px;">
									<option value="">--请选择--</option>
									<option value="1">--自营--</option>
									<option value="2">--城市合伙人--</option>
									<option value="3">--寄售--</option>
								</select>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 25%; margin-left: -40px;">
							<div class="tab_txt01">
								<span class="td_01" style="width: 180px;">门店：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="name" id="name" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
						
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
		<div style="text-align: center;">
		<a href="javascript:void(0);" id="submit" class="btn63_01">配车</a>
		</div>
</div>
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
 			<th style="text-align:center;word-wrap:break-word;">请选择</th>
            <th style="text-align:center;word-wrap:break-word;">车架号</th>
			<th style="text-align:center;word-wrap:break-word;">品牌</th>
			<th style="text-align:center;word-wrap:break-word;">型号</th>
			<th style="text-align:center;word-wrap:break-word;">版别</th>
			<th style="text-align:center;word-wrap:break-word;">颜色</th>
			<th style="text-align:center;word-wrap:break-word;">出厂日期</th>
			<th style="text-align:center;word-wrap:break-word;">gps</th>
			<th style="text-align:center;word-wrap:break-word;">合同日期</th>
			<th style="text-align:center;word-wrap:break-word;">到期日期</th>
			<th style="text-align:center;word-wrap:break-word;">结算价</th>
			<th style="text-align:center;word-wrap:break-word;">门店</th>
			<th style="text-align:center;word-wrap:break-word;">门店类型</th>
			<th style="text-align:center;word-wrap:break-word;">合作方式</th>
			<th style="text-align:center;word-wrap:break-word;">使用额度</th>
			<th style="text-align:center;word-wrap:break-word;">总额度</th>
			<th style="text-align:center;word-wrap:break-word;">状态</th>
			<th style="text-align:center;word-wrap:break-word;">车辆情况</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
 			<td><input type="checkbox" name="carid" id="checkbox1" value="{{cid}}" ></td>
            <td>{{VIN}}</td>
  			<td>{{brand}}</td>
  			<td>{{model}}</td>
  			<td>{{version}}</td>
<td>{{outlookclolor}}</td>
<td>{{_formatDatetime leaveFactoryTime}}</td>
<td>{{ gpsprice}}</td>
<td>{{_formatDatetime signingdate}}</td>
<td>{{_formatDatetime duedate}}</td>
<td>{{settlementprice}}</td>
<td>{{name}}</td>
<td>{{_type type}}</td>
<td>{{mode financetype type}}</td>
<td>{{contractprice}}</td>
<td>{{credit}}</td>
<td>{{_supplycarstatus supplycarstatus}}</td>
<td>{{_operate cid}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/addleasebackcontract/carlibrarylistpage.js?r=<%=new Date()%>");
</script>