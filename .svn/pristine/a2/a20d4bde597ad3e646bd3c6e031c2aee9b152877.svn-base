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
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 100%;">
	<div class="rg_list">
		<input type="hidden" id="currency" value="${contract.currency }">
		<c:choose>
			<c:when test="${contract.paytype==1&&contract.cstatus==1}">
				<h2 class="buy-title">付款申请单定金审核</h2>
			</c:when>
			<c:when test="${contract.paytype==2&&contract.cstatus==1}">
				<h2 class="buy-title">付款申请单全款审核</h2>
			</c:when>
			<c:when test="${contract.paytype==3&&contract.cstatus==1}">
				<h2 class="buy-title">付款申请单尾款审核</h2>
			</c:when>
			<c:otherwise>
				<h2 class="buy-title">付款申请单详情查看</h2>
			</c:otherwise>
		</c:choose>

		<div class="clear"></div>
		<li>
			<div class="tbul02_left02" style="width: 50%">
				<div class="tab_txt01">
					<span class="td_01" style="width: 200px">采购计划编号：</span>
					<span class="td_02" style="margin-top: 10px;">${buy.code }&nbsp </span>
				</div>
			</div>
			<div class="tbul02_left02" style="width: 50%">
				<div class="tab_txt01">
					<span class="td_01" style="width: 180px">采购计划名称：</span>
					<span class="td_02" style="display: inline-block; margin-top: 10px; min-width: 200px;">${buy.name }&nbsp
					</span>
				</div>
			</div>
			<input type="hidden" id="id" value="${id }"> <input type="hidden" id="audit" value="2">
			<input type="hidden" id="finals" value="">
			<!--审核查看详情和添加查看详情是一个js 为了查看合同详情返回用  -->
			<!--合同申请单id  -->
			<input type="hidden" id="username" value="${username }"> <input type="hidden"
				id="currpage" value="${currpage }">
		</li>
		<c:choose>
			<c:when test="${contract.paytype==1&&contract.cstatus==1}">
				<!-- 定金审核显示 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">定金：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_right02" style="width: 100%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">审核不通过的理由：</span>
							<textarea style="margin-left: 10px; resize: none;" cols="45" rows="3" name="cause" id="cause"></textarea>
						</div>
					</div>
					<div class="btnlist" style="margin-bottom: 20px;">
						<div style="text-align: center;">
							<a href="javascript:void(0);" id="submit" class="btn63_01">审核通过</a>
							<a href="javascript:void(0);" id="submit1" class="btn63_01">审核不通过</a>
							<a href="javascript:void(0);" id="cancel" class="btn63_02 margin_let10">取消</a>
						</div>
					</div>
				</li>
			</c:when>
			<c:when test="${contract.paytype==2&&contract.cstatus==1}">
				<!-- 全款审核显示 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">全款：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.totalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_right02" style="width: 100%; margin-left: 50px;">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px">审核不通过的理由：</span>
							<textarea style="margin-left: 10px; resize: none;" cols="45" rows="3" name="cause" id="cause"></textarea>
						</div>
					</div>
					<div class="btnlist" style="margin-bottom: 20px;">
						<div style="text-align: center;">
							<a href="javascript:void(0);" id="submit" class="btn63_01">审核通过</a>
							<a href="javascript:void(0);" id="submit1" class="btn63_01">审核不通过</a>
							<a href="javascript:void(0);" id="cancel" class="btn63_02 margin_let10">取消</a>
						</div>
					</div>
				</li>
			</c:when>
			<c:when test="${contract.paytype==3&&contract.cstatus==1&&contract.selfbuy==2}">
				<!-- 带采尾款审核显示 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px">定金：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">尾款：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.finalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_right02" style="width: 100%; margin-left: 50px;">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px">审核不通过的理由:</span>
							<textarea style="margin-left: 10px; resize: none;" cols="45" rows="3" name="cause" id="cause"></textarea>
						</div>
					</div>
					<div class="btnlist" style="margin-bottom: 20px;">
						<div style="text-align: center;">
							<a href="javascript:void(0);" id="submit" class="btn63_01">审核通过</a>
							<a href="javascript:void(0);" id="submit1" class="btn63_01">审核不通过</a>
							<a href="javascript:void(0);" id="cancel" class="btn63_02 margin_let10">取消</a>
						</div>
					</div>
				</li>
			</c:when>
			<c:when test="${contract.paytype==3&&contract.cstatus==1&&contract.selfbuy==1}">
				<!-- 自采尾款审核显示 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px">定金：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">尾款：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.finalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;"><label class="fc_red">*</label>4s店杂费：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.othercost }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">车辆保险：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.insurance }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述1：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim1 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费1：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t1price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述2：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim2 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费2：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t2price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述3：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim3 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费3：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t3price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述4：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim4 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费4：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t4price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述5：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim5 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费5：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t5price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述6：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim6 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费6：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t6price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述7：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim7 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费7：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t7price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述8：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim8 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费8：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t8price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述9：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim9 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t9price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述10：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim10 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费10：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t10price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述11：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim11 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费11：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t11price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述12：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim12 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费12：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t12price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;"><label class="fc_red">*</label>4s店杂费文件：</span>
							<a href="${contextPath}${contract.othercosturl }"
								style="text-decoration: underline; margin-top: 10px;display:inline-block; color: #4d90fe;"
								download="${contract.othercosturl }" title="点击下载">4s店杂费文件下载</a>
							</span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费文件：</span>
							<a href="${contextPath}${contract.trimurl }"
								style="text-decoration: underline; margin-top: 10px;display:inline-block; color: #4d90fe;" 
								download="${contract.trimurl }" title="点击下载">加装费文件下载</a>
							</span>
						</div>
					</div>
				</li>
				<c:if test="${contract.otherurl!=null }">
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 150px; margin-left: 50px;">其他文件：</span>
						<a href="${contextPath}${contract.otherurl }"
							style="text-decoration: underline; margin-top: 10px;display:inline-block; color: #4d90fe;"
							download="${contract.otherurl }" title="点击下载">其他文件下载</a>
						</span>
					</div>
				</div></c:if>
				<div class="tbul02_right02" style="width: 100%; margin-left: 50px;">
					<div class="tab_txt01">
						<span class="td_01" style="width: 150px">审核不通过的理由:</span>
						<textarea style="margin-left: 10px; resize: none;" cols="45" rows="3" name="cause" id="cause"></textarea>
					</div>
				</div>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="text-align: center;">
						<a href="javascript:void(0);" id="submit" class="btn63_01">审核通过</a>
						<a href="javascript:void(0);" id="submit1" class="btn63_01">审核不通过</a>
						<a href="javascript:void(0);" id="cancel" class="btn63_02 margin_let10">取消</a>
					</div>
				</div>

			</c:when>
			<c:when test="${contract.paytype==1&&contract.cstatus==2}">
				<!-- 定金审核通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">定金：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
			</c:when>
			<c:when test="${contract.paytype==1&&contract.cstatus==3}">
				<!-- 定金审核不通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">定金：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_right02" style="width: 100%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">审核不通过的理由：</span>
							<textarea style="margin-left: 10px; resize: none;" cols="45" rows="3" disabled="disabled">${contract.cause }</textarea>
						</div>
					</div>
				</li>
			</c:when>
			<c:when test="${contract.paytype==2&&contract.cstatus==2}">
				<!-- 全款审核通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">全款：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.totalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
			</c:when>
			<c:when test="${contract.paytype==2&&contract.cstatus==3}">
				<!-- 全款审核不通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">全款：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.totalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_right02" style="width: 100%; margin-left: 50px;">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px">审核不通过的理由：</span>
							<textarea style="margin-left: 10px; resize: none;" cols="45" rows="3" disabled="disabled">${contract.cause }</textarea>
						</div>
					</div>
				</li>
			</c:when>
			<c:when test="${contract.paytype==3&&contract.cstatus==2&&contract.selfbuy==2}">
				<!-- 带采尾款审核通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px">定金：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">尾款：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.finalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
			</c:when>
			<c:when test="${contract.paytype==3&&contract.cstatus==2&&contract.selfbuy==1}">
				<!-- 自采尾款审核通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px">定金：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">尾款：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.finalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;"><label class="fc_red">*</label>4s店杂费：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.othercost }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">车辆保险：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.insurance }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">改装描述1：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim1 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费1：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t1price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述2：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim2 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费2：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t2price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述3：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim3 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费3：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t3price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述4：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim4 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费4：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t4price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述5：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim5 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费5：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t5price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述6：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim6 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费6：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t6price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述7：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim7 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费7：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t7price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述8：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim8 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费8：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t8price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述9：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim9 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费9：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t9price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述10：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim10 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费10：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t10price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述11：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim11 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费11：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t11price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述12：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim12 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费12：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t12price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>		
				</li>	<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;"><label class="fc_red">*</label>4s店杂费文件：</span>
							<a href="${contextPath}${contract.othercosturl }"
								style="text-decoration: underline; margin-top: 10px;display:inline-block; color: #4d90fe;"
								download="${contract.othercosturl }" title="点击下载">4s店杂费文件下载</a>
							</span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费文件：</span>
							<a href="${contextPath}${contract.trimurl }"
								style="text-decoration: underline; margin-top: 10px;display:inline-block; color: #4d90fe;" 
								download="${contract.trimurl }" title="点击下载">加装费文件下载</a>
							</span>
						</div>
					</div>
				</li><c:if test="${contract.otherurl!=null }">
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 150px; margin-left: 50px;">其他文件：</span>
						<a href="${contextPath}${contract.otherurl }"
							style="text-decoration: underline; margin-top: 10px;display:inline-block; color: #4d90fe;"
							download="${contract.otherurl }" title="点击下载">其他文件下载</a>
						</span>
					</div>
				</div></c:if>
			</c:when>
			<c:when test="${contract.paytype==3&&contract.cstatus==3&&contract.selfbuy==2}">
				<!-- 带采尾款审核不通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px">定金：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">尾款：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.finalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_right02" style="width: 100%; margin-left: 50px;">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px">审核不通过的理由：</span>
							<textarea style="margin-left: 10px" cols="45" rows="3" disabled="disabled">${contract.cause }
