<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/jndapplypay.css" rel="stylesheet">
<input type="hidden" id="indexUrl" value="<ufa:url fieldName="jndpayapplyauditindex" namespace="car-ms"/>">
<input type="hidden" id="currpage" value="${currpage}">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;"><head>
    <meta charset="UTF-8">
    <title>付款申请单审核-尾款</title>
</head>
<body>
<div class="box">
    <h2 class="buy-title">付款申请单审核-尾款</h2>
    <div class="content">
        <form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="jndpayapplyauditdo"/>">
        <input type="hidden" name="id" id="apid" value="${ap.id}"><input type="hidden" name="status" value="${ap.status}">
        <input type="hidden" name="adjust" id="adjust" value="${ap.adjust}">
        <div class="rightbox" style="width: 100%;padding-left: 0px;border-left:0px;">
            <div class="right-title">
                <p>
                    <span>
                        <i>采购计划编号：</i>
                        <i>(purchase number)</i>
                    </span>
                    <span id="pcode">${ap.code}</span>
                </p>
                <p>
                    <span>
                        <i>采购计划名称：</i>
                        <i>(purchase name)</i>
                    </span>
                    <span id="pname">${ap.name}</span>
                </p>
            </div>
            <div class="right" style="padding-top: 5px;"><div class="info">
                    <div class="set" style="width: 100%;">
                        <span>
                            <i>合同编号:</i>
                        <i>(contract code)</i>
                        </span>
                        <span id="contract" style="width: 61%;">${ap.contract}</span>
                    </div>
                </div><div class="detail">
                <div>
                    <span>
                        <i>品牌首字母:</i>
                        <i>(brand initials)</i>
                    </span><span>${ap.initials}</span></div><div><span>
                        <i>品牌:</i>
                        <i>(brand)</i>
                    </span><span>${ap.brand}</span>
                </div></div><div class="detail"><div>
                    <span>
                        <i>型号:</i>
                        <i>(model)</i>
                    </span><span>${ap.model}</span></div><div><span>
                        <i>版别:</i>
                        <i>(version)</i>
                    </span><span>${ap.version}</span>
                </div></div>
                <div class="info">
                    <div class="set">
                        <span>
                            <i>配置：</i>
                            <i>(configuration)</i>
                        </span>
                        <span id="pconfig" name="config">${ap.config}</span>
                    </div>
                    <div class="color">
                        <div>
                             <span>
                            <i>外观颜色：</i>
                            <i>(appearance color)</i>
                            </span>
                            <span>${ap.outcolor}</span>
                        </div>
                        <div>
                             <span>
                            <i>内饰颜色：</i>
                            <i>(inner color)</i>
                        </span>
                            <span>${ap.incolor}</span>
                        </div>
                    </div>
                </div>
                <div class="numbox">
                     <span>
                            <i>数量：</i>
                            <i>(amount)</i>
                        </span>
                    <span>${ap.num}</span>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>供应方名称：</i>
                            <i>(supplier name)</i>
                        </span>
                        <span>${ap.supplyname}</span>
                    </div>
                    <div>
                         <span>
                            <i>车价：</i>
                            <i>(car price)</i>
                        </span>
                        <span>${ap.totalprice}<c:if test="${ap.currency eq 1}"><c:set var="_curr" value="加币(CAD)"></c:set></c:if><c:if test="${ap.currency eq 2}"><c:set var="_curr" value="美元($)"></c:set></c:if><c:out value="${_curr}"></c:out></span>
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>货物运送地点：</i>
                            <i>(delivery location)</i>
                        </span><span>
                   <c:forEach var="ite" items="${stores}">
		             <c:if test="${ite.id eq ap.tostoreid}"><c:out value="${ite.name}"></c:out></c:if>
		           </c:forEach></span>
                    </div><div>
                         <span>
                            <i>约定入库时间：</i>
                            <i>(agreed storage time)</i>
                        </span>
                        <span><fmt:formatDate pattern="yyyy-MM-dd" value="${ap.appointtime}"/></span>
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>4S店杂费：</i>
                            <i>(4S shop charges)</i>
                        </span>
                        <span>${ap.othercost}<c:out value="${_curr}"></c:out></span>
                    </div><div>
                        <span>
                            <i>车辆保险：</i>
                            <i>(car insurance)</i>
                        </span>
                        <span>${ap.insurance}<c:out value="${_curr}"></c:out></span>
                    </div>
                </div>
                <div class="detail">
                    <div>
                          <span>
                            <i>消费税：</i>
                            <i>(consumption tax)</i>
                        </span>
                        <span>${ap.expensetax}<c:out value="${_curr}"></c:out></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金1：</i>
                            <i>(commission1)</i>
                        </span>
                        <span>${ap.cmsn1}<c:out value="${_curr}"></c:out></span>
                    </div><div>
                         <span>
                            <i>佣金2：</i>
                            <i>(commission2)</i>
                        </span>
                        <span>${ap.cmsn2}<c:out value="${_curr}"></c:out></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金3：</i>
                            <i>(commission3)</i>
                        </span>
                        <span>${ap.cmsn3}<c:out value="${_curr}"></c:out></span>
                    </div><div>
                         <span>
                            <i>佣金4：</i>
                            <i>(commission4)</i>
                        </span>
                        <span>${ap.cmsn4}<c:out value="${_curr}"></c:out></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金5：</i>
                            <i>(commission5)</i>
                        </span>
                        <span>${ap.cmsn5}<c:out value="${_curr}"></c:out></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用1：</i>
                            <i>(other cost1)</i>
                        </span>
                        <span>${ap.other1}<c:out value="${_curr}"></c:out></span>
                    </div><div>
                         <span>
                            <i>其他费用2：</i>
                            <i>(other cost2)</i>
                        </span>
                        <span>${ap.other2}<c:out value="${_curr}"></c:out></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用3：</i>
                            <i>(other cost3)</i>
                        </span>
                        <span>${ap.other3}<c:out value="${_curr}"></c:out></span>
                    </div><div>
                         <span>
                            <i>其他费用4：</i>
                            <i>(other cost4)</i>
                        </span>
                        <span>${ap.other4}<c:out value="${_curr}"></c:out></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用5：</i>
                            <i>(other cost5)</i>
                        </span>
                        <span>${ap.other5}<c:out value="${_curr}"></c:out></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>运输费用：</i>
                            <i>(transport cost)</i>
                        </span>
                        <span>${ap.transcost}<c:out value="${_curr}"></c:out></span>
                    </div><div>
                         <span>
                            <i>运输方名称：</i>
                            <i>(transport name)</i>
                        </span>
                        <span>${ap.transname}</span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>购车方式：</i>
                            <i>(pay type)</i>
                        </span>
                        <input type="radio" name="paytype" disabled="disabled" <c:if test="${ap.paytype eq '1'}">checked="checked"</c:if>>全款购车<input type="radio" name="paytype" disabled="disabled" style="margin-left: 33px;"<c:if test="${ap.paytype eq '2'}">checked="checked"</c:if>>预定车辆
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>定金：</i>
                            <i>(downpay)</i>
                        </span><span>${ap.downpay}<c:out value="${_curr}"></c:out></span>
                    </div><div>
                         <span>
                            <i>尾款：</i>
                            <i>(finalpay)</i>
                        </span><span style="color:red;font-size:20px;">${ap.finalpay}</span><c:out value="${_curr}"></c:out><c:if test="${ap.status == 7}">预计尾款:${ap.shouldfp}<c:out value="${_curr}"></c:out></c:if>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>不通过原因：</i>
                            <i>(nopass reason)</i>
                        </span><textarea style="border: 1px solid #ccc;height: 80px;overflow-y: auto;width: 500px;" name="reason">${ap.reason}</textarea>
                    </div>
                </div>
                </div>
            </div></form>
    </div>
    <div class="sell-button"><c:if test="${ap.status == 7}"><a href="javascript:void(0);" id="passBtn">
            审核通过
        </a><a href="javascript:void(0);" id="nopassBtn" style="margin-left: 57px;">
            审核不通过
        </a></c:if>
        <a href="javascript:void(0);" id="cancelBtn" style="color: #666;">返回(back)</a>
    </div></div>
</body></div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jnd/payapplyaudit.js?r=<%=new Date()%>");
</script>