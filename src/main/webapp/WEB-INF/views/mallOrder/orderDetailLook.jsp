<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="addcarUrl"
	value="<ufa:url fieldName="KRCAR_TYPEIN_SUBMIT" namespace="car-ms"/>">
<input type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input type="hidden" id="modelUrl"
	value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="checkUrl" value="<ufa:url fieldName="MALL_ORDERDETAILUPDATE_STATUS" namespace="car-ms"/>">
<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
			<ul class="tb_ul02">
			  <div class="tab_txt01">
					<li>
						
							<span class="td_01" style="width: 120px;">
								账号：
							</span>
							<span style="line-height: 35px; margin-top: 8px; width: 200px;">
								<input type="text"  value="${orderDetail.username}" readonly="readonly"/>
							</span>							
					</li>
					<li>							

							<span class="td_01" style="width: 120px;">
								订单编号：
							</span>
							<span style="line-height: 35px; margin-top: 8px; width: 300px;">
								<input type="text"  value="${orderDetail.code}"  readonly="readonly"/>
							</span>
					</li>
					<li>							
							<span class="td_01" style="width: 120px;">
								版别：
							</span>
							<span style="line-height: 35px; margin-top: 8px; width: 400px;">
								<input type="text" value="${orderDetail.brand}${orderDetail.model}${orderDetail.version}" 
									style="width: 300px;" readonly="readonly"/>
							</span>
						
					</li>
				</div>	
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">
								 车身价：
							</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" value="${orderDetail.carprice}" width="280px" readonly="readonly" />
								&nbsp;
							</span>
							<span class="td_01" style="width: 120px;">
								加装(元)：
							</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text"  value="${orderDetail.decorateprice}" readonly="readonly"/>
								&nbsp;
							</span>	
							
							<span class="td_01" style="width: 120px;">
								商品总价(元)：
							</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text"  value="${orderDetail.totalprice}" readonly="readonly"/>
								&nbsp;
							</span>
							</div>	
						</li>
						<li>	
						  <div class="tab_txt01">
							<span class="td_01" style="width: 120px;">
								定金(元)：
							</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text"  value="${orderDetail.downpay}" readonly="readonly"/>
								&nbsp;
							</span>				
							
							<span class="td_01" style="width: 120px;">
								数量：
							</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text"  value="${orderDetail.num}" readonly="readonly"/>
								&nbsp;
							</span>																				
						</div>
					</li>
						<li>	
						  <div class="tab_txt01">
							<span class="td_01" style="width: 120px;">
								支付环节：
							</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text"  value=" <c:if test="${orderDetail.paystatus ==1 }"> 待支付</c:if>
								  <c:if test="${orderDetail.paystatus ==2 }"> 已支付</c:if>" readonly="readonly"/>
								&nbsp;
							</span>					
							<span class="td_01" style="width: 120px;">
								汇率：
							</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text"  value="${site.exchangerate}" readonly="readonly"/>
								&nbsp;
							</span>									 																					
						</div>
					</li>					
			</ul>
		</div>
		<div class="btnlist">
			<div style="width: 400px; margin: auto; margin-top: 80px;">
				<a id='backBtn' href="javascript:void(0);" class="btn63_01 margin_let10">返回</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/mallOrder/orderDetailLook.js?r=<%=new Date()%>");
</script>
