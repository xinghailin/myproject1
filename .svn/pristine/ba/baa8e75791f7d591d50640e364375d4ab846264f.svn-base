<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="SHOP_GROUP_LST" namespace="car-ms"/>">
<input id="provincesQueryUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="DATA_GETPROVINCES"/>'/>
<input id="citiesQueryUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="DATA_GETCITIES"/>'/>
<input type="hidden" id="transferUrl" value="<ufa:url fieldName="LOCATION_TRANSFER" namespace="car-ms"/>">
<input type="hidden" id="viewUrl" value="<ufa:url fieldName="SHOP_CARS" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm">	    
			<ul class="tb_ul02">
				<li>
					<div class="tbul02_left02" style="width:20%">
						<div class="tab_txt01">
							<span class="td_01">门店名称：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="name" id="name"
								class="input_text01" type="text"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:20%">
						<div class="tab_txt01">
							<span class="td_01">门店地址：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="address" id="address"
								class="input_text01" type="text"></span>
						</div>
					</div>
					<div class="tbul02_right02" style="width:20%">
						<div class="tab_txt01">
							<span class="td_01">门店电话：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="tel" id="tel"
								class="input_text01" type="text"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 30%;"><div class="tab_txt01">
			  <span class="td_01" style="">省 :</span>
			  <span class="td_05" style="margin-top: 8px;">
			  	<select id="provinces" name="province" style="width:100px;">
		        </select></span><span class="td_01" style="width:40px;">市 :</span><span class="td_05" style="margin-top: 8px;">
		        <select id="cities" name="city" style="width:100px;">
		         <option value="">--请选择市--</option>
		        </select>
		        </span>
			  </div></div>
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
            <th style="text-align:center">门店名称</th>
			<th style="text-align:center">门店地址</th>
            <th style="text-align:center">门店电话</th>
            <th style="text-align:center">省</th>
            <th style="text-align:center">市</th>
            <th style="text-align:center">负责人</th>
            <th style="text-align:center">联系方式</th>
<th style="text-align:center">状态</th>
			<th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{name}}</td>
			<td>{{address}}</td>
            <td>{{tel}}</td>
            <td>{{province}}</td>
			<td>{{city}}</td>
            <td>{{principal}}</td>
			<td>{{priTel}}</td>
<td>{{formavalid invalid}}</td>
            <td>{{addButton id}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
/* function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); 
     return null;
}
// 调用方法
var type=GetQueryString("type");
var car=GetQueryString("car");
alert(type);
alert(car); */
    seajs.use("${scriptBasePath}/shop/shopqueryview.js?r=<%=new Date()%>");
</script>