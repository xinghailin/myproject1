<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input id="currpage" type="hidden" value='${currpage}'/>
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="QUERY_ALL_BRAND" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="QUERY_MODEL" namespace="car-ms"/>">
<input type="hidden" id="updateUrl" value="<ufa:url fieldName="ADD_ABRAND" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm" action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>" method="post" target="hideiframe">	    
					<ul class="tb_ul02"> 
				 <li> 
					<div style="text-align: center;">
						<div style="text-align: center;">
							<span class="td_01">品牌：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="brand" id="brand"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					</li> 
			 </ul>
			<div class="btnlist" style="margin-bottom: 20px;">
				<div style="text-align: center;">
					<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
					<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a>
					<a href="javascript:void(0);" onclick="updatebrand()" id='resetBtn' class="btn63_01">品牌车型版别更新</a>
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
			<th style="text-align:center">编号</th>
            <th style="text-align:center">品牌</th>
            <th style="text-align:center">首字母</th>
            <th style="text-align:center">图片</th>
            <th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
             <td>{{brandid}}</td>
             <td>{{brand}}</td>
			 <td>{{brandinitial}}</td>
<td><img src="{{logopic}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
             <td>{{_operate brandid}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
function updatebrand(){
	 if(confirm("更新数据库表所有品牌、车型、版本，仅在有必要并且时间恰当的时候更新，更新时间大约10分钟，请慎重操作！")){
		 window.location.href=$("#updateUrl").val();
	}
}
    seajs.use("${scriptBasePath}/APIbrand/APIbrand.js");
</script>