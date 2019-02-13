<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="LOOK_INVENTORYQUOTATION_URL" namespace="car-ms"/>">
<input type="hidden" id="viewUrl" value="<ufa:url fieldName="FINDTWOPRICE_INVENTORYQUOTATION_PAGE" namespace="car-ms"/>">
<div class="main_right" id="viewList"
	style="margin-left: 300px; width: 1550px; height: 190%;">
	<div class="rg_list">
		<div class="tb_list">
			 <form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>"
				method="post" target="hideiframe">
				<ul class="tb_ul02">
					<li><input id="currpage" value="${currpage }" type="hidden" />

						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">品牌：</span> <span class="td_02"
									style="margin-top: 4px;"><input class="input_text01"
									name="brand" id="brand" class="input_text01" type="text"
									style="width: 180px;"></span>
							</div>
						</div>

						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">车型：</span> <span class="td_02"
									style="margin-top: 4px;"><input class="input_text01"
									name="carModel" id="carModel" class="input_text01" type="text"
									style="width: 180px;"></span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">版本：</span> <span class="td_02"
									style="margin-top: 4px;"><input class="input_text01"
									name="version" id="version" class="input_text01" type="text"
									style="width: 180px;"></span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">配置：</span> <span class="td_02"
									style="margin-top: 4px;"><input class="input_text01"
									name="configure" id="configure" class="input_text01" type="text"
									style="width: 180px;"></span>
							</div>
						</div>						
						</li>

				</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="width: 400px; margin: auto;">
						<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
						<a href="javascript:void(0);" id="btnReset"
							class="btn63_02 margin_let10">重置</a>

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
									
            <th style="text-align:center">品牌</th>
            <th style="text-align:center">车型</th>
            <th style="text-align:center">版本</th>
            <th style="text-align:center">配置</th>
            <th style="text-align:center">颜色</th>
            <th style="text-align:center">数量</th>
            <th style="text-align:center">类型</th>
            <th style="text-align:center">结算价</th>
            <th style="text-align:center">日期</th>
            <th style="text-align:center;width:60px">历史价格</th>
           
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            
            <td>{{brand}}</td>
            <td>{{carModel}}</td>
            <td>{{version}}</td>
            <td>{{configure}}</td>
            <td>{{colour}}</td>
            <td>{{number}}</td>
            <td>{{type}}</td>
			<td>{{settlementPrice}}</td>
			<td>{{_formatSimpleDate quoteDate}}</td>
            <td>{{_addButton id}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/inventoryQuotation/look.js?r=<%=new Date()%>");
</script>