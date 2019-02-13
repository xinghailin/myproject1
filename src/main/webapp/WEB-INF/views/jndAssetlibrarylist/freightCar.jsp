<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="freightCarList" namespace="car-ms"/>">
<input type="hidden" id="freightpageUrl"
	value="<ufa:url fieldName="freightpage" namespace="car-ms"/>">
<input type="hidden" id="freightCarupdateUrl"
	value="<ufa:url fieldName="freightCarupdate" namespace="car-ms"/>">
<input type="hidden" id="freightCarNoPassUrl"
	value="<ufa:url fieldName="freightCarNoPass" namespace="car-ms"/>">
<input type="hidden" id="freightApplyUpdatepageUrl"
	value="<ufa:url fieldName="freightApplyUpdatepage" namespace="car-ms"/>">
<input type="hidden" id="updatefreightsaveUrl"
	value="<ufa:url fieldName="updatefreightsave" namespace="car-ms"/>">
<input type="hidden" id="detailsUrl" value="<ufa:url fieldName="jndcardetails" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">
	<div class="rg_list">

 <input type="hidden" id="currpage" name="currpage" value="${currpage }"/>
 <input type="hidden" id="id" value="${id }"><!--运费申请单id  -->
 <input type="hidden" id="username"  value="${username }">
 <input type="hidden" id="ftype"  value="${jnd.type }">
 <c:if test="${jnd.currency eq 1}"><c:set var="curr" value="C$" /></c:if><c:if test="${jnd.currency eq 2}"><c:set var="curr" value="$" /></c:if>
		<div class="tbul02_left02" style="width:25%">
			<div class="tab_txt01">
				<span class="td_01" style="width: 180px"><label class="fc_red">*</label>申请名称applyName：</span> <span
					class="td_center" style="width: 150px;">${jnd.name }</span>
			</div>
		</div>
		<div class="tbul02_left02" style="width:25%">
			<div class="tab_txt01">
			<span class="td_01" style="width: 180px"><label class="fc_red">*</label>4s店到仓库运费reachStore：</span> <span
				class="td_center" style="width: 150px;">${jnd.fourtorep }${curr}</span>
			</div>
		</div>
		<div class="tbul02_left02" style="width:25%">
			<div class="tab_txt01">
			<span class="td_01" style="width: 180px"><label class="fc_red">*</label>仓库到港口运费drayage：</span> <span
				class="td_center" style="width: 150px;">${jnd.drayage }${curr}</span>
			</div>
		</div>
		<div class="tbul02_left02" style="width:25%">
			<div class="tab_txt01">
			<span class="td_01" style="width: 180px"><label class="fc_red">*</label>海运费oceanFreight：</span> <span
				class="td_center" style="width: 150px;">${jnd.oceanfreight }${curr}</span>
			</div>
		</div>
		<div class="tbul02_left02" style="width:25%">
			<div class="tab_txt01">
			<span class="td_01" style="width: 180px"><label class="fc_red">*</label>牌照费LicenseFees：</span> <span
				class="td_center" style="width: 150px;">${jnd.brandprice }${curr}</span>
			</div>
		</div>	
		<div class="tbul02_left02" style="width:25%">
			<div class="tab_txt01">
			<span class="td_01" style="width: 180px"><label class="fc_red">*</label>保险费 Premium：</span> <span
				class="td_center" style="width: 150px;">${jnd.surepreinsuranceprice }${curr}</span>
			</div>
		</div>
		<div class="tbul02_left02" style="width:25%">
			<div class="tab_txt01">
			<span class="td_01" style="width: 180px"><label class="fc_red">*</label>燃油费fuelCharge：</span> <span
				class="td_center" style="width: 150px;">${jnd.surepreoilprice }${curr}</span>
			</div>
		</div>					
		<div class="tbul02_right02" style="width:25%">
			<div class="tab_txt01">
				<span class="td_01" style="width: 180px" >其他费用1otherCost1：</span> <span
					class="td_center" style="width: 150px;">${jnd.elsecost1 }${curr}</span>
			</div>
		</div>
		<div class="tbul02_right02" style="width:25%">
			<div class="tab_txt01">
			<span class="td_01" style="width: 180px">其他费用2otherCost2：</span> <span
			class="td_center" style="width: 150px;">${jnd.elsecost2 }${curr}</span>
			</div>
		</div>
<c:if test="${not empty jnd.reason }">
<div class="tbul02_right02" style="width:25%">
	<div class="tab_txt01">
<span class="td_01" style="width: 150px">审核不通过的理由：</span>${jnd.reason}</span>
	</div>
	</div>
</c:if>
	<c:if test="${jnd.type ==1&&username!=null&&username!=''}">
		<div class="tbul02_right02" style="width:50%">
	<div class="tab_txt01">
<span class="td_01" style="width: 150px">审核不通过的理由：</span>
<textarea style="margin-left:10px" cols="45" rows="3" value="" id="reason">
</textarea>
</span>
	</div>
	</div>
<div class="btnlist" style="margin-bottom: 20px;">
<div style="text-align: center;">
	<a href="javascript:void(0);" id="submit" class="btn63_01">审核通过</a>
	<a href="javascript:void(0);" id="submit1" class="btn63_01">审核不通过</a>
	<a href="javascript:void(0);" id="cancel" class="btn63_02 margin_let10">取消</a>
</div></div>
				</c:if>
				<div class="tbul02_right02" style="width:100%">
		<span id="carp1" style="color: red;font-family: "新宋体"">
			</span>
			</div>
		</li>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg"></div>
		<div class="btnlist" style="margin-bottom: 20px;">
			<div style="text-align: center;">
				<a href="javascript:void(0);" id="back" class="btn63_01">返回</a>
			</div>
		<div class="hide" id="J_DataList">
		</div>
	</div>
</div>
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center;word-wrap:break-word;">车架号</th>
			<th style="text-align:center;word-wrap:break-word;">品牌</th>
			<th style="text-align:center;word-wrap:break-word;">型号</th>
			<th style="text-align:center;word-wrap:break-word;">版别</th>
			<th style="text-align:center;word-wrap:break-word;">排量</th>
			<th style="text-align:center;word-wrap:break-word;">内饰颜色</th>
			<th style="text-align:center;word-wrap:break-word;">外观颜色</th>
			<th style="text-align:center;word-wrap:break-word;">车价</th>
			<th style="text-align:center;word-wrap:break-word;">成本价</th>
			<th style="text-align:center;word-wrap:break-word;">供应商姓名</th>
			<th style="text-align:center;word-wrap:break-word;">仓库</th>
			<th style="text-align:center;word-wrap:break-word;">运输日期</th>
			<th style="text-align:center;word-wrap:break-word;">到港时间</th>
			<th style="text-align:center;word-wrap:break-word;">状态</th>
			<th style="text-align:center;word-wrap:break-word;">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{vin}}</td>
  			<td>{{brand}}</td>
  			<td>{{model}}</td>
  			<td>{{version}}</td>
<td>{{displacement}}</td>
<td>{{incolor}}</td>
<td>{{outcolor}}</td>
<td>{{price}}</td>
<td>{{costprice}}</td>
<td>{{buyername}}</td>
<td>{{roughweight}}</td>
<td>{{_formatDatetime starttime}}</td>
<td>{{_formatarrivetime arrivetime}}</td>
<td>{{_type status1}}</td>
	<td>{{_operate id }}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
</script>
<script type="text/javascript">
 seajs.use("${scriptBasePath}/jndAssetlibrarylist/freightCar.js?v=<%=new Date()%>"); 
</script>