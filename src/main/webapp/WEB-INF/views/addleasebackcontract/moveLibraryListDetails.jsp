<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/index.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/jquery.css">
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="moveLibraryListDetails" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;">
	<div class="rg_list">
		<div class="tb_list"><input id="currpage" value="${currpage }" type="hidden"> 
		  <form name="searchForm" id="searchForm">	    
			<ul class="tb_ul02">
				<li>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">配车单名称:</span> <span
								class="td_02" style="margin-top: 4px;"><input name="name" id="name"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">品牌:</span> <span
								class="td_02" style="margin-top: 4px;"><input name="brand" id="brand"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">型号:</span> <span
								class="td_02" style="margin-top: 4px;"><input name="model" id="model"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">版别:</span> <span
								class="td_02" style="margin-top: 4px;"><input name="version" id="version"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">车架号:</span> <span
								class="td_02" style="margin-top: 4px;"><input name="vin" id="vin"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 25%;">
							<div class="tab_txt01">
								<span class="td_01">配车单状态：</span>
								<select id="status" name="status" style="width: 180px; margin-top: 5px;">
									<option value="">--请选择--</option>
									<option value="1">--额度超额未审核配车--</option>
									<option value="4">--待物流配车--</option>
									<option value="5">--开始物流--</option>
									<option value="6">--物流确认到店--</option>
									<option value="7">--门店确认到店--</option>
								</select>
							</div>
						</div>
				</li>
			</ul>
			<div class="btnlist" style="margin-bottom: 20px;">
				<div style="width: 300px; margin: auto; ">
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
			<th style="text-align:center;width:150px">配车单名称</th>
			<th style="text-align:center">品牌</th>
			<th style="text-align:center">型号</th>
			<th style="text-align:center">版别</th>
			<th style="text-align:center">车架号</th>
            <th style="text-align:center">创建时间</th>
			<th style="text-align:center">移前门店或仓库</th>
            <th style="text-align:center">移前门店或仓库地址</th>
			<th style="text-align:center">移后门店或仓库</th>
			<th style="text-align:center">移后门店或仓库地址</th>
            <th style="text-align:center">状态</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{name}}</td>
 			<td>{{brand}}</td>
			<td>{{model}}</td>
			<td>{{version}}</td>
			<td>{{vin}}</td>
            <td>{{_formatDatetime createtime}}</td>
 	 		<td>{{shopname}}</td>
            <td>{{nowaddress}}</td>
			<td>{{moveshopname}}</td>
			<td>{{moveaddress}}</td>
          	<td>{{status}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=2013090913" id="seajsnode"></script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/addleasebackcontract/movelibrarylist.js?r=<%=new Date()%>");
</script>