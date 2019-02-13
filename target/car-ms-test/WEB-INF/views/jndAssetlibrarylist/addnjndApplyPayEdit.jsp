<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="selectContract" namespace="car-ms"/>">
<input type="hidden" id="updatecontractUrl"
	value="<ufa:url fieldName="updatecontract" namespace="car-ms"/>">
<input type="hidden" id="njndpayapplyauditindexUrl"
	value="<ufa:url fieldName="njndpayapplyauditindex" namespace="car-ms"/>">
<input type="hidden" id="updatecontractNoPassUrl"
	value="<ufa:url fieldName="updatecontractNoPass" namespace="car-ms"/>">
<input type="hidden" id="freightApplyUpdatepageUrl"
	value="<ufa:url fieldName="freightApplyUpdatepage" namespace="car-ms"/>">
<input type="hidden" id="detailsUrl"
	value="<ufa:url fieldName="jndcontractdetails" namespace="car-ms"/>">
<input type="hidden" id="back1Url"
	value="<ufa:url fieldName="njndApplyPayLstIndex" namespace="car-ms"/>">
<input type="hidden" id="finalsubmitUrl"
	value="<ufa:url fieldName="finalsubmit" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">
	<div class="rg_list">
		<input type="hidden" id="currpage" value="${currpage }"> <input type="hidden" id="finals"
			value="${finals}">
		<!--有值代表尾款(final payment)提交进入  -->
		<input type="hidden" id="selfbuy" value="${contract.selfbuy}"> <input type="hidden"
			id="audit" value="1"> <input type="hidden" id="currency" value="${contract.currency }">
		<c:choose>
			<c:when test="${contract.paytype==1&&contract.cstatus==1}">
				<h2 class="buy-title">付款申请单定金审核(Payment application form deposit review)</h2>
			</c:when>
			<c:when test="${contract.paytype==2&&contract.cstatus==1}">
				<h2 class="buy-title">付款申请单全款审核(Review payment application form for full payment)</h2>
			</c:when>
			<c:when test="${contract.paytype==3&&contract.cstatus==1}">
				<h2 class="buy-title">付款申请单尾款审核(Payment request form balance payment review)</h2>
			</c:when>
			<c:otherwise>
				<h2 class="buy-title">付款申请单详情查看(Please check the payment application form for details)</h2>
			</c:otherwise>
		</c:choose>

		<div class="clear"></div>
		<li>
			<div class="tbul02_left02" style="width: 50%">
				<div class="tab_txt01">
					<span class="td_01" style="width: 200px;margin-left: 150px;">采购计划编号(purchase number)：</span>
					<span class="td_02" style="margin-top: 10px;">${buy.code }&nbsp </span>
				</div>
			</div>
			<div class="tbul02_left02" style="width: 50%">
				<div class="tab_txt01">
					<span class="td_01" style="width: 180px;margin-left: 150px;">采购计划名称(purchase name)：</span>
					<span class="td_02" style="margin-top: 10px;">${buy.name }&nbsp </span>
				</div>
			</div>
			<input type="hidden" id="id" value="${id }">
			<!--合同申请单id  -->
			<input type="hidden" id="username" value="${username }">
			<input type="hidden" id="currpage" value="${currpage }">
		</li>

		<!-- 		 * <option value="">--请选择--</option>
