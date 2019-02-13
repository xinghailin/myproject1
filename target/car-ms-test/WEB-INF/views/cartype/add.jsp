<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input id="hideMsg" type="hidden" value='${msg}'/>
<link href="${cssBasePath}/common/car.css" rel="stylesheet">
<input type="hidden" id="saveUrl" value="<ufa:url fieldName="CARTYPE_ADDDO" namespace="car-ms"/>">
<input type="hidden" id="uploadUrl" value="<ufa:url fieldName="FILEUPLOAD" namespace="car-ms"/>">
<input type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input type="hidden" id="modelUrl" value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="versionUrl" value="<ufa:url fieldName="QUERY_VERSION" namespace="car-ms"/>">
<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
	<div class="box">
    <div class="new-top">
        <span>新增车型</span>
    </div>
    <form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="CARTYPE_ADDDO"/>">
    <div class="new-list">
     <div class="tab_txt01">
		 <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>品牌首字母：</span>
		        <span class="" style="line-height: 35px;margin-top: 8px;width:200px;">
		  	  	  <select id="brandinitial" name="" style="line-height: 35px;width:172px;">
		  	  	    <option value=''>--请选择--</option>
			           <c:forEach var="item" items="${brand}">  
			             <option value="<c:out value="${item.brandinitial}">
			             </c:out>"><c:out value="${item.brandinitial}"></c:out></option>
			           </c:forEach>
		          </select>
		        </span>
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>品牌：</span>
		  	  	<span style="line-height: 35px;margin-top: 8px;width:200px;"> 
		  	  	<select id="brand" name="brand" style="line-height: 35px;width:172px;">
		          </select>
		          </span>
		        <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>型号：</span>
		       <span style="line-height: 35px;margin-top: 8px;width:200px;"> 
		  	  	<select id="model" name="model" style="line-height: 35px;width:172px;">
		          </select>
		          </span>
		       <span class="td_01" style="width: 120px;"><label class="fc_red">*</label>版本：</span>
		       <span style="line-height: 35px;margin-top: 8px;width:200px;"> 
		  	  	<select id="version" name="version" style="line-height: 35px;width:172px;">
		          </select>
		          </span>
		 </div>
    <%-- 	    <div class="tab_txt01">
