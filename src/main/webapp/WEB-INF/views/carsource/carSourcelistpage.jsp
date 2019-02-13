<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/common/index.css">
<input type="hidden" id="searchUrl"
	value="<ufa:url fieldName="carSourcelist" namespace="car-ms"/>">
<input type="hidden" id="cityUrl" value="<ufa:url fieldName="shopcity" namespace="car-ms"/>">
<input type="hidden" id="addCarSourceUrl" value="<ufa:url fieldName="addCarSource" namespace="car-ms"/>">
<input type="hidden" id="currpage" value="${currpage }">
<input type="hidden" id="shopid" value="${shopid }">
<input type="hidden" id="loginid" value="${loginid }">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm">
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
									<input name="model" id="model" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01">版别：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input type="text" id="version" name="version" class="input_text01" style="width: 180px;" />&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li><div class="tbul02_left02" style="width: 30%;margin-left: 100px;">
									<div class="tab_txt01">
										<span class="td_01" style="width: 40px;">省：</span>
										<span class="" style="margin-top: 10px;">
											<select id="Editprovinces" class="prov" name="province" style="width: 100px;"
												onchange="citys()">
												<option value="">--请选择省--</option>
												<c:forEach var="item" items="${lo}">
													<option value="<c:out value="${item.name}"></c:out>"
														<c:if test="${item.name eq shop.province}">selected="selected"</c:if>><c:out
															value="${item.name}"></c:out></option>
												</c:forEach>
											</select>
										</span>
										<span class="td_01" style="width: 40px;">市 ：</span>
										<span class="" style="margin-top: 10px;">
											<select id="Editcities" name="city" class="city" style="width: 100px;">
												<option value="">--请选择市--</option>
												<c:forEach var="item" items="${lo1}">
													<option value="<c:out value="${item.name}"></c:out>"
														<c:if test="${item.name eq shop.city}">selected="selected"</c:if>><c:out
															value="${item.name}"></c:out></option>
												</c:forEach>
											</select>
									</div>
									&nbsp;
								</div>
						<div class="tbul02_left02" style="width: 30%;margin-left: -100px;">
							<div class="tab_txt01">
								<span class="td_01">门店：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="shopname" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
					</li>
				</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="width: 300px; margin: auto;">
						<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
						<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a>
						<c:if test="${shopid!=null }">
						<a href="javascript:void(0);" id="addCarSource" class="btn63_01 margin_let10">添加车源</a>
						</c:if>
					</div>
				</div>
			</form>
		</div>
		<div class="clear"></div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
		</div>
	
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
            <th style="text-align:center">门店</th>
            <th style="text-align:center">品牌</th>
            <th style="text-align:center">型号</th>
            <th style="text-align:center">版别</th>
            <th style="text-align:center">外观颜色</th>
			<th style="text-align:center">内饰颜色</th>
			<th style="text-align:center">数量</th>
			<th style="text-align:center">车源地</th>
			<th style="text-align:center">采购价</th>
			<th style="text-align:center">状态</th>
			<th style="text-align:center">原因</th>
			<th style="text-align:center">是否有效</th>
            <th style="text-align:center">有效时间截止</th>

			
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
 			<td>{{shopname}}</td>
            <td>{{brand}}</td>
            <td>{{model}}</td>
            <td>{{version}}</td>
            <td>{{outcolour}}</td>
            <td>{{incolour}}</td>
 			<td>{{num}}</td>
            <td>{{province}}&nbsp{{city}}</td>
			<td>{{purchaseprice}}</td>
            <td>{{ _status status}}</td>
 	 		<td>{{cause}}</td>
			<td>{{valid  status endtime}}</td>
            <td>{{_formatDatetime endtime}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript" src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=2013090913" id="seajsnode"></script>
<script type="text/javascript">
 function citys() {
	var city = $('#cityUrl').val();
	$.ajax({
		//几个参数需要注意一下
		type : "POST",//方法类型
		dataType : "json",//预期服务器返回的数据类型
		url : city,//url
		data : {
			province : $('#Editprovinces').val()
		},
		success : function(data) {
			console.log(data);
			$(".city").find("option").remove();
			$.each(data.lo1, function() {
				$('.city').append($("<option>" + this.name + "</option>"))
			});
		}
	});
}; 
    seajs.use("${scriptBasePath}/carsource/carSourcelistpage.js?r=<%=new Date()%>");
</script>