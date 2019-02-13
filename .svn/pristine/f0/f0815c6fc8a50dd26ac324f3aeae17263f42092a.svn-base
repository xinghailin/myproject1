<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/jndapplypay.css" rel="stylesheet">
<input type="hidden" id="indexUrl" value="<ufa:url fieldName="jndApplyPayLstIndex" namespace="car-ms"/>">
<input type="hidden" id="choosepurUrl" value="<ufa:url fieldName="jndPurchaseLstForApayIndex" namespace="car-ms"/>">
<input type="hidden" id="subpurUrl" value="<ufa:url fieldName="jndSubPurchaseById" namespace="car-ms"/>">
<input type="hidden" id="currpage" value="${currpage}">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;"><head>
    <meta charset="UTF-8">
    <title>付款申请单编辑-定金</title>
</head>
<body>
<div class="box">
    <h2 class="buy-title">付款申请单编辑-定金</h2>
    <div class="content">
        <form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="jndapplypaysave"/>">
        <input type="hidden" name="id" value="${ap.id}"><input type="hidden" name="status" value="${ap.status}">
        <input type="hidden" name="subbuyid" id="subbuyid" value="${ap.subbuyid}">
        <input type="hidden" name="adjust" id="adjust" value="${ap.adjust}">
        <input type="hidden" name="buytime" id="buytime" value="${ap.buytime}">
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
            <div class="right" style="padding-top: 5px;"><c:if test="${ap.status == 2 or ap.status==4}"><div class="brand">
                    <span style="width: 100%;margin-left: 15%;">
                        <a href="javascript:void(0);" id="choseBtn" class="addgoon">选择采购计划(choose purchase plan)</a>
                    </span>
                </div></c:if><div class="info">
                    <div class="set" style="width: 100%;">
                        <span>
                            <i>合同编号:</i>
                        <i>(contract code)</i>
                        </span><label class="fc_red">*</label>
                        <textarea id="contract" name="contract" style="width: 61%;">${ap.contract}</textarea>逗号(,)分隔 dot(,) separate
                    </div>
                </div>
                <div class="detail">
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
                        </span><label class="fc_red">*</label>
                        <textarea id="pconfig" name="config">${ap.config}</textarea>
                    </div>
                    <div class="color">
                        <div>
                             <span>
                            <i>外观颜色：</i>
                            <i>(appearance color)</i>
                            </span><label class="fc_red">*</label>
                            <input id="poutcolor" type="text" name="outcolor" class="out_color" value="${ap.outcolor}">
                        </div>
                        <div>
                             <span>
                            <i>内饰颜色：</i>
                            <i>(inner color)</i>
                        </span><label class="fc_red">*</label>
                            <input id="pincolor" type="text" name="incolor" class="in_color" value="${ap.incolor}">
                        </div>
                    </div>
                </div>
                <div class="numbox">
                     <span>
                            <i>数量：</i>
                            <i>(amount)</i>
                        </span><label class="fc_red">*</label>
                    <input id="pnum" type="text" name="num" class="num" value="${ap.num}">
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>供应方名称：</i>
                            <i>(supplier name)</i>
                        </span><label class="fc_red">*</label>
                        <input id="psupplyname" type="text" name="supplyname" value="${ap.supplyname}">
                    </div>
                    <div>
                         <span>
                            <i>车价：</i>
                            <i>(car price)</i>
                        </span><label class="fc_red">*</label>
                        <input id="ptotalprice" type="text" name="totalprice" value="<fmt:formatNumber type="number" groupingUsed="false" value="${ap.totalprice }" maxFractionDigits="2"/>"><span id="currency"><c:if test="${ap.currency eq 1}"><c:set var="_curr" value="加币(CAD)"></c:set></c:if>
                        <c:if test="${ap.currency eq 2}"><c:set var="_curr" value="美元($)"></c:set></c:if><c:out value="${_curr}"></c:out></span>
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>货物运送地点：</i>
                            <i>(delivery location)</i>
                        </span>
                   <select id="ptostoreid" name="tostoreid">
                   <c:forEach var="ite" items="${stores}">
		             <option value="<c:out value="${ite.id}"></c:out>" <c:if test="${ite.id eq ap.tostoreid}">selected="selected"</c:if>><c:out value="${ite.name}"></c:out></option>
		           </c:forEach>
                   </select>
                    </div><div>
                         <span>
                            <i>约定入库时间：</i>
                            <i>(agreed storage time)</i>
                        </span><label class="fc_red">*</label>
                        <input id="patime" class="datainp" name="appointtime" type="text" placeholder="请选择时间" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${ap.appointtime}"/>" readonly="readonly">
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>4S店杂费：</i>
                            <i>(4S shop charges)</i>
                        </span>
                        <input id="otherco" type="text" name="othercost" value="<fmt:formatNumber type="number" groupingUsed="false" value="${ap.othercost }" maxFractionDigits="2"/>"><span name="currency"><c:out value="${_curr}"></c:out></span>
                    </div><div>
                        <span>
                            <i>车辆保险：</i>
                            <i>(car insurance)</i>
                        </span>
                        <input id="insure" type="text" name="insurance" value="<fmt:formatNumber type="number" groupingUsed="false" value="${ap.insurance }" maxFractionDigits="2"/>"><span name="currency"><c:out value="${_curr}"></c:out></span>
                    </div>
                </div>
                <div class="detail">
                    <div>
                          <span>
                            <i>消费税：</i>
                            <i>(consumption tax)</i>
                        </span>
                        <input id="exptax" type="text" name="expensetax" value="<fmt:formatNumber type="number" groupingUsed="false" value="${ap.expensetax }" maxFractionDigits="2"/>"><span name="currency"><c:out value="${_curr}"></c:out></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金1：</i>
                            <i>(commission1)</i>
                        </span>
                        <input type="text" name="cmsn1" id="cmsn1" value="<fmt:formatNumber type="number" groupingUsed="false" value="${ap.cmsn1 }" maxFractionDigits="2"/>"><span name="currency"><c:out value="${_curr}"></c:out></span>
                    </div><div>
                         <span>
                            <i>佣金2：</i>
                            <i>(commission2)</i>
                        </span>
                        <input type="text" name="cmsn2" id="cmsn2" value="<fmt:formatNumber type="number" groupingUsed="false" value="${ap.cmsn2 }" maxFractionDigits="2"/>"><span name="currency"><c:out value="${_curr}"></c:out></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金3：</i>
                            <i>(commission3)</i>
                        </span>
                        <input type="text" name="cmsn3" id="cmsn3" value="<fmt:formatNumber type="number" groupingUsed="false" value="${ap.cmsn3 }" maxFractionDigits="2"/>"><span name="currency"><c:out value="${_curr}"></c:out></span>
                    </div><div>
                         <span>
                            <i>佣金4：</i>
                            <i>(commission4)</i>
                        </span>
                        <input type="text" name="cmsn4" id="cmsn4" value="<fmt:formatNumber type="number" groupingUsed="false" value="${ap.cmsn4 }" maxFractionDigits="2"/>"><span name="currency"><c:out value="${_curr}"></c:out></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金5：</i>
                            <i>(commission5)</i>
                        </span>
                        <input type="text" name="cmsn5" id="cmsn5" value="<fmt:formatNumber type="number" groupingUsed="false" value="${ap.cmsn5 }" maxFractionDigits="2"/>"><span name="currency"><c:out value="${_curr}"></c:out></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用1：</i>
                            <i>(other cost1)</i>
                        </span>
                        <input type="text" name="other1" id="other1" value="<fmt:formatNumber type="number" groupingUsed="false" value="${ap.other1 }" maxFractionDigits="2"/>"><span name="currency"><c:out value="${_curr}"></c:out></span>
                    </div><div>
                         <span>
                            <i>其他费用2：</i>
                            <i>(other cost2)</i>
                        </span>
                        <input type="text" name="other2" id="other2" value="<fmt:formatNumber type="number" groupingUsed="false" value="${ap.other2 }" maxFractionDigits="2"/>"><span name="currency"><c:out value="${_curr}"></c:out></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用3：</i>
                            <i>(other cost3)</i>
                        </span>
                        <input type="text" name="other3" id="other3" value="<fmt:formatNumber type="number" groupingUsed="false" value="${ap.other3 }" maxFractionDigits="2"/>"><span name="currency"><c:out value="${_curr}"></c:out></span>
                    </div><div>
                         <span>
                            <i>其他费用4：</i>
                            <i>(other cost4)</i>
                        </span>
                        <input type="text" name="other4" id="other4" value="<fmt:formatNumber type="number" groupingUsed="false" value="${ap.other4 }" maxFractionDigits="2"/>"><span name="currency"><c:out value="${_curr}"></c:out></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用5：</i>
                            <i>(other cost5)</i>
                        </span>
                        <input type="text" name="other5" id="other5" value="<fmt:formatNumber type="number" groupingUsed="false" value="${ap.other5 }" maxFractionDigits="2"/>"><span name="currency"><c:out value="${_curr}"></c:out></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>运输费用：</i>
                            <i>(transport cost)</i>
                        </span>
                        <input type="text" name="transcost" id="transcost" value="<fmt:formatNumber type="number" groupingUsed="false" value="${ap.transcost }" maxFractionDigits="2"/>"><span name="currency"><c:out value="${_curr}"></c:out></span>
                    </div><div>
                         <span>
                            <i>运输方名称：</i>
                            <i>(transport name)</i>
                        </span>
                        <input type="text" name="transname" id="transname" value="${ap.transname}">
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>购车方式：</i>
                            <i>(pay type)</i>
                        </span><label class="fc_red">*</label>
                        <input type="radio" name="paytype" value="1" <c:if test="${ap.paytype eq '1'}">checked="checked"</c:if>>全款购车<input type="radio" name="paytype" value="2" style="margin-left: 33px;"<c:if test="${ap.paytype eq '2'}">checked="checked"</c:if>>预定车辆
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>定金：</i>
                            <i>(downpay)</i>
                        </span><label class="fc_red">*</label>
                        <input type="text" name="downpay" id="downpay" value="<fmt:formatNumber type="number" groupingUsed="false" value="${ap.downpay }" maxFractionDigits="2"/>"><span name="currency"><c:out value="${_curr}"></c:out></span><input type="hidden" name="shouldfp" id="shouldfp">
                    </div>
                </div><c:if test="${not empty ap.reason}"><div class="detail">
                    <div>
                         <span>
                            <i>不通过原因：</i>
                            <i>(nopass reason)</i>
                        </span></span style="width:500px;">${ap.reason}</span>
                    </div>
                </div></c:if>
                </div>
            </div></form>
    </div>
    <div class="sell-button"><c:if test="${ap.status == 2 or ap.status == 4}"><a href="javascript:void(0);" id="saveBtn">
            提交(submit)
        </a></c:if>
        <a href="javascript:void(0);" id="cancelBtn" style="color: #666;">返回(back)</a>
    </div></div>
</body></div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jnd/apayedit.js?r=<%=new Date()%>");
</script>