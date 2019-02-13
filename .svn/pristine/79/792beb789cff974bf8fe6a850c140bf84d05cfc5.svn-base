<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="FINDSTORELISTMETHOD_CARFINANCE_METHOD" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 190%;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>" method="post"
				target="hideiframe">
				<ul class="tb_ul02">
					<li>
						<input id="currpage" value="${currpage }" type="hidden" />
						<input id="shopId" name="shopId" value="${carFinanceShopDto.id}" type="hidden" />
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">金融合作类型： ${carFinanceShopDto.type}</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">门店名称：${carFinanceShopDto.name}</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">门店类型：${carFinanceShopDto.financeType}</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">组名称： ${carFinanceShopDto.termName}</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">结息日期： ${carFinanceShopDto.payDate}</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">当前样车利息：${carFinanceShopDto.sumMoney}</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">授信额度：${carFinanceShopDto.credit}(万)</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">已用额度：${carFinanceShopDto.sumSettlementprice}</span>
							</div>
						</div>												
					</li>
					<li>
					
					<li>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">剩余额度：${carFinanceShopDto.remainsumMoney}</span>
							</div>
						</div>						
					</li>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">车架号：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input class="input_text01" name="vin" id="vin" class="input_text01" type="text"
										style="width: 180px;">
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
            <th style="text-align:center">样车金融</th>
            <th style="text-align:center">采购金融</th>
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
            <th style="text-align:center">结息</th>
            <th style="text-align:center">结算价</th>       
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>      
           <td>{{shopName}}</td>
            <td>{{principal}}</td>
            <td>{{deposit}}</td>
            <td>{{_financeTypeY financeType}}</td>
            <td>{{_financeTypeC financeType}}</td>
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
    seajs.use("${scriptBasePath}/carFinance/shopList.js?r=<%=new Date()%>");
</script>