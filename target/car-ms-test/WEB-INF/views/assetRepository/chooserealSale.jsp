<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="CAR_ASSET_LST_REAL" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:40px;width: 95%;height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm" action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>" method="post" target="hideiframe">	    
			<ul class="tb_ul02">
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
					<!-- <div class="tbul02_left02" style="width:20%">
						<div class="tab_txt01">
							<span class="td_01">能源类型：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="energyType" id="energyType"
								class="input_text01" type="text"></span>
						</div>
					</div> -->
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">状态：</span> <span
								class="td_02" style="margin-top: 4px;">
				<select id="status" name="status" style="width:100px;">
		  	  	  <option value="">--请选择--</option>
			             <option value="1">库存车辆</option><option value="2">移库中</option><option value="3">已移库门店</option>
		          </select>
								</span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">仓库：</span> <span
								class="td_02" style="margin-top: 4px;">
				<select id="address" name="address" style="width: 180px;">
		  	  	  <option value="">--请选择--</option>
			           <c:forEach var="item" items="${storeLst}">  
			             <option value="<c:out value="${item.id}"></c:out>"><c:out value="${item.name}"></c:out></option>
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
				<div style="width: 400px; margin: auto;">
					<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
					<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a>
			<!-- 		<a href="javascript:void(0);" id="btnExcel" class="btn63_01 margin_let10">导出excel</a> -->
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
		<div style="width: 250px; margin: auto;">
		<a id='sureBtn' href="javascript:void(0);" class="btn63_01 margin_let10">确定</a>
		</div>
		</div>
</div>
</div><!--
 <th style="text-align:center">长宽高</th>
            <th style="text-align:center">排量</th>
            <th style="text-align:center">排放</th>
            <th style="text-align:center">油耗</th>
            <th style="text-align:center">变速箱</th>
            <th style="text-align:center">能源类型</th>

<td>{{lenWidHei}}</td>
            <td>{{displacement}}</td>
			<td>{{discharge}}</td>
            <td>{{oilWear}}</td>
            <td>{{gearbox}}</td>
            <td>{{energyType}}</td>
  -->
<div id="imgLayer" class="ele_img_item clearfix" style="position:absolute;z-index:1;width: 260px; solid;display:none;" ></div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr><th style="text-align:center">&nbsp;选车&nbsp;</th>
			<th style="text-align:center">品牌</th>
            <th style="text-align:center">型号</th>
			<th style="text-align:center">版别</th>
            <th style="text-align:center">车架号</th>
			<th style="text-align:center">发动机号</th>
			<th style="text-align:center">仓库</th>
            <th style="text-align:center">出厂日期</th>
            <th style="text-align:center">外观颜色</th>
			<th style="text-align:center">关单</th>
            <th style="text-align:center">采购价(元)</th>
            <th style="text-align:center">采购商</th>
            <th style="text-align:center">状态</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
<td><input type="radio" name="carID" id="carID{{id}}" value="{{id}}" vin="{{vin}}" ></td>
            <td>{{brand}}</td>
            <td>{{model}}</td>
 			<td>{{version}}</td>
            <td>{{vin}}</td>
			<td>{{engineNum}}</td>
            <td>{{_formatAddress address}}</td>
			<td>{{_formatSimpleDatetime leaveFactoryTime}}</td>
			<td>{{outlookColor}}</td>
<td><img src="{{formatPic iden1}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
			<td>{{buyPrice}}</td>
            <td>{{buyName}}</td>
            <td>{{_formatStatus status}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/assetRepository/chooserealSale.js?r=${ts}");
</script>