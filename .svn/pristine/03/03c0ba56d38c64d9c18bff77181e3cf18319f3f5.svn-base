<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="INTEREST_TALK_PAGE" namespace="car-ms"/>">
<input type="hidden" id="deleteUrl" value="<ufa:url fieldName="DELETE_INTEREST_TALK" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="UPDATE_INTEREST_TALK_PAGE" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm" action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>" method="post" target="hideiframe">	    
					<ul class="tb_ul02"> 
				 <li> 
					<div style="text-align: center;">
						<div style="text-align: center;">
							<span class="td_01">趣话：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="interestTalk" id="interestTalk"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					</li> 
			 </ul>
			<div class="btnlist" style="margin-bottom: 20px;">
				<div style="text-align: center;">
					<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
					  <a href="<ufa:url fieldName="ADD_INTEREST_TALK_PAGE" namespace="car-ms"/>"  class="btn63_01 margin_let10">添加趣话</a>
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
			<th style="text-align:center">趣话</th>
            <th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
             <td>{{interestTalk}}</td>
             <td>{{_operate id }}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/interetTalk/interetTalk.js");
</script>