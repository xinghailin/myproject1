<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="FINDLISTMETHOD_PAYMENTPLAN_METHOD" namespace="car-ms"/>">
<input type="hidden" id="viewUrl" value="<ufa:url fieldName="FINDLIST_PAYMENTPLANDETAIL_PAGE" namespace="car-ms"/>">
<input type="hidden" id="searchPayStatusUrl" value="<ufa:url fieldName="FINDDETAILLISTMETHOD_QUERYPAYSTATUS_METHOD" namespace="car-ms"/>">
<input type="hidden" id="searchPayMoneyUrl" value="<ufa:url fieldName="FINDDETAILLISTMETHOD_BEGINPAYMONEY_METHOD" namespace="car-ms"/>">

<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 190%;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>" method="post"
				target="hideiframe">
				<ul class="tb_ul02">

					<li>
						<input id="currpage" value="${currpage }" type="hidden" />
						<div class="tab_txt01">
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">车架号：</span> <span class="td_02"
									style="margin-top: 4px;"><input class="input_text01"
									name="vin" id="vin"  class="input_text01"
									type="text" style="width: 180px;"></span>
							</div>
						</div>	
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">手机号：</span> <span class="td_02"
									style="margin-top: 4px;"><input class="input_text01"
									name="phone" id="phone" class="input_text01"
									type="text" style="width: 180px;"></span>
							</div>
						</div>	
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">开始日期：</span> <span class="td_02"
									style="margin-top: 4px;"><input class="input_text01"
									name="payStartDateString" id="payStartDateTime" class="input_text01"
									type="text" style="width: 180px;"></span>
							</div>
						</div>											
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">结束日期：</span> <span class="td_02"
									style="margin-top: 4px;"><input class="input_text01"
									name="payEndDateString" id="payEndDateTime" class="input_text01"
									type="text" style="width: 180px;"></span>
							</div>
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
            <th style="text-align:center">车架号</th>
            <th style="text-align:center">姓名</th>
            <th style="text-align:center">电话</th>
            <th style="text-align:center">代扣款银行卡号</th>
            <th style="text-align:center">担保人</th>
            <th style="text-align:center">担保人电话</th>
            <th style="text-align:center">出售门店</th>

            <th style="text-align:center">门店联系人</th>
            <th style="text-align:center">代扣款期数</th>
            <th style="text-align:center">提交扣款请求</th>
            <th style="text-align:center">扣款状态</th>
            <th style="text-align:center">交易码</th>
            <th style="text-align:center">应扣款金额</th>
            <th style="text-align:center">扣款日期</th>
            <th style="text-align:center">提交扣款时间</th> 
            <th style="text-align:center">更新扣款状态时间</th>
            <th style="text-align:center">更新扣款状态</th>  
            <th style="text-align:center">手动扣款</th>
            <th style="text-align:center">查看代扣款记录</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr> 
            <td>{{vin}}</td>
            <td>{{name}}</td>
            <td>{{phone}}</td>
            <td>{{accountcode}}</td>
            <td>{{bondsman}}</td>
            <td>{{bmphone}}</td>
			<td>{{shopname}}</td>
            <td>{{shopprincipal}}</td>
            <td>{{term}}</td>
            <td>{{formatsendPayStatus sendPayStatus}}</td>
            <td>{{formatStatus payStatus}}</td>
            <td>{{formatResCode payStatus queryPayRespCode}}</td>
            <td>{{price}}</td>
            <td>{{_formatSimpleDate paytime}}</td>
            <td>{{formatSimpleDatetime paysubmittime}}</td>
            <td>{{formatSimpleDatetime paymodifytime}}</td>
            <td>{{addPayStatus payStatus id}}</td>
            <td>{{addPayMoney payStatus id}}</td>
			<td>{{addButton contractId}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/paymentplan/paymentplanList.js?r=<%=new Date()%>");
</script>