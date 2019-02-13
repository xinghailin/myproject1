<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="jndprecarlstquery" namespace="car-ms"/>">
<input type="hidden" id="currpage" value="${currpage}">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm">	    
			<ul class="tb_ul02">
				<li>
				<div class="tbul02_right02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">采购计划名称：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="buyname" id="buyname"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">品牌：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="brand" id="brand"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">车架号：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="vin" id="vin"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">应入库时间：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="appointtime" id="appointtime"
								class="input_text01" type="text" style="width:180px;"></span>
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
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center">需求单编号</th>
			<th style="text-align:center">需求单名称</th>
			<th style="text-align:center">采购计划编号</th>
			<th style="text-align:center">采购计划名称</th>
            <th style="text-align:center">品牌首字母</th>
			<th style="text-align:center">品牌</th>
			<th style="text-align:center">型号</th>
			<th style="text-align:center">版别</th>
			<th style="text-align:center">车架号</th>
            <th style="text-align:center">排量</th>
			<th style="text-align:center">外观颜色</th>
			<th style="text-align:center">内饰颜色</th>
            <th style="text-align:center">应入库时间</th>
            <th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{needcode}}</td>
            <td>{{needname}}</td>
 			<td>{{buycode}}</td>
            <td>{{buyname}}</td>
			<td>{{initials}}</td>
            <td>{{brand}}</td>
            <td>{{model}}</td>
            <td>{{version}}</td>
 			<td>{{vin}}</td>
            <td>{{displacement}}</td>
			<td>{{outcolor}}</td>
            <td>{{incolor}}</td>
            <td>{{_formatDatetime appointtime}}</td>
            <td>{{operate id}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jnd/precarlst.js?v=<%=new Date()%>");
</script>