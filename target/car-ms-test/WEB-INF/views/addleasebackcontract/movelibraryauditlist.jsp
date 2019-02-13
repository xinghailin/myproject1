<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="movelibraryauditlist" namespace="car-ms"/>">
<input type="hidden" id="supplycartabledetailsUrl" value="<ufa:url fieldName="supplycartabledetails" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;">
	<div class="rg_list">
		<div class="tb_list"><input id="currpage" value="${currpage }" type="hidden"> 
		<input id="loginid" name="loginid" value="${loginid }" type="hidden">
		  <form name="searchForm" id="searchForm">	    
			<ul class="tb_ul02">
				<li>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">移库单名称:</span> <span
								class="td_02" style="margin-top: 4px;"><input name="name" id="name"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">送达门店名称:</span> <span
								class="td_02" style="margin-top: 4px;"><input name="shopname" id="shopname"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
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
		<div class="btnlist">
		</div>
</div>
</div>
<div id="imgLayer" class="ele_img_item clearfix" style="position:absolute;z-index:1;width: 260px; solid;display:none;" ></div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">配车单名称</th>
            <th style="text-align:center">创建时间</th>
			<th style="text-align:center">送达门店</th>
            <th style="text-align:center">展销协议签订日期</th>
			<th style="text-align:center">展销协议结束日期</th>
			<th style="text-align:center">超额钱数</th>
			<th style="text-align:center">状态</th>
            <th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{name}}</td>
            <td>{{_formatDatetime createtime}}</td>
 	 		<td>{{shopname}}</td>
            <td>{{_formatDatetime signingdate}}</td>
			<td>{{_formatDatetime duedate}}</td>
			<td>{{exceedmoney}}</td>
			<td>{{_status status}}</td>
          	<td>{{_operate status id}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/addleasebackcontract/movelibraryauditlist.js?r=<%=new Date()%>");
</script>