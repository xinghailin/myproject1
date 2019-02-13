<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="COUNTBUYCAR_BUYCARPURPOSE" namespace="car-ms"/>">
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
		<div id="container" style="width: 750px; height: 500px; margin: 0 auto;margin-bottom:100px"></div> 
</div>
</div>	
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
           <th style="text-align:center">时间</th>
            <th style="text-align:center">进店人数</th>
			<th style="text-align:center">个人用车进店人数</th>
            <th style="text-align:center">单位用车进店人数</th>   
            <th style="text-align:center">客户车辆用途购买比率</th>                             
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{time}}</td>
            <td>{{comesize}}人</td>
			 <td>{{personagebuycar}}人</td>
             <td>{{firmbuycar}}人</td>
             <td>个人用车进店人数占比：{{personagebuycarRatio}} 单位用车进店人数占比：{{firmbuycarRatio}}</td>
            
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
<div  style="width: 50px; height: 40px; margin: 0 auto;margin-bottom:100px"></div>
</script>
<table id="datatable" class="hide">
<thead>
<tr><th></th>
<th>进店人数</th>
<th id="personagebuycarRatio">个人用车进店人数</th>
<th id="firmbuycarRatio">单位用车进店人数</th>
</tr>
</thead>
<tbody>
<tr><th id="th"></th>
<th id="comesize"></th>
<td id="personagebuycar"></td>
<td id="firmbuycar"></td>
</tr>
</tbody>
</table>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/report/baycar_purpose.js");
    
</script>