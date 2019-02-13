<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/common/car.css" rel="stylesheet">
<input type="hidden" id="saveUrl" value="<ufa:url fieldName="CARTYPE_EDITDO" namespace="car-ms"/>">
<input type="hidden" id="uploadUrl" value="<ufa:url fieldName="FILEUPLOAD" namespace="car-ms"/>">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="CARTYPE_INDEX" namespace="car-ms"/>">
<input type="hidden" id="versionUrl" value="<ufa:url fieldName="QUERY_VERSION" namespace="car-ms"/>">
<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
	<div class="box">
    <div class="new-top">
        <span>编辑车型</span>
    </div>
    <form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="CARTYPE_EDITDO"/>">
    <input type="hidden" name="id" value="${ct.id}" />
    <div class="new-list">
        <div class="tab_txt01">
        <input type="hidden" id="currpage" name="currpage" value="${currpage }"/>
	        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>品牌：</span>
	  	  	<span style="line-height: 35px;width:200px;">${ct.brand}</span>
	  	  	
	  	  	<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>型号：</span>
		       <span style="line-height: 35px;margin-top: 8px;width:200px;"> 
		  	  	<select id="model" name="model" style="line-height: 35px;width:172px;">
		  	  	<option value=''>--请选择--</option>
		  	  	 <c:forEach var="item" items="${model}">  
			             <option value="<c:out value="${item.model}"></c:out>" <c:if test="${item.model eq ct.model}">selected="selected"</c:if>><c:out value="${item.model}"></c:out></option>
			           </c:forEach>
		          </select>
		          </span>
		  	  	
		  	  	 <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>版别：</span>
		       <span style="line-height: 35px;margin-top: 8px;width:200px;"> 
		  	  	<select id="version" name="version" style="line-height: 35px;width:172px;">
		  	  	<option value=''>--请选择--</option>
		  	  	<c:forEach var="item" items="${version}">  
			             <option value="<c:out value="${item.version}"></c:out>" <c:if test="${item.version eq ct.version}">selected="selected"</c:if>><c:out value="${item.version}"></c:out></option>
			           </c:forEach>
		          </select>
		          </span>
		 </div>
		<div class="tab_txt01">
	        <span class="td_01" style="width: 120px;">0首期产品本金：</span>
	  	  	<span style="line-height: 35px;width:200px;"><input type="hidden" name="olddownPay" value="${ct.downPay}" />
	  	  	<input type="text" name="downPay" value="${ct.downPay}" />&nbsp;</span>
	        <span class="td_01" style="width: 120px;">车辆价格：</span>
	        <span style="line-height: 35px;width:200px;"><input type="text" name="firstMonthPay" value="${ct.firstMonthPay}" width="280px"/>&nbsp;</span>
	        <span class="td_01" style="width: 120px;">指导价：</span>
	        <span style="line-height: 35px;width:200px;"><input type="text" name="principal" value="${ct.principal}" width="280px"/>&nbsp;</span>
		 </div>
		 <div class="tab_txt01">
	        <span class="td_01" style="width: 120px;">首付：</span>
	  	  	<span style="line-height: 35px;width:200px;"><input type="text" name="firstpay" value="${ct.firstpay}" width="280px"/>&nbsp;</span>
	  	  	<span class="td_01" style="width: 120px;">利率：</span>
	  	  	<span style="line-height: 35px;width:200px;"><input type="text" name="rate" value="${ct.rate}" />&nbsp;</span>
	        <span class="td_01" style="width: 120px;">期数：</span>
	        <span style="line-height: 35px;width:200px;"><input type="text" name="periodNum"  value="${ct.periodNum}" width="280px"/>&nbsp;</span>
		  <%-- <span class="td_01" style="width: 120px;">第一月月供：</span>
	  	  	<span style="line-height: 35px;width:200px;"><input type="text" name="oneMonthPay"  value="${ct.oneMonthPay}" width="280px"/>&nbsp;</span>
		 <span class="td_01" style="width: 120px;">第二月月供：</span>
	  	  	<span style="line-height: 35px;width:200px;"><input type="text" name="everyMonthPay"  value="${ct.everyMonthPay}" width="280px"/>&nbsp;</span>
		 <span class="td_01" style="width: 120px;">后三年尾款：</span>
	  	  	<span style="line-height: 35px;width:200px;"><input type="text" name="finalPayment"  value="${ct.finalPayment}" width="280px"/>&nbsp;</span> --%>
		 </div>	
		   <%-- <div class="tab_txt01">
		   <span class="td_01" style="width: 120px;">第十三月月供：</span>
	  	  	<span style="line-height: 35px;width:200px;"><input type="text" name="thirteenthMonthPay"  value="${ct.thirteenthMonthPay}" width="280px"/>&nbsp;</span>
		   <span class="td_01" style="width: 120px;">第十四月月供：</span>
	  	  	<span style="line-height: 35px;width:200px;"><input type="text" name="fourteenthMonthPay"  value="${ct.fourteenthMonthPay}" width="280px"/>&nbsp;</span>
		   </div> --%>
    </div>
    <div class="list-img">
        <div class="feng-img">
            <p>封面图片</p>
            <ul>
                <li>
                    <span>点击上传</span>
                    <img src="${contextPath}${ct.coverPic}" id="coverPicImg">
                    <input type="file" id="coverPicFile" name="coverPicFile" onchange="imagePreview(this.files,'coverPicImg','coverPicFile','coverPicHide')">
                    <input type="hidden" name="coverPic" id="coverPicHide" value="${ct.coverPic}" />
                </li>
            </ul>
        </div>
        <div class="out-img">
            <p>外观图片</p>
            <ul>
            <c:forEach var="item" items="${outLst}" varStatus="ss"> 
                <li>
                    <span>点击上传</span>
                    <img src="${contextPath}${item.pic}" alt="" id="${ss.index+1}outpicImg">
                    <input type="file" id="${ss.index+1}outpicFile" name="${ss.index+1}outpicFile" onchange="imagePreview(this.files,'${ss.index+1}outpicImg','${ss.index+1}outpicFile','${ss.index+1}outpicHide')">
                    <input type="hidden" name="outpic" id="${ss.index+1}outpicHide" value="${item.pic}"/>
                </li>
            </c:forEach>
            <c:forEach var="item" begin="${outBegin}" end="8" varStatus="ss" step="1">  
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="${item}outpicImg">
                    <input type="file" id="${item}outpicFile" name="${item}outpicFile" onchange="imagePreview(this.files,'${item}outpicImg','${item}outpicFile','${item}outpicHide')">
                    <input type="hidden" name="outpic" id="${item}outpicHide"/>
                </li>
            </c:forEach>    
            </ul>
        </div>
        <div class="inner-img">
            <p>内饰图片</p>
            <ul>
            <c:forEach var="item" items="${inLst}" varStatus="ss"> 
                <li>
                    <span>点击上传</span>
                    <img src="${contextPath}${item.pic}" alt="" id="${ss.index+1}inpicImg">
                    <input type="file" id="${ss.index+1}inpicFile" name="${ss.index+1}inpicFile" onchange="imagePreview(this.files,'${ss.index+1}inpicImg','${ss.index+1}inpicFile','${ss.index+1}inpicHide')">
                    <input type="hidden" name="inpic" id="${ss.index+1}inpicHide" value="${item.pic}"/>
                </li>
            </c:forEach>
            <c:forEach var="item" begin="${inBegin}" end="8" varStatus="ss" step="1">  
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="${item}inpicImg">
                    <input type="file" id="${item}inpicFile" name="${item}inpicFile" onchange="imagePreview(this.files,'${item}inpicImg','${item}inpicFile','${item}inpicHide')">
                    <input type="hidden" name="inpic" id="${item}inpicHide"/>
                </li>
            </c:forEach> 
            </ul>
        </div>
        <div class="small-img">
            <p>细节图片</p>
            <ul>
            <c:forEach var="item" items="${detailLst}" varStatus="ss"> 
                <li>
                    <span>点击上传</span>
                    <img src="${contextPath}${item.pic}" alt="" id="${ss.index+1}detailpicImg">
                    <input type="file" id="${ss.index+1}detailpicFile" name="${ss.index+1}detailpicFile" onchange="imagePreview(this.files,'${ss.index+1}detailpicImg','${ss.index+1}detailpicFile','${ss.index+1}detailpicHide')">
                    <input type="hidden" name="detailpic" id="${ss.index+1}detailpicHide" value="${item.pic}"/>
                </li>
            </c:forEach>
            <c:forEach var="item" begin="${detailBegin}" end="8" varStatus="ss" step="1">  
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="${item}detailpicImg">
                    <input type="file" id="${item}detailpicFile" name="${item}detailpicFile" onchange="imagePreview(this.files,'${item}detailpicImg','${item}detailpicFile','${item}detailpicHide')">
                    <input type="hidden" name="detailpic" id="${item}detailpicHide"/>
                </li>
            </c:forEach>
            </ul>
        </div>
    </div>
    <div class="new-message">
        <ul class="mes-tab">
            <li class="tab-config">
                <span>车辆信息</span>
                <div style="display: block"></div>
            </li>
            <li class="tab-details">
                <span>详细配置</span>
                <div></div>
            </li>
        </ul>
        <ul class="mes-son-tab">
            <li class="mes-config">
                <div class="config-ligth">
