<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="SHOP_LST" namespace="car-ms"/>">
<input id="provincesQueryUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="DATA_GETPROVINCES"/>'/>
<input id="citiesQueryUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="DATA_GETCITIES"/>'/>
<input type="hidden" id="createUrl" value="<ufa:url fieldName="SHOP_EDIT" namespace="car-ms"/>">
<input type="hidden" id="transferUrl" value="<ufa:url fieldName="LOCATION_TRANSFER" namespace="car-ms"/>">
<input type="hidden" id="deleteUrl" value="<ufa:url fieldName="SHOP_DEL" namespace="car-ms"/>">
<input type="hidden" id="viewUrl" value="<ufa:url fieldName="SHOP_CARS" namespace="car-ms"/>">
<input type="hidden" id="addshopUrl" value="<ufa:url fieldName="addshop" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;">
<input type="hidden" id="userrole" value="${userrole }">
<input type="hidden" id="currpage" value="${currpage }">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm" action="<ufa:url fieldName="SHOP_EXCEL" namespace="car-ms"/>" method="post" target="hideiframe">	    
			<ul class="tb_ul02">
				<li>
					<div class="tbul02_left02" style="width:20%">
						<div class="tab_txt01">
							<span class="td_01">门店名称：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="name" id="name"
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
			  </div></div><div class="tbul02_left02" style="width:20%">
						<div class="tab_txt01">
							<span class="td_01">门店类型：</span> <span
								class="td_02" style="margin-top: 4px;"><select id="type" name="type" style="width:100px;">
<option value="">--请选择--</option><option value="0">虚拟</option>
<option value="1">自营</option><option value="2">城市合伙人</option><option value="3">寄售</option>
</select></span>
						</div>
					</div>
				</li>
			</ul>
			<div class="btnlist" style="margin-bottom: 20px;">
				<div style="width: 400px; margin: auto;">
					<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
					<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a>
					<a href="javascript:void(0);" id="btnAddShop" class="btn63_01 margin_let10">添加门店</a>
					<a href="javascript:void(0);" id="btnExcel" class="btn63_01 margin_let10">导出excel</a>
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
			<th style="text-align:center">门店类型</th>
<th style="text-align:center">样车金融额度(万)</th>
<th style="text-align:center">样车金融利率(%)</th>
<th style="text-align:center">样车金融放大比例</th>
            <th style="text-align:center">押金</th>
            <th style="text-align:center">采购金融额度(万)</th>
<th style="text-align:center">采购金融利率(%)</th>
			<th style="text-align:center">签约日期</th>
<th style="text-align:center">公司</th><th style="text-align:center">状态</th>
			<th style="text-align:center;width: 200px;">操作</th>
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
			<td>{{_formatype type}}</td>
			<td>{{credit}}</td>
			<td>{{creditinterestrate}}</td>
