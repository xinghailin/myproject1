<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<script src="../../../scripts/base/html5media.min.js.js"></script>
<script >
    videojs.options.flash.swf = "video-js.swf";
</script>
<input type="hidden" id="backUrl" value="<ufa:url fieldName="CONTRACT_QUERY" namespace="car-ms"/>">
<div class="mian_right-new" id="EA">
	<div class="rg_list">
		<h1 class="tt_h1" id="He">车辆销售合同</h1>
		<div class="tb_list">
		<ul class="tb_ul02">
		<li>
		<input id="currpage" value="${currpage }" type="hidden"/>
		  	  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">甲方(卖方)：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.parta}&nbsp;</span>
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">住所&nbsp(址)：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.addressa}&nbsp;</span>
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">邮政&nbsp编号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.phonea}&nbsp;</span>
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">联系&nbsp电话：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.shopName}&nbsp;</span>
		        
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">选择&nbsp门店：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.addressa}&nbsp;</span>
		  	  	</div>
		  	  	<div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">销售&nbsp人员：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.sellerName}&nbsp;</span>
		  	  	</div>
		  	  	</li>
			 <li>
		  	  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">乙方(买方)：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.buyerName}&nbsp;</span>
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">住所&nbsp(址)：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.addressb}&nbsp;</span>
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">邮政&nbsp编号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.postcodeb}&nbsp;</span>
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">联系&nbsp电话：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.phone}&nbsp;</span>
			 </div>
			  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">证件&nbsp类型：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.idenType}&nbsp;</span>
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">证件&nbsp号码：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.idenCode}&nbsp;</span>
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">委托代理人：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.agent}&nbsp;</span>
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">联系&nbsp电话：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.agentPhone}&nbsp;</span>
			 </div>
		   	</li>
		   		<li>
		  	  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;"><font size="5">车辆信息</font> </span>
			 </div>
		   	</li>
		   		
		   	<li>
		  	  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">车辆品牌：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.brand}&nbsp;</span>
		  	   <span class="td_01" style="width: 120px;">车辆型号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.model}&nbsp;</span>
		  	  	   <span class="td_01" style="width: 120px;">车辆版别：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.version}&nbsp;</span>
		      
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		  	    <span class="td_01" style="width: 120px;">长宽高：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.lenWidHei}&nbsp;</span>
		  	   <span class="td_01" style="width: 120px;">发动机号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.engineNum}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">车架号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.vin}&nbsp;</span>
		  	  	
			 </div></li>
		   	<li>
		  	  <div class="tab_txt01">
		  	  <span class="td_01" style="width: 120px;">出厂日期：</span>
		  	  	<span style="line-height: 35px;width:300px;"><fmt:formatDate pattern="yyyy-MM-dd" 
               value="${car.leaveFactoryTime}" />&nbsp;</span>
		  	  <span class="td_01" style="width: 120px;">工信部综合油耗：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.oilWear}&nbsp;</span>
		  	   <span class="td_01" style="width: 120px;">排量：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.displacement}&nbsp;L</span>
		  	  
			 </div>
		   	</li><li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">排放：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.discharage}&nbsp;L</span>
		  	  	
		  	   <span class="td_01" style="width: 120px;">车辆能源类型：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.energyType}&nbsp;</span>
		  	   <span class="td_01" style="width: 120px;">整体质量：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.weight}&nbsp;kg</span>
		       
		  	  	
			 </div>
		   	</li><li>
		  	  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">车身级别：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.level}&nbsp;</span>
		       <span class="td_01" style="width: 120px;">变速箱：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.gearbox}&nbsp;</span>
		  	  <span class="td_01" style="width: 120px;">外观颜色：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.outlookColor}&nbsp;</span>
		  	  
			 </div>
		   	</li>
		   	
		   	<li>
		  	  <div class="tab_txt01">
		  	 	<span class="td_01" style="width: 120px;">内饰颜色：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.innerColor}&nbsp;</span>
		  	  <span class="td_01" style="width: 120px;">仓库地点：</span>
		  	  	<span style="line-height: 35px;width:300px;">${store.name}&nbsp;</span>
		  	  
		        <span class="td_01" style="width: 120px;">采购商名称：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.buyName}&nbsp;</span>
			 </div>
		   	</li>
		   		<li>
		  	  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 240px;"><font size="5">合同价格和各种费用</font> </span>
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;">车辆销售价格：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.salePrice}&nbsp;元</span>
		  	  	</div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;">定金金额：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.downpay}&nbsp;元</span>
		  	  <span class="td_01" style="width: 120px;">实到定金金额：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.realdownpay}&nbsp;元</span>
			 </div>
		   	</li>
		   			<li>
		  	  <div class="tab_txt01">
		  	  <span class="td_01" style="width: 120px;">尾款：</span>
		  	  <c:choose>
              <c:when test="${contract.finalpay !=null}"> 
		  	  	<span style="line-height: 35px;width:300px;">${contract.finalpay}&nbsp;元</span>
		  	  		</c:when>
               <c:otherwise> 
               <span style="line-height: 35px;width:300px;">
		  	  	0.0&nbsp;元</span>
               </c:otherwise>
               </c:choose>
                <span class="td_01" style="width: 120px;">实到尾款：</span>
		  	  <c:choose>
              <c:when test="${contract.realfinalpay !=null}"> 
		  	  	<span style="line-height: 35px;width:300px;">${contract.realfinalpay}&nbsp;元</span>
		  	  		</c:when>
               <c:otherwise> 
               <span style="line-height: 35px;width:300px;">
		  	  	0.0&nbsp;元</span>
               </c:otherwise>
               </c:choose>
		 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		  	  <c:if test="${contract.buyTax !=null}">
		  	  <span class="td_01" style="width: 120px;">购置税：</span>
		  	  	<span style="line-height: 35px;width:300px;">
		  	  	${contract.buyTax}&nbsp;元</span>
		  	  </c:if>
		  	   <c:if test="${contract.buyTaxr !=null}">
		  	  <span class="td_01" style="width: 120px;">实到购置税：</span>
		  	  	<span style="line-height: 35px;width:300px;">
		  	  	${contract.buyTaxr}&nbsp;元</span>
		  	  </c:if>
		  	   </div>
		   	</li>
		  	  <li>
		  	  <div class="tab_txt01">
		         <c:if test="${contract.cardPrice !=null}">
		  	  	<span class="td_01" style="width: 120px;">上牌费：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.cardPrice}&nbsp;元</span>
		  	  	</c:if>
		  	  	   <c:if test="${contract.cardPricer !=null}">
		  	  	<span class="td_01" style="width: 120px;">实到上牌费：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.cardPricer}&nbsp;元</span>
		  	  	</c:if>
		  	  	 </div>
		   	</li>
		  	  	 <li>
		  	  <div class="tab_txt01">
		  	  	   <c:if test="${contract.qualityguarPrice !=null}">
		  	  	   <span class="td_01" style="width: 120px;">质保费用：</span>
		  	  	<span style="line-height: 35px;width:300px;">
		  	  	${contract.qualityguarPrice}&nbsp;元</span>
		  	  	</c:if>
		  	  	  <c:if test="${contract.qualityguarPricer !=null}">
		  	  	   <span class="td_01" style="width: 120px;">实到质保费用：</span>
		  	  	<span style="line-height: 35px;width:300px;">
		  	  	${contract.qualityguarPricer}&nbsp;元</span>
		  	  	</c:if>
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		  	  <c:if test="${contract.delayguarPrice !=null}">
		  	  	<span class="td_01" style="width: 120px;">延保费用：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.delayguarPrice}&nbsp;元</span>
		  	  	</c:if>
		  	  	 <c:if test="${contract.delayguarPricer !=null}">
		  	  	<span class="td_01" style="width: 120px;">实到延保费用：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.delayguarPricer}&nbsp;元</span>
		  	  	</c:if>
		  	  	 </div>
		   	</li>
		  	  	<li>
		  	  <div class="tab_txt01">
		  	  	 <c:if test="${contract.decoratePrice !=null}">
		        <span class="td_01" style="width: 120px;">装潢费用：</span>
		  	  	<span style="line-height: 35px;width:300px;"> ${contract.decoratePrice}&nbsp;元</span>
		  	  </c:if>
		  	   <c:if test="${contract.decoratePricer !=null}">
		        <span class="td_01" style="width: 120px;">实到装潢费用：</span>
		  	  	<span style="line-height: 35px;width:300px;"> ${contract.decoratePricer}&nbsp;元</span>
		  	  </c:if>
			 </div>
		   	</li>	
		   	<li>
		  	  <div class="tab_txt01">
		   		  <c:if test="${contract.insurePrice !=null}">
		  	<span class="td_01" style="width: 120px;">保险费：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.insurePrice}&nbsp;元</span>
		  	  	</c:if>
		  	  	<c:if test="${contract.insurePricer !=null}">
		  	<span class="td_01" style="width: 120px;">实到保险费：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.insurePricer}&nbsp;元</span>
		  	  	</c:if> 
		   		    </div>
		   	</li>		
		   	 	<li>
		  	  <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;">结算：</span>
		         <c:choose>
              <c:when test="${contract.settlement!=null}"> 
		  	  	<span style="line-height: 35px;width:300px;">
		  	  ${contract.settlement}&nbsp;元</span>
		  	  	</c:when>
               <c:otherwise> 
               <span style="line-height: 35px;width:300px;">
		  	  	0.0&nbsp;元</span>
               </c:otherwise>
               </c:choose>
		  	  <span class="td_01" style="width: 120px;">合同补充信息：</span>
		  	  	<span style="line-height: 35px;width:300px;">${contract.otherCont}</span>
			 </div>
		   	</li>
		   	 	  	
