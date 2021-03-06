<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>

<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="COUNT_PROFIT_CAR" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="CAR_EDIT" namespace="car-ms"/>">
<input id="currpage" type="hidden" value='${currpage}'/>
<input id="hideMsg" type="hidden" value='${message}'/>
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 190%">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm">	    
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
				<div class="tbul02_right02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">采购商：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="buyName" id="buyName"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
				<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">门店：</span> <span
								class="td_02" style="margin-top: 4px;">
				<select id="shopId" name="shopId" style="width: 180px;">
		  	  	  <option value="">--请选择--</option>
			           <c:forEach var="item" items="${shoplist}">  
			             <option value="<c:out value="${item.id}"></c:out>"><c:out value="${item.name}"></c:out></option>
			           </c:forEach>
		          </select>
								</span>
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
</div>
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
            <th style="text-align:center">出厂日期</th>
            <th style="text-align:center">外观颜色</th>
            <th style="text-align:center">内饰颜色</th>
            <th style="text-align:center">采购商</th>
            <th style="text-align:center">门店</th>
            <th style="text-align:center">关单</th>
			<th style="text-align:center">商检单</th>
            <th style="text-align:center">一致性证书(反面)</th>
  <th style="text-align:center">一致性证书(正面)</th>
  <th style="text-align:center">环保请单</th>
            <th style="text-align:center">采购价(元)</th>
            <th style="text-align:center">销售价(元)</th>
			<th style="text-align:center">利润(元)</th>
			
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
			<td>{{_formatSimpleDatetime leaveFactoryTime}}</td>
			<td>{{outlookColor}}</td>
            <td>{{innerColor}}</td>
			<td>{{buyName}}</td>
            <td>{{_formatShopId shopId}}</td>
<td><img src="{{formatPic iden1}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
<td><img src="{{formatPic iden2}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
<td><img src="{{formatPic iden3}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
<td><img src="{{formatPic iden5}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
<td><img src="{{formatPic iden4}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
            <td>{{buyPrice}}</td>
			<td>{{salePrice}}</td>
            <td>{{profit}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/assetRepository/profit.js");
</script>