<c:forEach var="item" items="${lightLst}" varStatus="ss"> 
<div class="ligth-list">
                        <div>
                            <span>点击上传</span>
<img src="${contextPath}${item.pic}" alt="" id="${ss.index+1}lightpicImg">
<input type="file" id="${ss.index+1}lightpicFile" name="${ss.index+1}lightpicFile" onchange="imagePreview(this.files,'${ss.index+1}lightpicImg','${ss.index+1}lightpicFile','${ss.index+1}lightpicHide')">
<input type="hidden" name="lightpic" id="${ss.index+1}lightpicHide" value="${item.pic}"/>
                        </div>
                        <p class="ligth-list-title">
                            <span>标题：</span>
                            <input type="text" value="${item.title}" name="title">
                        </p>
                        <textarea class="ligth-list-summary" name="content" >${item.content}</textarea>
                    </div>
</c:forEach>
<c:forEach var="item" begin="${lightBegin}" end="4" varStatus="ss" step="1">  
<div class="ligth-list">
    <div><span>点击上传</span>
    <img src="" alt="" id="${item}lightpicImg">
<input type="file" id="${item}lightpicFile" name="${item}lightpicFile" onchange="imagePreview(this.files,'${item}lightpicImg','${item}lightpicFile','${item}lightpicHide')">
<input type="hidden" name="lightpic" id="${item}lightpicHide"/></div><p class="ligth-list-title">
                            <span>标题：</span>
                            <input type="text" value="" name="title">
                        </p>
                        <textarea class="ligth-list-summary" name="content" ></textarea>
                    </div>
