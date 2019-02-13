<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="FIND_CAR_INDEX" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="HELP_FIND_CAR_DETAILS" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 190%;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm" action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>" method="post" target="hideiframe">	    
			<ul class="tb_ul02"> 
				 <li> 
				 <input id="currpage" value="${currpage }" type="hidden" />
					<div class="tbul02_left02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">品牌车系：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="brand" id="brand"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">手机&nbsp号：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="phone" id="phone"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_right02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">姓&nbsp&nbsp名：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="name" id="name"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
						</div>
					<div class="tbul02_right02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">城&nbsp&nbsp市：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="city" id="city"
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
<iframe name="hideiframe" style="display: none;"></iframe>	
<div id="imgLayer" class="ele_img_item clearfix" style="position:absolute;z-index:1;width: 260px; solid;display:none;" ></div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">品牌车系</th>
            <th style="text-align:center">手机号</th>
            <th style="text-align:center">姓名</th>
			<th style="text-align:center">城市</th>
			<th style="text-align:center">询价时间</th>
			<th style="text-align:center">状态</th>
            <th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{brand}}</td>
            <td>{{phone}}</td>
            <td>{{name}}</td>
			<td>{{city}}</td>
			<td>{{_formatDatetime createtime}}</td>
            <td>{{_formatStatus detail}}</td>
             <td>{{_operate id status}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/findcar/findcar.js");
</script>