<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>品牌首字母：</span>
<span style="line-height: 35px;width:200px;">
<select id="brandinitial" name="brandinitial" style="line-height: 35px;width:150px;">
<option checked="checked" value="">--请选择--</option>
<c:forEach var="item" items="${brand}">  
<option value="<c:out value="${item.brandinitial}"></c:out>"><c:out value="${item.brandinitial}"></c:out></option>
</c:forEach>
</select>
</span>
<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>品牌：</span>
<span style="line-height: 35px;width:200px;"><input type="text" name="brand"  />&nbsp;</span>
<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>型号：</span>
<span style="line-height: 35px;width:200px;"><input type="text"  name="model" width="280px"/>&nbsp;</span>
<span class="td_01" style="width: 120px;"><label class="fc_red">*</label>版别：</span>
<span style="line-height: 35px;width:200px;"><input type="text" name="version" width="280px"/>&nbsp;</span>
		 </div> --%>
		<div class="tab_txt01">
	        <span class="td_01" style="width: 120px;">0首期产品本金：</span>
	  	  	<span style="line-height: 35px;width:200px;"><input type="text" name="downPay"/>&nbsp;</span>
	        <span class="td_01" style="width: 120px;">车辆价格：</span>
	        <span style="line-height: 35px;width:200px;"><input type="text" name="firstMonthPay" width="280px"/>&nbsp;</span>
	        <span class="td_01" style="width: 120px;">指导价：</span>
	        <span style="line-height: 35px;width:200px;"><input type="text" name="principal" width="280px"/>&nbsp;</span>
		 </div>
		 <div class="tab_txt01">
		 	<span class="td_01" style="width: 120px;">首付：</span>
	  	  	<span style="line-height: 35px;width:200px;"><input type="text" name="firstpay"  width="280px"/>&nbsp;</span>
		 	<span class="td_01" style="width: 120px;">利率：</span>
	  	  	<span style="line-height: 35px;width:200px;"><input type="text" name="rate"/>&nbsp;</span>
	        <span class="td_01" style="width: 120px;">期数：</span>
	        <span style="line-height: 35px;width:200px;"><input type="text" name="periodNum" width="280px"/>&nbsp;</span>
	  	  	<!-- <span class="td_01" style="width: 120px;">第一月月供：</span>
	  	  	<span style="line-height: 35px;width:200px;"><input type="text" name="oneMonthPay" width="280px"/>&nbsp;</span>
	  	  	<span class="td_01" style="width: 120px;">第二月月供：</span>
	  	  	<span style="line-height: 35px;width:200px;"><input type="text" name="everyMonthPay" width="280px"/>&nbsp;</span> -->
		 </div>	 
		 <!-- <div class="tab_txt01">
		 <span class="td_01" style="width: 120px;">后三年尾款：</span>
	  	  	<span style="line-height: 35px;width:200px;"><input type="text" name="finalPayment" width="280px"/>&nbsp;</span>
		 	<span class="td_01" style="width: 120px;">第十三月月供：</span>
	  	  	<span style="line-height: 35px;width:200px;"><input type="text" name="thirteenthMonthPay" width="280px"/>&nbsp;</span>
	  	  	<span class="td_01" style="width: 120px;">第十四月月供：</span>
	  	  	<span style="line-height: 35px;width:200px;"><input type="text" name="fourteenthMonthPay" width="280px"/>&nbsp;</span>
		 </div> -->
    </div>
    <div class="list-img">
        <div class="feng-img">
            <p>封面图片</p>
            <ul>
                <li>
                    <span>点击上传</span>
                    <img src="" id="coverPicImg">
                    <input type="file" id="coverPicFile" name="coverPicFile" onchange="imagePreview(this.files,'coverPicImg','coverPicFile','coverPicHide')">
                    <input type="hidden" name="coverPic" id="coverPicHide"/>
                    <!-- <button class="button">移除</button> -->
                </li>
            </ul>
        </div>
        <div class="out-img">
            <p>外观图片</p>
            <ul>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="1outpicImg">
                    <input type="file" id="1outpicFile" name="1outpicFile" onchange="imagePreview(this.files,'1outpicImg','1outpicFile','1outpicHide')">
                    <input type="hidden" name="outpic" id="1outpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="2outpicImg">
                    <input type="file" id="2outpicFile" name="2outpicFile" onchange="imagePreview(this.files,'2outpicImg','2outpicFile','2outpicHide')">
                    <input type="hidden" name="outpic" id="2outpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="3outpicImg">
                    <input type="file" id="3outpicFile" name="3outpicFile" onchange="imagePreview(this.files,'3outpicImg','3outpicFile','3outpicHide')">
                    <input type="hidden" name="outpic" id="3outpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="4outpicImg">
                    <input type="file" id="4outpicFile" name="4outpicFile" onchange="imagePreview(this.files,'4outpicImg','4outpicFile','4outpicHide')">
                    <input type="hidden" name="outpic" id="4outpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="5outpicImg">
                    <input type="file" id="5outpicFile" name="5outpicFile" onchange="imagePreview(this.files,'5outpicImg','5outpicFile','5outpicHide')">
                    <input type="hidden" name="outpic" id="5outpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="6outpicImg">
                    <input type="file" id="6outpicFile" name="6outpicFile" onchange="imagePreview(this.files,'6outpicImg','6outpicFile','6outpicHide')">
                    <input type="hidden" name="outpic" id="6outpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="7outpicImg">
                    <input type="file" id="7outpicFile" name="7outpicFile" onchange="imagePreview(this.files,'7outpicImg','7outpicFile','7outpicHide')">
                    <input type="hidden" name="outpic" id="7outpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="8outpicImg">
                    <input type="file" id="8outpicFile" name="8outpicFile" onchange="imagePreview(this.files,'8outpicImg','8outpicFile','8outpicHide')">
                    <input type="hidden" name="outpic" id="8outpicHide"/>
                </li>
            </ul>
        </div>
        <div class="inner-img">
            <p>内饰图片</p>
            <ul>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="1inpicImg">
                    <input type="file" id="1inpicFile" name="1inpicFile" onchange="imagePreview(this.files,'1inpicImg','1inpicFile','1inpicHide')">
                    <input type="hidden" name="inpic" id="1inpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="2inpicImg">
                    <input type="file" id="2inpicFile" name="2inpicFile" onchange="imagePreview(this.files,'2inpicImg','2inpicFile','2inpicHide')">
                    <input type="hidden" name="inpic" id="2inpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="3inpicImg">
                    <input type="file" id="3inpicFile" name="3inpicFile" onchange="imagePreview(this.files,'3inpicImg','3inpicFile','3inpicHide')">
                    <input type="hidden" name="inpic" id="3inpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="4inpicImg">
                    <input type="file" id="4inpicFile" name="4inpicFile" onchange="imagePreview(this.files,'4inpicImg','4inpicFile','4inpicHide')">
                    <input type="hidden" name="inpic" id="4inpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="5inpicImg">
                    <input type="file" id="5inpicFile" name="5inpicFile" onchange="imagePreview(this.files,'5inpicImg','5inpicFile','5inpicHide')">
                    <input type="hidden" name="inpic" id="5inpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="6inpicImg">
                    <input type="file" id="6inpicFile" name="6inpicFile" onchange="imagePreview(this.files,'6inpicImg','6inpicFile','6inpicHide')">
                    <input type="hidden" name="inpic" id="6inpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="7inpicImg">
                    <input type="file" id="7inpicFile" name="7inpicFile" onchange="imagePreview(this.files,'7inpicImg','7inpicFile','7inpicHide')">
                    <input type="hidden" name="inpic" id="7inpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="8inpicImg">
                    <input type="file" id="8inpicFile" name="8inpicFile" onchange="imagePreview(this.files,'8inpicImg','8inpicFile','8inpicHide')">
                    <input type="hidden" name="inpic" id="8inpicHide"/>
                </li>
            </ul>
        </div>
        <div class="small-img">
            <p>细节图片</p>
            <ul>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="1detailpicImg">
                    <input type="file" id="1detailpicFile" name="1detailpicFile" onchange="imagePreview(this.files,'1detailpicImg','1detailpicFile','1detailpicHide')">
                    <input type="hidden" name="detailpic" id="1detailpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="2detailpicImg">
                    <input type="file" id="2detailpicFile" name="2detailpicFile" onchange="imagePreview(this.files,'2detailpicImg','2detailpicFile','2detailpicHide')">
                    <input type="hidden" name="detailpic" id="2detailpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="3detailpicImg">
                    <input type="file" id="3detailpicFile" name="3detailpicFile" onchange="imagePreview(this.files,'3detailpicImg','3detailpicFile','3detailpicHide')">
                    <input type="hidden" name="detailpic" id="3detailpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="4detailpicImg">
                    <input type="file" id="4detailpicFile" name="4detailpicFile" onchange="imagePreview(this.files,'4detailpicImg','4detailpicFile','4detailpicHide')">
                    <input type="hidden" name="detailpic" id="4detailpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="5detailpicImg">
                    <input type="file" id="5detailpicFile" name="5detailpicFile" onchange="imagePreview(this.files,'5detailpicImg','5detailpicFile','5detailpicHide')">
                    <input type="hidden" name="detailpic" id="5detailpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="6detailpicImg">
                    <input type="file" id="6detailpicFile" name="6detailpicFile" onchange="imagePreview(this.files,'6detailpicImg','6detailpicFile','6detailpicHide')">
                    <input type="hidden" name="detailpic" id="6detailpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="7detailpicImg">
                    <input type="file" id="7detailpicFile" name="7detailpicFile" onchange="imagePreview(this.files,'7detailpicImg','7detailpicFile','7detailpicHide')">
                    <input type="hidden" name="detailpic" id="7detailpicHide"/>
                </li>
                <li>
                    <span>点击上传</span>
                    <img src="" alt="" id="8detailpicImg">
                    <input type="file" id="8detailpicFile" name="8detailpicFile" onchange="imagePreview(this.files,'8detailpicImg','8detailpicFile','8detailpicHide')">
                    <input type="hidden" name="detailpic" id="8detailpicHide"/>
                </li>
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
                    <div class="ligth-list">
                        <div>
                            <span>点击上传</span>