<option value="1">定金(down payment)通过</option>
<option value="2">定金(down payment)不通过</option>//cstatus 1 审核中 2 审核通过 3 审核不通过 4撤销
<option value="3">定金(down payment)审核中</option> paytype 付款类型1 定金(down payment) 2全款(full payment) 3尾款(final payment)
<option value="4">定金(down payment)已撤销</option>
<option value="5">尾款(final payment)通过</option>
<option value="6">尾款(final payment)不通过</option>
<option value="7">尾款(final payment)审核中</option> contract buy
<option value="8">尾款(final payment)已撤销</option>
<option value="9">全款(full payment)通过</option>
<option value="10">全款(full payment)不通过</option>
<option value="11">全款(full payment)审核中</option>
<option value="12">全款(full payment)已撤销</option>
			 */ -->
			 <form name="searchForm" id="searchForm"
					action="<ufa:url fieldName="addleasebacksave" namespace="car-ms"/>"
					enctype="multipart/form-data" method="post">
		<c:choose>
			<c:when test="${contract.paytype==1&&contract.cstatus==1}">
				<!-- 定金(down payment)审核显示 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">定金(down payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>

				</li>
			</c:when>
			<c:when test="${contract.paytype==1&&contract.cstatus==4}">
				<!-- 定金(down payment)撤销显示 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">定金(down payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>

				</li>
			</c:when>
			<c:when test="${contract.paytype==2&&contract.cstatus==1}">
				<!-- 全款(full payment)审核显示 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 50px;">全款(full payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.totalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>

				</li>
			</c:when>
			<c:when test="${contract.paytype==2&&contract.cstatus==4}">
				<!-- 全款(full payment)撤销显示 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 50px;">全款(full payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.totalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>

				</li>
			</c:when>
			<c:when test="${contract.paytype==3&&contract.cstatus==1&&contract.selfbuy==2}">
				<!-- 代采尾款(final payment)审核显示 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;">定金(down payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">尾款(final payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.finalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>

				</li>
			</c:when>
			<c:when test="${contract.paytype==3&&contract.cstatus==1&&contract.selfbuy==1}">
				<!-- 自采尾款(final payment)审核显示 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;margin-left: 150px;">定金(down payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">尾款(final payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.finalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">4s店杂费(4S Shop Charges)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.othercost }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">车辆保险(Vehicle Insurance)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.insurance }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">改装描述1(config1 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim1 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费1(config1 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t1price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述2(config2 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim2 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费2(config2 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t2price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述3(config3 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim3 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费3(config3 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t3price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述4(config4 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim4 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费4(config4 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t4price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述5(config5 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim5 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费5(config5 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t5price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述6(config6 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim6 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费6(config6 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t6price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述7(config7 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim7 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费7(config7 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t7price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述8(config8 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim8 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费8(config8 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t8price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述9(config9 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim9 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费9(config9 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t9price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述10(config10 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim10 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费10(config10 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t10price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述11(config11 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim11 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费11(config11 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t11price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述12(config12 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim12 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费12(config12 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t12price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">4s店杂费文件(4S Shop Charges file)：</span>
							<a href="${contextPath}${contract.othercosturl }" download="${contract.othercosturl }"
								style="text-decoration: underline; margin-top: 10px; display: inline-block; color: #4d90fe;"
								title="点击下载(click to download)">4s店杂费文件下载(4S Shop Charges file download)</a>
							</span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 230px;margin-left: 100px;">加装费文件(Additional fee documents)：</span>
							<a href="${contextPath}${contract.trimurl }" download="${contract.trimurl }"
								style="text-decoration: underline; margin-top: 10px; display: inline-block; color: #4d90fe;"
								title="点击下载(click to download)">加装费文件下载(Download additional fee files)</a>
							</span>
						</div>
					</div>
				</li>
				<c:if test="${contract.otherurl!=null }">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">其他文件(other file)：</span>
							<a href="${contextPath}${contract.otherurl }" download="${contract.otherurl }"
								style="text-decoration: underline; margin-top: 10px; display: inline-block; color: #4d90fe;"
								title="点击下载(click to download)">其他文件下载(other file download)</a>
							</span>
						</div>
					</div>
				</c:if>
			</c:when>
			<c:when test="${contract.paytype==3&&contract.cstatus==4&&contract.selfbuy==2}">
				<!-- 代采尾款(final payment)撤销显示 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px">定金(down payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">尾款(final payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.finalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>

				</li>
			</c:when>
			<c:when test="${contract.paytype==3&&contract.cstatus==4&&contract.selfbuy==1}">
				<!-- 自采尾款(final payment)撤销显示 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;margin-left: 150px;">定金(down payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">尾款(final payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.finalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">4s店杂费(4S Shop Charges)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.othercost }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">车辆保险(Vehicle Insurance)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.insurance }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">改装描述1(config1 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim1 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费1(config1 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t1price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述2(config2 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim2 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费2(config2 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t2price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述3(config3 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim3 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费3(config3 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t3price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述4(config4 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim4 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费4(config4 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t4price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述5(config5 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim5 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费5(config5 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t5price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述6(config6 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim6 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费6(config6 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t6price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述7(config7 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim7 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费7(config7 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t7price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述8(config8 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim8 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费8(config8 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t8price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述9(config9 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim9 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费9(config9 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t9price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述10(config10 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim10 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费10(config10 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t10price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述11(config11 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim11 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费11(config11 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t11price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述12(config12 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim12 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费12(config12 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t12price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">4s店杂费文件(4S Shop Charges file)：</span>
							<a href="${contextPath}${contract.othercosturl }" download="${contract.othercosturl }"
								style="text-decoration: underline; margin-top: 10px; display: inline-block; color: #4d90fe;"
								title="点击下载(click to download)">4s店杂费文件下载(4S Shop Charges file download)</a>
							</span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 230px;margin-left: 100px;">加装费文件(Additional fee documents)：</span>
							<a href="${contextPath}${contract.trimurl }" download="${contract.trimurl }"
								style="text-decoration: underline; margin-top: 10px; display: inline-block; color: #4d90fe;"
								title="点击下载(click to download)">加装费文件下载(Download additional fee files)</a>
							</span>
						</div>
					</div>
				</li>
				<c:if test="${contract.otherurl!=null }">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">其他文件(other file)：</span>
							<a href="${contextPath}${contract.otherurl }" download="${contract.otherurl }"
								style="text-decoration: underline; margin-top: 10px; display: inline-block; color: #4d90fe;"
								title="点击下载(click to download)">其他文件下载(other file download)</a>
							</span>
						</div>
					</div>
				</c:if>
			</c:when>
			<c:when test="${contract.paytype==1&&contract.cstatus==2&&finals==null}">
				<!-- 定金(down payment)审核通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">定金(down payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
			</c:when>
			<c:when test="${contract.paytype==1&&contract.cstatus==2&&finals==1&&contract.selfbuy==1}">
				<!-- 自采尾款(final payment)提交申请显示 -->
					<li>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left:70px;">定金(down payment)：</span>
								<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
								<p style="float: left; margin-top: 10px;"></p>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 50px; color: red;">尾款(final payment)：</span>
								<span class="td_02" style="margin-top: 10px;">${contract.cfinalpay }&nbsp </span>
								<p style="float: left; margin-top: 10px;"></p>
							</div>
						</div>
						</li>
						<li>
						<div class="tbul02_left02" style="width:100%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 300px; margin-left: 50px;">尾款申请金额(Balance payment application amount)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="finalpay" id="finalpay" class="input_text01" type="text" style="width: 180px;">
								</span>
								<p style="float: left; margin-top: 15px;"></p>
							</div>
						</div>
					</li><br/>
					<li style="width: 100%">
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 70px;">4s店杂费(4S Shop Charges)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="othercost" id="othercost" class="input_text01 money" type="text"
										style="width: 180px;">
								</span>
								<p style="float: left; margin-top: 15px;"></p>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 50px;">车辆保险(Vehicle Insurance)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="insurance" id="insurance" class="input_text01 money" type="text"
										style="width: 180px;">
								</span>
								<p style="float: left; margin-top: 15px;"></p>
							</div>
						</div>
					</li>
					<li style="width: 100%">
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 70px;">改装描述1(config1 description)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="trim1" id="trim1" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 50px;">加装费1(config1 price)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="t1price" id="t1price" class="input_text01 money" type="text" style="width: 180px;">
								</span>
								<p style="float: left; margin-top: 15px;"></p>
							</div>
						</div>
					</li>
					<li style="width: 100%">
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述2(config2 description)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="trim2" id="trim2" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 50px;">加装费2(config2 price)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="t2price" id="t2price" class="input_text01 money" type="text" style="width: 180px;">
								</span>
								<p style="float: left; margin-top: 15px;"></p>
							</div>
						</div>
					</li>
					<li style="width: 100%">
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述3(config3 description)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="trim3" id="trim3" class="input_text01 " type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 50px;">加装费3(config3 price)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="t3price" id="t3price" class="input_text01 money" type="text" style="width: 180px;">
								</span>
								<p style="float: left; margin-top: 15px;"></p>
							</div>
						</div>
					</li>
					<li style="width: 100%">
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left:70px;">加装描述4(config4 description)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="trim4" id="trim4" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 50px;">加装费4(config4 price)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="t4price" id="t4price" class="input_text01 money" type="text" style="width: 180px;">
								</span>
								<p style="float: left; margin-top: 15px;"></p>
							</div>
						</div>
					</li>
					<li style="width: 100%">
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left:70px;">加装描述5(config5 description)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="trim5" id="trim5" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 50px;">加装费5(config5 price)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="t5price" id="t5price" class="input_text01 money" type="text" style="width: 180px;">
								</span>
								<p style="float: left; margin-top: 15px;"></p>
							</div>
						</div>
					</li>
					<li style="width: 100%">
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述6(config6 description)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="trim6" id="trim6" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 50px;">加装费6(config6 price)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="t6price" id="t6price" class="input_text01 money" type="text" style="width: 180px;">
								</span>
								<p style="float: left; margin-top: 15px;"></p>
							</div>
						</div>
					</li>
					<li style="width: 100%">
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述7(config7 description)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="trim7" id="trim7" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 50px;">加装费7(config7 price)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="t7price" id="t7price" class="input_text01 money" type="text" style="width: 180px;">
								</span>
								<p style="float: left; margin-top: 15px;"></p>
							</div>
						</div>
					</li>
					<li style="width: 100%">
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述8(config8 description)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="trim8" id="trim8" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 50px;">加装费8(config8 price)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="t8price" id="t8price" class="input_text01 money" type="text" style="width: 180px;">
								</span>
								<p style="float: left; margin-top: 15px;"></p>
							</div>
						</div>
					</li>
					<li style="width: 100%">
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述9(config9 description)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="trim9" id="trim9" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 50px;">加装费9(config9 price)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="t9price" id="t9price" class="input_text01 money" type="text" style="width: 180px;">
								</span>
								<p style="float: left; margin-top: 15px;"></p>
							</div>
						</div>
					</li>
					<li style="width: 100%">
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述10(config10 description)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="trim10" id="trim10" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 50px;">加装费10(config10 price)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="t10price" id="t10price" class="input_text01 money" type="text" style="width: 180px;">
								</span>
								<p style="float: left; margin-top: 15px;"></p>
							</div>
						</div>
					</li>
					<li style="width: 100%">
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述11(config11 description)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="trim11" id="trim11" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 50px;">加装费11(config11 price)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="t11price" id="t11price" class="input_text01 money" type="text" style="width: 180px;">
								</span>
								<p style="float: left; margin-top: 15px;"></p>
							</div>
						</div>
					</li>
					<li style="width: 100%">
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述12(config12 description)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="trim12" id="trim12" class="input_text01" type="text" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 50px;">加装费12(config12 price)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="t12price" id="t12price" class="input_text01 money" type="text" style="width: 180px;">
								</span>
								<p style="float: left; margin-top: 15px;"></p>
							</div>
						</div>
					</li>
					<li style="width: 100%">
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 300px; margin-left: 50px;">4s店杂费明细文件(4S Shop Charges detail file)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input id="othercosturl1" name="othercosturl1" type="file" style="width: 180px;">
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 50px;">加装明细文件(config detail file)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input id="trimurl2" name="trimurl2" type="file" style="width: 180px;">
								</span>
							</div>
						</div>
					</li>
					<li style="width: 100%">
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 300px; margin-left: 50px;">其他费用明细文件(Other expense details file)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input id="otherurl3" name="otherurl3" type="file" style="width: 180px;">
								</span>
							</div>
						</div>

					</li>
				
			</c:when>
			<c:when test="${contract.paytype==1&&contract.cstatus==2&&finals==1&&contract.selfbuy==2}">
				<!-- 代采尾款(final payment)提交申请显示 -->
				
					<li>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 70px;">定金(down payment)：</span>
								<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
								<p style="float: left; margin-top: 10px;"></p>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 280px; margin-left: 70px; color: red;">尾款(final payment)：</span>
								<span class="td_02" style="margin-top: 10px;">${contract.cfinalpay }&nbsp </span>
								<p style="float: left; margin-top: 10px;"></p>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 300px; margin-left: 50px;">尾款申请金额(Balance payment application amount)：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input name="finalpay" id="finalpay" class="input_text01" type="text" style="width: 180px;">
								</span>
								<p style="float: left; margin-top: 15px;"></p>
							</div>
						</div>
					</li>
				
			</c:when>
			<c:when test="${contract.paytype==1&&contract.cstatus==3&&contract.selfbuy==2}">
				<!-- 代采定金(down payment)审核不通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">定金(down payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_right02" style="width: 100%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 50px;">审核不通过的理由(Reasons for not passing the audit)：</span>
							<textarea style="margin-left: 10px; resize: none;" cols="45" rows="3" disabled="disabled">${contract.cause }</textarea>
						</div>
					</div>
				</li>
			</c:when>
			<c:when test="${contract.paytype==1&&contract.cstatus==3&&contract.selfbuy==1}">
				<!-- 自采定金(down payment)审核不通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">定金(down payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_right02" style="width: 100%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 300px; margin-left: 50px;">审核不通过的理由(Reasons for not passing the audit)：</span>
							<textarea style="margin-left: 10px; resize: none;" cols="45" rows="3" disabled="disabled">${contract.cause }</textarea>
						</div>
					</div>
				</li>
			</c:when>
			<c:when test="${contract.paytype==2&&contract.cstatus==2}">
				<!-- 全款(full payment)审核通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 50px;">全款(full payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.totalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
			</c:when>

			<c:when test="${contract.paytype==2&&contract.cstatus==3}">
				<!-- 全款(full payment)审核不通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 50px;">全款(full payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.totalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_right02" style="width: 100%; margin-left: 50px;">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px">审核不通过的理由(Reasons for not passing the audit)：</span>
							<textarea style="margin-left: 10px; resize: none;" cols="45" rows="3" disabled="disabled">${contract.cause }</textarea>
						</div>
					</div>
				</li>
			</c:when>
			<c:when test="${contract.paytype==3&&contract.cstatus==2&&contract.selfbuy==2}">
				<!-- 代采尾款(final payment)审核通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;margin-left: 150px;">定金(down payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">尾款(final payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.finalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
			</c:when>
			<c:when test="${contract.paytype==3&&contract.cstatus==2&&contract.selfbuy==1}">
				<!-- 自采尾款(final payment)审核通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;margin-left: 150px;">定金(down payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">尾款(final payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.finalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">4s店杂费(4S Shop Charges)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.othercost }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">车辆保险(Vehicle Insurance)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.insurance }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">改装描述1(config1 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim1 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费1(config1 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t1price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述2(config2 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim2 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费2(config2 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t2price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述3(config3 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim3 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费3(config3 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t3price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述4(config4 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim4 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费4(config4 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t4price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述5(config5 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim5 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费5(config5 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t5price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述6(config6 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim6 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费6(config6 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t6price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述7(config7 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim7 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费7(config7 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t7price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述8(config8 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim8 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费8(config8 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t8price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述9(config9 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim9 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费9(config9 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t9price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述10(config10 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim10 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费10(config10 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t10price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述11(config11 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim11 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费11(config11 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t11price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述12(config12 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim12 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费12(config12 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t12price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">4s店杂费文件(4S Shop Charges file)：</span>
							<a href="${contextPath}${contract.othercosturl }" download="${contract.othercosturl }"
								style="text-decoration: underline; margin-top: 10px; display: inline-block; color: #4d90fe;"
								title="点击下载(click to download)">4s店杂费文件下载(4S Shop Charges file download)</a>
							</span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 230px;margin-left: 100px;">加装费文件(Additional fee documents)：</span>
							<a href="${contextPath}${contract.trimurl }" download="${contract.trimurl }"
								style="text-decoration: underline; margin-top: 10px; display: inline-block; color: #4d90fe;"
								title="点击下载(click to download)">加装费文件下载(Download additional fee files)</a>
							</span>
						</div>
					</div>
				</li>
				<c:if test="${contract.otherurl!=null }">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">其他文件(other file)：</span>
							<a href="${contextPath}${contract.otherurl }" download="${contract.otherurl }"
								style="text-decoration: underline; margin-top: 10px; display: inline-block; color: #4d90fe;"
								title="点击下载(click to download)">其他文件下载(other file download)</a>
							</span>
						</div>
					</div>
				</c:if>
			</c:when>
			<c:when test="${contract.paytype==3&&contract.cstatus==3&&contract.selfbuy==2}">
				<!-- 代采尾款(final payment)审核不通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px">定金(down payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;">尾款(final payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.finalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_right02" style="width: 100%; margin-left: 50px;">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px">审核不通过的理由(Reasons for not passing the audit)：</span>
							<textarea style="margin-left: 10px" cols="45" rows="3" disabled="disabled">${contract.cause }
</textarea>
							</span>
						</div>
					</div>
				</li>
			</c:when>
			<c:when test="${contract.paytype==3&&contract.cstatus==3&&contract.selfbuy==1}">
				<!-- 自采尾款(final payment)审核不通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;margin-left: 150px;">定金(down payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">尾款(final payment)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.finalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">4s店杂费(4S Shop Charges)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.othercost }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">车辆保险(Vehicle Insurance)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.insurance }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">改装描述1(config1 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim1 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费1(config1 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t1price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述2(config2 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim2 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费2(config2 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t2price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述3(config3 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim3 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费3(config3 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t3price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述4(config4 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim4 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费4(config4 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t4price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述5(config5 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim5 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费5(config5 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t5price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述6(config6 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim6 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费6(config6 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t6price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述7(config7 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim7 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费7(config7 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t7price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述8(config8 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim8 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费8(config8 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t8price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述9(config9 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim9 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费9(config9 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t9price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述10(config10 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim10 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费10(config10 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t10price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述11(config11 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim11 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费11(config11 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t11price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">加装描述12(config12 description)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim12 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;margin-left: 150px;">加装费12(config12 price)：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t12price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">4s店杂费文件(4S Shop Charges file)：</span>
							<a href="${contextPath}${contract.othercosturl }" download="${contract.othercosturl }"
								style="text-decoration: underline; margin-top: 10px; display: inline-block; color: #4d90fe;"
								title="点击下载(click to download)">4s店杂费文件下载(4S Shop Charges file download)</a>
							</span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 230px;margin-left: 100px;">加装费文件(Additional fee documents)：</span>
							<a href="${contextPath}${contract.trimurl }" download="${contract.trimurl }"
								style="text-decoration: underline; margin-top: 10px; display: inline-block; color: #4d90fe;"
								title="点击下载(click to download)">加装费文件下载(Download additional fee files)</a>
							</span>
						</div>
					</div>
				</li>
				<c:if test="${contract.otherurl!=null }">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px; margin-left: 70px;">其他文件(other file)：</span>
							<a href="${contextPath}${contract.otherurl }" download="${contract.otherurl }"
								style="text-decoration: underline; margin-top: 10px; display: inline-block; color: #4d90fe;"
								title="点击下载(click to download)">其他文件下载(other file download)</a>
							</span>
						</div>
					</div>
				</c:if>
				<div class="tbul02_right02" style="width: 100%; margin-left: 50px;">
					<div class="tab_txt01">
						<span class="td_01" style="width: 300px">审核不通过的理由(Reasons for not passing the audit)：</span>
						<textarea style="margin-left: 10px" cols="45" rows="3" disabled="disabled">${contract.cause }
</textarea>
						</span>
					</div>
				</div>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		</form>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg"></div>
		<div class="btnlist" style="margin-bottom: 20px;">
			<div style="text-align: center;">
				<c:if test="${finals==1 }">
					<!-- 修改或尾款(final payment)提交保存使用 -->
					<a href="javascript:void(0);" id="submit3" class="btn63_01">提交(submit)</a>
				</c:if>
				<a href="javascript:void(0);" id="back1" class="btn63_01">返回(back)</a>
			</div>
		</div>
	</div>
</div>
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">采购计划编号(purchaseCode)</th>
			<th style="text-align:center">合同编号(contractCode)</th>
			<th style="text-align:center">车辆品牌(brand)</th>
            <th style="text-align:center">车辆型号(model)</th>
            <th style="text-align:center">车辆版别(version)</th>
			<th style="text-align:center">车辆排量(displacement)</th>
			<th style="text-align:center">车价(price)</th>
			<th style="text-align:center">成本价(totalprice)</th>
			<th style="text-align:center">数量(num)</th>
			<th style="text-align:center;">商城合同编号(MallContractNumber)</th>
			<th style="text-align:center;word-wrap:break-word;">操作(operate)</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{code}}</td>
  			<td>{{ccode}}</td>
  			<td>{{brand}}</td>
  			<td>{{model}}</td>
  			<td>{{vin}}</td>
  			<td>{{displacement}}</td>
  			<td>{{price}}</td>
			<td>{{totalprice}}</td>
			<td>{{num}}</td>
			<td>{{mallcontractcode}}</td>
  			<td>{{_operate id}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
	seajs.use("${scriptBasePath}/jndAssetlibrarylist/njndApplyPayEdit.js?v=<%=new Date()%>");
</script>