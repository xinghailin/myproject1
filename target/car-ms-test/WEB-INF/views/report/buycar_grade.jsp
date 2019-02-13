<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="COUNTBUYCAR_BUYCARGRADE" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm">	    
			<ul class="tb_ul02">
				<li>
				<div class="tbul02_left02" style="width:20%">
						<div class="tab_txt01">
							<span class="td_01">开始：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="startTime" id="startTime"
								class="input_text01" type="text"></span>
						</div>
					</div>					
					<div class="tbul02_left02" style="width:20%">
						<div class="tab_txt01">
							<span class="td_01">结束：</span>
						 <span class="td_02" style="margin-top: 4px;">
							<input name="endTime" id="endTime"class="input_text01" type="text">
							</span>
								</div>
				</li>
			</ul>
			<div class="btnlist" style="margin-bottom: 20px;">
				<div style="width: 300px; margin: auto;">
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
		<div id="container" style="width: 650px; height: 400px; margin: 0 auto;margin-bottom:100px"></div> 
</div>
</div>	
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
           <th style="text-align:center">时间</th>
            <th style="text-align:center">进店人数</th>
			<th style="text-align:center">已经购买人数(G)</th>
            <th style="text-align:center">购买意愿高的(H)</th>   
            <th style="text-align:center">购买意愿比较高(A)</th>  
            <th style="text-align:center">购买意愿中等(B)</th>  
            <th style="text-align:center">购买意愿比较低(C)</th>  
            <th style="text-align:center">不买的(N)</th>  
            <th style="text-align:center">购买意愿等级比率</th>                              
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{time}}</td>
            <td>{{comesize}}人</td>
			 <td>{{alreadyBuyCar}}人</td>
             <td>{{veryHighBuyCar}}人</td>
             <td>{{highBuyCar}}人</td>
             <td>{{centerBuyCar}}人</td>
             <td>{{bottomBuyCar}}人</td>
             <td>{{notBuyCar}}人</td>
             <td>购买意愿高的占比：{{alreadyBuyCarRatio}} 购买意愿比特别高占比：{{veryHighBuyCarRatio}}购买意愿比较高占比：{{highBuyCarRatio}} 
                                              购买意愿中等占比：{{centerBuyCarRatio}} 购买意愿比较低占比：{{bottomBuyCarRatio}}
                                              不买的占比：{{notBuyCarRatio}}</td>
            
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
<div  style="width: 50px; height: 40px; margin: 0 auto;margin-bottom:100px"></div>
</script>
<table id="datatable">
<thead  hidden="hidden">
<tr><th></th>
<th>进店人数</th>
<th id="alreadyBuyCarRatio">已经购买人数</th>
<th id="veryHighBuyCarRatio">购买意愿高的(H)</th>
<th id="highBuyCarRatio">购买意愿比较高(A)</th>
<th id="centerBuyCarRatio">购买意愿中等(B)</th>
<th id="bottomBuyCarRatio">购买意愿比较低(C)</th>
<th id="notBuyCarRatio">不买的(N)</th>
</tr>
</thead>
<tbody  hidden="hidden">
<tr><th id="th"></th>
<th id="comesize"></th>
<td id="alreadyBuyCar"></td>
<td id="veryHighBuyCar"></td>
<td id="highBuyCar"></td>
<td id="centerBuyCar"></td>
<td id="bottomBuyCar"></td>
<td id="notBuyCar"></td>
</tr>
</tbody>
</table>
</body>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/report/baycar_grade.js");
    
</script>