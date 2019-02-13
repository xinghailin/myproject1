<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/jndapplypay.css" rel="stylesheet">
<input type="hidden" id="njndApplyPayLstIndexUrl"
	value="<ufa:url fieldName="njndApplyPayLstIndex" namespace="car-ms"/>">
<input type="hidden" id="choosepurUrl"
	value="<ufa:url fieldName="njndPurchaseLstForApayIndex" namespace="car-ms"/>">
<input type="hidden" id="searchUrl"
	value="<ufa:url fieldName="choosecontractshow" namespace="car-ms"/>">
<input type="hidden" id="applyaddUrl" value="<ufa:url fieldName="applyadd" namespace="car-ms"/>">
<input type="hidden" id="updateUrl" value="<ufa:url fieldName="updatequery" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">
	<head>
<meta charset="UTF-8">
	</head>
	<body>
		<input type="hidden" id="userCountry" name="userCountry" value="${userCountry }">
		<input type="hidden" id="currpage" value="${currpage}">
		<input type="hidden" id="cid" value="${id}">
		<!--付款申请单id  -->
		<input type="hidden" id="buyid" value="${conpay.buyid}">
		<!--  编辑时采购计划id-->
		<input type="hidden" class="checkval" id="checkval">
		<input type="button" id="ch" style="display: none;">
		<input type="hidden" id="paytype" value="${paytype}">
		<input type="hidden" id="selfbuy" name="selfbuy" value="${conpay.selfbuy }">
		<div class="box">
			<c:choose>
				<c:when test="${conpay.paytype==1&&conpay.cstatus==3}">
					<h2 class="buy-title">付款申请单定金审核不通过编辑(Payment application form deposit review is not approved by the editor)</h2>
				</c:when>
				<c:when test="${conpay.paytype==1&&conpay.cstatus==4}">
					<h2 class="buy-title">付款申请单定金编辑(Payment application form deposit editing)</h2>
				</c:when>
				<c:when test="${conpay.paytype==2&&conpay.cstatus==3}">
					<h2 class="buy-title">付款申请单全款审核不通过编辑(Payment application form is not edited for full payment review)</h2>
				</c:when>
				<c:when test="${conpay.paytype==2&&conpay.cstatus==4}">
					<h2 class="buy-title">付款申请单全款编辑(Edit the payment application form)</h2>
				</c:when>
				<c:when test="${conpay.paytype==3&&conpay.cstatus==3}">
					<h2 class="buy-title">付款申请单尾款审核不通过编辑(Payment request form balance payment is not approved by editing)</h2>
				</c:when>
				<c:when test="${conpay.paytype==3&&conpay.cstatus==4}">
					<h2 class="buy-title">付款申请单尾款编辑(Edit payment request form balance payment)</h2>
				</c:when>
				<c:otherwise>
					<h2 class="buy-title">付款申请单新增(New payment request form)</h2>
				</c:otherwise>
			</c:choose>
			<div class="content">
				<form name="editForm" id="editForm" method="POST"
					action="<ufa:url namespace="car-ms" fieldName="jndapplypaysave"/>">
					<div class="rightbox" style="width: 100%; padding-left: 0px; border-left: 0px;">
						<div class="right" style="padding-top: 5px;">
							<div class="brand">
								<span style="width: 100%; margin-left: 15%;">
									<c:if test="${conpay.paytype!=3 }">
										<a href="javascript:void(0);" id="choseBtn" class="addgoon">选择采购计划(choose purchase
											plan)</a>
									</c:if>
								</span>

							</div>
						</div>
				</form>
			</div>

		</div>
	</body>
