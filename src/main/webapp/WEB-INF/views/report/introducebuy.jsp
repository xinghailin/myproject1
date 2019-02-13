<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="COUNTINTRODUCE_BUYRATIO" namespace="car-ms"/>">
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
		<div id="container" style="width: 550px; height: 400px; margin: 0 auto;margin-bottom:100px"></div> 
</div>
</div>	
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
           <th style="text-align:center">时间</th>
            <th style="text-align:center">转介绍成交数量</th>
			<th style="text-align:center">总成交数量</th>
            <th style="text-align:center">转介绍成交率</th>           
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{time}}</td>
            <td>{{introducebuy}}辆</td>
			<td>{{buysize}}辆</td>
            <td>{{ratio}}</td>
       
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
<tr ><th></th><th>介绍成交量</th><th>总成交量</th></tr>
</thead>
<tbody  hidden="hidden">
<tr ><th id="th"></th><td id="tin"></td><td id="tok"></td></tr>
</tbody>
</table>
</body> 


<script type="text/javascript">
    seajs.use("${scriptBasePath}/report/introducebuy.js");
    
</script>