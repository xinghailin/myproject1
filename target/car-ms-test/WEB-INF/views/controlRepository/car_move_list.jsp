<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="CONTROL_REPOSITORY_LIST" namespace="car-ms"/>">
<input type="hidden" id="applyUrl" value="<ufa:url fieldName="CONTROL_REPOSITORY_CAR_MOVE_APPLY_PAGE" namespace="car-ms"/>">
<input type="hidden" id="outUrl" value="<ufa:url fieldName="CLIENT_INFO_INDEX" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 190%;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm">	    
			<ul class="tb_ul02">
				<li><input id="currpage" value="${currpage}" type="hidden"/>
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
							<span class="td_01">状态：</span> <span
								class="td_02" style="margin-top: 4px;">
				<select id="status" name="status" style="width:100px;">
		  	  	  <option value="">--请选择--</option>
			             <option value="1">库存车辆</option><option value="2">移库中</option><option value="3">已移库门店</option>
			             <option value="4">购车锁定</option><option value="5">购车物流中</option><option value="6">已销未提</option>
			             <option value="7">已销已提</option>
			          	<option value="9">门店到仓库审核中</option>
		          </select>
								</span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
						   <span class="td_01">车辆所在地：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="carAddress" id="carAddress"
								class="input_text01" type="text" style="width:180px;"></span>
							
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
</div>
</div>	
<div id="imgLayer" class="ele_img_item clearfix" style="position:absolute;z-index:1;width: 260px; solid;display:none;" ></div>
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
			<th style="text-align:center">车辆所在地</th>
            <th style="text-align:center">出厂日期</th>
            <th style="text-align:center">采购日期</th>
            <th style="text-align:center">外观颜色</th>
			<th style="text-align:center">关单</th>
            <th style="text-align:center">销售价(元)</th>
            <th style="text-align:center">状态</th>
            <th style="text-align:center;width:80px;">操作</th>
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
            <td>{{carAddress}}</td>
			<td>{{_formatSimpleDatetime leaveFactoryTime}}</td>
			<td>{{_formatSimpleDatetime purchaseTime}}</td>
			<td>{{outlookColor}}</td>
<td><img src="{{formatPic iden1}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
			<td>{{sellerprice}}</td>
            <td>{{_formatStatus status saleStatus}}</td>
            <td>{{addButton id}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/controlRepository/car_move_list.js?r=<%=new Date()%>");
</script>