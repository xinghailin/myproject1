<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/jndapplypay.css" rel="stylesheet">
<input type="hidden" id="indexUrl" value="<ufa:url fieldName="jndcontractindex" namespace="car-ms"/>">
<input type="hidden" id="choosepurUrl" value="<ufa:url fieldName="jndPurchaseLstForContractIndex" namespace="car-ms"/>">
<input type="hidden" id="subpurUrl" value="<ufa:url fieldName="jndSubPurchaseForContractById" namespace="car-ms"/>">
<input type="hidden" id="spUrl" value="<ufa:url fieldName="jndSpLst" namespace="car-ms"/>">
<input type="hidden" id="userCountry" value="${userCountry}">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;"><head>
    <meta charset="UTF-8">
    <title>合同编辑提交审核</title>
</head>
<body>
<div class="box">
    <h2 class="buy-title">合同编辑提交审核</h2>
    <div class="content">
        <form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="jndContractsave"/>" enctype="multipart/form-data">
        <input type="hidden" id="currpage" name="currpage" value="${currpage}">
        <input type="hidden" name="subbuyid" id="subbuyid" value="${con.subbuyid}">
        <input type="hidden" name="buyid" id="buyid" value="${con.buyid}">
        <input type="hidden" name="id" id="idkey" value="${con.id}">
        <input type="hidden" id="activepurchaser" name="activepurchaser" value="${con.needer}">
        <input type="hidden" id="mallcode" name="mallcode" value="${con.mallContractCode}">
        <input type="hidden" id="sptype" value="${con.currency}">
        <input type="hidden" id="daicai" value="${con.selfbuy}">
        <c:if test="${con.selfbuy eq 1}"><c:set var="zicai" value="display:none;" /></c:if>
        <div class="rightbox" style="width: 100%;padding-left: 0px;border-left:0px;">
            <div class="right-title">
                <p><span>
                    <i>合同编号:</i>
                <i>(contract code)</i>
                </span><input id="contractcode" type="text" name="code" value="${con.code}" readonly="readonly" style="background-color: #ccc;width: 260px;">
                </p>
                <p>
                <span>
                    <i><label class="fc_red">*</label>采购文件上传:</i>
                    <i>(purchase file upload)</i>
                </span><input id="purfile" name="purfile" type="file"><a href="${contextPath}${con.purfile}" download="${con.purfilename}" style="text-decoration: underline;margin-left: 10px;color: #4d90fe;" title="点击下载">${con.purfilename}</a>
                </p>
                <p style="width: 80%;">
                <span>
                    <i><label class="fc_red">*</label>合同文件上传:</i>
                    <i>(contract file upload)</i>
                </span><input id="texturl" name="texturl" type="file"><a href="${contextPath}${con.texturl}" download="${con.texturlname}" style="text-decoration: underline;margin-left: 10px;color: #4d90fe;" title="点击下载">${con.texturlname}</a>
                </p>
            </div>
            <div class="right" style="padding-top: 5px;"><c:if test="${con.status == 2 or con.status == 5 or con.status == 8 or con.status == 10}"><c:set var="ableedit" value="1" /></c:if>
            <c:if test="${ableedit == 1}"><div class="brand">
                    <span style="width: 100%;margin-left: 15%;">
                        <a href="javascript:void(0);" id="choseBtn" class="addgoon">选择采购计划(choose purchase plan)</a>
                    </span>
                </div></c:if>
                <div class="detail">
                    <div>
                     <span>
                        <i>采购计划编号：</i>
                        <i>(purchase number)</i>
                    </span>
                    <span id="pcode">${con.purchaseCode}</span>   
                    </div><div><span>
                        <i>采购计划名称：</i>
                        <i>(purchase name)</i>
                    </span>
                    <span id="pname">${con.purchaseName}</span>
                </div>
                </div><div class="detail">
								<div><span> <i>主动采购方：</i> <i>(Active Purchaser)</i>
								</span> <span id="pactivepurchaser">${con.needer == '中国采购' ? '中国采购(China Sourcing)': con.needer == '海外采购' ? '海外采购(Overseas Sourcing)':con.needer == '商城采购' ? '商城采购(Online-Stores Sourcing)':''  }</span></div>
						</div><div style="font-weight:bold;margin-top: 5px;margin-bottom: 5px;">基本信息(Basic Information)</div>
                <div class="detail">
                    <div>
                         <span>
                            <i><label class="fc_red">*</label>供应方名称：</i>
                            <i>(Agent Name)</i>
                        </span>
                   <select id="psupplyname" name="sname">
                   <c:forEach var="ite" items="${splst}">
		             <option value="<c:out value="${ite.name}"></c:out>" <c:if test="${ite.name eq con.sname}">selected="selected"</c:if>><c:out value="${ite.name}"></c:out></option>
		           </c:forEach>
                   </select>
                    </div><div>
                         <span>
                            <i>供应方地址：</i>
                            <i>(Agent address)</i>
                        </span>
                        <input id="sadd" type="text" name="sadd" value="${con.sadd}">
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i><label class="fc_red">*</label>证件类型：</i>
                            <i>(ID Type)</i>
                        </span>
                        <input id="sidtype" type="text" name="sidtype" value="${con.sidtype}">
                    </div><div>
                         <span>
                            <i><label class="fc_red">*</label>证件号：</i>
                            <i>(ID No)</i>
                        </span>
                        <input id="sno" type="text" name="sno" value="${con.sno}">
                    </div>
                    
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>联系方式：</i>
                            <i>(Contact Phone No)</i>
                        </span>
                        <input id="sphone" type="text" name="sphone" value="${con.sphone}">
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i><label class="fc_red">*</label>采购方名称：</i>
                            <i>(Purchaser name)</i>
                        </span>
                        <input id="pname" type="text" name="pname" value="${con.pname}">
                    </div><div>
                         <span>
                            <i><label class="fc_red">*</label>采购方地址：</i>
                            <i>(Purchaser address)</i>
                        </span>
                        <input id="padd" type="text" name="padd" value="${con.padd}">
                    </div>
                    
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i><label class="fc_red">*</label>证件类型：</i>
                            <i>(ID Type)</i>
                        </span>
                        <input id="pidtype" type="text" name="pidtype" value="${con.pidtype}">
                    </div><div>
                         <span>
                            <i><label class="fc_red">*</label>证件号：</i>
                            <i>(ID No)</i>
                        </span>
                        <input id="pno" type="text" name="pno" value="${con.pno}">
                    </div>
                    
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>联系方式：</i>
                            <i>(Contact Phone No)</i>
                        </span>
                        <input id="pphone" type="text" name="pphone" value="${con.pphone}">
                    </div>
                </div><div style="font-weight:bold;margin-top: 5px;margin-bottom: 5px;">车辆描述(Vehicle Description)</div>
                <div class="detail">
                <div><span>
                        <i><label class="fc_red">*</label>品牌:</i>
                        <i>(brand)</i>
                    </span><span><input id="pbrand" type="text" name="brand" value="${con.brand}"></span>
                </div><div>
                    <span>
                        <i><label class="fc_red">*</label>型号:</i>
                        <i>(model)</i>
                    </span><span><input id="pmodel" type="text" name="model" value="${con.model}"></span></div></div><div class="detail"><div><span>
                        <i>版别:</i>
                        <i>(version)</i>
                    </span><span><input id="pversion" type="text" name="version" value="${con.version}" style="width:400px;"></span>
                </div><div><span>
                        <i>排量:</i>
                        <i>(displacement)</i>
                    </span><span><input id="displacement" type="text" name="displacement" value="${con.displacement}"></span>
                </div></div>
                <div class="info">
                    <div class="set">
                        <span>
                            <i><label class="fc_red">*</label>配置：</i>
                            <i>(Configuration)</i>
                        </span>
                        <textarea id="pconfig" name="config">${con.config}</textarea>
                    </div>
                    <div class="color">
                        <div>
                            <span>
                            <i><label class="fc_red">*</label>外观颜色：</i>
                            <i>(Exterior Color)</i>
                            </span>
                            <input id="outcolor" type="text" name="outcolor" value="${con.outcolor}">
                        </div>
                        <div>
                            <span>
                            <i><label class="fc_red">*</label>内饰颜色：</i>
                            <i>(Interior Color)</i>
                        </span>
                            <input id="incolor" type="text" name="incolor" value="${con.incolor}">
                        </div>
                    </div>
                </div><div class="detail"><div>
                     <span>
                        <i>改装:</i>
                        <i>(Trim)</i>
                    </span><span><input id="trim" type="text" name="trim" value="${con.trim}"></span></div>
                    <div>
                    <span>
                            <i><label class="fc_red">*</label>数量：</i>
                            <i>(amount)</i>
                        </span>
                    <input id="pnum" type="text" name="num" value="${con.num}"></div>
                </div><div class="detail">
                <div><c:if test="${con.currency eq 1}"><c:set var="curr" value="加币(CAD)" /></c:if><c:if test="${con.currency eq 2}"><c:set var="curr" value="美元($)" /></c:if>
                    <span>
                        <i><label class="fc_red">*</label>价格:</i>
                        <i>(Price)</i>
                    </span><input id="ptotalprice" type="text" name="price" value="${con.price}"><label name="currency">${curr}</label>
                </div></div>
                <div class="detail">
                    <div>
                         <span>
                            <i>货物运送地点：</i>
                            <i>(delivery address)</i>
                        </span>
                   <select id="apponitadd" name="apponitadd">
                   <c:forEach var="ite" items="${stores}">
		             <option value="<c:out value="${ite.id}"></c:out>" <c:if test="${ite.id eq con.apponitadd}">selected="selected"</c:if>><c:out value="${ite.name}"></c:out></option>
		           </c:forEach>
                   </select>
                    </div><div>
                         <span>
                            <i><label class="fc_red">*</label>约定入库时间：</i>
                            <i>(Scheduled delivery)</i>
                        </span>
                        <input id="appointtime" name="appointtime" type="text" placeholder="请选择时间" readonly="readonly" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${con.appointtime}"/>">
                    </div>
                </div>
                <div class="detail">
                    <div>
                          <span>
                            <i>运输方名称：</i>
                            <i>(Shipping name)</i>
                        </span>
                        <input id="transname" type="text" name="transname" value="${con.transname}">
                    </div><div>
                          <span>
                            <i>运输费用：</i>
                            <i>(Shipping Fee)</i>
                        </span>
                        <input id="transprice" type="text" name="transprice" value="${con.transprice}"><label name="currency">${curr}</label>
                    </div>
                </div><div class="detail">
                    <div class="selfpur" style="${zicai}">
                          <span>
                            <i>4S店杂费：</i>
                            <i>(4S Shop Charges)</i>
                        </span>
                        <input id="othercost" type="text" name="othercost" value="${con.othercost}"><label name="currency"></label>
                    </div><div>
                          <span>
                            <i>消费税：</i>
                            <i>(Consumption Tax)</i>
                        </span>
                        <input id="expensetax" type="text" name="expensetax" value="${con.expensetax}"><label name="currency"></label>
                    </div>
                </div><div class="selfpur" style="${zicai}"><div class="detail">
                    <div>
                        <span>
                            <i>保险：</i>
                            <i>(Insurance)</i>
                        </span>
                        <input id="insurance" type="text" name="insurance" value="${con.insurance}"><label name="currency">${curr}</label>
                    </div><div>
                         <span>
                            <i>总加装费：</i>
                            <i>(Total Configuration Price)</i>
                        </span>
                        <input id="trimprice" type="text" name="trimprice" value="${con.trimprice}"><label name="currency">${curr}</label>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述1：</i>
                            <i>(config1 description)</i>
                        </span>
                        <input type="text" name="trim1" id="trim1" value="${con.trim1}">
                    </div><div>
                         <span>
                            <i>加装费1：</i>
                            <i>(config1 price)</i>
                        </span>
                        <input type="text" name="t1price" id="t1price" value="${con.t1price}">
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述2：</i>
                            <i>(config2 description)</i>
                        </span>
                        <input type="text" name="trim2" id="trim2" value="${con.trim2}">
                    </div><div>
                         <span>
                            <i>加装费2：</i>
                            <i>(config2 price)</i>
                        </span>
                        <input type="text" name="t2price" id="t2price" value="${con.t2price}">
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述3：</i>
                            <i>(config3 description)</i>
                        </span>
                        <input type="text" name="trim3" id="trim3" value="${con.trim3}">
                    </div><div>
                         <span>
                            <i>加装费3：</i>
                            <i>(config3 price)</i>
                        </span>
                        <input type="text" name="t3price" id="t3price" value="${con.t3price}">
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述4：</i>
                            <i>(config4 description)</i>
                        </span>
                        <input type="text" name="trim4" id="trim4" value="${con.trim4}">
                    </div><div>
                         <span>
                            <i>加装费4：</i>
                            <i>(config4 price)</i>
                        </span>
                        <input type="text" name="t4price" id="t4price" value="${con.t4price}">
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述5：</i>
                            <i>(config5 description)</i>
                        </span>
                        <input type="text" name="trim5" id="trim5" value="${con.trim5}">
                    </div><div>
                         <span>
                            <i>加装费5：</i>
                            <i>(config5 price)</i>
                        </span>
                        <input type="text" name="t5price" id="t5price" value="${con.t5price}">
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述6：</i>
                            <i>(config6 description)</i>
                        </span>
                        <input type="text" name="trim6" id="trim6" value="${con.trim6}">
                    </div><div>
                         <span>
                            <i>加装费6：</i>
                            <i>(config6 price)</i>
                        </span>
                        <input type="text" name="t6price" id="t6price" value="${con.t6price}">
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述7：</i>
                            <i>(config7 description)</i>
                        </span>
                        <input type="text" name="trim7" id="trim7" value="${con.trim7}">
                    </div><div>
                         <span>
                            <i>加装费7：</i>
                            <i>(config7 price)</i>
                        </span>
                        <input type="text" name="t7price" id="t7price" value="${con.t7price}">
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述8：</i>
                            <i>(config8 description)</i>
                        </span>
                        <input type="text" name="trim8" id="trim8" value="${con.trim8}">
                    </div><div>
                         <span>
                            <i>加装费8：</i>
                            <i>(config8 price)</i>
                        </span>
                        <input type="text" name="t8price" id="t8price" value="${con.t8price}">
                    </div>
                </div>
                <div class="detail">
                    <div>
                         <span>
                            <i>加装描述9：</i>
                            <i>(config9 description)</i>
                        </span>
                        <input type="text" name="trim9" id="trim9" value="${con.trim9}">
                    </div><div>
                         <span>
                            <i>加装费9：</i>
                            <i>(config9 price)</i>
                        </span>
                        <input type="text" name="t9price" id="t9price" value="${con.t9price}">
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述10：</i>
                            <i>(config10 description)</i>
                        </span>
                        <input type="text" name="trim10" id="trim10" value="${con.trim10}">
                    </div><div>
                         <span>
                            <i>加装费10：</i>
                            <i>(config10 price)</i>
                        </span>
                        <input type="text" name="t10price" id="t10price" value="${con.t10price}">
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述11：</i>
                            <i>(config11 description)</i>
                        </span>
                        <input type="text" name="trim11" id="trim11" value="${con.trim11}">
                    </div><div>
                         <span>
                            <i>加装费11：</i>
                            <i>(config11 price)</i>
                        </span>
                        <input type="text" name="t11price" id="t11price" value="${con.t11price}">
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>加装描述12：</i>
                            <i>(config12 description)</i>
                        </span>
                        <input type="text" name="trim12" id="trim12" value="${con.trim12}">
                    </div><div>
                         <span>
                            <i>加装费12：</i>
                            <i>(config12 price)</i>
                        </span>
                        <input type="text" name="t12price" id="t12price" value="${con.t12price}">
                    </div>
                </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金1：</i>
                            <i>(commission1)</i>
                        </span>
                        <input type="text" name="cmsn1" id="cmsn1" value="${con.cmsn1}"><label name="currency">${curr}</label>
                    </div><div>
                         <span>
                            <i>佣金2：</i>
                            <i>(commission2)</i>
                        </span>
                        <input type="text" name="cmsn2" id="cmsn2" value="${con.cmsn2}"><label name="currency">${curr}</label>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>佣金3：</i>
                            <i>(commission3)</i>
                        </span>
                        <input type="text" name="cmsn3" id="cmsn3" value="${con.cmsn3}"><label name="currency">${curr}</label>
                    </div><div>
                         <span>
                            <i>佣金4：</i>
                            <i>(commission4)</i>
                        </span>
                        <input type="text" name="cmsn4" id="cmsn4" value="${con.cmsn4}"><label name="currency">${curr}</label>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用1：</i>
                            <i>(other Fee1)</i>
                        </span>
                        <input type="text" name="other1" id="other1" value="${con.other1}"><label name="currency">${curr}</label>
                    </div><div>
                         <span>
                            <i>其他费用2：</i>
                            <i>(other Fee2)</i>
                        </span>
                        <input type="text" name="other2" id="other2" value="${con.other2}"><label name="currency">${curr}</label>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i>其他费用3：</i>
                            <i>(other Fee3)</i>
                        </span>
                        <input type="text" name="other3" id="other3" value="${con.other3}"><label name="currency">${curr}</label>
                    </div><div>
                         <span>
                            <i>其他费用4：</i>
                            <i>(other Fee4)</i>
                        </span>
                        <input type="text" name="other4" id="other4" value="${con.other4}"><label name="currency">${curr}</label>
                    </div>
                </div><div id="prediv" style="<c:if test="${!('1' eq con.selfbuy)}">display: none;</c:if>">
						<div class="detail">
								<div><span> <i>预估保险费：</i> <i>(forecast insurance price)</i>
								</span> <input type="text" name="preinsuranceprice" id="preinsuranceprice" value="${con.preinsuranceprice}"><label name="currency">${curr}</label></div>
							<div><span> <i>预估短驳费：</i> <i>(forecast drayage price)</i>
								</span> <input type="text" name="predrayageprice" id="predrayageprice" value="${con.predrayageprice}"><label name="currency">${curr}</label></div>
						</div>
						<div class="detail">
								<div><span> <i>预估执照费：</i> <i>(forecast license price)</i>
								</span> <input type="text" name="prelicenseprice" id="prelicenseprice" value="${con.prelicenseprice}"><label name="currency">${curr}</label></div>
							<div><span> <i>预估燃油费：</i> <i>(forecast oil price)</i>
								</span> <input type="text" name="preoilprice" id="preoilprice" value="${con.preoilprice}"><label name="currency">${curr}</label></div>
						</div></div><div style="font-weight:bold;margin-top: 5px;margin-bottom: 5px;">合同支付概述(Contract Payment Summarize)</div><div class="detail">
                    <div style="width: 100%;">
                         <span>
                            <i><label class="fc_red">*</label>合同总金额：</i>
                            <i>(Contract Total Amount)</i>
                        </span><input type="hidden" name="autotprice" id="autotprice" value="${con.autotprice}">
                        <input type="text" name="totalprice" id="totalprice" value="${con.totalprice}"><a href="javascript:void(0);" id="autocalc" class="btn63_01">自动计算(auto calc)</a>注：本合同涉及的所有金额单位均为(all monetary unit of the contract is):<label name="currency" id="moneyunit">${curr}</label>
                    </div>
                </div><div class="detail">
                    <div>
                         <span>
                            <i><label class="fc_red">*</label>是否定金：</i>
                            <i>(Is Down Payment)</i>
                        </span>
                        <input type="radio" name="paytype" value="1" <c:if test="${con.paytype eq 1}">checked="checked"</c:if>>否(No)<input type="radio" name="paytype" value="2" style="margin-left: 33px;" <c:if test="${con.paytype eq 2}">checked="checked"</c:if>>是(Yes)
                    </div>
                    <c:if test="${con.paytype eq 2}">
                    <div id="selfbuy">
                         <span>
                            <i><label class="fc_red">*</label>采购方式：</i>
                            <i>(Purchase Type)</i>
                        </span>
                        <input type="radio" name="selfbuy" value="1" <c:if test="${con.selfbuy eq 1}">checked="checked"</c:if>>自采<input type="radio" name="selfbuy" value="2" style="margin-left: 33px;" <c:if test="${con.selfbuy eq 2}">checked="checked"</c:if>>代采
                    </div></c:if>
                    <c:if test="${con.paytype eq 1}">
                    <div id="selfbuy" style="display: none;">
                         <span>
                            <i><label class="fc_red">*</label>采购方式：</i>
                            <i>(Purchase Type)</i>
                        </span>
                        <input type="radio" name="selfbuy" value="1">自采(self-served)<input type="radio" name="selfbuy" value="2" style="margin-left: 33px;">代采(agency-purchase)
                    </div></c:if>
                </div><div class="detail" id="downfinal" <c:if test="${con.paytype eq 1}">style="display: none;"</c:if>>
                <div>
                         <span>
                            <i>定金：</i>
                            <i>(Down Payment)</i>
                        </span>
                        <input type="text" name="downpay" id="downpay" value="${con.downpay}"><label name="currency">${curr}</label>
                    </div><div>
                         <span>
                            <i>尾款：</i>
                            <i>(Final Payment)</i>
                        </span>
                        <input type="text" name="finalpay" id="finalpay" value="${con.finalpay}"><label name="currency">${curr}</label>
                    </div>
                </div><div class="detail">
                <div><span> <i>开证价：</i> <i>(Issuing Price)</i>
								</span> <input type="text" name="issuingprice" id="issuingprice" value="${con.issuingprice}"><label name="currency">${curr}</label></div>
                <div class="set">
                    <span>
                        <i>备注:</i>
                        <i>(Remark)</i>
                    </span><span><textarea id="remark" name="remark">${con.remark}</textarea></span>
                </div></div><c:if test="${!empty con.rejectreason1 or !empty con.rejectreason2 or !empty con.rejectreason3}"><div class="detail">
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
                </div></div></c:if><div class="detail">
                <div>
                    <span>
                        <i>合同状态:</i>
                        <i>(Contract Status)</i>
                    </span><span><c:choose>  
                    <c:when test="${empty con.status}">待审核(pending)</c:when>
                    <c:when test="${con.status eq '1'}">采购通过(purchase approved)</c:when>
                    <c:when test="${con.status eq '2'}">采购修改(purchase modification)</c:when>
                    <c:when test="${con.status eq '3'}">采购不通过(purchase unapproved)</c:when>
                    <c:when test="${con.status eq '4'}">法务通过(legal approved)</c:when>
                    <c:when test="${con.status eq '5'}">法务修改(legal modification)</c:when>
                    <c:when test="${con.status eq '6'}">法务不通过(legao unapproved)</c:when>
                    <c:when test="${con.status eq '7'}">全通过(full approval)</c:when>
                    <c:when test="${con.status eq '8'}">财务修改(financial modification)</c:when>
                    <c:when test="${con.status eq '9'}">财务不通过(financial unapproved)</c:when>
                    <c:when test="${con.status eq '10'}">已撤销(undone)</c:when>
                    </c:choose></span>
                </div></div><div class="detail">
                <div style="width: 33%;"><label>采购审核(Purchase Audit):</label>
                    <span>${con.auditer1}&nbsp;<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${con.auditime1}"/></span>
                </div><div style="width: 33%;"><label>法务审核(Law Audit):</label>
                    <span>${con.auditer2}&nbsp;<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${con.auditime2}"/></span>
                </div><div style="width: 33%;"><label>财务审核(Finance Audit):</label>
                    <span>${con.auditer3}&nbsp;<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${con.auditime3}"/></span>
                </div></div>
                </div>
            </div></form>
    </div>
    <div class="sell-button"><c:if test="${ableedit == 1}"><a href="javascript:void(0);" id="saveBtn">提交(submit)</a></c:if>
        <a href="javascript:void(0);" id="cancelBtn" style="color: #666;">返回(back)</a>
    </div></div>
</body></div>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/jnd/contractadd.js?r=<%=new Date()%>");
</script>