<div style="text-align:center"> 
   <video id="video1" src="${contextPath}${contract.videos}" width="420" controls="controls" autoplay="autoplay">
     <%-- <source src="${contextPath}${contract.videos}" type="video/mp4" >
    <source src="${contextPath}${contract.videos}" type="video/ogg" > --%>
    <source src="${contextPath}${contract.videos}" type="video/webm" >
  </video> 
  <br>
  <a onclick="playPause()">播放/暂停</a> 
  <a onclick="makeBig()">放大</a>
  <a onclick="makeSmall()">缩小</a>
  <a onclick="makeNormal()">普通</a>
</div>
 <%--  
 <div style="text-align:center"> 
	<video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="640" height="264"
      poster="http://video-js.zencoder.com/oceans-clip.png"
      data-setup="{}">
    <source src="${contextPath}${contract.videos}" type='video/mp4' />
    <source src="${contextPath}${contract.videos}" type='video/webm' />
    <source src="${contextPath}${contract.videos}" type='video/ogg' />
    <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
    <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
</video>
</div> --%>
		</ul>
		</div>
		<div class="btnlist" style="text-align:center; " >
		<a  href="javascript:void(0);" id="backBtn" class="btn63_01 margin_let10">返回</a>
		</div>
		</div>
	</div>		
</div>

<script type="text/javascript">
/* var myPlayer = videojs('example_video_1');
videojs("example_video_1").ready(function(){
    var myPlayer = this;
    myPlayer.play();
}); */
/* var back=document.getElementById("backBtn"); 
function back() {       
	location.href=$('#backUrl').val();
} */
 var myVideo=document.getElementById("video1"); 

function playPause()
{ 
if (myVideo.paused) 
  myVideo.play(); 
else 
  myVideo.pause(); 
} 

function makeBig()
{ 
myVideo.width=860; 
} 

function makeSmall()
{ 
myVideo.width=320; 
} 

function makeNormal()
{ 
myVideo.width=420; 
} 
 seajs.use("${scriptBasePath}/assetRepository/contractDatails.js");
</script>