<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="CLIENT_INFO_LST_DO" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="CLIENT_INFO_EDIT" namespace="car-ms"/>">
<input type="hidden" id="addUrl" value="<ufa:url fieldName="CLIENT_INFO_ADD" namespace="car-ms"/>">

<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm">	    
			<ul class="tb_ul02">
				<li><input type="hidden" id="currpage" value="${currpage }">
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">客户姓名：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="name" id="name"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_right02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">进店日期：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="comeshopTime" id="comeshopTime"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">联系电话：</span> <span
								class="td_02" style="margin-top: 4px;">
								<input name="phone" id="phone"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
				</li>
				<li>
				<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">客户级别：</span> <span class="td_02" style="margin-top: 10px;">
		  	  	<input type="radio"  name="clientLevel" value="H"/>H&nbsp;
		  	    <input type="radio"  name="clientLevel" value="A"/>A&nbsp;
		  	    <input type="radio"  name="clientLevel" value="B"/>B&nbsp;
		     	<input type="radio"  name="clientLevel" value="C"/>C&nbsp;
		    	<input type="radio"  name="clientLevel" value="N"/>N&nbsp;
		    	<input type="radio"  name="clientLevel" value="G"/>G</span>
						</div>
					</div>
				<div class="tbul02_left02" style="width:30%">
						<div class="tab_txt01">
							<span class="td_01">客户类型：</span> <span class="td_02" style="margin-top: 10px;">
<c:choose>
    <c:when test="${(empty worktype) or (worktype eq '1')}">
        <input type="radio"  name="workType" value="1" checked="checked"/>个人&nbsp;
		<input type="radio"  name="workType" value="2" />单位&nbsp;
    </c:when>
    <c:otherwise>
        <input type="radio"  name="workType" value="1" />个人&nbsp;
		<input type="radio"  name="workType" value="2" checked="checked"/>单位&nbsp;
    </c:otherwise>
</c:choose>
								</span>
						</div>
					</div>
				</li>
			</ul>
			<div class="btnlist" style="margin-bottom: 20px;">
				<div style="width: 300px; margin: auto;">
					<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
					<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a>
					<a href="javascript:void(0);" id="btnAddClient" class="btn63_01 margin_let10">添加</a>
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
			<th style="text-align:center">客户类别</th>
			<th style="text-align:center">级别</th>
            <th style="text-align:center">姓名</th>
			<th style="text-align:center">身份证</th>
			<th style="text-align:center">电话</th>
            <th style="text-align:center">进店日期</th>
            <th style="text-align:center">意向品牌</th>
            <th style="text-align:center">意向型号</th>
            <th style="text-align:center">意向版别</th>
            <th style="text-align:center">心里价位(万)</th>
            <th style="text-align:center">配置颜色</th>
            <th style="text-align:center">现有交通工具</th>
			<th style="text-align:center">熟客介绍</th>
            <th style="text-align:center">可用牌照</th>
			<th style="text-align:center">销售人员</th>
            <th style="text-align:center">所属门店</th>
			<th style="text-align:center;width:60px;">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{formatwt workType}}</td>
            <td>{{clientLevel}}</td>
            <td>{{name}}</td>
            <td>{{identify}}</td>
            <td>{{phone}}</td>
            <td>{{_formatSimpleDatetime comeshopTime}}</td>
            <td>{{wantBrand}}</td>
            <td>{{wantcar}}</td>
 	 		<td>{{version}}</td>
            <td>{{heartPrice}}</td>
            <td>{{color}}</td>
            <td>{{nowCar}}</td>
            <td>{{oldIntroduce}}</td>
            <td>{{haveCard}}</td>
            <td>{{sellerName}}</td>
            <td>{{shopName}}</td>
            <td>{{_operate id}}</td>

        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script id="dataListTemplate1"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">客户类别</th>
			<th style="text-align:center">级别</th>
            <th style="text-align:center">单位名称</th>
			<th style="text-align:center">营业执照号</th>
			<th style="text-align:center">负责人姓名</th>
			<th style="text-align:center">负责人电话</th>
            <th style="text-align:center">进店日期</th>
            <th style="text-align:center">意向品牌</th>
            <th style="text-align:center">意向型号</th>
            <th style="text-align:center">心里价位</th>
            <th style="text-align:center">配置颜色</th>
            <th style="text-align:center">现有交通工具</th>
			<th style="text-align:center">熟客介绍</th>
            <th style="text-align:center">可用牌照</th>
			<th style="text-align:center">销售人员</th>
            <th style="text-align:center">所属门店</th>
			<th style="text-align:center;width:60px;">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{formatwt workType}}</td>
            <td>{{clientLevel}}</td>
            <td>{{name}}</td>
            <td>{{bizLicense}}</td>
            <td>{{principal}}</td>
            <td>{{phone}}</td>
            <td>{{_formatSimpleDatetime comeshopTime}}</td>
            <td>{{wantBrand}}</td>
            <td>{{wantcar}}</td>
            <td>{{heartPrice}}</td>
            <td>{{color}}</td>
            <td>{{nowCar}}</td>
            <td>{{oldIntroduce}}</td>
            <td>{{haveCard}}</td>
            <td>{{sellerName}}</td>
            <td>{{shopName}}</td>
           <td>{{_operate id}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/assetRepository/clientInfo.js");
</script>