</textarea>
							</span>
						</div>
					</div>
				</li>
			</c:when>
			<c:when test="${contract.paytype==3&&contract.cstatus==3&&contract.selfbuy==1}">
				<!-- 自采尾款审核不通过查看 -->
				<li>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px">定金：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.downpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">尾款：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.finalpay }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;"><label class="fc_red">*</label>4s店杂费：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.othercost }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">车辆保险：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.insurance }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">改装描述1：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim1 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费1：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t1price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述2：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim2 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费2：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t2price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述3：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim3 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费3：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t3price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述4：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim4 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费4：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t4price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述5：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim5 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费5：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t5price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述6：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim6 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t6price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述7：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim7 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费7：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t7price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述8：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim8 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费8：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t8price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述9：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim9 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费9：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t9price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述10：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim10 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费10：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t10price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述11：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim11 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费11：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t11price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>	
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;">加装描述12：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.trim12 }&nbsp </span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费12：</span>
							<span class="td_02" style="margin-top: 10px;">${contract.t12price }&nbsp </span>
							<p style="float: left; margin-top: 10px;"></p>
						</div>
					</div>
				</li>		
				<li style="width: 100%">
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px; margin-left: 50px;"><label class="fc_red">*</label>4s店杂费文件：</span>
							<a href="${contextPath}${contract.othercosturl }"
								style="text-decoration: underline; margin-top: 10px;display:inline-block; color: #4d90fe;"
								download="${contract.othercosturl }" title="点击下载">4s店杂费文件下载</a>
							</span>
						</div>
					</div>
					<div class="tbul02_left02" style="width: 50%">
						<div class="tab_txt01">
							<span class="td_01" style="width: 180px;">加装费文件：</span>
							<a href="${contextPath}${contract.trimurl }"
								style="text-decoration: underline; margin-top: 10px;display:inline-block; color: #4d90fe;" 
								download="${contract.trimurl }" title="点击下载">加装费文件下载</a>
							</span>
						</div>
					</div>
				</li>
				<c:if test="${contract.otherurl!=null }">
				<div class="tbul02_left02" style="width: 50%">
					<div class="tab_txt01">
						<span class="td_01" style="width: 150px; margin-left: 50px;">其他文件：</span>
						<a href="${contextPath}${contract.otherurl }"
							style="text-decoration: underline; margin-top: 10px;display:inline-block; color: #4d90fe;"
							download="${contract.otherurl }" title="点击下载">其他文件下载</a>
						</span>
					</div>
				</div>
				</c:if>
				<div class="tbul02_right02" style="width: 100%; margin-left: 50px;">
					<div class="tab_txt01">
						<span class="td_01" style="width: 150px">审核不通过的理由：</span>
						<textarea style="margin-left: 10px" cols="45" rows="3" disabled="disabled">${contract.cause }
</textarea>
						</span>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<h2 class="buy-title">付款申请单详情查看</h2>
			</c:otherwise>
		</c:choose>


		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg"></div>
		<div class="btnlist" style="margin-bottom: 20px;">
			<div style="text-align: center;">
				<a href="javascript:void(0);" id="back" class="btn63_01">返回</a>
			</div>
		</div>
	</div>
</div>
<script id="dataListTemplate" type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
<th style="text-align:center">采购计划编号</th>
			<th style="text-align:center">合同编号</th>
			<th style="text-align:center">车辆品牌</th>
            <th style="text-align:center">车辆型号</th>
            <th style="text-align:center">车辆版别</th>
			<th style="text-align:center">车辆排量</th>
			<th style="text-align:center">车价</th>
			<th style="text-align:center">成本价</th>
			<th style="text-align:center">数量</th>
			<th style="text-align:center;">商城合同编号</th>
			<th style="text-align:center;word-wrap:break-word;">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{code}}</td>
  			<td>{{ccode}}</td>
  			<td>{{brand}}</td>
  			<td>{{model}}</td>
  			<td>{{version}}</td>
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