<img src="" alt="" id="1lightpicImg">
<input type="file" id="1lightpicFile" name="1lightpicFile" onchange="imagePreview(this.files,'1lightpicImg','1lightpicFile','1lightpicHide')">
<input type="hidden" name="lightpic" id="1lightpicHide"/>
                        </div>
                        <p class="ligth-list-title">
                            <span>标题：</span>
                            <input type="text" value="" name="title">
                        </p>
                        <textarea class="ligth-list-summary" name="content" ></textarea>
                    </div>
                    <div class="ligth-list">
                        <div>
                            <span>点击上传</span>
<img src="" alt="" id="2lightpicImg">
<input type="file" id="2lightpicFile" name="2lightpicFile" onchange="imagePreview(this.files,'2lightpicImg','2lightpicFile','2lightpicHide')">
<input type="hidden" name="lightpic" id="2lightpicHide"/>
                        </div>
                        <p class="ligth-list-title">
                            <span>标题：</span>
                            <input type="text" value="" name="title">
                        </p>
                        <textarea class="ligth-list-summary" name="content" ></textarea>
                    </div>
                    <div class="ligth-list">
                        <div>
                            <span>点击上传</span>
<img src="" alt="" id="3lightpicImg">
<input type="file" id="3lightpicFile" name="3lightpicFile" onchange="imagePreview(this.files,'3lightpicImg','3lightpicFile','3lightpicHide')">
<input type="hidden" name="lightpic" id="3lightpicHide"/>
                        </div>
                        <p class="ligth-list-title">
                            <span>标题：</span>
                            <input type="text" value="" name="title">
                        </p>
                        <textarea class="ligth-list-summary" name="content" ></textarea>
                    </div>
                    <div class="ligth-list">
                        <div>
                            <span>点击上传</span>
