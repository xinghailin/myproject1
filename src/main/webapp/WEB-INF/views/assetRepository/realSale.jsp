<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl"
	value="<ufa:url fieldName="CAR_ASSET_LST_REAL" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 190%;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="EXCEL_REALSALE_EDIT" namespace="car-ms"/>" method="post"
				target="hideiframe">
				<ul class="tb_ul02">
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01">品牌：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="brand" id="brand" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01">型号：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input class="input_text01" name="model" id="model" class="input_text01" type="text"
										style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01">车架号：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="vin" id="vin" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01">状态：</span>
								<span class="td_02" style="margin-top: 4px;">
									<select id="status" name="status" style="width: 100px;">
										<option value="">--请选择--</option>
										<option value="1">库存车辆</option>
										<option value="2">移库中</option>
										<option value="3">已移库门店</option>
									</select>
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01">仓库：</span>
								<span class="td_02" style="margin-top: 4px;">
									<select id="address" name="address" style="width: 180px;">
										<option value="">--请选择--</option>
										<c:forEach var="item" items="${storeLst}">
											<option value="<c:out value="${item.id}"></c:out>"><c:out value="${item.name}"></c:out></option>
										</c:forEach>
									</select>
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01">出厂日期：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input class="input_text01" name="leaveFactoryTime" id="leaveFactoryTime"
										class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
					</li>
				</ul>
			</form>
			<div class="btnlist" style="margin-top: 10px;">
				<div style="width: 400px; margin: auto;">
					<a id="btnSearch" class="btn63_01" href="javascript:void(0);">查询</a>
					<a id="btnReset" class="btn63_02 margin_let10" href="javascript:void(0);">重置</a>
					<a id="btnExcel" class="btn63_01 margin_let10" href="javascript:void(0);">导出Excel</a>
				</div>
			</div>
			<div class="btnlist" style="margin-top: 15px;">
				<div style="width: 600px; margin: auto;">
					<form name="inForm" id="inForm"
						action="<ufa:url fieldName="EXCEL_REALSALE_EDITDO" namespace="car-ms"/>" method="post"
						enctype="multipart/form-data" target="hideiframe">
						<label class="margin_let10">上传文件：</label> <input id="excelFile" name="excelFile" type="file">
						<a id="btnExcelIn" class="btn63_01 margin_let10" href="javascript:void(0);">确定导入</a>
					</form>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
		</div>
	</div>
</div>
<iframe name="hideiframe" style="display: none;"></iframe>
<div id="imgLayer" class="ele_img_item clearfix"
	style="position: absolute; z-index: 1; width: 260px; solid; display: none;"></div>
<!-- 
			<th style="text-align:center">商检单</th>
            <th style="text-align:center">一致性证书(正面)</th>
 			<th style="text-align:center">一致性证书(反面)</th>
 			<th style="text-align:center">环保清单</th>
<td><img src="{{formatPic iden2}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
<td><img src="{{formatPic iden3}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
<td><img src="{{formatPic iden5}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
<td><img src="{{formatPic iden4}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
 -->
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">品牌</th>
            <th style="text-align:center">型号</th>
  			<th style="text-align:center">版别</th>
            <th style="text-align:center">车架号</th>
			<th style="text-align:center">发动机号</th>
			<th style="text-align:center">仓库原地址</th>
	        <th style="text-align:center">车辆所在地</th>
            <th style="text-align:center">出厂日期</th>
            <th style="text-align:center">采购日期</th>
            <th style="text-align:center">外观颜色</th>
			<th style="text-align:center">关单</th>
            <th style="text-align:center">结算价(元)</th>
<th style="text-align:center">采购金融结算价(元)</th>
            <th style="text-align:center">采购商</th>
            <th style="text-align:center">状态</th>
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
            <td>{{_formatSimpleDatetime purchaseTime}}</td>
			<td>{{outlookColor}}</td>
			<td><img src="{{formatPic iden1}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
			<td>{{settlementprice}}</td>
			<td>{{purchasesettlementprice}}</td>
            <td>{{buyName}}</td>
            <td>{{_formatStatus status saleStatus}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
	seajs.use("${scriptBasePath}/assetRepository/realSale.js");
</script>