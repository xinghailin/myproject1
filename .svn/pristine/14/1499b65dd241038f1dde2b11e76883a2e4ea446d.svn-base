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
    <title>付款申请单新增</title>
</head>
<body>
<div class="box">
    <h2 class="buy-title">付款申请单新增</h2>
    <div class="content">
        <form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="jndapplypaysave"/>">
        <input type="hidden" name="subbuyid" id="subbuyid" value="">
        <input type="hidden" name="adjust" id="adjust" value="">
        <div class="rightbox" style="width: 100%;padding-left: 0px;border-left:0px;">
            <div class="right-title">
                <p>
                    <span>
                        <i>采购计划编号：</i>
                        <i>(purchase number)</i>
                    </span>
                    <span id="pcode"></span>
                </p>
                <p>
                    <span>
                        <i>采购计划名称：</i>
                        <i>(purchase name)</i>
                    </span>
                    <span id="pname"></span>
                </p>
            </div>
            <div class="right" style="padding-top: 5px;"><div class="brand">
                    <span style="width: 100%;margin-left: 15%;">
                        <a href="javascript:void(0);" id="choseBtn" class="addgoon">选择采购计划(choose purchase plan)</a>
                    </span>
                </div>
                <div class="info">
                    <div class="set" style="width: 100%;">
                        <span>
                            <i>合同编号:</i>
                        <i>(contract code)</i>
                        </span><label class="fc_red">*</label>
                        <textarea id="contract" name="contract" style="width: 61%;"></textarea>逗号(,)分隔 dot(,) separate
                    </div>
                </div>
                <div class="detail">
                <div>
                    <span>
                        <i>品牌首字母:</i>
                        <i>(brand initials)</i>
                    </span><span id="pinitials">${ap.initials}</span></div><div><span>
                        <i>品牌:</i>
                        <i>(brand)</i>
                    </span><span id="pbrand">${ap.brand}</span>
                </div></div><div class="detail"><div>
                    <span>
                        <i>型号:</i>
                        <i>(model)</i>
                    </span><span id="pmodel">${ap.model}</span></div><div><span>
                        <i>版别:</i>
                        <i>(version)</i>
                    </span><span id="pversion">${ap.version}</span>
                </div></div>
                <div class="info">
                    <div class="set">
                        <span>
                            <i>配置：</i>
                            <i>(configuration)</i>
                        </span><label class="fc_red">*</label>
                        <textarea id="pconfig" name="config"></textarea>
                    </div>
                    <div class="color">
                        <div>
                             <span>
                            <i>外观颜色：</i>
                            <i>(appearance color)</i>
                            </span><label class="fc_red">*</label>
                            <input id="poutcolor" type="text" name="outcolor" class="out_color" value="">
                        </div>
                        <div>
                             <span>
                            <i>内饰颜色：</i>
                            <i>(inner color)</i>
                        </span><label class="fc_red">*</label>
                            <input id="pincolor" type="text" name="incolor" class="in_color" value="">
                        </div>
                    </div>
                </div>
                <div class="numbox">
                     <span>
                            <i>数量：</i>
                            <i>(amount)</i>
                        </span><label class="fc_red">*</label>
                    <input id="pnum" type="text" name="num" class="num" value="">
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>供应方名称：</i>
                            <i>(supplier name)</i>
                        </span><label class="fc_red">*</label>
                        <input id="psupplyname" type="text" name="supplyname" value="">
                    </div>
                    <div>
                         <span>
                            <i>车价：</i>
                            <i>(car price)</i>
                        </span><label class="fc_red">*</label>
                        <input id="ptotalprice" type="text" name="totalprice" value=""><span name="currency"></span>
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>货物运送地点：</i>
                            <i>(delivery location)</i>
                        </span>
                   <select id="ptostoreid" name="tostoreid">
                   <%-- <c:forEach var="ite" items="${stores}">
		             <option value="<c:out value="${ite.id}"></c:out>"><c:out value="${ite.name}"></c:out></option>
		           </c:forEach> --%>
                   </select>
                    </div><div>
                         <span>
                            <i>约定入库时间：</i>
                            <i>(agreed storage time)</i>
                        </span><label class="fc_red">*</label>
                        <input id="patime" class="datainp" name="appointtime" type="text" placeholder="请选择时间" readonly="readonly">
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>4S店杂费：</i>
                            <i>(4S shop charges)</i>
                        </span>
                        <input id="otherco" type="text" name="othercost" value=""><span name="currency"></span>
                    </div><div>
                        <span>
                            <i>车辆保险：</i>
                            <i>(car insurance)</i>
                        </span>
                        <input id="insure" type="text" name="insurance" value=""><span name="currency"></span>
                    </div>
                </div>
                <div class="detail">
                    <div>
                          <span>
                            <i>消费税：</i>
                            <i>(consumption tax)</i>
                        </span>
                        <input id="exptax" type="text" name="expensetax" value=""><span name="currency"></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金1：</i>
                            <i>(commission1)</i>
                        </span>
                        <input type="text" name="cmsn1" id="cmsn1"><span name="currency"></span>
                    </div><div>
                         <span>
                            <i>佣金2：</i>
                            <i>(commission2)</i>
                        </span>
                        <input type="text" name="cmsn2" id="cmsn2"><span name="currency"></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金3：</i>
                            <i>(commission3)</i>
                        </span>
                        <input type="text" name="cmsn3" id="cmsn3"><span name="currency"></span>
                    </div><div>
                         <span>
                            <i>佣金4：</i>
                            <i>(commission4)</i>
                        </span>
                        <input type="text" name="cmsn4" id="cmsn4"><span name="currency"></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金5：</i>
                            <i>(commission5)</i>
                        </span>
                        <input type="text" name="cmsn5" id="cmsn5"><span name="currency"></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用1：</i>
                            <i>(other cost1)</i>
                        </span>
                        <input type="text" name="other1" id="other1"><span name="currency"></span>
                    </div><div>
                         <span>
                            <i>其他费用2：</i>
                            <i>(other cost2)</i>
                        </span>
                        <input type="text" name="other2" id="other2"><span name="currency"></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用3：</i>
                            <i>(other cost3)</i>
                        </span>
                        <input type="text" name="other3" id="other3"><span name="currency"></span>
                    </div><div>
                         <span>
                            <i>其他费用4：</i>
                            <i>(other cost4)</i>
                        </span>
                        <input type="text" name="other4" id="other4"><span name="currency"></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用5：</i>
                            <i>(other cost5)</i>
                        </span>
                        <input type="text" name="other5" id="other5"><span name="currency"></span>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>运输费用：</i>
                            <i>(transport cost)</i>
                        </span>
                        <input type="text" name="transcost" id="transcost"><span name="currency"></span>
                    </div><div>
                         <span>
                            <i>运输方名称：</i>
                            <i>(transport name)</i>
                        </span>
                        <input type="text" name="transname" id="transname">
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>购车方式：</i>
                            <i>(pay type)</i>
                        </span><label class="fc_red">*</label>
                        <input type="radio" name="paytype" value="1">全款购车<input type="radio" name="paytype" value="2" style="margin-left: 33px;">预定车辆
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>定金：</i>
                            <i>(downpay)</i>
                        </span><label class="fc_red">*</label>
                        <input type="text" name="downpay" id="downpay"><span name="currency"></span><input type="hidden" name="shouldfp" id="shouldfp">
                    </div>
                </div>
                </div>
            </div></form>
    </div>
    <div class="sell-button"><a href="javascript:void(0);" id="savenewBtn">
            提交(submit)
        </a>
        <a href="javascript:void(0);" id="cancelBtn" style="color: #666;">返回(back)</a>
    </div></div>
</body></div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jnd/apayedit.js?r=<%=new Date()%>");
</script>