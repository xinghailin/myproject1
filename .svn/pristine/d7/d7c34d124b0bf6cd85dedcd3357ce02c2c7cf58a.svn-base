<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="CAR_AUDIT_LST" namespace="car-ms"/>">
<input type="hidden" id="checkUrl" value="<ufa:url fieldName="CAR_PARAM_CHECK" namespace="car-ms"/>">
<input id="currpage" type="hidden" value='${currpage}' />
<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
			<ul class="tb_ul02">
				<li>
					<div class="tab_txt01">
						<span class="td_01" style="width: 120px;">品牌：</span>
						<span style="line-height: 35px; width: 300px;">${car.brand}&nbsp;</span>
						<span class="td_01" style="width: 120px;">型号：</span>
						<span style="line-height: 35px; width: 300px;">${car.model}&nbsp;</span>
						<span class="td_01" style="width: 120px;">版别：</span>
						<span style="line-height: 35px; width: 300px;">${car.version}&nbsp;</span>

					</div>
				</li>
				<li>
					<div class="tab_txt01">
						<span class="td_01" style="width: 120px;">车架号：</span>
						<span style="line-height: 35px; width: 300px;">${car.vin}&nbsp;</span>
						<span class="td_01" style="width: 120px;">发动机号：</span>
						<span style="line-height: 35px; width: 300px;">${car.engineNum}&nbsp;</span>
						<span class="td_01" style="width: 120px;">出厂日期：</span>
						<span style="line-height: 35px; width: 300px;">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${car.leaveFactoryTime}" />
							&nbsp;
						</span>

					</div>
				</li>
				<li>
					<div class="tab_txt01">
						<span class="td_01" style="width: 120px;">采购日期：</span>
						<span style="line-height: 35px; width: 300px;">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${car.purchaseTime}" />
							&nbsp;
						</span>
						<span class="td_01" style="width: 120px;">外观颜色：</span>
						<span style="line-height: 35px; width: 300px;">${car.outlookColor}&nbsp;</span>
						<span class="td_01" style="width: 120px;">内饰颜色：</span>
						<span style="line-height: 35px; width: 300px;">${car.innerColor}&nbsp;</span>
					</div>
				</li>
				<li>
					<div class="tab_txt01">
						<span class="td_01" style="width: 120px;">可售：</span>
						<span style="line-height: 35px; width: 300px;">${car.realSale}&nbsp;</span>
						<span class="td_01" style="width: 120px;">采购价(元)：</span>
						<span style="line-height: 35px; width: 300px;">${car.buyPrice}&nbsp;</span>
						<span class="td_01" style="width: 120px;">成本价(元)：</span>
						<span style="line-height: 35px; width: 300px;">${car.lowPrice}&nbsp;</span>
						<%-- 	<span class="td_01" style="width: 120px;">车身级别：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.level}&nbsp;</span> --%>
					</div>
				</li>
				<li>
					<div class="tab_txt01">
						<span class="td_01" style="width: 120px;">销售价(元)：</span>
						<span style="line-height: 35px; width: 300px;">${car.sellerprice}&nbsp;</span>
						<span class="td_01" style="width: 120px;">结算价(元)：</span>
						<span style="line-height: 35px; width: 300px;">${car.typeinsettleprice}&nbsp;</span>
						<span class="td_01" style="width: 120px;">采购金融结算价(元)：</span>
						<span style="line-height: 35px; width: 300px;">${car.purchasesettlementprice}&nbsp;</span>
					</div>
				</li>
				<li>
					<div class="tab_txt01">
						<span class="td_01" style="width: 120px;">采购商名称：</span>
						<span style="line-height: 35px; width: 300px;">${car.buyName}&nbsp;</span>
						<span class="td_01" style="width: 120px;">原始地址：</span>
						<span style="line-height: 35px; width: 300px;">${car.address}&nbsp;</span>
						<%-- <span class="td_01" style="width: 120px;">车辆所在地：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.carAddress}&nbsp;</span> --%>
						<span class="td_01" style="width: 120px;">采购人：</span>
						<span style="line-height: 35px; width: 300px;">${car.buyerName }&nbsp;</span>

					</div>
				</li>
				<li>
					<div class="tab_txt01">
						<span class="td_01" style="width: 120px;">配置：</span>
						<span style="line-height: 35px; width: 300px;">${car.config}&nbsp;</span>
						<span class="td_01" style="width: 120px;">备注：</span>
						<span style="line-height: 35px; width: 300px;">${car.decorate}&nbsp;</span>
					</div>
				</li>
				<li style="width: 240px; float: left;">
					<div class="tab_txt01">
						<span class="td_01" style="margin-left: 50px">
							<img src="${contextPath}${car.iden1}" style="width: 100px; height: 100px;" id="productImg1">
						</span>
					</div>
					<div class="tab_txt01">
						<span class="td_02" style="margin-left: 90px">
							关单<br />&nbsp;
						</span>
					</div>
				</li>
				<li style="width: 240px; float: left">
					<div class="tab_txt01">
						<span class="td_01" style="margin-left: 50px">
							<img src="${contextPath}${car.iden2}" style="width: 100px; height: 100px;" id="productImg2">
						</span>
					</div>
					<div class="tab_txt01">
						<span class="td_02" style="margin-left: 90px">
							商检单<br />&nbsp;
						</span>
					</div>
				</li>
				<li style="width: 240px; float: left">
					<div class="tab_txt01">
						<span class="td_01" style="margin-left: 50px">
							<img src="${contextPath}${car.iden3}" style="width: 100px; height: 100px;" id="productImg3">
						</span>
					</div>
					<div class="tab_txt01">
						<span class="td_02" style="margin-left: 90px">
							车辆一致性证书(正面)<br />&nbsp;
						</span>
					</div>
				</li>
				<li style="width: 240px; float: left">
					<div class="tab_txt01">
						<span class="td_01" style="margin-left: 50px">
							<img src="${contextPath}${car.iden5}" style="width: 100px; height: 100px;" id="productImg3">
						</span>
					</div>
					<div class="tab_txt01">
						<span class="td_02" style="margin-left: 90px">
							车辆一致性证书(反面)<br />&nbsp;
						</span>
					</div>
				</li>
				<li style="width: 240px; float: left">
					<div class="tab_txt01">
						<span class="td_01" style="margin-left: 50px">
							<img src="${contextPath}${car.iden4}" style="width: 100px; height: 100px;" id="productImg4">
						</span>
					</div>
					<div class="tab_txt01">
						<span class="td_02" style="margin-left: 90px">
							环保清单<br />&nbsp;
						</span>
					</div>
				</li>
			</ul>
		</div>
		<div class="btnlist">
			<div style="width: 450px; margin: auto; margin-top: 80px;">
				<a href="javascript:void(0);" class="btn63_01" id="yesBtn">审核通过车辆入库</a>
				<a id='noBtn' href="javascript:void(0);" class="btn63_02 margin_let10">不通过</a>
				<a id='backBtn' href="javascript:void(0);" class="btn63_01 margin_let10">返回</a>
			</div>
		</div>
		<form name="editForm" id="editForm" method="POST"
			action="<ufa:url namespace="car-ms" fieldName="CAR_AUDIT_DO"/>" enctype="multipart/form-data">
			<input id="hideId" type="hidden" name="id" value='${car.id}' /> <input id="hidePass"
				type="hidden" name="pass" value='' /> <input type="hidden" name="jndcar" value="${car.jndcar }">
			<div style="">
				<textarea style="margin-left: 80px" cols="45" rows="3" placeholder="审核不通过的理由" name="reason"
					id="reason" value=""></textarea>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	seajs.use("${scriptBasePath}/assetRepository/audit.js?r=${ts}");
</script>