</div>
<div class="main_right" id="viewList" style="margin-left: 40px; width: 95%; height: 100%;">
	<div class="rg_list">
		<div class="tb_list"></div>
		<div class="clear"></div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
		</div>
		
		<!-- 当值为1时是自采尾款 -->
	<form name="searchForm" id="searchForm"
					action="<ufa:url fieldName="applyadd" namespace="car-ms"/>" enctype="multipart/form-data"
					method="post">
		<li>
			<div class="tbul02_left02" style="width: 50%">
				<span id="contract" style="color: red; font-family: 新宋体;"> </span>
				<div class="tab_txt01">
					<span class="td_01" style="width: 200px" id="vv">
						<label style="color: red;">*</label>
						<p id="pp" style="float: right;">申请金额(applied amount)：</p>
					</span>
					<span class="td_02" style="margin-top: 4px;">
						<input name="appliedamount" id="appliedamount" class="input_text01 money" type="text" style="width: 180px;">
					</span>
				</div>
			</div>

			<c:if test="${conpay.cstatus==3&&conpay.paytype==3 }">
				<!--尾款  -->
				<div class="tbul02_right02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">审核不通过的理由(Reasons for not passing the audit)：</span>
						<textarea style="margin-left: 10px; resize: none;" cols="45" rows="3" name="cause" id="cause"
							disabled="disabled">${conpay.cause }</textarea>
					</div>
				</div>
			</c:if>
			<c:if test="${conpay.cstatus==3&&conpay.paytype==1 }">
				<!-- 定金 -->
				<div class="tbul02_right02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">审核不通过的理由(Reasons for not passing the audit)：</span>
						<textarea style="margin-left: 10px; resize: none;" cols="45" rows="3" name="cause" id="cause"
							disabled="disabled">${conpay.cause }</textarea>
					</div>
				</div>
			</c:if>
			<c:if test="${conpay.cstatus==3&&conpay.paytype==2 }">
				<!-- 全款 -->
				<div class="tbul02_right02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">审核不通过的理由(Reasons for not passing the audit)：</span>
						<textarea style="margin-left: 10px; resize: none;" cols="45" rows="3" name="cause" id="cause"
							disabled="disabled">${conpay.cause }</textarea>
					</div>
				</div>
			</c:if>
		</li>
		
		<c:if test="${conpay.selfbuy==1&&conpay.paytype==3 }">
			<!-- 自采尾款审核修改 -->
			
			<li style="width: 100%">
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">4s店杂费(4S Shop Charges)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="othercost" id="othercost" class="input_text01 money" type="text"
								value="${conpay.othercost }" style="width: 180px;">&nbsp
						</span>
						<p style="float: left; margin-top: 10px;"></p>
					</div>
				</div>
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 230px;margin-left: -30px;">车辆保险(automobile insurance)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="insurance" id="insurance" class="input_text01 money" type="text"
								value="${conpay.insurance }" style="width: 180px;">&nbsp
						</span>
						<p style="float: left; margin-top: 10px;"></p>
					</div>
				</div>
			</li><br/> 
			 <li style="width: 100%">
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 230px;margin-left:-30px;">改装描述1(config1 description)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="trim1" id="trim1" class="input_text01" type="text" value="${conpay.trim1 }"
								style="width: 180px;">&nbsp
						</span>
					</div>
				</div>
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">加装费1(config1 price)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="t1price" id="t1price" class="input_text01 money" type="text"
								value="${conpay.t1price }" style="width: 180px;">&nbsp
						</span>
						<p style="float: left; margin-top: 10px;"></p>
					</div>
				</div>
			</li> 
			<li style="width: 100%">
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 230px;margin-left:-30px;">改装描述2(config2 description)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="trim2" id="trim2" class="input_text01 " type="text" value="${conpay.trim2 }"
								style="width: 180px;">&nbsp
						</span>
					</div>
				</div>
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">加装费2(config2 price)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="t2price" id="t2price" class="input_text01 money" type="text"
								value="${conpay.t2price }" style="width: 180px;">&nbsp
						</span>
						<p style="float: left; margin-top: 10px;"></p>
					</div>
				</div>
			</li> 
			 <li style="width: 100%">
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 230px;margin-left:-30px;">改装描述3(config3 description)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="trim3" id="trim3" class="input_text01" type="text" value="${conpay.trim3 }"
								style="width: 180px;">&nbsp
						</span>
					</div>
				</div>
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">加装费3(config3 price)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="t3price" id="t3price" class="input_text01 money" type="text"
								value="${conpay.t3price  }" style="width: 180px;">&nbsp
						</span>
						<p style="float: left; margin-top: 10px;"></p>
					</div>
				</div>
			</li> 

			<li style="width: 100%">
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 230px;margin-left:-30px;">改装描述4(config4 description)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="trim4" id="trim4" class="input_text01" type="text" value="${conpay.trim4 }"
								style="width: 180px;">&nbsp
						</span>
					</div>
				</div>
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">加装费4(config4 price)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="t4price" id="t4price" class="input_text01 money" type="text"
								value="${conpay.t4price }" style="width: 180px;">&nbsp
						</span>
						<p style="float: left; margin-top: 10px;"></p>
					</div>
				</div>
			</li> 
			<li style="width: 100%">
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 230px;margin-left:-30px;">改装描述5(config5 description)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="trim5" id="trim5" class="input_text01" type="text" value="${conpay.trim5 }"
								style="width: 180px;">&nbsp
						</span>
					</div>
				</div>
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">加装费5(config5 price)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="t5price" id="t5price" class="input_text01 money" type="text"
								value="${conpay.t5price }" style="width: 180px;">&nbsp
						</span>
						<p style="float: left; margin-top: 10px;"></p>
					</div>
				</div>
			</li> 
		 <li style="width: 100%">
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 230px;margin-left:-30px;">改装描述6(config6 description)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="trim6" id="trim6" class="input_text01" type="text" value="${conpay.trim6 }"
								style="width: 180px;">&nbsp
						</span>
					</div>
				</div>
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">加装费6(config6 price)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="t6price" id="t6price" class="input_text01 money" type="text"
								value="${conpay.t6price }" style="width: 180px;">&nbsp
						</span>
						<p style="float: left; margin-top: 10px;"></p>
					</div>
				</div>
			</li> 
		<li style="width: 100%">
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 230px;margin-left:-30px;">改装描述7(config7 description)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="trim7" id="trim7" class="input_text01 " type="text" value="${conpay.trim7 }"
								style="width: 180px;">&nbsp
						</span>
					</div>
				</div>
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">加装费7(config7 price)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="t7price" id="t7price" class="input_text01 money" type="text"
								value="${conpay.t7price }" style="width: 180px;">&nbsp
						</span>
						<p style="float: left; margin-top: 10px;"></p>
					</div>
				</div>
			</li>
			<li style="width: 100%">
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 230px;margin-left:-30px;">改装描述8(config8 description)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="trim8" id="trim8" class="input_text01" type="text" value="${conpay.trim8 }"
								style="width: 180px;">&nbsp
						</span>
					</div>
				</div>
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">加装费8(config8 price)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="t8price" id="t8price" class="input_text01 money" type="text"
								value="${conpay.t8price }" style="width: 180px;">&nbsp
						</span>
						<p style="float: left; margin-top: 10px;"></p>
					</div>
				</div>
			</li>
			<li style="width: 100%">
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 230px;margin-left:-30px;">改装描述9(config9 description)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="trim9" id="trim9" class="input_text01" type="text" value="${conpay.trim9 }"
								style="width: 180px;">&nbsp
						</span>
					</div>
				</div>
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">加装费9(config9 price)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="t9price" id="t9price" class="input_text01 money" type="text"
								value="${conpay.t9price }" style="width: 180px;">&nbsp
						</span>
						<p style="float: left; margin-top: 10px;"></p>
					</div>
				</div>
			</li>
			<li style="width: 100%">
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 250px;margin-left: -50px;">改装描述10(config10 description)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="trim10" id="trim10" class="input_text01 " type="text" value="${conpay.trim10 }"
								style="width: 180px;">&nbsp
						</span>
					</div>
				</div>
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">加装费10(config10 price)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="t10price" id="t10price" class="input_text01 money" type="text"
								value="${conpay.t10price }" style="width: 180px;">&nbsp
						</span>
						<p style="float: left; margin-top: 10px;"></p>
					</div>
				</div>
			</li>
			<li style="width: 100%">
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 250px;margin-left: -50px;">改装描述11(config11 description)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="trim11" id="trim11" class="input_text01" type="text" value="${conpay.trim11 }"
								style="width: 180px;">&nbsp
						</span>
					</div>
				</div>
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">加装费11(config11 price)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="t11price" id="t11price" class="input_text01 money" type="text"
								value="${conpay.t11price }" style="width: 180px;">&nbsp
						</span>
						<p style="float: left; margin-top: 10px;"></p>
					</div>
				</div>
			</li>
			<li style="width: 100%">
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 250px;margin-left: -50px;">改装描述12(config12 description)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="trim12" id="trim12" class="input_text01" type="text" value="${conpay.trim12 }"
								style="width: 180px;">&nbsp
						</span>
					</div>
				</div>
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">加装费12(config12 price)：</span>
						<span class="td_02" style="margin-top: 10px;">
							<input name="t12price" id="t12price" class="input_text01 money" type="text"
								value="${conpay.t12price }" style="width: 180px;">&nbsp
						</span>
						<p style="float: left; margin-top: 10px;"></p>
					</div>
				</div>
			</li> 
			<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 250px;margin-left: -50px;">4s店杂费文件(4S Shop Charges file)：</span>
							<a href="${contextPath}${conpay.othercosturl }"
								style="text-decoration: underline; margin-top: 10px;display:inline-block; color: #4d90fe;"
								download="${conpay.othercosturl }" title="点击下载(click to download)">4s店杂费文件下载(4S Shop Charges file download)</a>
								<input id="othercosturl1" name="othercosturl1" type="file" style="width: 180px;">
							</span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;">加装费文件(config price file)：</span>
							<a href="${contextPath}${conpay.trimurl }"
								style="text-decoration: underline; margin-top: 10px;display:inline-block; color: #4d90fe;" 
								download="${conpay.trimurl }" title="点击下载(click to download)">加装费文件下载(config price file download)</a>
								<input id="trimurl2" name="trimurl2" type="file" style="width: 180px;">
							</span>
						</div>
					</div>
				</li>
				 <div class="tbul02_left02" style="width:50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 200px;">其他文件(other file)：</span>
						<a href="${contextPath}${conpay.otherurl }"
							style="text-decoration: underline; margin-top: 10px;display:inline-block; color: #4d90fe;"
							download="${conpay.otherurl }" title="点击下载(click to download)">其他文件下载(other file download)</a>
							<input id="otherurl3" name="otherurl3" type="file" style="width: 180px;">
						</span>
					</div>
				</div> 
		</c:if></form>
		<div class="btnlist">
			<div style="width: 400px; margin: auto;">
				<div class="sell-button">
					<c:choose>
						<c:when test="${id!=null}">
							<!--付款申请单id为空时是添加  -->
							<a href="javascript:void(0);" id="savenewBtn1"> 提交(submit) </a>
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0);" id="savenewBtn"> 提交(submit) </a>
						</c:otherwise>
					</c:choose>

					<a href="javascript:void(0);" id="cancelBtn" style="color: #666;">返回(back)</a>
				</div>
			</div>
		</div>
	</div>
</div>
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
			<th style="text-align:center">采购计划编号(purchaseCode)</th>
			<th style="text-align:center">合同编号(contractCode)</th>
			<th style="text-align:center">车辆品牌(brand)</th>
            <th style="text-align:center">车辆型号(model)</th>
            <th style="text-align:center">车辆版别(version)</th>
			<th style="text-align:center">车辆排量(displacement)</th>
			<th style="text-align:center">车价(price)</th>
			<th style="text-align:center">成本价(totalprice)</th>
			<th style="text-align:center">数量(num)</th>
            <th style="text-align:center">加装费用(addCost)</th>
			<th style="text-align:center;">商城合同编号(MallContractNumber)</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
			<td>{{code}}</td>
            <td>{{ccode}}</td>
			<td>{{brand}}</td>
            <td>{{model}}</td>
            <td>{{version}}</td>
            <td>{{displacement}}</td>
 			<td>{{price}}</td>
			<td>{{totalprice}}</td>
			<td>{{num}}</td>
            <td>{{trimprice}}</td>
			<td>{{mallcontractcode}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jndAssetlibrarylist/njndApplyPayAdd.js?r=<%=new Date()%>");
</script>