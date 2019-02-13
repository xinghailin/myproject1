<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/content.css" rel="stylesheet">
<link rel='stylesheet' type="text/css" href='${cssBasePath}/common/car.css' />
<link rel='stylesheet' type="text/css" href='${cssBasePath}/common/qiyi.css' />
<link rel='stylesheet' type="text/css" href='${cssBasePath}/common/myButton.css' />

<input type="hidden" id="backUrl" value="<ufa:url fieldName="CLIENT_INFO_LST" namespace="car-ms"/>">
<input type="hidden" id="mainUrl" value="<ufa:url fieldName="CLIENT_INFO_LST" namespace="car-ms"/>">
<input id="addUrl" type="hidden" value="<ufa:url namespace="car-ms" fieldName="VIDEOS_UPLOAD"/>"/>
<div class="mian_right-new" id="EA">
	<div class="rg_list">
		<h1 class="tt_h1" id="He">车辆销售合同</h1>
		<div class="tb_list">
		<ul class="tb_ul02">
		<form name="editForm" id="editForm" method="POST"  enctype="multipart/form-data" action="<ufa:url namespace="car-ms" fieldName="CONTRACT_SUBMIT"/>" target="hideiframe">
		<input id="shopId" name="shopId" type="hidden" value='${shopId}'/>
		<input id="carId" name="carId" type="hidden" value='${carId}'/>
		<li><input id="currpage" value="${currpage }" type="hidden" name="currpage"/>
		  	<div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">门店名称：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="hidden" id="shopName" name="shopName" value="${shopName}" />${shopName}&nbsp;</span>
				
				<span class="td_01" style="width: 120px;">档案编号：</span>
		  	  	<span style="line-height: 35px;width:300px;">
		  	  	<input type="hidden" id="infoId" name="infoId" value="${infoId}"/>
		  	  	<input type="hidden" id="infoNum" name="infoNum" value="${infoNum}"/>${infoNum}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">销售人员：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="hidden" id="sellerName" name="sellerName" value="${name}" />${name}&nbsp;</span>		
			</div>
		</li>
		<li>
		  	<div class="tab_txt01">
		  	  	
		  	  	<span class="td_01" style="width: 120px;">甲方（卖方）：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="parta" name="parta" value="" />&nbsp;</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">住所（地址）：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="addressa" name="addressa" value="" />&nbsp;</span>
		  	  	
		  	  	<span class="td_01" style="width: 120px;">邮政编码：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="postcodea" name="postcodea" value="" />&nbsp;</span>
  	  			
  	  		</div>
  	  	</li>
  	  	<li>
  	  			<div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">联系电话：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="phonea" name="phonea" value="" />&nbsp;</span>
		  	  	<%-- <input type="hidden" id="sellerId" name="sellerId" value="${sellerId}" />
		  	  	<input type="hidden" id="sellerCode" name="sellerCode" value="${sellerCode}" />
		  	  	<input type="hidden" id="sellerName" name="sellerName" value="${sellerName}" /> --%>
			 </div>
		</li>
		<li>
		  	  <div class="tab_txt01">
		  	  
		  	  	<span class="td_01" style="width: 120px;">乙方（买方）：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="buyerName" name="buyerName" value="${buyerName}" />&nbsp;</span>
		        
		  	  	<span class="td_01" style="width: 120px;">住所（地址）：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="addressb" name="addressb" value="" />&nbsp;</span>
		        
		        <span class="td_01" style="width: 120px;">邮政编码：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="postcodeb" name="postcodeb" value="" />&nbsp;</span>
		 	</div>
		 </li>     
		 <li>
		  	  	<div class="tab_txt01">  
		        <span class="td_01" style="width: 120px;">联系电话：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="phone" name="phone" value="${phone}" />&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">身份证号：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="identify" name="identify" value="${identify}" />&nbsp;</span>
		  	</div>
		 </li> <li>
		  	  <div class="tab_txt01"> 	
		  	  	<span class="td_01" style="width: 120px;">委托代理人：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="agent" name="agent" value="" />&nbsp;</span>
		        <span class="td_01" style="width: 120px;">联系电话：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text"  name="agentPhone" value="" />&nbsp;</span>
			 </div>
		   	</li>
		<li>
		  	  <div class="tab_txt01"><span class="td_01" style="width: 120px;">车辆信息</span>
		  	  </div>
		   	</li><li>
		  	  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">发动机号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.engineNum}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">车架号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.vin}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">车辆品牌：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.brand}&nbsp;</span>
			 </div>
		   	</li><li>
		  	  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">车辆型号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.model}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">车辆版别：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.version}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">出厂日期：</span>
		  	  	<span style="line-height: 35px;width:300px;"><fmt:formatDate pattern="yyyy-MM-dd" 
            value="${car.leaveFactoryTime}" />&nbsp;</span>
			 </div>
		   	</li><%-- <li>
		  	  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">排量：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.displacement}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">工信部综合油耗：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.oilWear}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">排放：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.discharge}&nbsp;</span>
			 </div>
		   	</li> --%><%-- <li>
		  	  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">整体质量：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.weight}&nbsp;</span>
		        <span class="td_01" style="width: 120px;">车身级别：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.level}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">变速箱：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.gearbox}&nbsp;</span>
			 </div>
		   	</li> --%><li>
		  	  <div class="tab_txt01">
		  	   <%-- <span class="td_01" style="width: 120px;">车辆能源类型：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.energyType}&nbsp;</span> --%>
		        <span class="td_01" style="width: 120px;">外观颜色：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.outlookColor}&nbsp;</span>
		  	  	<span class="td_01" style="width: 120px;">内饰颜色：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.innerColor}&nbsp;</span>
		  	  	 <span class="td_01" style="width: 120px;">采购商名称：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.buyName}&nbsp;</span>
			 </div>
		   	</li><li>
		  	  <div class="tab_txt01">
		  	   
		       
		  	  	<span class="td_01" style="width: 120px;">仓库地点：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.address}&nbsp;</span>
		  	  		<span class="td_01" style="width: 120px;">加装：</span>
		  	  	<span style="line-height: 35px;width:300px;">${car.decorate}&nbsp;</span>
			 </div>
		   	</li>
		   	<li style="width:240px; float:left;">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.iden1}" style="width:100px;height:100px;" id="productImg1">
			  		</span>
			  	</div><div class="tab_txt01">		  	   
			  		<span class="td_02" style="margin-left:90px">关单<br/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			  <li style="width:240px; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.iden2}" style="width:100px;height:100px;" id="productImg2">
			  		</span>
			  	</div><div class="tab_txt01">		  	   
			  		<span class="td_02" style="margin-left:90px">商检单<br/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			  <li style="width:240px; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.iden3}" style="width:100px;height:100px;" id="productImg3">
			  		</span>
			  	</div><div class="tab_txt01">		  	   
			  		<span class="td_02" style="margin-left:90px">车辆一致性证书(正面)<br/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			  <li style="width:240px; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.iden5}" style="width:100px;height:100px;" id="productImg3">
			  		</span>
			  	</div><div class="tab_txt01">		  	   
			  		<span class="td_02" style="margin-left:90px">车辆一致性证书(反面)<br/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			  <li style="width:240px; float:left">
			  	<div class="tab_txt01">		  	   
			  		<span class="td_01" style="margin-left:50px">
			  		  <img src="${contextPath}${car.iden4}" style="width:100px;height:100px;" id="productImg4">
			  		</span>
			  	</div><div class="tab_txt01">		  	   
			  		<span class="td_02" style="margin-left:90px">环保清单<br/>&nbsp;
			  		</span>
			  	</div>
			  </li>
			<li>
		  	  <div class="tab_txt01">
		  	  <span class="td_01" style="width: 120px;">销售价：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="hidden" id="sellerprice" name="sellerprice" value="${car.sellerprice}" />${car.sellerprice}&nbsp;</span>
		  	  </div>
			  </li>
			  <li>
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 120px;">车辆销售价：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="salePrice" name="salePrice" value="" />&nbsp;元</span>
		  	  	<span class="td_01" style="width: 120px;">定金金额：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text" id="downpay" name="downpay" value="" />&nbsp;元</span>
		  	  <label class="">上传视频：</label>
			   <input type="file" name="iden5" id="iden5" value="视频格式mp4"/>
			  	<font color="red">提示：上传视频为mp4(avc h264)格式 用格式工厂转换</font>
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;"><input type="checkbox" id="cb1" onchange="check('#insurePrice','cb1');" >保险费：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text"  readonly="readonly"  id="insurePrice" name="insurePrice" value="" />&nbsp;元</span>
		  	  	<span class="td_01" style="width: 120px;"><input type="checkbox"   id="cb2" onchange="check('#buyTax','cb2');" >购置税：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text"  readonly="readonly" id="buyTax" name="buyTax" value="" />&nbsp;元</span>
		  	  	<span class="td_01" style="width: 120px;"><input type="checkbox"   id="cb3" onchange="check('#cardPrice','cb3');" >上牌费：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text"  readonly="readonly" id="cardPrice" name="cardPrice" value="" />&nbsp;元</span>
			 </div>
		   	</li>
		   	<li>
		  	  <div class="tab_txt01">
		        <span class="td_01" style="width: 120px;"><input type="checkbox"   id="cb4" onchange="check('#qualityguarPrice','cb4');" >质保费：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text"  readonly="readonly" id="qualityguarPrice" name="qualityguarPrice"  value="" />&nbsp;元</span>
		  	  	<span class="td_01" style="width: 120px;"><input type="checkbox"   id="cb5" onchange="check('#delayguarPrice','cb5');" >延保费：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text"  readonly="readonly" id="delayguarPrice" name="delayguarPrice" value="" />&nbsp;元</span>
		  	  	<span class="td_01" style="width: 120px;"><input type="checkbox"   id="cb6" onchange="check('#decoratePrice','cb6');" >装潢费：</span>
		  	  	<span style="line-height: 35px;width:300px;"><input type="text"  readonly="readonly" id="decoratePrice" name="decoratePrice" value="" />&nbsp;元</span>
			
			 </div>
		   	</li>
		   	<li>
		   	<div style=""><textarea style="margin-left:100px" cols="60" rows="3"  placeholder="合同补充条款"  name="otherCont" id="otherCont" value=""></textarea>
		</div></li>
		
		  </form>
		</ul>
		</div>
		<div class="btnlist">
		<div style="width: 300px; margin: auto;">
		<a href="javascript:void(0);" class="btn63_01" id="saveBtn">提交审核</a>
		
		<a id='backBtn' href="javascript:void(0);" class="btn63_02 margin_let10">取消</a>
		
		</div>
		</div>
	</div>		
</div>
<iframe name="hideiframe" style="display: none;"></iframe>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/outRepository/contract.js?r=<%=new Date()%>");
</script>
