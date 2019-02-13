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
<input type="hidden" id="backUrl" value="<ufa:url fieldName="MALL_ORDERDETAIL_LISTPAGE" namespace="car-ms"/>">
<input type="hidden" id="sumMoneyUrl" value="<ufa:url fieldName="MALL_ORDERDETAIL_CHECK_SUMMONEY_METHOD" namespace="car-ms"/>">
	<style>
	.oder {
		line-height: 35px;
		margin-right: 20px;
		padding: 6px 0;
	}
	
	.seal {
		width: 240px;
		text-align: left;
	}
	.decoratediv{
	  padding:20px 0 20px 30px;
	  border-bottom:1px solid #ccc;
	}
	</style>
<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
			<ul class="tb_ul02">
			<form name="editForm" id="editForm" method="POST" >
			  <div class="tab_txt01">
					<li>
						<span class="oder" style="padding-left: 100px">账号： ${orderDetail.username}</span>

					</li>

					<li>
						<span class="oder" style="padding-left: 100px">订单编号： ${orderDetail.code}</span>

					</li>
					<li>
						<div style="float: left">
							<div class="tab_txt01">
								<span class="td_01" style="margin-left: 50px">
									<img src="${ftpFileUrl}${pic}"
										style="width: 200px; height: 200px;" id="productImg1">
								</span>
							</div>
							<div class="tab_txt01" id="divPD">
								<span class="td_02" style="margin-left: 20px">
									<label class="fc_red"></label>图片<br />
								</span>
							</div>
						</div>
					</li>
					<li>
						<span class="oder" style="padding-left: 100px"> 版别：
							${orderDetail.brand}${orderDetail.model}${orderDetail.version}</span>

					</li>
				</div>
				<li>
					<span class="oder" style="padding-left: 100px">车身价： </span>
					<input  id="carprice"  value="${orderDetail.carprice}" readonly />
					<span >${orderDetail.unit}</span>
					<input id="totalprice" type="hidden" value='${orderDetail.totalprice}' />
					<input id="oldnum" type="hidden" value='${orderDetail.num}' />
					<span class="oder" style="padding-left: 100px">加装：</span>
					<input  id="packagePrice" name="packagePrice" value="${orderDetail.decorateprice}" readonly />
					<span >${orderDetail.unit}</span>
					<span class="oder" style="padding-left: 100px" >商品总价(元)： </span>
					<input  id="ntotalprice" name="totalprice" value="${orderDetail.totalprice}" readonly />
				</li>
				<li>	
							
							<span  class="oder" style="padding-left: 100px">定金：</span>
							<input  id="downpay" name="downpay" value=" ${orderDetail.downpay}" readonly />
							<span >${orderDetail.unit}</span>
							<span class="oder" style="padding-left: 100px">
								数量：
							</span>
								
							<span style="line-height: 35px; width: 200px;">
								<input type="text" name="num"  id ="num" value="${orderDetail.num}" class="textNum" style="text-align:center;" onblur="changeMonet()"  />
							</span>																			
						
					</li>
					<li>	
						  <div class="tab_txt01">
						  <span class="oder" style="padding-left: 100px">支付环节：
								  <c:if test="${orderDetail.paystatus ==1 }"> 待支付</c:if>
								  <c:if test="${orderDetail.paystatus ==2 }"> 已支付</c:if>
						  </span>		
						  <span class="oder" style="padding-left: 100px">汇率： ${site.exchangerate}</span>																										
						</div>
					</li>

					<li>
						<h4 style="padding: 10px 0;" class="list-group-item-danger">加装包（图片格式jpg,png,jpeg）</h4>
						<c:forEach var="item" items="${ds}" varStatus="ss">

							<div class="form-inline decoratediv" style="width: 100%;">
								<c:if test="${2 eq item.deflt}">
									<label style="color: red">请选择：</label>
									<td><input type="checkbox" name="addPackage"
											<c:if test="${1 eq item.ischeck}">checked</c:if> value="${item.id}" onclick="myPackage()"></td>
								</c:if>
								<!-- 默认配置，不能更改 -->
								<c:if test="${1 eq item.deflt}">
									<label>请选择：</label>
									<td><input type="checkbox" checked="checked" name="addPackage" value="${item.id}"
											onclick="return false;"></td>
								</c:if>
								<div class="form-group newInput">
									<label>名称：</label>
									<input type="text" class="form-control" name="deconame" value="${item.title}"
										placeholder="有名称代表有加装包" v="${item.id}" readonly="readonly">
								</div>
								<div class="form-group newInput" style="padding: 16px 0">
									<label>内容：</label>
									<input type="text" class="form-control" name="decodetail" value="${item.detail}"
										readonly="readonly">
								</div>
								<div class="form-group newInput">
									<label>价格：</label>
									<input type="text" class="form-control" name="decoprice" value="${item.price}"
										readonly="readonly">${cs.unit}</div>

								<div class="form-group newInput" style="padding-top: 16px">
									<label>默认选中：</label> <label class="radio-inline"> <input type="radio"
											name="default${ss.index}" value="1" <c:if test="${1 eq item.deflt}">checked</c:if>
											disabled="disabled"> 是
									</label><label class="radio-inline"><input type="radio" name="default${ss.index}" value="2"
											<c:if test="${2 eq item.deflt}">checked</c:if> disabled="disabled"> 否 </label>
								</div>
							</div>
						</c:forEach>
					</li>


					<li>
					<h4 style="padding: 10px 0;" class="list-group-item-danger">颜色</h4>
						<c:forEach var="item" items="${ds_colour}" varStatus="ss">
						
							<div class="form-inline decoratediv" style="width: 100%;">
								
									<label style="color: red">请选择：</label>
									<td>
									<%-- <input type="checkbox" name="addPackage" <c:if test="${1 eq item.ischeck}">checked</c:if>  value="${item.id}" onclick="myPackage()"> --%>
									<input name="addPackage" type="radio" <c:if test="${1 eq item.ischeck}">checked</c:if>  value="${item.id}"  onclick="myPackage()"  >
									</td>
								<div class="form-group newInput">
									<label>外观：</label>
									<input type="text" class="form-control" name="deconame" value="${item.title}"
										placeholder="有名称代表有加装包" v="${item.id}" readonly="readonly">
								</div>
								<div class="form-group newInput" style="padding: 16px 0">
									<label>内饰：</label>
									<input type="text" class="form-control" name="decodetail" value="${item.detail}"
										readonly="readonly">
								</div>
								<div class="form-group newInput">
									<label>价格：</label>
									<input type="text" class="form-control" name="decoprice" value="${item.price}"
										readonly="readonly">${cs.unit}</div>
							</div>
						</c:forEach>
					</li>
					<input id="id" type="hidden" name="id" value='${orderDetail.id}' />
					<input id="changedecoratepackage" type="hidden" name="changedecoratepackage" value='${orderDetail.decoratepackage}' />
					<input id="orderstatus" type="hidden" name="orderstatus" value='${orderDetail.orderstatus}' />
					
					<div style="">
						原因：<textarea style="margin-left: 50px" cols="45" rows="3" placeholder="订单作废的原因" name="reason"
							id="reason" value=""></textarea>
						备注：<textarea style="margin-left: 50px" cols="45" rows="3" placeholder="备注" name="remarks"
							id="remarks" value=""></textarea>
					</div>						
				</form>
			</ul>
		</div>
		<div class="btnlist">
			<div style="width: 400px; margin: auto; margin-top: 80px;">
				<a id="yesBtn" href="javascript:void(0);" class="btn63_01" >审核通过</a>
				<a id='nopassBtn'  href="javascript:void(0);" class="btn63_02 margin_let10">作废</a>
				<a id='backBtn' href="javascript:void(0);" class="btn63_01 margin_let10">返回</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/mallOrder/orderDetailCheck.js?r=<%=new Date()%>");
</script>
