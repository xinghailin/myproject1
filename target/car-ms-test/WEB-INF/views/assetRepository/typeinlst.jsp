<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="CAR_TYPEIN_LST_DO" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm">	    
			<ul class="tb_ul02">
			<select id="address" name="address" style="display:none;width: 180px;" >
		  	  	  <option value="">--请选择--</option>
			           <c:forEach var="item" items="${storeLst}">  
			             <option value="<c:out value="${item.id}"></c:out>"><c:out value="${item.name}"></c:out></option>
			           </c:forEach>
		          </select>
				<li>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">品牌：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="brand" id="brand"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_right02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">型号：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="model" id="model"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">车架号：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="vin" id="vin"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
				</li>
				<li>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">审核状态：</span> <span
								class="td_02" style="margin-top: 4px;">
				<select id="isStored" name="isStored" style="width:180px;">
		  	  	  <option value="">--请选择--</option><option value="1">通过</option>
			             <option value="2">不通过</option><option value="3">待审核</option>
		          </select>
								</span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">车辆所在地：</span> <span
								class="td_02" style="margin-top: 4px;">
				<select id="carAddress" name="carAddress" style="width:180px;">
		  	  	  <option value="">--请选择--</option>
			           <c:forEach var="item" items="${car}">  
			             <option value="<c:out value="${item.carAddress}"></c:out>"><c:out value="${item.carAddress}"></c:out></option>
			           </c:forEach>
		          </select>
								</span>
						</div>
					</div>
					<div class="tbul02_right02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">出厂日期：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="leaveFactoryTime" id="leaveFactoryTime"
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
</div><!--  <th style="text-align:center">长宽高</th>
            <th style="text-align:center">排量</th>
            <th style="text-align:center">排放</th>
            <th style="text-align:center">工信部综合油耗</th>
            <th style="text-align:center">整体质量</th>
			<th style="text-align:center">车身级别</th>
            <th style="text-align:center">变速箱</th>
            <th style="text-align:center">能源类型</th>
            
            <td>{{lenWidHei}}</td>
            <td>{{displacement}}</td>
			<td>{{discharge}}</td>
            <td>{{oilWear}}</td>
            <td>{{weight}}</td>
			<td>{{level}}</td>
            <td>{{gearbox}}</td>
            <td>{{energyType}}</td>
			
             -->
</div>	
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">品牌</th>
            <th style="text-align:center">型号</th>
 			<th style="text-align:center">版别</th>
            <th style="text-align:center">车架号</th>
			<th style="text-align:center">发动机号</th>
			<th style="text-align:center">仓库</th>
            <th style="text-align:center">车辆所在地</th>
            <th style="text-align:center">出厂日期</th>
            <th style="text-align:center">外观颜色</th>
            <th style="text-align:center">内饰颜色</th>
            <th style="text-align:center">采购价(元)</th>
			<th style="text-align:center">销售价(元)</th>
<th style="text-align:center">结算价(元)</th>
            <th style="text-align:center">采购商</th>
            <th style="text-align:center">提交时间</th>
            <th style="text-align:center">审核状态</th>
            <th style="text-align:center">理由</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{brand}}</td>
            <td>{{model}}</td>
 			<td>{{version}}</td>
            <td>{{vin}}</td>
			<td>{{engineNum}}</td>
            <td>{{_formatAddress address}}</td>
     		 <td>{{carAddress}}</td>
			<td>{{_formatSimpleDatetime leaveFactoryTime}}</td>
			<td>{{outlookColor}}</td>
            <td>{{innerColor}}</td>
			<td>{{buyPrice}}</td>
			<td>{{sellerprice}}</td>
<td>{{typeinsettleprice}}</td>
            <td>{{buyName}}</td>
            <td>{{_formatDatetime createTime}}</td>
            <td>{{_formatAuditStatus isStored}}</td>
			<td>{{reason}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/assetRepository/typeinlst.js");
</script>