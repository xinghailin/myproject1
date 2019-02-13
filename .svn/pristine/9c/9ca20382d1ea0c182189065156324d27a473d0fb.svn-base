<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="CHECKINTOLIST_KRCARENTER_URL" namespace="car-ms"/>">
<input type="hidden" id="checkintopageUrl" value="<ufa:url fieldName="CHECKINTOLIST_KRCARENTER_URL" namespace="car-ms"/>">
<input type="hidden" id="viewUrl" value="<ufa:url fieldName="CHECKINTOPAGE_KRCARENTER_PAGE" namespace="car-ms"/>">
<div class="main_right" id="viewList"
	style="margin-left: 300px; width: 1550px; height: 190%;">
	<div class="rg_list">
		<div class="tb_list">
			 <form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>"
				method="post" target="hideiframe">
				<ul class="tb_ul02">
					<li>
						<input id="currpage" value="${currpage }" type="hidden" />                
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">品牌：</span> <span class="td_02" style="margin-top: 4px;"><input
										class="input_text01" name="brand" id="brand" class="input_text01" type="text"
										style="width: 180px;"></span>
							</div>
						</div>

						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">型号：</span> <span class="td_02" style="margin-top: 4px;"><input
										class="input_text01" name="model" id="model" class="input_text01" type="text"
										style="width: 180px;"></span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">版别：</span> <span class="td_02" style="margin-top: 4px;"><input
										class="input_text01" name="version" id="version" class="input_text01" type="text"
										style="width: 180px;"></span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">车架号：</span> <span class="td_02" style="margin-top: 4px;"><input
										class="input_text01" name="vin" id="vin" class="input_text01" type="text"
										style="width: 180px;"></span>
							</div>
						</div>
					</li>
					<li>

						<!-- <div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01" >状态：</span> <span
									class="" style="margin-top: 8px; width: 200px;"> <select id="status" name="status"
										style="width: 159px;height:25px">
										    <option value="">--请选择--</option>
											<option value="1">待审核</option>
											<option value="2">已入库</option>
											<option value="3">审核不通过</option>
											<option value="4">已出库</option>
									</select>
								</span>
							</div>
						</div> -->

						<div class="tbul02_right02" style="width: 25%;"">
							<div class="tab_txt01">
								<span class="td_01">库融池：</span>
								<span class="td_02" style="margin-top: 4px;">
									<select id="poolid" name="poolid" style="width: 159px;height:25px">
										<option value="">--请选择--</option>
										<c:forEach var="item" items="${poolList}">
											<option value="<c:out value="${item.id}"></c:out>"><c:out value="${item.name}"></c:out></option>
										</c:forEach>
									</select>
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">入库日期：</span> <span class="td_02" style="margin-top: 4px;"><input
										class="input_text01" name="intime" id="payDateTime" class="input_text01" type="text"
										style="width: 180px;"></span>
							</div>
						</div>
					</li>


				</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="width: 400px; margin: auto;">
						<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
						<a href="javascript:void(0);" id="btnReset"
							class="btn63_02 margin_let10">重置</a>

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
<div id="imgLayer" class="ele_img_item clearfix" style="position:absolute;z-index:1;width: 260px; solid;display:none;" ></div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
		    <th style="text-align:center">库融名称</th>				
            <th style="text-align:center">品牌</th>
            <th style="text-align:center">型号</th>
            <th style="text-align:center">版别</th>
            <th style="text-align:center">车架号</th>
            <th style="text-align:center">外观颜色</th>
            <th style="text-align:center">内饰颜色</th>
            <th style="text-align:center">价格(元)</th>
            <th style="text-align:center">折扣价(元)</th>
            <th style="text-align:center">入库日期</th>
            <th style="text-align:center">状态</th>
            <th style="text-align:center">操作</th>
     
           
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{poolname}}</td>
            <td>{{brand}}</td>
            <td>{{model}}</td>
            <td>{{version}}</td>
            <td>{{vin}}</td>
            <td>{{outcolor}}</td>
            <td>{{incolor}}</td>
            <td>{{price}}</td>
            <td>{{disprice}}</td>
			<td>{{_formatSimpleDate intime}}</td>
            <td>{{_formatStatus status}}</td>
            <td>{{addButton status id}}</td>      
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/krcar/checkintolist.js?r=<%=new Date()%>");
</script>