</c:forEach>  
                </div>
            </li>
            <li class="mes-details">
                <div class="details-box">
                    <div class="details-item">
                        <div class="details-item_title">
                            <span>车身配置</span>
                            <i class="icon"></i>
                        </div>
                        <ul class="item-info">
                        <li>
                                <span>车身结构:</span>
                                <input type="text" name="structure" value="${ct.structure}">
                            </li>
                            <li>
                                <span>长*宽*高（mm）:</span>
                                <input type="text" name="lwh" value="${ct.lwh}">
                            </li>
                            <li>
                                <span>发动机:</span>
                                <input type="text" name="engine" value="${ct.engine}">
                            </li>
                            <li>
                                <span>变速箱:</span>
                                <input type="text" name="gearbox" value="${ct.gearbox}">
                            </li>
                            <li>
                                <span>驱动方式:</span>
                                <input type="text" name="driveT" value="${ct.driveT}">
                            </li>
                            <li>
                                <span>燃料形式:</span>
                                <input type="text" name="fuelT" value="${ct.fuelT}">
                            </li>
                            <li>
                                <span>综合耗油:</span>
                                <input type="text" name="oilWear" value="${ct.oilWear}">
                            </li>
                            <li>
                                <span>车辆配色:</span>
                                <input type="text" name="color" value="${ct.color}">
                            </li>
                            <li>
                                <span>轴距:</span>
                                <input type="text" name="wheelBase" value="${ct.wheelBase}">
                            </li>
                            <li>
                                <span>前轮距（mm）:</span>
                                <input type="text" name="frontSpan" value="${ct.frontSpan}">
                            </li>
                            <li>
                                <span>后轮距（mm）:</span>
                                <input type="text" name="rearSpan" value="${ct.rearSpan}">
                            </li>
                            <li>
                                <span>最小离地间隙（mm）:</span>
                                <input type="text" name="minClearance" value="${ct.minClearance}">
                            </li>
                            <li>
                                <span>整车质量（kg）:</span>
                                <input type="text" name="weight" value="${ct.weight}">
                            </li>
                            <li>
                                <span>车门数（个）:</span>
                                <input type="text" name="doorNum" value="${ct.doorNum}">
                            </li>
                            <li>
                                <span>座位数（个）:</span>
                                <input type="text" name="seatNum" value="${ct.seatNum}">
                            </li>
                            <li>
                                <span>油箱容积（L）:</span>
                                <input type="text" name="fuelTankVol" value="${ct.fuelTankVol}">
                            </li>
                            <li>
                                <span>行李厢容积（L）:</span>
                                <input type="text" name="trunkVol" value="${ct.trunkVol}">
                            </li>
                        </ul>
                    </div>
                    <div class="details-item">
                        <div class="details-item_title">
                            <span>发动机配置</span>
                            <i class="icon"></i>
                        </div>
                        <ul class="item-info">
                            <li>
                                <span>发动机型号:</span>
                                <input type="text" name="engineT" value="${ct.engineT}">
                            </li>
                            <li>
                                <span>排量:</span>
                                <input type="text" name="displacement" value="${ct.displacement}">
                            </li>
                            <li>
                                <span>进气形式:</span>
                                <input type="text" name="inairType" value="${ct.inairType}">
                            </li>
                            <li>
                                <span>气缸排列形式:</span>
                                <input type="text" name="airCylinderArr" value="${ct.airCylinderArr}">
                            </li>
                            <li>
                                <span>气缸数（个）:</span>
                                <input type="text" name="airCyNum" value="${ct.airCyNum}">
                            </li>
                            <li>
                                <span>每缸气门数（个）:</span>
                                <input type="text" name="airDoorsPerCy" value="${ct.airDoorsPerCy}">
                            </li>
                            <li>
                                <span>缸径（mm）:</span>
                                <input type="text" name="cySpan" value="${ct.cySpan}">
                            </li>
                            <li>
                                <span>行程（mm）:</span>
                                <input type="text" name="cyDistance" value="${ct.cyDistance}">
                            </li>
                            <li>
                                <span>最大马力（Ps）:</span>
                                <input type="text" name="maxPower" value="${ct.maxPower}">
                            </li>
                            <li>
                                <span>最大功率（kW）:</span>
                                <input type="text" name="maxWork" value="${ct.maxWork}">
                            </li>
                            <li>
                                <span>最大功率转速（rpm）:</span>
                                <input type="text" name="maxWorkRotate" value="${ct.maxWorkRotate}">
                            </li>
                            <li>
                                <span>最大扭矩（N·m）:</span>
                                <input type="text" name="maxTorque" value="${ct.maxTorque}">
                            </li>
                            <li>
                                <span>最大扭矩转速（rpm）:</span>
                                <input type="text" name="maxTorqueRotate" value="${ct.maxTorqueRotate}">
                            </li>
                            <li>
                                <span>发动机特有技术:</span>
                                <input type="text" name="engineSpecialTech" value="${ct.engineSpecialTech}">
                            </li>
                            <li>
                                <span>燃油标号:</span>
                                <input type="text" name="fuelFlag" value="${ct.fuelFlag}">
                            </li>
                            <li>
                                <span>供油方式:</span>
                                <input type="text" name="supplyFuelT" value="${ct.supplyFuelT}">
                            </li>
                            <li>
                                <span>缸盖材料:</span>
                                <input type="text" name="cyCoverMaterial" value="${ct.cyCoverMaterial}">
                            </li>
                            <li>
                                <span>缸体材料:</span>
                                <input type="text" name="cyTrunkMaterial" value="${ct.cyTrunkMaterial}">
                            </li>
                            <li>
                                <span>环保标准:</span>
                                <input type="text" name="envirProtect" value="${ct.envirProtect}">
                            </li>
                        </ul>
                    </div>
                    <div class="details-item">
                        <div class="details-item_title">
                            <span>变速箱配置</span>
                            <i class="icon"></i>
                        </div>
                        <ul class="item-info">
                            <li>
                                <span>档位个数:</span>
                                <input type="text" name="gearsNum" value="${ct.gearsNum}">
                            </li>
                            <li>
                                <span>变速箱类型:</span>
                                <input type="text" name="gearboxT" value="${ct.gearboxT}">
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="details-box">
                    <div class="details-item">
                        <div class="details-item_title">
                            <span>底盘转向</span>
                            <i class="icon"></i>
                        </div>
                        <ul class="item-info">
                            <li>
                                <span>四驱形式:</span>
                                <input type="text" name="fourdrivet" value="${ct.fourdrivet}">
                            </li>
                            <li>
                                <span>中央差速器结构:</span>
                                <input type="text" name="centerdiffstru" value="${ct.centerdiffstru}">
                            </li>
                            <li>
                                <span>前悬架类型:</span>
                                <input type="text" name="frontframet" value="${ct.frontframet}">
                            </li>
                            <li>
                                <span>后悬架类型:</span>
                                <input type="text" name="rearframet" value="${ct.rearframet}">
                            </li>
                            <li>
                                <span>助力类型:</span>
                                <input type="text" name="assistpowert" value="${ct.assistpowert}">
                            </li>
                            <li>
                                <span>车体结构:</span>
                                <input type="text" name="trunkstruc" value="${ct.trunkstruc}">
                            </li>
                        </ul>
                    </div>
                    <div class="details-item">
                        <div class="details-item_title">
                            <span>车轮制动</span>
                            <i class="icon"></i>
                        </div>
                        <ul class="item-info">
                            <li>
                                <span>前制动器类型:</span>
                                <input type="text" value="${ct.frontbraket}" name="frontbraket">
                            </li>
                            <li>
                                <span>后制动器类型:</span>
                                <input type="text" value="${ct.rearbraket}" name="rearbraket">
                            </li>
                            <li>
                                <span>驻车制动类型:</span>
                                <input type="text" value="${ct.parkingbraket}" name="parkingbraket">
                            </li>
                            <li>
                                <span>前轮胎规格:</span>
                                <input type="text" value="${ct.frontwheelspe}" name="frontwheelspe">
                            </li>
                            <li>
                                <span>后轮胎规格:</span>
                                <input type="text" value="${ct.rearwheelspe}" name="rearwheelspe">
                            </li>
                            <li>
                                <span>备胎规格:</span>
                                <input type="text" value="${ct.readywheelspe}" name="readywheelspe">
                            </li>
                        </ul>
                    </div>
                    <div class="details-item">
                        <div class="details-item_title">
                            <span>安全装备</span>
                            <i class="icon"></i>
                        </div>
                        <ul class="item-info">
                            <li>
                                <span>主驾驶座安全气囊:</span>
                                <input type="radio" name="mainsafeair" value="1" <c:if test="${ct.mainsafeair eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="mainsafeair" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>副驾驶座安全气囊:</span>
                                <input type="radio" name="sidesafeair" value="1" <c:if test="${ct.sidesafeair eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="sidesafeair" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>前排侧气囊:</span>
                                <input type="radio" name="frontsideair" value="1" <c:if test="${ct.frontsideair eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="frontsideair" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后排侧气囊:</span>
                                <input type="radio" name="rearsizeair" value="1" <c:if test="${ct.rearsizeair eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="rearsizeair" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>前排头部气囊（气帘）:</span>
                                <input type="radio" name="frontheadair" value="1" <c:if test="${ct.frontheadair eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="frontheadair" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后排头部气囊（气帘）:</span>
                                <input type="radio" name="rearheadair" value="1" <c:if test="${ct.rearheadair eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="rearheadair" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>膝部气囊:</span>
                                <input type="radio" name="kneeair" value="1" <c:if test="${ct.kneeair eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="kneeair" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>胎压监测装置:</span>
                                <input type="radio" name="tireprescheck" value="1" <c:if test="${ct.tireprescheck eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="tireprescheck" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>零胎压继续行驶:</span>
                                <input type="radio" name="zerotirepresdrive" value="1" <c:if test="${ct.zerotirepresdrive eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="zerotirepresdrive" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>安全带未系提示:</span>
                                <input type="radio" name="safebeltnotice" value="1" <c:if test="${ct.safebeltnotice eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="safebeltnotice" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>ISOFIX儿童座椅接口:</span>
                                <input type="radio" name="isofix" value="1" <c:if test="${ct.isofix eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="isofix" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>发动机电子防盗:</span>
                                <input type="radio" name="enginestopsteal" value="1" <c:if test="${ct.enginestopsteal eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="enginestopsteal" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>车内中控锁:</span>
                                <input type="radio" name="insidecenterlock" value="1" <c:if test="${ct.insidecenterlock eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="insidecenterlock" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>遥控钥匙:</span>
                                <input type="radio" name="controkey" value="1" <c:if test="${ct.controkey eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="controkey" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>无钥匙启动系统:</span>
                                <input type="radio" name="startnokey" value="1" <c:if test="${ct.startnokey eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="startnokey" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>无钥匙进入系统:</span>
                                <input type="radio" name="enternokey" value="1" <c:if test="${ct.enternokey eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="enternokey" value="">
                                <i>无</i>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="details-box">
                    <div class="details-item">
                        <div class="details-item_title">
                            <span>操控配置</span>
                            <i class="icon"></i>
                        </div>
                        <ul class="item-info">
                            <li>
                                <span>ABS防抱死:</span>
                                <input type="radio" name="antiblocking" value="1" <c:if test="${ct.antiblocking eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="antiblocking" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>制动力分配（EBD/CBC等）:</span>
                                <input type="radio" name="brakeallot" value="1" <c:if test="${ct.brakeallot eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="brakeallot" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>刹车辅助（EBA/BAS/BA等）:</span>
                                <input type="radio" name="brakeassist" value="1" <c:if test="${ct.brakeassist eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="brakeassist" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>牵引力控制（ASR/TCS/TRC等）:</span>
                                <input type="radio" name="pullcontrol" value="1" <c:if test="${ct.pullcontrol eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="pullcontrol" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>车身稳定控制（ESC/ESP/DSC等）:</span>
                                <input type="radio" name="trunkholdcontrol" value="1" <c:if test="${ct.trunkholdcontrol eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="trunkholdcontrol" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>上坡辅助:</span>
                                <input type="radio" name="uphillassist" value="1" <c:if test="${ct.uphillassist eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="uphillassist" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>自动驻车:</span>
                                <input type="radio" name="autoparking" value="1" <c:if test="${ct.autoparking eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="autoparking" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>陡坡缓降:</span>
                                <input type="radio" name="steephillslow" value="1" <c:if test="${ct.steephillslow eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="steephillslow" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>可变悬架:</span>
                                <input type="radio" name="changeframe" value="1" <c:if test="${ct.changeframe eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="changeframe" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>空气悬架:</span>
                                <input type="radio" name="airframe" value="1" <c:if test="${ct.airframe eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="airframe" value="">
                                <i>无</i>
                            </li>
                        </ul>
                    </div>
                    <div class="details-item">
                        <div class="details-item_title">
                            <span>外部配置</span>
                            <i class="icon"></i>
                        </div>
                        <ul class="item-info">
                            <li>
                                <span>电动天窗:</span>
                                <input type="radio" name="elecskywin" value="1" <c:if test="${ct.elecskywin eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="elecskywin" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>全景天窗:</span>
                                <input type="radio" name="widewin" value="1" <c:if test="${ct.widewin eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="widewin" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>运动外观套件:</span>
                                <input type="radio" name="sportextend" value="1" <c:if test="${ct.sportextend eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="sportextend" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>铝合金轮圈:</span>
                                <input type="radio" name="lvhejintire" value="1" <c:if test="${ct.lvhejintire eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="lvhejintire" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>电动吸合门:</span>
                                <input type="radio" name="elecdoor" value="1" <c:if test="${ct.elecdoor eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="elecdoor" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>侧滑门:</span>
                                <input type="radio" name="sideslidedoor" value="1" <c:if test="${ct.sideslidedoor eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="sideslidedoor" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>电动后备厢:</span>
                                <input type="radio" name="elecbackvan" value="1" <c:if test="${ct.elecbackvan eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="elecbackvan" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>感应后备厢:</span>
                                <input type="radio" name="feelbackvan" value="1" <c:if test="${ct.feelbackvan eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="feelbackvan" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>车顶行李架:</span>
                                <input type="radio" name="roofrack" value="1" <c:if test="${ct.roofrack eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="roofrack" value="">
                                <i>无</i>
                            </li>
                        </ul>
                    </div>
                    <div class="details-item">
                        <div class="details-item_title">
                            <span>内部配置</span>
                            <i class="icon"></i>
                        </div>
                        <ul class="item-info">
                            <li>
                                <span>真皮方向盘:</span>
                                <input type="radio" name="realfursteering" value="1" <c:if test="${ct.realfursteering eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="realfursteering" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>方向盘调节:</span>
                                <input type="text" value="${ct.steeringadjust}" name="steeringadjust">
                            </li>
                            <li>
                                <span>方向盘电动调节:</span>
                                <input type="radio" name="steeringeleca" value="1" <c:if test="${ct.steeringeleca eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="steeringeleca" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>多功能方向盘:</span>
                                <input type="radio" name="multifunsteering" value="1" <c:if test="${ct.multifunsteering eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="multifunsteering" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>方向盘换挡:</span>
                                <input type="radio" name="steeringshift" value="1" <c:if test="${ct.steeringshift eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="steeringshift" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>方向盘加热:</span>
                                <input type="radio" name="steeringhot" value="1" <c:if test="${ct.steeringhot eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="steeringhot" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>定速巡航:</span>
                                <input type="radio" name="speednavigation" value="1" <c:if test="${ct.speednavigation eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="speednavigation" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>前驻车雷达:</span>
                                <input type="radio" name="frontparkingradar" value="1" <c:if test="${ct.frontparkingradar eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="frontparkingradar" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后驻车雷达:</span>
                                <input type="radio" name="rearparkingradar" value="1" <c:if test="${ct.rearparkingradar eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="rearparkingradar" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>倒车视频影像:</span>
                                <input type="radio" name="backvideo" value="1" <c:if test="${ct.backvideo eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="backvideo" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>行车电脑显示屏:</span>
                                <input type="radio" name="drivedisplay" value="1" <c:if test="${ct.drivedisplay eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="drivedisplay" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>全液晶仪表盘:</span>
                                <input type="radio" name="liquiddisplay" value="1" <c:if test="${ct.liquiddisplay eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="liquiddisplay" value="">
                                <i>无</i>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="details-box">
                    <div class="details-item">
                        <div class="details-item_title">
                            <span>座椅配置</span>
                            <i class="icon"></i>
                        </div>
                        <ul class="item-info">
                            <li>
                                <span>座椅材质:</span>
                                <input type="text" value="${ct.seatmatieral}" name="seatmatieral">
                            </li>
                            <li>
                                <span>座椅高低调节:</span>
                                <input type="radio" name="seatadjust" value="1" <c:if test="${ct.seatadjust eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="seatadjust" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>腰部支撑调节:</span>
                                <input type="radio" name="waistadjust" value="1" <c:if test="${ct.waistadjust eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="waistadjust" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>肩部支撑调节:</span>
                                <input type="radio" name="shoulderadjust" value="1" <c:if test="${ct.shoulderadjust eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="shoulderadjust" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>主驾驶座电动调节:</span>
                                <input type="radio" name="mainseateleca" value="1" <c:if test="${ct.mainseateleca eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="mainseateleca" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>副驾驶座电动调节:</span>
                                <input type="radio" name="assistsearteleca" value="1" <c:if test="${ct.assistsearteleca eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="assistsearteleca" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后排座椅电动调节:</span>
                                <input type="radio" name="rearseateleca" value="1" <c:if test="${ct.rearseateleca eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="rearseateleca" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>前排座椅加热:</span>
                                <input type="radio" name="frontseathot" value="1" <c:if test="${ct.frontseathot eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="frontseathot" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后排座椅加热:</span>
                                <input type="radio" name="rearsearthot" value="1" <c:if test="${ct.rearsearthot eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="rearsearthot" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>前排座椅通风:</span>
                                <input type="radio" name="frontseartwind" value="1" <c:if test="${ct.frontseartwind eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="frontseartwind" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后排座椅通风:</span>
                                <input type="radio" name="rearseatwind" value="1" <c:if test="${ct.rearseatwind eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="rearseatwind" value="">
                                <i>无</i>
                            </li>
                        </ul>
                    </div>
                    <div class="details-item">
                        <div class="details-item_title">
                            <span>多媒体配置</span>
                            <i class="icon"></i>
                        </div>
                        <ul class="item-info">
                            <li>
                                <span>GPS导航系统:</span>
                                <input type="radio" name="gpsnavisys" value="1" <c:if test="${ct.gpsnavisys eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="gpsnavisys" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>中控台彩色大屏:</span>
                                <input type="radio" name="centercolorfulscreen" value="1" <c:if test="${ct.centercolorfulscreen eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="centercolorfulscreen" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>蓝牙/车载电话:</span>
                                <input type="radio" name="bluephone" value="1" <c:if test="${ct.bluephone eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="bluephone" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>外接音源接口:</span>
                                <input type="text" value="${ct.soundinterface}" name="soundinterface">
                            </li>
                            <li>
                                <span>多媒体系统:</span>
                                <input type="radio" name="multimediasys" value="1" <c:if test="${ct.multimediasys eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="multimediasys" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>扬声器数量:</span>
                                <input type="text" value="${ct.loudspeakernum}" name="loudspeakernum">
                            </li>
                        </ul>
                    </div>
                    <div class="details-item">
                        <div class="details-item_title">
                            <span>灯光配置</span>
                            <i class="icon"></i>
                        </div>
                        <ul class="item-info">
                            <li>
                                <span>近光灯:</span>
                                <input type="text" value="${ct.headlight}" name="headlight">
                            </li>
                            <li>
                                <span>远光灯:</span>
                                <input type="text" value="${ct.farlight}" name="farlight">
                            </li>
                            <li>
                                <span>日间行车灯:</span>
                                <input type="radio" name="daylight" value="1" <c:if test="${ct.daylight eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="daylight" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>自适应远近光:</span>
                                <input type="radio" name="autolight" value="1" <c:if test="${ct.autolight eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="autolight" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>自动头灯:</span>
                                <input type="radio" name="autoheadlight" value="1" <c:if test="${ct.autoheadlight eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="autoheadlight" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>转向辅助灯:</span>
                                <input type="radio" name="turnassistlight" value="1" <c:if test="${ct.turnassistlight eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="turnassistlight" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>转向头灯:</span>
                                <input type="radio" name="turnlight" value="1" <c:if test="${ct.turnlight eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="turnlight" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>前雾灯:</span>
                                <input type="radio" name="frontfoglight" value="1" <c:if test="${ct.frontfoglight eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="frontfoglight" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>大灯高度可调:</span>
                                <input type="radio" name="biglighta" value="1" <c:if test="${ct.biglighta eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="biglighta" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>大灯清洗装置:</span>
                                <input type="radio" name="biglightclean" value="1" <c:if test="${ct.biglightclean eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="biglightclean" value="">
                                <i>无</i>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="details-box">
                    <div class="details-item">
                        <div class="details-item_title">
                            <span>玻璃/后视镜</span>
                            <i class="icon"></i>
                        </div>
                        <ul class="item-info">
                            <li>
                                <span>前电动车窗:</span>
                                <input type="radio" name="frontelecwin" value="1" <c:if test="${ct.frontelecwin eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="frontelecwin" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后电动车窗:</span>
                                <input type="radio" name="rearelecwin" value="1" <c:if test="${ct.rearelecwin eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="rearelecwin" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>车窗防夹手功能:</span>
                                <input type="radio" name="winprevhand" value="1" <c:if test="${ct.winprevhand eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="winprevhand" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后视镜电动调节:</span>
                                <input type="radio" name="rearvieweleca" value="1" <c:if test="${ct.rearvieweleca eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="rearvieweleca" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后视镜加热:</span>
                                <input type="radio" name="rearviewhot" value="1" <c:if test="${ct.rearviewhot eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="rearviewhot" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>内后视镜自动防炫目:</span>
                                <input type="radio" name="inrearviewpreveye" value="1" <c:if test="${ct.inrearviewpreveye eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="inrearviewpreveye" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>外后视镜自动防炫目:</span>
                                <input type="radio" name="outrearviewpreveye" value="1" <c:if test="${ct.outrearviewpreveye eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="outrearviewpreveye" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后视镜电动折叠:</span>
                                <input type="radio" name="rearviewelecfold" value="1" <c:if test="${ct.rearviewelecfold eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="rearviewelecfold" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>遮阳板化妆镜:</span>
                                <input type="radio" name="sunmakeupmirror" value="1" <c:if test="${ct.sunmakeupmirror eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="sunmakeupmirror" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后雨刷:</span>
                                <input type="radio" name="rearrainbrush" value="1" <c:if test="${ct.rearrainbrush eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="rearrainbrush" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>感应雨刷:</span>
                                <input type="radio" name="feelrarnbrush" value="1" <c:if test="${ct.feelrarnbrush eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="feelrarnbrush" value="">
                                <i>无</i>
                            </li>
                        </ul>
                    </div>
                    <div class="details-item">
                        <div class="details-item_title">
                            <span>空调/冰箱</span>
                            <i class="icon"></i>
                        </div>
                        <ul class="item-info">
                            <li>
                                <span>空调控制方式:</span>
                                <input type="text" value="${ct.airconditioncontrolt}" name="airconditioncontrolt">
                            </li>
                            <li>
                                <span>后排独立空调:</span>
                                <input type="radio" name="rearindependentac" value="1" <c:if test="${ct.rearindependentac eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="rearindependentac" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后排出风口:</span>
                                <input type="radio" name="rearoutwindport" value="1" <c:if test="${ct.rearoutwindport eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="rearoutwindport" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>温度分区控制:</span>
                                <input type="radio" name="tempercontrol" value="1" <c:if test="${ct.tempercontrol eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="tempercontrol" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>车内空气调节/花粉过滤:</span>
                                <input type="radio" name="airadjust" value="1" <c:if test="${ct.airadjust eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="airadjust" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>车载冰箱:</span>
                                <input type="radio" name="icebox" value="1" <c:if test="${ct.icebox eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="icebox" value="">
                                <i>无</i>
                            </li>
                        </ul>
                    </div>
                    <div class="details-item">
                        <div class="details-item_title">
                            <span>高科技配置</span>
                            <i class="icon"></i>
                        </div>
                        <ul class="item-info">
                            <li>
                                <span>自动泊车入位:</span>
                                <input type="radio" name="autoparkingposi" value="1" <c:if test="${ct.autoparkingposi eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="autoparkingposi" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>发动机启停技术:</span>
                                <input type="radio" name="enginestartshoptech" value="1" <c:if test="${ct.enginestartshoptech eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="enginestartshoptech" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>并线辅助:</span>
                                <input type="radio" name="asyassist" value="1" <c:if test="${ct.asyassist eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="asyassist" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>车道偏离预警系统:</span>
                                <input type="radio" name="roadwrongsys" value="1" <c:if test="${ct.roadwrongsys eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="roadwrongsys" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>主动刹车/主动安全系统:</span>
                                <input type="radio" name="selfbrakesys" value="1" <c:if test="${ct.selfbrakesys eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="selfbrakesys" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>整体主动转向系统:</span>
                                <input type="radio" name="selfturnsys" value="1" <c:if test="${ct.selfturnsys eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="selfturnsys" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>夜视系统:</span>
                                <input type="radio" name="nightseesys" value="1" <c:if test="${ct.nightseesys eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="nightseesys" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>中控液晶屏分屏显示:</span>
                                <input type="radio" name="liquidbypage" value="1" <c:if test="${ct.liquidbypage eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="liquidbypage" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>自适应巡航:</span>
                                <input type="radio" name="autonavi" value="1" <c:if test="${ct.autonavi eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="autonavi" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>全景摄像头:</span>
                                <input type="radio" name="allcamera" value="1" <c:if test="${ct.allcamera eq '1'}">checked="checked"</c:if>>
                                <i>有</i>
                                <input type="radio" name="allcamera" value="">
                                <i>无</i>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <div class="new-button">
        <a href="javascript:void(0);" onclick="save()" style="margin-right: 10px;">保存</a>
        <a href="javascript:void(0);" onclick="back()">返回</a>
    </div>
    </form>