<img src="" alt="" id="4lightpicImg">
<input type="file" id="4lightpicFile" name="4lightpicFile" onchange="imagePreview(this.files,'4lightpicImg','4lightpicFile','4lightpicHide')">
<input type="hidden" name="lightpic" id="4lightpicHide"/>
                        </div>
                        <p class="ligth-list-title">
                            <span>标题：</span>
                            <input type="text" value="" name="title">
                        </p>
                        <textarea class="ligth-list-summary" name="content" ></textarea>
                    </div>
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
                                <input type="text" value="" name="structure">
                            </li>
                            <li>
                                <span>长*宽*高（mm）:</span>
                                <input type="text" value="" name="lwh">
                            </li>
                            <li>
                                <span>发动机:</span>
                                <input type="text" value="" name="engine">
                            </li>
                            <li>
                                <span>变速箱:</span>
                                <input type="text" value="" name="gearbox">
                            </li>
                            <li>
                                <span>驱动方式:</span>
                                <input type="text" value="" name="driveT">
                            </li>
                            <li>
                                <span>燃料形式:</span>
                                <input type="text" value="" name="fuelT">
                            </li>
                            <li>
                                <span>综合耗油:</span>
                                <input type="text" value="" name="oilWear">
                            </li>
                            <li>
                                <span>车辆配色:</span>
                                <input type="text" value="" name="color">
                            </li>
                            <li>
                                <span>轴距:</span>
                                <input type="text" value="" name="wheelBase">
                            </li>
                            <li>
                                <span>前轮距（mm）:</span>
                                <input type="text" value="" name="frontSpan">
                            </li>
                            <li>
                                <span>后轮距（mm）:</span>
                                <input type="text" value="" name="rearSpan">
                            </li>
                            <li>
                                <span>最小离地间隙（mm）:</span>
                                <input type="text" value="" name="minClearance">
                            </li>
                            <li>
                                <span>整车质量（kg）:</span>
                                <input type="text" value="" name="weight">
                            </li>
                            <li>
                                <span>车门数（个）:</span>
                                <input type="text" value="" name="doorNum">
                            </li>
                            <li>
                                <span>座位数（个）:</span>
                                <input type="text" value="" name="seatNum">
                            </li>
                            <li>
                                <span>油箱容积（L）:</span>
                                <input type="text" value="" name="fuelTankVol">
                            </li>
                            <li>
                                <span>行李厢容积（L）:</span>
                                <input type="text" value="" name="trunkVol">
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
                                <input type="text" value="" name="engineT">
                            </li>
                            <li>
                                <span>排量:</span>
                                <input type="text" value="" name="displacement">
                            </li>
                            <li>
                                <span>进气形式:</span>
                                <input type="text" value="" name="inairType">
                            </li>
                            <li>
                                <span>气缸排列形式:</span>
                                <input type="text" value="" name="airCylinderArr">
                            </li>
                            <li>
                                <span>气缸数（个）:</span>
                                <input type="text" value="" name="airCyNum">
                            </li>
                            <li>
                                <span>每缸气门数（个）:</span>
                                <input type="text" value="" name="airDoorsPerCy">
                            </li>
                            <li>
                                <span>缸径（mm）:</span>
                                <input type="text" value="" name="cySpan">
                            </li>
                            <li>
                                <span>行程（mm）:</span>
                                <input type="text" value="" name="cyDistance">
                            </li>
                            <li>
                                <span>最大马力（Ps）:</span>
                                <input type="text" value="" name="maxPower">
                            </li>
                            <li>
                                <span>最大功率（kW）:</span>
                                <input type="text" value="" name="maxWork">
                            </li>
                            <li>
                                <span>最大功率转速（rpm）:</span>
                                <input type="text" value="" name="maxWorkRotate">
                            </li>
                            <li>
                                <span>最大扭矩（N·m）:</span>
                                <input type="text" value="" name="maxTorque">
                            </li>
                            <li>
                                <span>最大扭矩转速（rpm）:</span>
                                <input type="text" value="" name="maxTorqueRotate">
                            </li>
                            <li>
                                <span>发动机特有技术:</span>
                                <input type="text" value="" name="engineSpecialTech">
                            </li>
                            <li>
                                <span>燃油标号:</span>
                                <input type="text" value="" name="fuelFlag">
                            </li>
                            <li>
                                <span>供油方式:</span>
                                <input type="text" value="" name="supplyFuelT">
                            </li>
                            <li>
                                <span>缸盖材料:</span>
                                <input type="text" value="" name="cyCoverMaterial">
                            </li>
                            <li>
                                <span>缸体材料:</span>
                                <input type="text" value="" name="cyTrunkMaterial">
                            </li>
                            <li>
                                <span>环保标准:</span>
                                <input type="text" value="" name="envirProtect">
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
                                <input type="text" value="" name="gearsNum">
                            </li>
                            <li>
                                <span>变速箱类型:</span>
                                <input type="text" value="" name="gearboxT">
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
                                <input type="text" value="" name="fourdrivet">
                            </li>
                            <li>
                                <span>中央差速器结构:</span>
                                <input type="text" value="" name="centerdiffstru">
                            </li>
                            <li>
                                <span>前悬架类型:</span>
                                <input type="text" value="" name="frontframet">
                            </li>
                            <li>
                                <span>后悬架类型:</span>
                                <input type="text" value="" name="rearframet">
                            </li>
                            <li>
                                <span>助力类型:</span>
                                <input type="text" value="" name="assistpowert">
                            </li>
                            <li>
                                <span>车体结构:</span>
                                <input type="text" value="" name="trunkstruc">
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
                                <input type="text" value="" name="frontbraket">
                            </li>
                            <li>
                                <span>后制动器类型:</span>
                                <input type="text" value="" name="rearbraket">
                            </li>
                            <li>
                                <span>驻车制动类型:</span>
                                <input type="text" value="" name="parkingbraket">
                            </li>
                            <li>
                                <span>前轮胎规格:</span>
                                <input type="text" value="" name="frontwheelspe">
                            </li>
                            <li>
                                <span>后轮胎规格:</span>
                                <input type="text" value="" name="rearwheelspe">
                            </li>
                            <li>
                                <span>备胎规格:</span>
                                <input type="text" value="" name="readywheelspe">
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
                                <input type="radio" name="mainsafeair" value="1">
                                <i>有</i>
                                <input type="radio" name="mainsafeair" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>副驾驶座安全气囊:</span>
                                <input type="radio" name="sidesafeair" value="1">
                                <i>有</i>
                                <input type="radio" name="sidesafeair" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>前排侧气囊:</span>
                                <input type="radio" name="frontsideair" value="1">
                                <i>有</i>
                                <input type="radio" name="frontsideair" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后排侧气囊:</span>
                                <input type="radio" name="rearsizeair" value="1">
                                <i>有</i>
                                <input type="radio" name="rearsizeair" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>前排头部气囊（气帘）:</span>
                                <input type="radio" name="frontheadair" value="1">
                                <i>有</i>
                                <input type="radio" name="frontheadair" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后排头部气囊（气帘）:</span>
                                <input type="radio" name="rearheadair" value="1">
                                <i>有</i>
                                <input type="radio" name="rearheadair" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>膝部气囊:</span>
                                <input type="radio" name="kneeair" value="1">
                                <i>有</i>
                                <input type="radio" name="kneeair" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>胎压监测装置:</span>
                                <input type="radio" name="tireprescheck" value="1">
                                <i>有</i>
                                <input type="radio" name="tireprescheck" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>零胎压继续行驶:</span>
                                <input type="radio" name="zerotirepresdrive" value="1">
                                <i>有</i>
                                <input type="radio" name="zerotirepresdrive" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>安全带未系提示:</span>
                                <input type="radio" name="safebeltnotice" value="1">
                                <i>有</i>
                                <input type="radio" name="safebeltnotice" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>ISOFIX儿童座椅接口:</span>
                                <input type="radio" name="isofix" value="1">
                                <i>有</i>
                                <input type="radio" name="isofix" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>发动机电子防盗:</span>
                                <input type="radio" name="enginestopsteal" value="1">
                                <i>有</i>
                                <input type="radio" name="enginestopsteal" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>车内中控锁:</span>
                                <input type="radio" name="insidecenterlock" value="1">
                                <i>有</i>
                                <input type="radio" name="insidecenterlock" checked="checked" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>遥控钥匙:</span>
                                <input type="radio" name="controkey" value="1">
                                <i>有</i>
                                <input type="radio" name="controkey" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>无钥匙启动系统:</span>
                                <input type="radio" name="startnokey" value="1">
                                <i>有</i>
                                <input type="radio" name="startnokey" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>无钥匙进入系统:</span>
                                <input type="radio" name="enternokey" value="1">
                                <i>有</i>
                                <input type="radio" name="enternokey" checked="checked" value="">
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
                                <input type="radio" name="antiblocking" value="1">
                                <i>有</i>
                                <input type="radio" name="antiblocking" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>制动力分配（EBD/CBC等）:</span>
                                <input type="radio" name="brakeallot" value="1">
                                <i>有</i>
                                <input type="radio" name="brakeallot" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>刹车辅助（EBA/BAS/BA等）:</span>
                                <input type="radio" name="brakeassist" value="1">
                                <i>有</i>
                                <input type="radio" name="brakeassist" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>牵引力控制（ASR/TCS/TRC等）:</span>
                                <input type="radio" name="pullcontrol" value="1">
                                <i>有</i>
                                <input type="radio" name="pullcontrol" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>车身稳定控制（ESC/ESP/DSC等）:</span>
                                <input type="radio" name="trunkholdcontrol" value="1">
                                <i>有</i>
                                <input type="radio" name="trunkholdcontrol" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>上坡辅助:</span>
                                <input type="radio" name="uphillassist" value="1">
                                <i>有</i>
                                <input type="radio" name="uphillassist" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>自动驻车:</span>
                                <input type="radio" name="autoparking" value="1">
                                <i>有</i>
                                <input type="radio" name="autoparking" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>陡坡缓降:</span>
                                <input type="radio" name="steephillslow" value="1">
                                <i>有</i>
                                <input type="radio" name="steephillslow" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>可变悬架:</span>
                                <input type="radio" name="changeframe" value="1">
                                <i>有</i>
                                <input type="radio" name="changeframe" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>空气悬架:</span>
                                <input type="radio" name="airframe" value="1">
                                <i>有</i>
                                <input type="radio" name="airframe" checked="checked" value="">
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
                                <input type="radio" name="elecskywin" value="1">
                                <i>有</i>
                                <input type="radio" name="elecskywin" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>全景天窗:</span>
                                <input type="radio" name="widewin" value="1">
                                <i>有</i>
                                <input type="radio" name="widewin" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>运动外观套件:</span>
                                <input type="radio" name="sportextend" value="1">
                                <i>有</i>
                                <input type="radio" name="sportextend" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>铝合金轮圈:</span>
                                <input type="radio" name="lvhejintire" value="1">
                                <i>有</i>
                                <input type="radio" name="lvhejintire" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>电动吸合门:</span>
                                <input type="radio" name="elecdoor" value="1">
                                <i>有</i>
                                <input type="radio" name="elecdoor" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>侧滑门:</span>
                                <input type="radio" name="sideslidedoor" value="1">
                                <i>有</i>
                                <input type="radio" name="sideslidedoor" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>电动后备厢:</span>
                                <input type="radio" name="elecbackvan" value="1">
                                <i>有</i>
                                <input type="radio" name="elecbackvan" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>感应后备厢:</span>
                                <input type="radio" name="feelbackvan" value="1">
                                <i>有</i>
                                <input type="radio" name="feelbackvan" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>车顶行李架:</span>
                                <input type="radio" name="roofrack" value="1">
                                <i>有</i>
                                <input type="radio" name="roofrack" checked="checked" value="">
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
                                <input type="radio" name="realfursteering" value="1">
                                <i>有</i>
                                <input type="radio" name="realfursteering" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>方向盘调节:</span>
                                <input type="text" value="" name="steeringadjust">
                            </li>
                            <li>
                                <span>方向盘电动调节:</span>
                                <input type="radio" name="steeringeleca" value="1">
                                <i>有</i>
                                <input type="radio" name="steeringeleca" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>多功能方向盘:</span>
                                <input type="radio" name="multifunsteering" value="1">
                                <i>有</i>
                                <input type="radio" name="multifunsteering" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>方向盘换挡:</span>
                                <input type="radio" name="steeringshift" value="1">
                                <i>有</i>
                                <input type="radio" name="steeringshift" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>方向盘加热:</span>
                                <input type="radio" name="steeringhot" value="1">
                                <i>有</i>
                                <input type="radio" name="steeringhot" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>定速巡航:</span>
                                <input type="radio" name="speednavigation" value="1">
                                <i>有</i>
                                <input type="radio" name="speednavigation" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>前驻车雷达:</span>
                                <input type="radio" name="frontparkingradar" value="1">
                                <i>有</i>
                                <input type="radio" name="frontparkingradar" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后驻车雷达:</span>
                                <input type="radio" name="rearparkingradar" value="1">
                                <i>有</i>
                                <input type="radio" name="rearparkingradar" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>倒车视频影像:</span>
                                <input type="radio" name="backvideo" value="1">
                                <i>有</i>
                                <input type="radio" name="backvideo" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>行车电脑显示屏:</span>
                                <input type="radio" name="drivedisplay" value="1">
                                <i>有</i>
                                <input type="radio" name="drivedisplay" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>全液晶仪表盘:</span>
                                <input type="radio" name="liquiddisplay" value="1">
                                <i>有</i>
                                <input type="radio" name="liquiddisplay" checked="checked" value="">
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
                                <input type="text" value="" name="seatmatieral">
                            </li>
                            <li>
                                <span>座椅高低调节:</span>
                                <input type="radio" name="seatadjust" value="1">
                                <i>有</i>
                                <input type="radio" name="seatadjust" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>腰部支撑调节:</span>
                                <input type="radio" name="waistadjust" value="1">
                                <i>有</i>
                                <input type="radio" name="waistadjust" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>肩部支撑调节:</span>
                                <input type="radio" name="shoulderadjust" value="1">
                                <i>有</i>
                                <input type="radio" name="shoulderadjust" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>主驾驶座电动调节:</span>
                                <input type="radio" name="mainseateleca" value="1">
                                <i>有</i>
                                <input type="radio" name="mainseateleca" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>副驾驶座电动调节:</span>
                                <input type="radio" name="assistsearteleca" value="1">
                                <i>有</i>
                                <input type="radio" name="assistsearteleca" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后排座椅电动调节:</span>
                                <input type="radio" name="rearseateleca" value="1">
                                <i>有</i>
                                <input type="radio" name="rearseateleca" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>前排座椅加热:</span>
                                <input type="radio" name="frontseathot" value="1">
                                <i>有</i>
                                <input type="radio" name="frontseathot" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后排座椅加热:</span>
                                <input type="radio" name="rearsearthot" value="1">
                                <i>有</i>
                                <input type="radio" name="rearsearthot" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>前排座椅通风:</span>
                                <input type="radio" name="frontseartwind" value="1">
                                <i>有</i>
                                <input type="radio" name="frontseartwind" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后排座椅通风:</span>
                                <input type="radio" name="rearseatwind" value="1">
                                <i>有</i>
                                <input type="radio" name="rearseatwind" checked="checked" value="">
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
                                <input type="radio" name="gpsnavisys" value="1">
                                <i>有</i>
                                <input type="radio" name="gpsnavisys" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>中控台彩色大屏:</span>
                                <input type="radio" name="centercolorfulscreen" value="1">
                                <i>有</i>
                                <input type="radio" name="centercolorfulscreen" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>蓝牙/车载电话:</span>
                                <input type="radio" name="bluephone" value="1">
                                <i>有</i>
                                <input type="radio" name="bluephone" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>外接音源接口:</span>
                                <input type="text" value="" name="soundinterface">
                            </li>
                            <li>
                                <span>多媒体系统:</span>
                                <input type="radio" name="multimediasys" value="1">
                                <i>有</i>
                                <input type="radio" name="multimediasys" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>扬声器数量:</span>
                                <input type="text" value="" name="loudspeakernum">
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
                                <input type="text" value="" name="headlight">
                            </li>
                            <li>
                                <span>远光灯:</span>
                                <input type="text" value="" name="farlight">
                            </li>
                            <li>
                                <span>日间行车灯:</span>
                                <input type="radio" name="daylight" value="1">
                                <i>有</i>
                                <input type="radio" name="daylight" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>自适应远近光:</span>
                                <input type="radio" name="autolight" value="1">
                                <i>有</i>
                                <input type="radio" name="autolight" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>自动头灯:</span>
                                <input type="radio" name="autoheadlight" value="1">
                                <i>有</i>
                                <input type="radio" name="autoheadlight" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>转向辅助灯:</span>
                                <input type="radio" name="turnassistlight" value="1">
                                <i>有</i>
                                <input type="radio" name="turnassistlight" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>转向头灯:</span>
                                <input type="radio" name="turnlight" value="1">
                                <i>有</i>
                                <input type="radio" name="turnlight" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>前雾灯:</span>
                                <input type="radio" name="frontfoglight" value="1">
                                <i>有</i>
                                <input type="radio" name="frontfoglight" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>大灯高度可调:</span>
                                <input type="radio" name="biglighta" value="1">
                                <i>有</i>
                                <input type="radio" name="biglighta" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>大灯清洗装置:</span>
                                <input type="radio" name="biglightclean" value="1">
                                <i>有</i>
                                <input type="radio" name="biglightclean" checked="checked" value="">
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
                                <input type="radio" name="frontelecwin" value="1">
                                <i>有</i>
                                <input type="radio" name="frontelecwin" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后电动车窗:</span>
                                <input type="radio" name="rearelecwin" value="1">
                                <i>有</i>
                                <input type="radio" name="rearelecwin" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>车窗防夹手功能:</span>
                                <input type="radio" name="winprevhand" value="1">
                                <i>有</i>
                                <input type="radio" name="winprevhand" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后视镜电动调节:</span>
                                <input type="radio" name="rearvieweleca" value="1">
                                <i>有</i>
                                <input type="radio" name="rearvieweleca" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后视镜加热:</span>
                                <input type="radio" name="rearviewhot" value="1">
                                <i>有</i>
                                <input type="radio" name="rearviewhot" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>内后视镜自动防炫目:</span>
                                <input type="radio" name="inrearviewpreveye" value="1">
                                <i>有</i>
                                <input type="radio" name="inrearviewpreveye" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>外后视镜自动防炫目:</span>
                                <input type="radio" name="outrearviewpreveye" value="1">
                                <i>有</i>
                                <input type="radio" name="outrearviewpreveye" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后视镜电动折叠:</span>
                                <input type="radio" name="rearviewelecfold" value="1">
                                <i>有</i>
                                <input type="radio" name="rearviewelecfold" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>遮阳板化妆镜:</span>
                                <input type="radio" name="sunmakeupmirror" value="1">
                                <i>有</i>
                                <input type="radio" name="sunmakeupmirror" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后雨刷:</span>
                                <input type="radio" name="rearrainbrush" value="1">
                                <i>有</i>
                                <input type="radio" name="rearrainbrush" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>感应雨刷:</span>
                                <input type="radio" name="feelrarnbrush" value="1">
                                <i>有</i>
                                <input type="radio" name="feelrarnbrush" checked="checked" value="">
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
                                <input type="text" value="" name="airconditioncontrolt">
                            </li>
                            <li>
                                <span>后排独立空调:</span>
                                <input type="radio" name="rearindependentac" value="1">
                                <i>有</i>
                                <input type="radio" name="rearindependentac" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>后排出风口:</span>
                                <input type="radio" name="rearoutwindport" value="1">
                                <i>有</i>
                                <input type="radio" name="rearoutwindport" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>温度分区控制:</span>
                                <input type="radio" name="tempercontrol" value="1">
                                <i>有</i>
                                <input type="radio" name="tempercontrol" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>车内空气调节/花粉过滤:</span>
                                <input type="radio" name="airadjust" value="1">
                                <i>有</i>
                                <input type="radio" name="airadjust" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>车载冰箱:</span>
                                <input type="radio" name="icebox" value="1">
                                <i>有</i>
                                <input type="radio" name="icebox" checked="checked" value="">
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
                                <input type="radio" name="autoparkingposi" value="1">
                                <i>有</i>
                                <input type="radio" name="autoparkingposi" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>发动机启停技术:</span>
                                <input type="radio" name="enginestartshoptech" value="1">
                                <i>有</i>
                                <input type="radio" name="enginestartshoptech" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>并线辅助:</span>
                                <input type="radio" name="asyassist" value="1">
                                <i>有</i>
                                <input type="radio" name="asyassist" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>车道偏离预警系统:</span>
                                <input type="radio" name="roadwrongsys" value="1">
                                <i>有</i>
                                <input type="radio" name="roadwrongsys" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>主动刹车/主动安全系统:</span>
                                <input type="radio" name="selfbrakesys" value="1">
                                <i>有</i>
                                <input type="radio" name="selfbrakesys" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>整体主动转向系统:</span>
                                <input type="radio" name="selfturnsys" value="1">
                                <i>有</i>
                                <input type="radio" name="selfturnsys" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>夜视系统:</span>
                                <input type="radio" name="nightseesys" value="1">
                                <i>有</i>
                                <input type="radio" name="nightseesys" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>中控液晶屏分屏显示:</span>
                                <input type="radio" name="liquidbypage" value="1">
                                <i>有</i>
                                <input type="radio" name="liquidbypage" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>自适应巡航:</span>
                                <input type="radio" name="autonavi" value="1">
                                <i>有</i>
                                <input type="radio" name="autonavi" checked="checked" value="">
                                <i>无</i>
                            </li>
                            <li>
                                <span>全景摄像头:</span>
                                <input type="radio" name="allcamera" value="1">
                                <i>有</i>
                                <input type="radio" name="allcamera" checked="checked" value="">
                                <i>无</i>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <div class="new-button">
        <a href="javascript:void(0);" onclick="save()">保存</a>
    </div>
    </form>
