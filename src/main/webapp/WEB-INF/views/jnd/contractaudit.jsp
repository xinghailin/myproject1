<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/jndapplypay.css" rel="stylesheet">
<input type="hidden" id="indexUrl" value="<ufa:url fieldName="jndcontractindex" namespace="car-ms"/>">
<input type="hidden" id="auditUrl" value="<ufa:url fieldName="jndPurchaseLstForContractIndex" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;"><head>
    <meta charset="UTF-8">
    <title>合同<c:if test="${node == 1}">采购</c:if><c:if test="${node == 2}">法务</c:if><c:if test="${node == 3}">财务</c:if>审核</title>
</head>
<body>
<div class="box">
    <h2 class="buy-title">合同<c:if test="${node == 1}">采购</c:if><c:if test="${node == 2}">法务</c:if><c:if test="${node == 3}">财务</c:if>审核</h2>
    <div class="content">
        <form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="jndContractauditdo"/>">
        <input type="hidden" name="id" id="idkey" value="${con.id}">
        <input type="hidden" name="node" id="node" value="${node}">
        <input type="hidden" name="type" id="type" value="">
        <input type="hidden" id="currpage" name="currpage" value="${currpage}">
        <div class="rightbox" style="width: 100%;padding-left: 0px;border-left:0px;">
            <div class="right-title">
                <p><span>
                    <i>合同编号:</i>
                <i>(contract code)</i>
                </span><span>${con.code}</span>
                </p>
                <p>
                <span>
                    <i><label class="fc_red">*</label>采购文件下载:</i>
                    <i>(purchase file download)</i>
                </span><a href="${contextPath}${con.purfile}" download="${con.purfilename}" style="text-decoration: underline;margin-left: 10px;color: #4d90fe;" title="点击下载">${con.purfilename}</a>
                </p>
                <p style="width: 80%;">
                <span>
                    <i><label class="fc_red">*</label>合同文件下载:</i>
                    <i>(contract file download)</i>
                </span><a href="${contextPath}${con.texturl}" download="${con.texturlname}" style="text-decoration: underline;margin-left: 10px;color: #4d90fe;" title="点击下载">${con.texturlname}</a>
                </p>
            </div>
            <div class="right" style="padding-top: 5px;">
                <div class="detail">
                    <div>
                     <span>
                        <i>采购计划编号：</i>
                        <i>(purchase number)</i>
                    </span>
                    <span>${con.purchaseCode}</span>   
                    </div><div><span>
                        <i>采购计划名称：</i>
                        <i>(purchase name)</i>
                    </span>
                    <span>${con.purchaseName}</span>
                </div>
                </div>
                <div class="detail">
					<div><span> <i>主动采购方：</i> <i>(Active Purchaser)</i>
					</span> <span>${con.needer == '中国采购' ? '中国采购(China Sourcing)': con.needer == '海外采购' ? '海外采购(Overseas Sourcing)':con.needer == '商城采购' ? '商城采购(Online-Stores Sourcing)':''  }</span></div>
				</div><div style="font-weight:bold;margin-top: 5px;margin-bottom: 5px;">基本信息(Basic Information)</div>
                <div class="detail">
                    <div>
                         <span>
                            <i><label class="fc_red">*</label>供应方名称：</i>
                            <i>(Agent Name)</i>
                        </span><span>${con.sname}</span>
                    </div><div>
                         <span>
                            <i>供应方地址：</i>
                            <i>(Agent address)</i>
                        </span><span>${con.sadd}</span>
                    </div>
                    
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i><label class="fc_red">*</label>证件类型：</i>
                            <i>(ID Type)</i>
                        </span><span>${con.sidtype}</span>
                    </div><div>
                         <span>
                            <i><label class="fc_red">*</label>证件号：</i>
                            <i>(ID No)</i>
                        </span><span>${con.sno}</span>
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>联系方式：</i>
                            <i>(Contact Phone No)</i>
                        </span><span>${con.sphone}</span>
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i><label class="fc_red">*</label>采购方名称：</i>
                            <i>(Purchaser name)</i>
                        </span><span>${con.pname}</span>
                    </div><div>
                         <span>
                            <i><label class="fc_red">*</label>采购方地址：</i>
                            <i>(Purchaser address)</i>
                        </span><span>${con.padd}</span>
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i><label class="fc_red">*</label>证件类型：</i>
                            <i>(ID Type)</i>
                        </span><span>${con.pidtype}</span>
                    </div><div>
                         <span>
                            <i><label class="fc_red">*</label>证件号：</i>
                            <i>(ID No)</i>
                        </span><span>${con.pno}</span>
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>联系方式：</i>
                            <i>(Contact Phone No)</i>
                        </span><span>${con.pphone}</span>
                    </div>
                </div><div style="font-weight:bold;margin-top: 5px;margin-bottom: 5px;">车辆描述(Vehicle Description)</div>
                <div class="detail">
                <div><span>
                        <i><label class="fc_red">*</label>品牌:</i>
                        <i>(brand)</i>
                    </span><span>${con.brand}</span>
                </div><div>
                    <span>
                        <i><label class="fc_red">*</label>型号:</i>
                        <i>(model)</i>
                    </span><span>${con.model}</span></div></div><div class="detail"><div><span>
                        <i>版别:</i>
                        <i>(version)</i>
                    </span><span>${con.version}</span>
                </div><div><span>
                        <i>排量:</i>
                        <i>(displacement)</i>
                    </span><span>${con.displacement}</span>
                </div></div>
                <div class="info">
                    <div class="set">
                        <span>
                            <i><label class="fc_red">*</label>配置：</i>
                            <i>(Configuration)</i>
                        </span><span>${con.config}</span>
                    </div>
                    <div class="color">
                        <div>
                            <span>
                            <i><label class="fc_red">*</label>外观颜色：</i>
                            <i>(Exterior Color)</i>
                            </span><span>${con.outcolor}</span>
                        </div>
                        <div>
                            <span>
                            <i><label class="fc_red">*</label>内饰颜色：</i>
                            <i>(Interior Color)</i>
                        </span><span>${con.incolor}</span>
                        </div>
                    </div>
                </div><div class="detail"><div>
                     <span>
                        <i>改装:</i>
                        <i>(Trim)</i>
                    </span><span>${con.trim}</span></div>
                    <div>
                    <span>
                            <i><label class="fc_red">*</label>数量：</i>
                            <i>(amount)</i>
                        </span><span>${con.num}</span></div>
                </div><div class="detail">
                <div><c:if test="${con.currency eq 1}"><c:set var="curr" value="加币(CAD)" /></c:if><c:if test="${con.currency eq 2}"><c:set var="curr" value="美元($)" /></c:if>
                    <span>
                        <i><label class="fc_red">*</label>价格:</i>
                        <i>(Price)</i>
                    </span><span>${con.price}${curr}</span>
                </div></div>
                <div class="detail">
                    <div>
                         <span>
                            <i>货物运送地点：</i>
                            <i>(delivery address)</i>
                        </span>
                   <select id="apponitadd" name="apponitadd" disabled="disabled">
                   <c:forEach var="ite" items="${stores}">
		             <option value="<c:out value="${ite.id}"></c:out>" <c:if test="${ite.id eq con.apponitadd}">selected="selected"</c:if>><c:out value="${ite.name}"></c:out></option>
		           </c:forEach>
                   </select>
                    </div><div>
                         <span>
                            <i><label class="fc_red">*</label>约定入库时间：</i>
                            <i>(Scheduled delivery)</i>
                        </span><span><fmt:formatDate pattern="yyyy-MM-dd" value="${con.appointtime}"/></span>
                    </div>
                </div>
                <div class="detail">
                    <div>
                          <span>
                            <i>运输方名称：</i>
                            <i>(Shipping name)</i>
                        </span><span>${con.transname}</span>
                    </div><div>
                          <span>
                            <i>运输费用：</i>
                            <i>(Shipping Fee)</i>
                        </span><span>${con.transprice}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                          <span>
                            <i>4S店杂费：</i>
                            <i>(4S Shop Charges)</i>
                        </span><span>${con.othercost}${curr}</span>
                    </div><div>
                          <span>
                            <i>消费税：</i>
                            <i>(Consumption Tax)</i>
                        </span><span>${con.expensetax}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                        <span>
                            <i>保险：</i>
                            <i>(Insurance)</i>
                        </span><span>${con.insurance}${curr}</span>
                    </div><div>
                         <span>
                            <i>总加装费：</i>
                            <i>(Total Configuration Price)</i>
                        </span><span>${con.trimprice}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述1：</i>
                            <i>(config1 description)</i>
                        </span><span>${con.trim1}</span>
                    </div><div>
                         <span>
                            <i>加装费1：</i>
                            <i>(config1 price)</i>
                        </span><span>${con.t1price}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述2：</i>
                            <i>(config2 description)</i>
                        </span><span>${con.trim2}</span>
                    </div><div>
                         <span>
                            <i>加装费2：</i>
                            <i>(config2 price)</i>
                        </span><span>${con.t2price}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述3：</i>
                            <i>(config3 description)</i>
                        </span><span>${con.trim3}</span>
                    </div><div>
                         <span>
                            <i>加装费3：</i>
                            <i>(config3 price)</i>
                        </span><span>${con.t3price}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述4：</i>
                            <i>(config4 description)</i>
                        </span><span>${con.trim4}</span>
                    </div><div>
                         <span>
                            <i>加装费4：</i>
                            <i>(config4 price)</i>
                        </span><span>${con.t4price}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述5：</i>
                            <i>(config5 description)</i>
                        </span><span>${con.trim5}</span>
                    </div><div>
                         <span>
                            <i>加装费5：</i>
                            <i>(config5 price)</i>
                        </span><span>${con.t5price}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述6：</i>
                            <i>(config6 description)</i>
                        </span><span>${con.trim6}</span>
                    </div><div>
                         <span>
                            <i>加装费6：</i>
                            <i>(config6 price)</i>
                        </span><span>${con.t6price}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述7：</i>
                            <i>(config7 description)</i>
                        </span><span>${con.trim7}</span>
                    </div><div>
                         <span>
                            <i>加装费7：</i>
                            <i>(config7 price)</i>
                        </span><span>${con.t7price}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述8：</i>
                            <i>(config8 description)</i>
                        </span><span>${con.trim8}</span>
                    </div><div>
                         <span>
                            <i>加装费8：</i>
                            <i>(config8 price)</i>
                        </span><span>${con.t8price}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述9：</i>
                            <i>(config9 description)</i>
                        </span><span>${con.trim9}</span>
                    </div><div>
                         <span>
                            <i>加装费9：</i>
                            <i>(config9 price)</i>
                        </span><span>${con.t9price}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述10：</i>
                            <i>(config10 description)</i>
                        </span><span>${con.trim10}</span>
                    </div><div>
                         <span>
                            <i>加装费10：</i>
                            <i>(config10 price)</i>
                        </span><span>${con.t10price}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述11：</i>
                            <i>(config11 description)</i>
                        </span><span>${con.trim11}</span>
                    </div><div>
                         <span>
                            <i>加装费11：</i>
                            <i>(config11 price)</i>
                        </span><span>${con.t11price}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述12：</i>
                            <i>(config12 description)</i>
                        </span><span>${con.trim12}</span>
                    </div><div>
                         <span>
                            <i>加装费12：</i>
                            <i>(config12 price)</i>
                        </span><span>${con.t12price}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金1：</i>
                            <i>(commission1)</i>
                        </span><span>${con.cmsn1}${curr}</span>
                    </div><div>
                         <span>
                            <i>佣金2：</i>
                            <i>(commission2)</i>
                        </span><span>${con.cmsn2}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金3：</i>
                            <i>(commission3)</i>
                        </span><span>${con.cmsn3}${curr}</span>
                    </div><div>
                         <span>
                            <i>佣金4：</i>
                            <i>(commission4)</i>
                        </span><span>${con.cmsn4}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用1：</i>
                            <i>(other Fee1)</i>
                        </span><span>${con.other1}${curr}</span>
                    </div><div>
                         <span>
                            <i>其他费用2：</i>
                            <i>(other Fee2)</i>
                        </span><span>${con.other2}${curr}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用3：</i>
                            <i>(other Fee3)</i>
                        </span><span>${con.other3}${curr}</span>
                    </div><div>
                         <span>
                            <i>其他费用4：</i>
                            <i>(other Fee4)</i>
                        </span><span>${con.other4}${curr}</span>
                    </div>
                </div><c:if test="${con.selfbuy eq 1}"><div id="prediv" style="">
						<div class="detail">
								<div><span> <i>预估保险费：</i> <i>(forecast insurance price)</i>
								</span> <span>${con.preinsuranceprice}${curr}</span></div>
							<div><span> <i>预估短驳费：</i> <i>(forecast drayage price)</i>
								</span> <span>${con.predrayageprice}${curr}</span></div>
						</div>
						<div class="detail">
								<div><span> <i>预估执照费：</i> <i>(forecast license price)</i>
								</span> <span>${con.prelicenseprice}${curr}</span></div>
							<div><span> <i>预估燃油费：</i> <i>(forecast oil price)</i>
								</span> <span>${con.preoilprice}${curr}</span></div>
						</div></div></c:if><div style="font-weight:bold;margin-top: 5px;margin-bottom: 5px;">合同支付概述(Contract Payment Summarize)</div><div class="detail">
                    <div style="width: 100%;">
                         <span>
                            <i><label class="fc_red">*</label>合同总金额：</i>
                            <i>(Contract Total Amount)</i>
                        </span><input type="hidden" name="autotprice" id="autotprice" value="${con.autotprice}">
                        <span>${con.totalprice}${curr}</span>注：本合同涉及的所有金额单位均为(all monetary unit of the contract is):${curr}
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i><label class="fc_red">*</label>是否定金：</i>
                            <i>(Is Down Payment)</i>
                        </span>
                        <input type="radio" name="paytype" value="1" <c:if test="${con.paytype eq 1}">checked="checked"</c:if> disabled="disabled">否<input type="radio" name="paytype" value="2" style="margin-left: 33px;" <c:if test="${con.paytype eq 2}">checked="checked"</c:if> disabled>是
                    </div>
                    <c:if test="${con.paytype eq 2}">
                    <div id="selfbuy">
                         <span>
                            <i><label class="fc_red">*</label>采购方式：</i>
                            <i>(Purchase Type)</i>
                        </span>
                        <input type="radio" name="selfbuy" value="1" disabled="disabled" <c:if test="${con.selfbuy eq 1}">checked="checked"</c:if>>自采<input type="radio" name="selfbuy" value="2" disabled="disabled" style="margin-left: 33px;" <c:if test="${con.selfbuy eq 2}">checked="checked"</c:if>>代采
                    </div></c:if>
                </div><div class="detail" id="downfinal" <c:if test="${con.paytype eq 1}">style="display: none;"</c:if>>
                <div>
                         <span>
                            <i>定金：</i>
                            <i>(Down Payment)</i>
                        </span><span>${con.downpay}${curr}</span>
                    </div><div>
                         <span>
                            <i>尾款：</i>
                            <i>(Final Payment)</i>
                        </span><span>${con.finalpay}${curr}</span>
                    </div>
                </div><div class="detail">
                <div>
                    <span>
                        <i>开证价:</i>
                        <i>(Issuing Price)</i>
                    </span><span>${con.issuingprice}${curr}</span>
                </div>
                <div>
                    <span>
                        <i>备注:</i>
                        <i>(Remark)</i>
                    </span><span>${con.remark}</span>
                </div></div><div class="detail">
                <div class="set">
                    <span>
                        <i>修改原因:</i>
                        <i>(Modification Reason)</i>
                    </span><span><textarea id="rejectreason1"><c:if test="${empty con.status or con.status eq '10' or con.status eq '2' or con.status eq '5' or con.status eq '8'}">${con.rejectreason1}${con.rejectreason2}${con.rejectreason3}</c:if></textarea></span>
                </div><div class="set">
                    <span>
                        <i>不通过原因:</i>
                        <i>(No Pass Reason)</i>
                    </span><span><textarea id="rejectreason2"><c:if test="${con.status eq '3' or con.status eq '6' or con.status eq '9'}">${con.rejectreason1}${con.rejectreason2}${con.rejectreason3}</c:if></textarea></span>
                </div></div><div class="detail">
                <div>
                    <span>
                        <i>合同状态:</i>
                        <i>(Contract Status)</i>
                    </span><span><c:choose>  
                    <c:when test="${empty con.status}">待审核</c:when>
                    <c:when test="${con.status eq '1'}">采购通过</c:when>
                    <c:when test="${con.status eq '2'}">采购修改</c:when>
                    <c:when test="${con.status eq '3'}">采购不通过</c:when>
                    <c:when test="${con.status eq '4'}">法务通过</c:when>
                    <c:when test="${con.status eq '5'}">法务修改</c:when>
                    <c:when test="${con.status eq '6'}">法务不通过</c:when>
                    <c:when test="${con.status eq '7'}">全通过</c:when>
                    <c:when test="${con.status eq '8'}">财务修改</c:when>
                    <c:when test="${con.status eq '9'}">财务不通过</c:when>
                    <c:when test="${con.status eq '10'}">已撤销</c:when>
                    </c:choose></span>
                </div></div><div class="detail">
                <div style="width: 33%;"><label>采购审核(Purchase Audit):</label>
                    <span>${con.auditer1}&nbsp;<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${con.auditime1}"/></span>
                </div><div style="width: 33%;"><label>法务审核(Law Audit):</label>
                    <span>${con.auditer2}&nbsp;<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${con.auditime2}"/></span>
                </div><div style="width: 33%;"><label>财务审核(Finance Audit):</label>
                    <span>${con.auditer3}&nbsp;<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${con.auditime3}"/></span>
                </div></div>
                </div><input type="hidden" name="reason" id="hidereason" value="">
            </div></form>
    </div>
    <div class="sell-button"><a href="javascript:void(0);" id="saveBtn">通过</a><a href="javascript:void(0);" id="editBtn" style="margin-left: 50px;">要求修改</a><a href="javascript:void(0);" id="noBtn" style="margin-left: 50px;">不通过</a>
        <a href="javascript:void(0);" id="cancelBtn" style="color: #666;">返回(back)</a>
    </div></div>
</body></div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jnd/contractaudit.js?r=<%=new Date()%>");
</script>