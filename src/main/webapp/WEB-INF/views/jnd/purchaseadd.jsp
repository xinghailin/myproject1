<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/jndpurchase.css" rel="stylesheet">
<input type="hidden" id="indexUrl" value="<ufa:url fieldName="jndPurchaseLstIndex" namespace="car-ms"/>">
<input type="hidden" id="saveUrl" value="<ufa:url fieldName="jndPurchaseEditSave" namespace="car-ms"/>">
<input type="hidden" id="currpage" value="${currpage}">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;"><head>
    <meta charset="UTF-8">
    <title>采购计划添加</title>
</head>
<body>
<div class="box">
    <h2 class="buy-title">采购计划添加</h2>
    <div class="content">
        <div class="leftbox">
        <div class="right-title">
                <p style="width: 100%;">
                    <span>
                        <i>需求编号(requirementCode)：</i>
                    </span>
                    <span>${need.code}</span>
                </p>
                <p style="width: 100%;">
                    <span>
                        <i>需求名称(requirementName)：</i>
                    </span>
                    <span>${need.name}</span>
                </p>
                <p style="width: 100%;">
                    <span>
                        <i>主动采购方(activePurchaser)：</i>
                    </span>
                    <span>${need.needer}</span>
                </p>
            </div>
            <div class="left">
            <c:forEach var="item" items="${subneed}"><font style="color: red;font-size: 12px;">-------详细需求分割线(requirement details separate line)------------------</font>      
                    <span>
                        <i>品牌首字母：</i>
                        <i>(brand initials)</i>
                    </span>
                    <span>${item.initials}</span>
                </p>
                <p>
                    <span>
                        <i>品牌：</i>
                        <i>(brand)</i>
                    </span>
                    <span>${item.brand}</span>
                </p>
                <p>
                    <span>
                        <i>型号：</i>
                        <i>(model)</i>
                    </span>
                    <span>${item.model}</span>
                </p>
                <p>
                    <span>
                        <i>版别：</i>
                        <i>(version)</i>
                    </span>
                    <span>${item.version}</span>
                </p>
                <p>
                    <span>
                        <i>配置：</i>
                        <i>(configuration)</i>
                    </span>
                    <span>${item.config}</span>
                </p>
                <p>
                    <span>
                        <i>外观颜色：</i>
                        <i>(appearance color)</i>
                    </span>
                    <span>${item.outcolor}</span>
                </p>
                <p>
                    <span>
                        <i>内饰颜色：</i>
                        <i>(inner color)</i>
                    </span>
                    <span>${item.incolor}</span>
                </p>
                <p>
                    <span>
                        <i>数量：</i>
                        <i>(amount)</i>
                    </span>
                    <span>${item.num}</span>
                </p>
                </c:forEach>
            </div>
        </div>
        <input type="hidden" name="id" value="${idkey}"><input type="hidden" name="needid" value="${need.id}"><input type="hidden" name="puradd" value="1">
        <div class="rightbox">
            <div class="right-title">
                <p>
                    <span>
                        <i>采购计划编号(purchaseCode)：</i>
                    </span>
                    <span><input type="text" name="buycode" value="${filecode}" readonly="readonly" style="width: 210px;"/></span>
                </p>
                <p>
                    <span>
                        <i>采购计划名称(purchaseName)：</i>
                    </span>
                    <span><label class="fc_red">*</label><input type="text" name="buyname" value="" style="width: 210px;"/></span>
                </p>
            </div>
            <form id="rightVli0" class="rightVli">
            <div class="right"><input type="hidden" name="sid" value=""><input type="hidden" name="bidc" value="0">
                <div class="brand">
                    <span>
                        <i>品牌 型号 版别:</i>
                        <i>(brand model version)</i>
                    </span>
                    <select id="" name="bmv" class="selectchange">
                   <c:forEach var="item" items="${subneed}" varStatus="vs">
                   <c:if test="${vs.index eq 0}"><c:set var="firstneed" value="${item}"></c:set></c:if>
		             <option value="<c:out value="${item.id}"></c:out>"><c:out value="${item.brand}"></c:out> <c:out value="${item.model}"></c:out> <c:out value="${item.version}"></c:out></option>
		           </c:forEach>
                    </select>
                </div>
                <div class="check">
                    <input type="checkbox" class="checkbox">
                    <input type="hidden" name="adjust" value="">
                     <span>
                            <i>调剂（只有调剂后才可修改配置、颜色）</i>
                            <i>adjustment (config and color can be modified when you check adjustment)</i>
                     </span>
                </div>
                <div class="info">
                    <div class="set">
                        <span>
                            <i>配置：</i>
                            <i>(configuration)</i>
                        </span><label class="fc_red">*</label>
                        <textarea name="config" readonly="readonly">${firstneed.config}</textarea>
                    </div>
                    <div class="color">
                        <div>
                             <span>
                            <i>外观颜色：</i>
                            <i>(appearance color)</i>
                            </span><label class="fc_red">*</label>
                            <input type="text" name="outcolor" class="out_color" readonly="readonly" value="${firstneed.outcolor}">
                        </div>
                        <div>
                             <span>
                            <i>内饰颜色：</i>
                            <i>(inner color)</i>
                        </span><label class="fc_red">*</label>
                            <input type="text" name="incolor" class="in_color" readonly="readonly" value="${firstneed.incolor}">
                        </div>
                    </div>
                </div>
                <div class="numbox">
                     <span>
                            <i>数量：</i>
                            <i>(amount)</i>
                        </span><label class="fc_red">*</label>
                    <input type="text" name="num" class="num">
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>供应方名称：</i>
                            <i>(supplier name)</i>
                        </span><label class="fc_red">*</label>
                        <input type="text" name="supplyname">
                    </div>
                    <div>
                         <span>
                            <i>车价：</i>
                            <i>(car price)</i>
                        </span><label class="fc_red">*</label>
                        <input type="text" name="totalprice" id="111"><c:if test="${need.currency eq 1}"><c:set var="_curr" value="加币(CAD)"></c:set></c:if>
                        <c:if test="${need.currency eq 2}"><c:set var="_curr" value="美元($)"></c:set></c:if><c:out value="${_curr}"></c:out>
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>货物运送地点：</i>
                            <i>(delivery location)</i>
                        </span>
                   <select id="" name="tostoreid">
                   <c:forEach var="ite" items="${stores}">
		             <option value="<c:out value="${ite.id}"></c:out>"><c:out value="${ite.name}"></c:out></option>
		           </c:forEach>
                   </select>
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>约定入库时间：</i>
                            <i>(agreed storage time)</i>
                        </span>
                        <input class="datainp" type="text" name="appointtime" placeholder="请选择时间" readonly="readonly">
                    </div>
                    <div>
                         <span>
                            <i>付款时间：</i>
                            <i>(pay time)</i>
                        </span>
                        <input class="datainp" type="text" name="paytime" placeholder="请选择时间" readonly="readonly">
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>4S店杂费：</i>
                            <i>(4S shop charges)</i>
                        </span>
                        <input type="text" name="othercost"><c:out value="${_curr}"></c:out>
                    </div><div>
                        <span>
                            <i>车辆保险：</i>
                            <i>(car insurance)</i>
                        </span>
                        <input type="text" name="insurance"><c:out value="${_curr}"></c:out>
                    </div>
                </div>
                <div class="detail">
                    <div>
                        <span>
                            <i>消费税：</i>
                            <i>(consumption tax)</i>
                        </span>
                        <input type="text" name="expensetax"><c:out value="${_curr}"></c:out>
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>佣金1：</i>
                            <i>(commission1)</i>
                        </span>
                        <input type="text" name="cmsn1"><c:out value="${_curr}"></c:out>
                    </div><div>
                         <span>
                            <i>佣金2：</i>
                            <i>(commission2)</i>
                        </span>
                        <input type="text" name="cmsn2"><c:out value="${_curr}"></c:out>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金3：</i>
                            <i>(commission3)</i>
                        </span>
                        <input type="text" name="cmsn3"><c:out value="${_curr}"></c:out>
                    </div><div>
                         <span>
                            <i>佣金4：</i>
                            <i>(commission4)</i>
                        </span>
                        <input type="text" name="cmsn4"><c:out value="${_curr}"></c:out>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金5：</i>
                            <i>(commission5)</i>
                        </span>
                        <input type="text" name="cmsn5"><c:out value="${_curr}"></c:out>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用1：</i>
                            <i>(other cost1)</i>
                        </span>
                        <input type="text" name="other1"><c:out value="${_curr}"></c:out>
                    </div><div>
                         <span>
                            <i>其他费用2：</i>
                            <i>(other cost2)</i>
                        </span>
                        <input type="text" name="other2"><c:out value="${_curr}"></c:out>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用3：</i>
                            <i>(other cost3)</i>
                        </span>
                        <input type="text" name="other3"><c:out value="${_curr}"></c:out>
                    </div><div>
                         <span>
                            <i>其他费用4：</i>
                            <i>(other cost4)</i>
                        </span>
                        <input type="text" name="other4"><c:out value="${_curr}"></c:out>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用5：</i>
                            <i>(other cost5)</i>
                        </span>
                        <input type="text" name="other5"><c:out value="${_curr}"></c:out>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>运输费用：</i>
                            <i>(transport cost)</i>
                        </span>
                        <input type="text" name="transcost"><c:out value="${_curr}"></c:out>
                    </div><div>
                         <span>
                            <i>运输方名称：</i>
                            <i>(transport name)</i>
                        </span>
                        <input type="text" name="transname">
                    </div>
                </div>
                <div class="btn-box">
                    <a class="addgoon">
                        <i>继续添加</i>
                        <i>add</i>
                    </a>
                    <a class="delete">
                        <i>删除</i>
                        <i>delete</i>
                    </a>
                </div>
            </div></form>
            </div>
    </div>
    <div class="sell-button">
        <a href="javascript:void(0);" id="saveBtn">
            提交(submit)
        </a>
        <a href="javascript:void(0);" id="cancelBtn" style="color: #666;">返回(back)</a>
    </div></div><div style="display: none;" id="hideItem"><form id="rightVli0" class="rightVli">
