<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="QUERY_ALL_MODEL" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="BARGAIN_DETAILS" namespace="car-ms"/>">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="QUERY_BRAND" namespace="car-ms"/>">
<input type="hidden" id="addUrl" value="<ufa:url fieldName="addmodelandversion" namespace="car-ms"/>">
<input type="hidden" id="deleteUrl" value="<ufa:url fieldName="deletemodel" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;">
	<div class="rg_list">
	<input type="hidden" id="brandid" name="brandid" value="${brandid}" />
	<input id="currpage" type="hidden" name="currpage" value='${currpage}'/>
		<div class="tb_list">
		  <form name="searchForm" id="searchForm" action="<ufa:url fieldName="QUERY_ALL_MODEL" namespace="car-ms"/>" method="post" target="hideiframe">	    
					<ul class="tb_ul02"> 
				 <li> 
					<div style="text-align: center;">
						<div style="text-align: center;">
							<span class="td_01">型号：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="model" id="model"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					</li> 
			 </ul>
			<div class="btnlist" style="margin-bottom: 20px;">
				<div style="text-align: center;">
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
		<div style="text-align: center;">
		<a id='backBtn' href="javascript:void(0);" class="btn63_01">返回</a>
		</div>
</div>
	<div style="width: 800px;">
	
		<div class="tbul02_right02" style="width:50%">
<div class="tab_txt01">
<span class="td_01">型号：</span> <span class="td_02"
style="margin-top: 4px;"><input class="input_text01" name="models" id="models"
class="input_text01" type="text" style="width:180px;"></span>
</div>
</div>
<div class="tbul02_right02" style="width:50%">
<div class="tab_txt01">
<span class="td_01">版别：</span> <span class="td_02"
style="margin-top: 4px;"><input class="input_text01" name="version" id="version"
class="input_text01" type="text" style="width:180px;"></span>
</div>
</div>
<div style="text-align: center;padding-top: 50px;">
		<a id="save" href="javascript:void(0);" class="btn63_01">保存</a>
		</div>
</div>
</div>

<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">型号</th>
            <th style="text-align:center">版别</th>
            <th style="text-align:center">产地</th>
  			<th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
             <td>{{model}}</td>
             <td>{{version}}</td>
			 <td>{{source}}</td>
 			<td>{{_operate id}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">

    seajs.use("${scriptBasePath}/APIbrand/APImodel.js?v=<%=new Date()%>");
</script>