</div>
</div>		
</div>
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/ajaxfileupload.js"></script>
<script>
$(function() {
	 $('#model').bind('change', selectVersion);
	});
function selectVersion(){
$('#version option').remove();
var model = $("#model").val();
var versionUrl=$('#versionUrl').val();
$.ajax(versionUrl,{
	type: "post",
   data: {model:model},
   datatype: "json",
   success: function (data) {
   	var version=data.version;
   	 var ddl = $("#version");
        ddl.append("<option value=''>请选择</option>");
       $.each(version, function (idx, val) {
       	ddl.append($("<option value='"+val.version+"'>" + val.version + "</option>"))
           })
       }
   })
}
var lst=$(".item-info li input[type='radio']:nth-of-type(odd)");
lst.each(function(){
	if(!$(this).attr("checked")){$(this).siblings("input").attr("checked",true);}
})
$('.details-item').click(function(e){
    console.log($(e.target)==$(this).find('.details-item_title i'))
    if($(e.target).hasClass('details-item_title')||$(e.target).hasClass('icon')){
        var nowitem=$(this).find('.item-info li');
         if(nowitem.css('display')=='none'){
             nowitem.css('display','block');
             $(this).find('.icon').removeClass('iconActive');
         }else{
             nowitem.css('display','none');
             $(this).find('.icon').addClass('iconActive');
         }
     //$(this).find('.item-info li').toggle();
    }
})
$('.mes-tab li').click(function(){
    var index=$('.mes-tab li').index(this);
    $('.mes-tab li div').css('display','none').eq(index).css('display','block')
    $('.mes-son-tab li').css('display','none').eq(index).css('display','block').find('.item-info li').css("display","block")
})
function imagePreview(obj,imgObj,fl,hid){
	var f = obj[0];
	var src = window.URL.createObjectURL(f);
	$('#'+imgObj).attr('src',src);//window.URL.revokeObjectURL(src);
	$.ajaxFileUpload({
		url : uploadUrl+"/"+fl,
		fileElementId : fl,
		type : 'POST',
		dataType : 'json',
		success : function(data) {
			if (data.status == 1) {	
				$("#"+hid).val(data.path);								
			}
			alert(data.msg);
		},
		error : function(XMLHttpRequest, textStatus,
				errorThrown) {
			alert("服务异常，请稍后尝试");
		}
	});
//	window.URL.revokeObjectURL(src);
}
var uploadUrl = $("#uploadUrl").val();
function save(){$("#editForm").submit();}
function back(){location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val();}
</script>