<td>{{simplecarf}}</td>
            <td>{{deposit}}</td>
			<td>{{financial}}</td>
			<td>{{financialinterestrate}}</td>
			<td>{{_formatSimpleDatetime signtime}}</td>
			<td>{{company}}</td><td>{{formavalid invalid}}</td>
            <td>{{addButton id type}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script> 
<%-- <div class="mian_right-new hide" id="EAA">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
		<ul class="tb_ul02">
		<form name="editForm" id="editForm1" method="POST" action="<ufa:url namespace="car-ms" fieldName="SHOP_EDIT"/>" enctype="multipart/form-data">
		<input id="hideId" name="id" type="hidden" value=''/>
		  <li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right"><label class="fc_red">*</label>门店名称</span><span style="line-height: 35px;">
		  	<input type="text" id="name" name="name" value="" style="width: 500px"/>&nbsp;
		  	</span></div>
		    </div>
		  </li>
		  <li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right"><label class="fc_red">*</label>门店地址</span><span style="line-height: 35px;">
		  	<input type="text" id="address" name="address" value="" style="width: 500px"/>&nbsp;
		  	</span></div>
		    </div>
		  </li>
		  <li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">门店电话</span><span style="line-height: 35px;">
		  	<input type="text" id="tel" name="tel" value="" style="width: 500px"/>&nbsp;
		  	</span></div>
		    </div>
		  </li>
		  <li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">省市</span><span style="line-height:0px;">
		  	<div class="tab_txt01">
			  <span class="td_01" style="width:40px;">省 :</span>
			  <span class="" style="">
			  	<select id="Editprovinces" name="province" style="width:100px;">
		        </select></span><span class="td_01" style="width:40px;">市 :</span><span class="" style="">
		        <select id="Editcities" name="city" style="width:100px;">
		         <option value="">--请选择市--</option>
		        </select>
		        </span>
			  </div>&nbsp;
		  	</span></div>
		    </div>
		  </li>
		  <li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">负责人</span><span style="line-height: 35px;">
		  	<input type="text" id="principal" name="principal" value="" style="width: 500px"/>&nbsp;
		  	</span></div>
		    </div>
		  </li>
		  <li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">联系方式</span><span style="line-height: 35px;">
		  	<input type="text" id="priTel" name="priTel" value="" style="width: 500px"/>&nbsp;
		  	</span></div>
		    </div>
		  </li>
		  <li>
		   	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">门店类型</span>
		  	<span style="line-height: 35px;margin-top: 6px;">
		        <select id="types" name="type" style="width:100px;">
		         <option value="" onclick="self1()">--请选择--</option>
		         <option value="0" onclick="self1()">虚拟</option>
		         <option value="1" onclick="self1()">自营</option>
		         <option value="2" onclick="self()">城市合伙人</option>
		         <option value="3" onclick="self1()">寄售</option>
		        </select>
		        </span>
			  </div>
			  </div>
		  </li>
		   <li style="display: none;" id="finance">
		   	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">合伙人类别</span>
		  	<span style="line-height: 35px;margin-top: 6px;">
		        <input id="financeType" name="financeType" value="1" type="radio" >样车金融
				<input id="financeType" name="financeType" value="2" type="radio" >采购金融
		        </span>
			  </div>
			  </div>
		  </li>
		  <li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">样车金融额度</span><span style="line-height: 35px;">
		  	<input type="text" id="credit" name="credit" value="" style="width: 500px"/>万
		  	</span></div>
		    </div>
		  </li><li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">样车金融利率</span><span style="line-height: 35px;">
		  	<input type="text" id="creditinterestrate" name="creditinterestrate" value="" style="width: 500px"/>&nbsp;
		  	</span></div>
		    </div>
		  </li><li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">样车金融放大比例</span><span style="line-height: 35px;">
		  	<input type="text" id="simplecarf" name="simplecarf" value="" style="width: 500px"/>
		  	</span></div>
		    </div>
		  </li><li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">押金</span><span style="line-height: 35px;">
		  	<input type="text" id="deposit" name="deposit" value="" style="width: 500px"/>&nbsp;
		  	</span></div>
		    </div>
		  </li><li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">采购金融额度</span><span style="line-height: 35px;">
		  	<input type="text" id="financial" name="financial" value="" style="width: 500px"/>万
		  	</span></div>
		    </div>
		  </li><li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">采购金融利率</span><span style="line-height: 35px;">
		  	<input type="text" id="financialinterestrate" name="financialinterestrate" value="" style="width: 500px"/>
		  	</span></div>
		    </div>
		  </li><li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">签约日期</span><span style="line-height: 35px;">
		  	<input type="text" id="signtime" name="Ssigntime" value="" style="width: 500px"/>&nbsp;
		  	</span></div>
		    </div>
		  </li><li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">公司</span><span style="line-height: 35px;">
		  	<input type="text" id="company" name="company" value="" style="width: 500px"/>&nbsp;
		  	</span></div>
		    </div>
		  </li>
		  </form>
		</ul>
		</div>
		<div class="btnlist">
		<div style="width: 200px; margin: auto;"><a href="javascript:void(0);" class="btn63_01" id="saveBtn1">确定</a>
		<a id='cancelBtn1' href="javascript:void(0);" class="btn63_02 margin_let10">取消</a>
		</div>
		</div>
	</div>		
</div> --%>
<script type="text/javascript">
/* function self(){
	document.getElementById("finance").style.display="block"; 
	$('input:radio[name=financeType]').attr('checked',false);
}
function self1(){
	$('input:radio[name=financeType]').attr('checked',false);
	document.getElementById("finance").style.display="none";
} */
    seajs.use("${scriptBasePath}/shop/shopquery.js?r=<%=new Date()%>");
</script>