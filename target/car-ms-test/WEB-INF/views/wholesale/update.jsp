<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="addcarUrl"
	value="<ufa:url fieldName="KRCAR_TYPEIN_SUBMIT" namespace="car-ms"/>">
<input type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input type="hidden" id="modelUrl"
	value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="updateUrl" value="<ufa:url fieldName="WHOLESALE_UPDATEMESSAGE_URL" namespace="car-ms"/>">
<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
			<ul class="tb_ul02">
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">
								品牌：
							</span>
							<span style="line-height: 35px; margin-top: 8px; width: 200px;">
								<input type="text" id="brand" name="brand" value="${wholesaleCar.brand}" readonly="readonly"/>
							</span>
							
							<span class="td_01" style="width: 120px;">
								版别：
							</span>
							<span style="line-height: 35px; margin-top: 8px; width: 400px;">
								<input type="text" value="${wholesaleCar.version}" name="version" id="version"
									style="width: 300px;" readonly="readonly"/>
							</span>
						</div>
					</li>
					<li>
					<div class="tab_txt01">
						<span class="td_01" style="width: 120px;">
							 车架号：
						</span>
						<span style="line-height: 35px; width: 200px;">
							<input type="text" id="vin" name="vin" value="${wholesaleCar.vin}" width="280px"
								readonly="readonly" />
							&nbsp;
						</span>
                      <span class="td_01" style="width: 120px;">
								型号：
							</span>
							<span style="line-height: 35px; margin-top: 8px; width: 200px;">
								<input type="text" id="model" value="${wholesaleCar.model}" name="model" readonly="readonly"/>
							</span>
					</div>
					</li>
					<li>
					<div style="" class="tab_txt01">
					  <span class="td_01" style="width: 120px;">
							 未通过原因：
						</span>
						<span style="line-height: 35px; width: 200px;">
						<textarea style="margin-left: 50px" cols="45" rows="3" placeholder="审核不通过的理由" value=""
							readonly="readonly">${wholesaleCar.reason}</textarea>
						<span>
					</div>
				</li>
				<form name="editForm" id="editForm" method="POST" >
				  <div class="tab_txt01">
					<input id="id" type="hidden" name="id" value='${wholesaleCar.id}' />
					<input id="type" type="hidden" name="type" value='${wholesaleCar.type}' />
					
					
						<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label> 价格(元)：
							</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" id="price" name="price" value="${wholesaleCar.price}" />
								&nbsp;
							</span>
							<span class="td_01" style="width: 120px;">
								<label class="fc_red">*</label> 水单：
							</span>
							<span style="line-height: 35px;">
							<div style="display: inline-block">
							    <a  style="display: inline-block" href="${contextPath}${wholesaleCar.monad}" download="${wholesaleCar.monad}"	style="text-decoration: underline; margin-left: 10px; color: #4d90fe;" title="点击下载">${wholesaleCar.monadname}</a>
								<input style="display: inline-block;margin-left:20px" id="monads" name="monads" type="file" >
								</div>
							</span>						
					
                  </div>
				</form>
			</ul>
		</div>
		<div class="btnlist">
			<div style="width: 400px; margin: auto; margin-top: 80px;">
				<a href="#" class="btn63_01" id ="yesBtn"  style="padding: 6px 38px">保存</a>
				<a href="#" class="btn63_02 margin_let10"  id ="backBtn"  style="padding: 6px 38px">取消</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/wholesale/update.js?r=<%=new Date()%>");
</script>
