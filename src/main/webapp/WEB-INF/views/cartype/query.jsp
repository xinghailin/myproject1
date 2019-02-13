<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="CARTYPE_QUERY" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="CARTYPE_EDIT" namespace="car-ms"/>">
<input type="hidden" id="delUrl" value="<ufa:url fieldName="CARTYPE_DELETE" namespace="car-ms"/>">
<input type="hidden" id="addUrl" value="<ufa:url fieldName="CARTYPE_ADD" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;">
	<div class="rg_list">
		<div class="tb_list"><form name="searchForm" id="searchForm">
			<ul class="tb_ul02">
				<li>
				<input type="hidden" id="currpage" value="${currpage }"/>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">品牌：</span> <span class="td_02" style="margin-top: 4px;">
			<select id="brand" name="brand" style="">
		  	  <option value="">--请选择--</option>
	           <c:forEach var="item" items="${tl}">  
	             <option value="<c:out value="${item.brand}"></c:out>"><c:out value="${item.brand}"></c:out></option>
	           </c:forEach>
		    </select></span>
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
							<span class="td_01">版别：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="version" id="version"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
				</li>
			</ul></form>
			<div class="btnlist" style="margin-bottom: 20px;">
				<div style="width: 400px; margin: auto;">
					<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
					<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a>
				<!-- 	<a href="javascript:void(0);" id="btnAdd" class="btn63_01 margin_let10">新增</a> -->
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
<div id="imgLayer" class="ele_img_item clearfix" style="position:absolute;z-index:1;width: 260px; solid;display:none;" ></div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">品牌</th>
            <th style="text-align:center">型号</th>
            <th style="text-align:center">版别</th>
			<th style="text-align:center">0首付产品本金</th>
			<th style="text-align:center">车辆价格</th>
            <th style="text-align:center">第一月月供</th>
  			<th style="text-align:center">第二月月供</th>
 			<th style="text-align:center">第十三月月供</th>
  			<th style="text-align:center">第十四月月供</th>
            <th style="text-align:center">利率</th>
            <th style="text-align:center">期数</th>
			<th style="text-align:center">封面图片</th>
            <th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#lst}}
        <tr>
            <td>{{brand}}</td>
            <td>{{model}}</td>
            <td>{{version}}</td>
			<td>{{downpay}}</td>
            <td>{{firstpay}}</td>
 <td>{{oneMonthPay}}</td>
			<td>{{everypay}}</td>
 <td>{{thirteenthMonthPay}}</td>
 <td>{{fourteenthMonthPay}}</td>
            <td>{{rate}}</td>
			<td>{{period}}</td>
<td><img src="{{pic}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
            <td>{{operate id}}</td>
        </tr>
        {{/lst}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/cartype/query.js?r=<%=new Date()%>");
</script>