</div>
</div>		
</div>
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/ajaxfileupload.js"></script>
<script>
$(function() {
	 $('#brandinitial').bind('change', selectBrand);
	 $('#brand').bind('change', selectModel);
	 $('#model').bind('change', selectVersion);
	});
function selectBrand(){
	 $('#brand option').remove();
     $('#model option').remove();
     $('#version option').remove();
  var brandinitial = $("#brandinitial").val();
      var modelUrl=$('#brandUrl').val();
       $.ajax(modelUrl,{
       	type: "post",
           data: {brandinitial: brandinitial},
           datatype: "json",
           success: function (data) {
           	var brand=data.abrand;
           	 var ddl = $("#brand");
                ddl.append("<option value=''>请选择</option>");
               $.each(brand, function (idx, val) {
               	ddl.append($("<option value='"+val.brand+"'>" + val.brand + "</option>"))
               })
           }
       })
}
function selectModel(){
 $('#model option').remove();
 $('#version option').remove();
  var brand = $("#brand").val();
      var modelUrl=$('#modelUrl').val();
       $.ajax(modelUrl,{
       	type: "post",
           data: {brand: brand},
           datatype: "json",
           success: function (data) {
           	var model=data.model;
           	 var ddl = $("#model");
                ddl.append("<option value=''>请选择</option>");
               $.each(model, function (idx, val) {
               	ddl.append($("<option value='"+val.model+"'>" + val.model + "</option>"))
               })
           }
       })
}
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
//            $(this).find('.item-info li').toggle();
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
/* $('.button').click(function(){
    $(this).siblings('img').attr('src','');
}) */
var uploadUrl = $("#uploadUrl").val();
function save(){
	if($('#brand').val()!=null&&$('#brand').val()!=""){
		$("#editForm").submit();	
	}else{alert("请选择品牌！");}}
$(function(){
	var $msg=$('#hideMsg');
	if($msg.val())alert($msg.val());
})
</script>