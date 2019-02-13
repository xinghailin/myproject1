<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl"
	value="<ufa:url fieldName="supplycarshoplst" namespace="car-ms"/>">
<input id="provincesQueryUrl" type="hidden"
	value='<ufa:url namespace="car-ms" fieldName="DATA_GETPROVINCES"/>' />
<input id="citiesQueryUrl" type="hidden"
	value='<ufa:url namespace="car-ms" fieldName="DATA_GETCITIES"/>' />
<input type="hidden" id="createUrl" value="<ufa:url fieldName="SHOP_EDIT" namespace="car-ms"/>">
<input type="hidden" id="transferUrl"
	value="<ufa:url fieldName="LOCATION_TRANSFER" namespace="car-ms"/>">
<input type="hidden" id="deleteUrl" value="<ufa:url fieldName="SHOP_DEL" namespace="car-ms"/>">
<input type="hidden" id="viewUrl" value="<ufa:url fieldName="SHOP_CARS" namespace="car-ms"/>">
<input type="hidden" id="carlibrarylistpageUrl"
	value="<ufa:url fieldName="carlibrarylistpage" namespace="car-ms"/>">
<input type="hidden" id="comparisonTotaMoneyUrl"
	value="<ufa:url fieldName="comparisonTotaMoney" namespace="car-ms"/>">
<input type="hidden" id="supplycardetailedlistUrl"
	value="<ufa:url fieldName="supplycardetailedlist" namespace="car-ms"/>">
<input type="hidden" id="supplycarshopcarslstUrl"
	value="<ufa:url fieldName="supplycarshopcarslst" namespace="car-ms"/>">

<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px;">
	<input id="checkval" type="hidden" name="checkval" value="${checkval }">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="SHOP_EXCEL" namespace="car-ms"/>" method="post" target="hideiframe">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_left02" style="width: 20%">
							<div class="tab_txt01">
								<span class="td_01">门店名称：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="name" id="name" class="input_text01" type="text">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 20%">
							<div class="tab_txt01">
								<span class="td_01">门店电话：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input class="input_text01" name="tel" id="tel" class="input_text01" type="text">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%;">
							<div class="tab_txt01">
								<span class="td_01" style="">省 :</span>
								<span class="td_05" style="margin-top: 8px;">
									<select id="provinces" name="province" style="width: 100px;">
									</select>
								</span>
								<span class="td_01" style="width: 40px;">市 :</span>
								<span class="td_05" style="margin-top: 8px;">
									<select id="cities" name="city" style="width: 100px;">
										<option value="">--请选择市--</option>
									</select>
								</span>
							</div>
						</div>
					</li>
				</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="width: 400px; margin: auto;">
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
	<div align="center">
		<a href="javascript:void(0);" onclick="back()" class="btn63_01">返回</a>
	</div>
</div>
<iframe name="hideiframe" style="display: none;"></iframe>
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center">门店名称</th>
			<th style="text-align:center">门店地址</th>
            <th style="text-align:center">门店电话</th>
            <th style="text-align:center">省</th>
            <th style="text-align:center">市</th>
            <th style="text-align:center">负责人</th>
            <th style="text-align:center">联系方式</th>
			<th style="text-align:center">门店类型</th>
			<th style="text-align:center">样车金融(万)</th>
			<th style="text-align:center">样车金融利率(%)</th>
            <th style="text-align:center">押金</th>
            <th style="text-align:center">采购金融(万)</th>
			<th style="text-align:center">采购金融利率(%)</th>
			<th style="text-align:center">签约日期</th>
			<th style="text-align:center">公司</th>
			<th style="text-align:center;width: 100px;">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{name}}</td>
			<td>{{address}}</td>
            <td>{{tel}}</td>
            <td>{{province}}</td>
			<td>{{city}}</td>
            <td>{{principal}}</td>
			<td>{{priTel}}</td>
			<td>{{_formatype type}}</td>
			<td>{{credit}}</td>
			<td>{{creditinterestrate}}</td>
            <td>{{deposit}}</td>
			<td>{{financial}}</td>
			<td>{{financialinterestrate}}</td>
			<td>{{_formatSimpleDatetime signtime}}</td>
			<td>{{company}}</td>
            <td>{{addButton id type}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
function back(){
	location.href=$('#carlibrarylistpageUrl').val();
}
    seajs.use("${scriptBasePath}/addleasebackcontract/supplycarshop.js?r=<%=new Date()%>");
</script>