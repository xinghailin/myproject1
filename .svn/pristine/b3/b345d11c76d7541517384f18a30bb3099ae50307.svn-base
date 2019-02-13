<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="FINDLISTMETHOD_CARFINANCE_METHOD" namespace="car-ms"/>">
<input type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input type="hidden" id="modelUrl" value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="versionUrl" value="<ufa:url fieldName="QUERY_VERSION" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 190%;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>" method="post"
				target="hideiframe">
				<ul class="tb_ul02">
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label>
								品牌首字母：
							</span>
							<span class="" style="line-height: 35px; margin-top: 8px; width: 200px;">
								<select id="brandinitial" name="" style="line-height: 35px; width: 159px;">
									<option>--请选择--</option>
									<c:forEach var="item" items="${brand}">
										<option value="<c:out value="${item.brandinitial}"></c:out>"><c:out
												value="${item.brandinitial}"></c:out></option>
									</c:forEach>
								</select>
							</span>
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label>
								品牌：
							</span>
							<span style="line-height: 35px; margin-top: 8px; width: 230px;">
								<select id="brand" name="brand" style="line-height: 35px; width: 159px;">
								</select>
							</span>
							<span class="td_01" style="width: 90px;">
								<label class="fc_red">*</label>
								型号：
							</span>
							<span style="line-height: 35px; margin-top: 8px; width: 260px;">
								<select id="model" name="model" style="line-height: 35px; width: 159px;">
								</select>
							</span>
							<span class="td_01" style="width: 80px;">
								<label class="fc_red">*</label>
								版别：
							</span>
							<span style="line-height: 35px; margin-top: 8px; width: 230px;">
								<select id="version" name="version" style="line-height: 35px; width: 159px;">
								</select>
							</span>
						</div>
					</li>

					<li>
						<input id="currpage" value="${currpage }" type="hidden" />
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">门店名称：</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" name="shopName" id="shopName" width="280px" />
								&nbsp;
							</span>
							<span class="td_01" style="width: 120px;">组名称：</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" name="shopTermName" id="shopTermName" width="280px" />
								&nbsp;
							</span>
							<span class="td_01" style="width: 120px;">车架号：</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" name="vin" id="vin" width="280px" />
								&nbsp;
							</span>
						</div>
					</li>

				</ul>

				<ul>
					<div class="tbul02_right02" style="width: 25%">
						<div class="tab_txt01">
							<span class="td_01">利息总额：${carFinanceShopDto.sumMoney}</span>
						</div>
					</div>
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
</div>
<iframe name="hideiframe" style="display: none;"></iframe>	
<div id="imgLayer" class="ele_img_item clearfix" style="position:absolute;z-index:1;width: 260px; solid;display:none;" ></div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>								
            <th style="text-align:center">门店名称</th>
            <th style="text-align:center">负责人</th>
            <th style="text-align:center">押金</th>
            <th style="text-align:center">样车金融本金</th>
            <th style="text-align:center">组名称</th>
            <th style="text-align:center">组</th>
            <th style="text-align:center">品牌</th>
            <th style="text-align:center">型号</th>
            <th style="text-align:center">版本</th>
            <th style="text-align:center">颜色</th>
            <th style="text-align:center">VIN</th>
            <th style="text-align:center">出厂日期</th>          
            <th style="text-align:center">合同日期</th>
            <th style="text-align:center">到期日期</th>
            <th style="text-align:center">利息</th>
            <th style="text-align:center">结算价</th>                     
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr> 
            <td>{{shopName}}</td>
            <td>{{principal}}</td>
            <td>{{deposit}}</td>
            <td>{{contractprice}}</td>
            <td>{{shopTermName}}</td>
            <td>{{shopTermId}}</td>
			<td>{{brand}}</td>
			<td>{{model}}</td>
            <td>{{version}}</td>
            <td>{{outlookColor}}</td>
            <td>{{vin}}</td>
            <td>{{_formatSimpleDate leaveFactoryTime}}</td>
            <td>{{_formatSimpleDate signingdate}}</td>
            <td>{{_formatSimpleDate duedate}}</td>
            <td>{{sumMoney}}</td>
            <td>{{settlementprice}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/carFinance/financeDetailList.js?r=<%=new Date()%>");
</script>