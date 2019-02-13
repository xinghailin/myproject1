<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<script src="../../../scripts/base/highcharts.js"></script>
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="COUNTCAR_AVGAGE" namespace="car-ms"/>">

<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm">	    
			<ul class="tb_ul02">
				<li>
				<div class="tbul02_left02" style="width:20%">
						<div class="tab_txt01">
							<span class="td_01">出厂时间：</span> <span
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
								</div></div>
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
			<div id="container" style="width: 650px; height: 500px; margin: 0 auto;margin-bottom:100px"></div> 
</div>
</div>	
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list"  >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
           <th style="text-align:center">品牌</th>
            <th style="text-align:center">型号</th>
			<th style="text-align:center">出厂日期</th>
            <th style="text-align:center">当前时间</th> 
            <th style="text-align:center">车辆型号平均车龄</th>        
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{brand}}</td>
            <td>{{model}}</td>
			<td>{{productionTiem}}</td>
            <td>{{daytime}}</td>
             <td>{{remainingCar}}天</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
<div  style="width: 550px; height: 400px; margin: 0 auto"></div>
 
</script>

<script type="text/javascript">
    seajs.use("${scriptBasePath}/report/avg_warehouse_age.js");
</script>
