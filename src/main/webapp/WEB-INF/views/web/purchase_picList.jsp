<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/index.css">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="WEB_PURCHASE_PIC_URL_NAME_METHOD" namespace="car-ms"/>">
<input type="hidden" id="updateUrl" value="<ufa:url fieldName="WEB_PURCHASE_PIC_UPDATEONE_PAGE" namespace="car-ms"/>">
<input type="hidden" id="delpicUrl" value="<ufa:url fieldName="WEB_PURCHASE_PIC_DEL" namespace="car-ms"/>"> 
<input type="hidden" id="nextUrl" value="<ufa:url fieldName="WEB_PURCHASE_AREA_LISTPAGE" namespace="car-ms"/>"> 
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">

<input type="hidden" id="addUrl" value="<ufa:url fieldName="WEB_PURCHASE_AREA_ADD_PAGE" namespace="car-ms"/>">
	<div class="rg_list">
		<input type="hidden" id="currpage" name="currpage" value="${currpage}" /> 
		<div class="tb_list">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="freightApply" namespace="car-ms"/>" method="post"
				target="hideiframe">
				<input type="hidden" id="title_id" name="title_id" value="${title_id}" /> 
			</form>
		</div>
		<div class="clear"></div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
		</div>
		<div class="btnlist">
			<div style="width: 200px; margin: auto; margin-top: 80px;">
				<a id='backBtn' href="javascript:void(0);" class="btn63_01 margin_let10">返回</a>
			</div>
		</div>
</div>
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center;word-wrap:break-word;">语言</th>
            <th style="text-align:center;word-wrap:break-word;">名称</th>
            <th style="text-align:center;word-wrap:break-word;">图片</th>
            <th style="text-align:center;word-wrap:break-word;">创建时间</th>
            <th style="text-align:center;word-wrap:break-word;">操作</th>
      </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
      
            <td>{{_formatlanguage language}}</td>
            <td>{{pic_name}}</td>
            <td><img src="{{formatPic url}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
            <td>{{_formatSimpleDatetime createtime}}</td>
            <td>{{addButton id }}</td>  
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/web/purchase_picList.js?r=<%=new Date()%>");
</script>