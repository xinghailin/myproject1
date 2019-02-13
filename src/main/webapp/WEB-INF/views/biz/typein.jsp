<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="checkUrl" value="<ufa:url fieldName="CAR_PARAM_CHECK" namespace="car-ms"/>">
<input type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input type="hidden" id="modelUrl" value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="versionUrl" value="<ufa:url fieldName="QUERY_VERSION" namespace="car-ms"/>">
<input type="hidden" id="sellerpriceUrl" value="<ufa:url fieldName="querySellerPpriceByCar" namespace="car-ms"/>">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="bizzeropurstoreindex" namespace="car-ms"/>">
<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
			<ul class="tb_ul02">
				<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="bizcartypeinsubmit"/>" enctype="multipart/form-data"><input type="hidden" id="currpage" name="currpage" value="${currpage}"> <input type="hidden" name="zeroid" value="${zp.id}">
					<input type="hidden" name="vin" value="${zp.vin}"> <input type="hidden" name="brand" value="${zp.brand}"> <input type="hidden" name="model" value="${zp.model}"> <input type="hidden" name="version" value="${zp.version}"> <input type="hidden" name="outlookColor"
					value="${zp.outcolor}"> <input type="hidden" name="innerColor" value="${zp.incolor}"> <input type="hidden" name="config" value="${zp.config}"> <input type="hidden" name="lowPrice" value="${zp.costprice}"> <input type="hidden" name="typeinsettleprice"
					value="${zp.settleprice}">
					<li>
						<div class="tab_txt01"><span class="td_01" style="width: 120px;"><label class="fc_red">*</label>品牌：</span><span style="line-height: 35px; width: 200px;">${zp.brand}</span> <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>型号：</span><span
							style="line-height: 35px; width: 200px;">${zp.model}</span> <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>版别：</span><span style="line-height: 35px; width: 600px;">${zp.version}</span></div>
				</li>
					<li>
						<div class="tab_txt01"><span class="td_01" style="width: 120px;"><label class="fc_red">*</label>车架号：</span><span style="line-height: 35px; width: 200px;">${zp.vin}</span> <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>发动机号：</span> <span
							style="line-height: 35px; width: 200px;"><input type="text" id="engineNum" name="engineNum" value="" width="280px" />&nbsp;</span> <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>出厂日期：</span> <span style="line-height: 35px; width: 200px;"><input type="text"
								id="leaveFactoryTime" name="leaveFactoryTime" value="" />&nbsp;</span> <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>采购日期：</span> <span style="line-height: 35px; width: 200px;"><input type="text" id="purchaseTime" name="purchaseTime" value="" />&nbsp;</span> <!-- <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>长宽高：</span>
		  	  	<span style="line-height: 35px;width:200px;"><input type="text" id="lenWidHei" name="lenWidHei" value="" />&nbsp;</span>
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>排量：</span>
		  	  	<span style="line-height: 35px;width:200px;"><input type="text" id="displacement" name="displacement" value="" />&nbsp;</span> --></div>
				</li> <!-- 	<li>
		  	  <div class="tab_txt01">
		  	  <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>工信部综合油耗：</span>
		  	  	<span style="line-height: 35px;width:200px;"><input type="text" id="oilWear" name="oilWear" value="" />&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>排放：</span>
		  	  	<span style="line-height: 35px;width:200px;"><input type="text" id="discharge" name="discharge" value="" />&nbsp;</span>
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>整体质量：</span>
		  	  	<span style="line-height: 35px;width:200px;"><input type="text" id="weight" name="weight" value="" />&nbsp;</span>
		        
			 </div>
		   	</li> -->
					<li>
						<div class="tab_txt01"><span class="td_01" style="width: 120px;"><label class="fc_red">*</label>外观颜色：</span> <span style="line-height: 35px; width: 200px;">${zp.outcolor}&nbsp;</span> <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>内饰颜色：</span> <span
							style="line-height: 35px; width: 200px;">${zp.incolor}&nbsp;</span> <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>可售：</span> <span style="line-height: 35px; width: 200px;"><input type="text" id="realSale" name="realSale" placeholder="是可售填1,否则不填" value="1" />&nbsp;</span>
							<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>采购价(元)：</span> <span style="line-height: 35px; width: 200px;"><input type="text" id="buyPrice" name="buyPrice" value="" />&nbsp;</span> <!-- <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>车身级别：</span>
		  	  	<span style="line-height: 35px;width:200px;"><input type="text" id="level" name="level" value="" />&nbsp;</span> --></div>
				</li> <!-- <li>
		  	  <div class="tab_txt01">
		  	  
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>变速箱：</span>
		  	  	<span style="line-height: 35px;width:200px;"><input type="text" id="gearbox" name="gearbox" value="" />&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>能源类型：</span>
		  	  	<span style="line-height: 35px;width:200px;"><select name="energyType" id="energyType">
		  	  	   <option value="">--请选择--</option>
				   <option value="汽油">汽油</option>
				   <option value="纯电动">纯电动</option>
				   <option value="油电混合">油电混合</option>
			    </select>&nbsp;</span>
			    <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>出厂日期：</span>
		  	  	<span style="line-height: 35px;width:200px;"><input type="text" id="leaveFactoryTime" name="leaveFactoryTime" value="" />&nbsp;</span></div>
		   	</li> --> <!-- li><div class="tab_txt01">
		  	  	
		  	  	
			 </div>
		   	</li> -->
					<li><div class="tab_txt01"><span class="td_01" style="width: 120px;"><label class="fc_red">*</label>成本价(元)：</span> <span style="line-height: 35px; width: 200px;">${zp.costprice}&nbsp;</span> <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>销售价(元)：</span> <span
							style="line-height: 35px; width: 200px;"><input type="text" id="sellerprice" name="sellerprice" value="" />&nbsp;</span> <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>结算价(元)：</span> <span style="line-height: 35px; width: 200px;">${zp.settleprice}</span> <span
							class="td_01" style="width: 120px;"><label class="fc_red">*</label>采购商名称：</span> <span style="line-height: 35px; width: 200px;"><input type="text" id="buyName" name="buyName" value="" />&nbsp;</span></div></li>
					<li><div class="tab_txt01"><span class="td_01" style="width: 120px;"><label class="fc_red">*</label>原始地址：</span> <span class="" style="margin-top: 8px; width: 200px;"> <select id="address" name="address" style="width: 159px;">
									<c:forEach var="item" items="${storeLst}">
										<option value="<c:out value="${item.id}"></c:out>" <c:if test="${item.id ==2}">selected="selected"</c:if>><c:out value="${item.name}"></c:out></option>
									</c:forEach>
							</select>
						</span> <%-- <span class="td_01" style="width: 120px;"><label
								class="fc_red">*</label>车辆所在地：</span> <span class=""
								style="margin-top: 8px; width: 200px;"> <select
								id="energyType" name="energyType" style="width: 159px;">
									<c:forEach var="item" items="${shop}">
										<option value="<c:out value="${item.id}"></c:out>"><c:out
												value="${item.name}"></c:out></option>
									</c:forEach>
							</select>
							</span> --%> <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>采购人：</span> <span class="" style="margin-top: 8px; width: 200px;"> <select id="buyerName" name="buyerName " style="width: 159px;"">
									<c:forEach var="item" items="${user}">
										<option value="<c:out value="${item.name}"></c:out>"><c:out value="${item.name}"></c:out></option>
									</c:forEach>
							</select>
						</span> <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>配置：</span> <span style="width: 200px;">${zp.config}&nbsp;</span> <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>备注：</span> <span style="width: 200px;"> <textarea style="" cols="21"
								rows="3" placeholder="" name="decorate" id="decorate" value=""></textarea>&nbsp;
						</span></div></li>
					<li style="width: 20%; float: left;">
						<div class="tab_txt01"><span class="td_01" style="margin-left: 50px"> <img src="" style="width: 100px; height: 100px;" id="productImg1">
						</span></div>
						<div class="tab_txt01" id="divPL"><span class="td_02" style="margin-left: 20px"><label class="fc_red">*</label>关单<br /> <input type="file" name="iden1" id="iden1" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg1')" />&nbsp; </span></div>
				</li>
					<li style="width: 20%; float: left">
						<div class="tab_txt01"><span class="td_01" style="margin-left: 50px"> <img src="" style="width: 100px; height: 100px;" id="productImg2">
						</span></div>
						<div class="tab_txt01" id="divPD"><span class="td_02" style="margin-left: 20px"><label class="fc_red">*</label>商检单<br /> <input type="file" name="iden2" id="iden2" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg2')" />&nbsp; </span></div>
				</li>
					<li style="width: 20%; float: left">
						<div class="tab_txt01"><span class="td_01" style="margin-left: 50px"> <img src="" style="width: 100px; height: 100px;" id="productImg3">
						</span></div>
						<div class="tab_txt01" id="divPD"><span class="td_02" style="margin-left: 20px"><label class="fc_red">*</label>车辆一致性证书(正面)<br /> <input type="file" name="iden3" id="iden3" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg3')" />&nbsp; </span></div>
				</li>
					<li style="width: 20%; float: left">
						<div class="tab_txt01"><span class="td_01" style="margin-left: 50px"> <img src="" style="width: 100px; height: 100px;" id="productImg5">
						</span></div>
						<div class="tab_txt01" id="divPD"><span class="td_02" style="margin-left: 20px">车辆一致性证书(反面)<br /> <input type="file" name="iden5" id="iden5" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg5')" /></span>&nbsp; </span></div>
				</li>
					<li style="width: 20%; float: left">
						<div class="tab_txt01"><span class="td_01" style="margin-left: 50px"> <img src="" style="width: 100px; height: 100px;" id="productImg4">
						</span></div>
						<div class="tab_txt01" id="divPD"><span class="td_02" style="margin-left: 20px">环保清单<br /> <input type="file" name="iden4" id="iden4" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg4')" /></span>&nbsp; </span></div>
				</li></form>
		</ul>
	</div>
		<div class="btnlist">
			<div style="width: 200px; margin: auto; margin-top: 80px;"><a href="javascript:void(0);" class="btn63_01" id="saveBtn">提交审核</a> <a id='backBtn' href="javascript:void(0);" class="btn63_02 margin_let10">返回</a></div>
	</div>
</div>
</div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/biz/typein.js?r=<%=new Date()%>");
</script>