<div class="right"><input type="hidden" name="sid" value=""><input type="hidden" name="bidc" value="0">
                <div class="brand">
                    <span>
                        <i>品牌 型号 版别:</i>
                        <i>(brand model version)</i>
                    </span>
                    <select id="" name="bmv" class="selectchange">
                   <c:forEach var="item" items="${subneed}">
		             <option value="<c:out value="${item.id}"></c:out>"><c:out value="${item.brand}"></c:out> <c:out value="${item.model}"></c:out> <c:out value="${item.version}"></c:out></option>
		           </c:forEach>
                    </select>
                </div>
                <div class="check">
                    <input type="checkbox" class="checkbox">
                    <input type="hidden" name="adjust" value="">
                     <span>
                            <i>调剂（只有调剂后才可修改配置、颜色）</i>
                            <i>adjustment (config and color can be modified when you check adjustment)</i>
                     </span>
                </div>
                <div class="info">
                    <div class="set">
                        <span>
                            <i>配置：</i>
                            <i>(configuration)</i>
                        </span>
                        <textarea name="config" readonly="readonly">${firstneed.config}</textarea>
                    </div>
                    <div class="color">
                        <div>
                             <span>
                            <i>外观颜色：</i>
                            <i>(appearance color)</i>
                            </span>
                            <input type="text" name="outcolor" class="out_color" readonly="readonly" value="${firstneed.outcolor}">
                        </div>
                        <div>
                             <span>
                            <i>内饰颜色：</i>
                            <i>(inner color)</i>
                        </span>
                            <input type="text" name="incolor" class="in_color" readonly="readonly" value="${firstneed.incolor}">
                        </div>
                    </div>
                </div>
                <div class="numbox">
                     <span>
                            <i>数量：</i>
                            <i>(amount)</i>
                        </span>
                    <input type="text" name="num" class="num">
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>供应方名称：</i>
                            <i>(supplier name)</i>
                        </span>
                        <input type="text" name="supplyname">
                    </div>
                    <div>
                         <span>
                            <i>车价：</i>
                            <i>(car price)</i>
                        </span>
                        <input type="text" name="totalprice" id="222"><c:out value="${_curr}"></c:out>
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>货物运送地点：</i>
                            <i>(delivery location)</i>
                        </span>
                   <select id="" name="tostoreid">
                   <c:forEach var="ite" items="${stores}">
		             <option value="<c:out value="${ite.id}"></c:out>"><c:out value="${ite.name}"></c:out></option>
		           </c:forEach>
                   </select>
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>约定入库时间：</i>
                            <i>(agreed storage time)</i>
                        </span>
                        <input class="datainp" type="text" name="appointtime" placeholder="请选择时间" readonly="readonly">
                    </div>
                    <div>
                         <span>
                            <i>付款时间：</i>
                            <i>(pay time)</i>
                        </span>
                        <input class="datainp" type="text" name="paytime" placeholder="请选择时间" readonly="readonly">
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>4S店杂费：</i>
                            <i>(4S shop charges)</i>
                        </span>
                        <input type="text" name="othercost"><c:out value="${_curr}"></c:out>
                    </div><div>
                        <span>
                            <i>车辆保险：</i>
                            <i>(car insurance)</i>
                        </span>
                        <input type="text" name="insurance"><c:out value="${_curr}"></c:out>
                    </div>
                </div>
                <div class="detail">
                    <div>
                        <span>
                            <i>消费税：</i>
                            <i>(consumption tax)</i>
                        </span>
                        <input type="text" name="expensetax"><c:out value="${_curr}"></c:out>
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>佣金1：</i>
                            <i>(commission1)</i>
                        </span>
                        <input type="text" name="cmsn1"><c:out value="${_curr}"></c:out>
                    </div><div>
                         <span>
                            <i>佣金2：</i>
                            <i>(commission2)</i>
                        </span>
                        <input type="text" name="cmsn2"><c:out value="${_curr}"></c:out>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金3：</i>
                            <i>(commission3)</i>
                        </span>
                        <input type="text" name="cmsn3"><c:out value="${_curr}"></c:out>
                    </div><div>
                         <span>
                            <i>佣金4：</i>
                            <i>(commission4)</i>
                        </span>
                        <input type="text" name="cmsn4"><c:out value="${_curr}"></c:out>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金5：</i>
                            <i>(commission5)</i>
                        </span>
                        <input type="text" name="cmsn5"><c:out value="${_curr}"></c:out>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用1：</i>
                            <i>(other cost1)</i>
                        </span>
                        <input type="text" name="other1"><c:out value="${_curr}"></c:out>
                    </div><div>
                         <span>
                            <i>其他费用2：</i>
                            <i>(other cost2)</i>
                        </span>
                        <input type="text" name="other2"><c:out value="${_curr}"></c:out>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用3：</i>
                            <i>(other cost3)</i>
                        </span>
                        <input type="text" name="other3"><c:out value="${_curr}"></c:out>
                    </div><div>
                         <span>
                            <i>其他费用4：</i>
                            <i>(other cost4)</i>
                        </span>
                        <input type="text" name="other4"><c:out value="${_curr}"></c:out>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用5：</i>
                            <i>(other cost5)</i>
                        </span>
                        <input type="text" name="other5"><c:out value="${_curr}"></c:out>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>运输费用：</i>
                            <i>(transport cost)</i>
                        </span>
                        <input type="text" name="transcost"><c:out value="${_curr}"></c:out>
                    </div><div>
                         <span>
                            <i>运输方名称：</i>
                            <i>(transport name)</i>
                        </span>
                        <input type="text" name="transname">
                    </div>
                </div>
                <div class="btn-box">
                    <a class="addgoon">
                        <i>继续添加</i>
                        <i>add</i>
                    </a>
                    <a class="delete">
                        <i>删除</i>
                        <i>delete</i>
                    </a>
                </div>
            </div></form></div>
</body></div>
<script type="text/javascript">
function needconfig(){
}
needconfig.prototype = {
  constructor:needconfig,id:"",
  config:"",
  outcolor:"",
  incolor:"",
  getConfig:function(){
    return this.config;
  },
  getOutcolor:function(){
    return this.outcolor;
  },
  getIncolor:function(){
    return this.incolor;
  }
}
var needconfigarr=[];var it;
<c:forEach var="item" items="${subneed}">
it=new needconfig();it.id="${item.id}";it.config="${item.config}";it.outcolor="${item.outcolor}";it.incolor="${item.incolor}";
needconfigarr.push(it);
</c:forEach>
    seajs.use("${scriptBasePath}/jnd/purchaseedit.js?r=<%=new Date()%>");
</script>