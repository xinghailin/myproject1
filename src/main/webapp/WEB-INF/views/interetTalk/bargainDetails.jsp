<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="BARGAIN_DETAILS_LST" namespace="car-ms"/>">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="INITATOR" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
		<input type="hidden" id="id" name="id" value="${id}" />
		<input type="hidden" id="currpage"  value="${currpage}" />
		</div>
		 <div class="clear"></div> 
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
		</div>
		<div class="btnlist">
		<div style="width: 250px; margin: auto;">
		<a id='backBtn' href="javascript:void(0);" class="btn63_01 margin_let10">返回</a>
		</div>
		</div>
</div>
</div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">姓名</th>
            <th style="text-align:center">头像</th>
            <th style="text-align:center">电话</th>
            <th style="text-align:center">性别</th>
            <th style="text-align:center">国家</th>
            <th style="text-align:center">省份</th>
            <th style="text-align:center">城市</th>
            <th style="text-align:center">砍价钱数</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
             <td>{{name}}</td>
<td><img src="{{weixinPic}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
             <td>{{phone}}</td>
           	 <td>{{_sex sex}}</td>
             <td>{{country}}</td>
 			 <td>{{province}}</td>
             <td>{{city}}</td>
			 <td>{{money}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
  seajs.use("${scriptBasePath}/interetTalk/bargainDetails.js"); 
</script>