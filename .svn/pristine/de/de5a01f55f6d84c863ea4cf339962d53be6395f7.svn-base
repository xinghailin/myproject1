<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="bizshopgroupquery" namespace="car-ms"/>">
<input type="hidden" id="toaddUrl" value="<ufa:url fieldName="bizshopgrouptoadd" namespace="car-ms"/>">
<input type="hidden" id="toeditUrl" value="<ufa:url fieldName="bizshopgrouptoedit" namespace="car-ms"/>">
<input type="hidden" id="deleteUrl" value="<ufa:url fieldName="bizshopgrouptodel" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01"><span class="td_01">组名：</span> <span class="td_02" style="margin-top: 4px;"><input name="name" class="input_text01" type="text" style="width: 180px;"></span></div>
					</div>
				</li>
			</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="width: 300px; margin: auto;"><a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a><a href="javascript:void(0);" id="btnadd" class="btn63_01 margin_let10">新增</a>  <a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a></div>
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
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center">组名</th>
            <th style="text-align:center">主账号</th>
            <th style="text-align:center">副账号1</th>
            <th style="text-align:center">副账号2</th>
			<th style="text-align:center">创建时间</th>
			<th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{name}}</td>
            <td>{{hostname}}</td>
            <td>{{assistant1name}}</td>
            <td>{{assistant2name}}</td>
            <td>{{_formatSimpleDatetime createtime}}</td>
            <td>{{_operate id}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
	seajs.use("${scriptBasePath}/shopGroup/grouplst.js");
</script>