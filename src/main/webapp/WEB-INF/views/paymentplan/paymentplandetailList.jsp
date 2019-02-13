<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="FINDDETAILLISTMETHOD_PAYMENTPLAN_METHOD" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 190%;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>" method="post"
				target="hideiframe">
				<input type="hidden" name="contractId" id="contractId" value="${contractId}">
				<ul class="tb_ul02">
					<li>
						<input id="currpage" value="${currpage }" type="hidden" />
						<!-- <div class="tab_txt01">
							<span class="td_01" style="width: 120px;">车架号：</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" name="vin" id="vin" width="280px" />
								&nbsp;
							</span>


						</div> -->
					</li>

				</ul>

				<!-- <div class="btnlist" style="margin-bottom: 30px;">
					<div style="width: 400px; margin: auto;">
						<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
						<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a>

					</div>
				</div> -->
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
            <th style="text-align:center">代扣款期数</th>
            <th style="text-align:center">应扣款金额</th>
            <th style="text-align:center">扣款日期</th> 
             <th style="text-align:center">状态</th>               
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr> 
            <td>{{vin}}</td>             
            <td>{{term}}</td>
            <td>{{price}}</td>
            <td>{{_formatSimpleDate paytime}}</td>
            <td>{{formatStatus payStatus}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/paymentplan/paymentplandetailList.js?r=<%=new Date()%>");
</script>