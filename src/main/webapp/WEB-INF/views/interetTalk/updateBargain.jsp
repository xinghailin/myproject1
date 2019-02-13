<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<div class="mian_right-new" id="EA">
	<div class="rg_list">
		<h1 class="tt_h1" id="He">砍价配置</h1>
   <form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="UPDATE_BARGAIN"/>" enctype="multipart/form-data">
		<div class="tb_list">
		<ul class="tb_ul02">
		<input type="hidden" id="id" name="id" value="${bar.id}"/>
			<li>
			<div class="tab_txt01">
	        <span class="td_01" style="width: 70px;hight:60px;">砍价总额：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="allMoney" value="${bar.allMoney }"  style="width:100px;text-align: center;" />&nbsp;</span>
	  	  	 <span class="td_01" style="width: 70px;hight:60px;">倒计时间：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="downTime" value="${bar.downTime }"  style="width:100px;text-align: center;" />&nbsp;</span>
			</div>
			</li>
			<li>
		  	  <div class="tab_txt01">
		  	   <span><font size="5">区间金额</font> </span>
			 </div>
		   	</li>
		   	<li>
			<div class="tab_txt01">
	        <span class="td_01" style="width: 70px;">区间1：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="stepOneMoney" value="${bar.stepOneMoney }"  style="width:100px;text-align: center;" />&nbsp;</span>
	        <span class="td_01" style="width: 70px;">区间2：</span>
	        <span style="line-height: 35px;width:160px;"><input type="text"  name="stepTwoMoney" value="${bar.stepTwoMoney }" style="width:100px;text-align: center;"/>&nbsp;</span>
	        <span class="td_01" style="width: 70px;">区间3：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="stepThreeMoney" value="${bar.stepThreeMoney }" style="width:100px;text-align: center;"/>&nbsp;</span>
	  	  	<span class="td_01" style="width: 70px;">区间4：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="stepFourMoney" value="${bar.stepFourMoney }" style="width:100px;text-align: center;"/>&nbsp;</span>
	  	  	<span class="td_01" style="width: 70px;">区间5：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="stepFiveMoney" value="${bar.stepFiveMoney }" style="width:100px;text-align: center;"/>&nbsp;</span>
	  	  	<span class="td_01" style="width: 70px;">区间6：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="stepSixMoney" value="${bar.stepSixMoney }" style="width:100px;text-align: center;"/>&nbsp;</span>
		</div>
		</li>
		<li>
		  	  <div class="tab_txt01">
		  	   <span><font size="5">区间人数</font> </span>
			 </div>
		   	</li>
		   	<li>
			<div class="tab_txt01">
	        <span class="td_01" style="width: 70px;">区间1：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="stepOnePerson" value="${bar.stepOnePerson }"  style="width:100px;text-align: center;" />&nbsp;</span>
	        <span class="td_01" style="width: 70px;">区间2：</span>
	        <span style="line-height: 35px;width:160px;"><input type="text"  name="stepTwoPerson" value="${bar.stepTwoPerson }" style="width:100px;text-align: center;"/>&nbsp;</span>
	        <span class="td_01" style="width: 70px;">区间3：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="stepThreePerson" value="${bar.stepThreePerson }" style="width:100px;text-align: center;"/>&nbsp;</span>
	  	  	<span class="td_01" style="width: 70px;">区间4：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="stepFourPerson" value="${bar.stepFourPerson }" style="width:100px;text-align: center;"/>&nbsp;</span>
	  	  	<span class="td_01" style="width: 70px;">区间5：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="stepFivePerson" value="${bar.stepFivePerson }" style="width:100px;text-align: center;"/>&nbsp;</span>
	  	  	<span class="td_01" style="width: 70px;">区间6：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="stepSixPerson" value="${bar.stepSixPerson }" style="width:100px;text-align: center;"/>&nbsp;</span>
		</div>
		</li>
		<li>
		  	  <div class="tab_txt01">
		  	   <span><font size="5">区间波动</font> </span>
			 </div>
		   	</li>
		   	<li>
			<div class="tab_txt01">
	        <span class="td_01" style="width: 70px;">区间1：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="stepOneWave" value="${bar.stepOneWave }"  style="width:100px;text-align: center;" />&nbsp;</span>
	        <span class="td_01" style="width: 70px;">区间2：</span>
	        <span style="line-height: 35px;width:160px;"><input type="text"  name="stepTwoWave" value="${bar.stepTwoWave }" style="width:100px;text-align: center;"/>&nbsp;</span>
	        <span class="td_01" style="width: 70px;">区间3：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="stepThreeWave" value="${bar.stepThreeWave }" style="width:100px;text-align: center;"/>&nbsp;</span>
	  	  	<span class="td_01" style="width: 70px;">区间4：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="stepFourWave" value="${bar.stepFourWave }" style="width:100px;text-align: center;"/>&nbsp;</span>
	  	  	<span class="td_01" style="width: 70px;">区间5：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="stepFiveWave" value="${bar.stepFiveWave }" style="width:100px;text-align: center;"/>&nbsp;</span>
	  	  	<span class="td_01" style="width: 70px;">区间6：</span>
	  	  	<span style="line-height: 35px;width:160px;"><input type="text" name="stepSixWave" value="${bar.stepSixWave }" style="width:100px;text-align: center;"/>&nbsp;</span>
		</div>
		</li>
		 <li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right" style="line-height:152px">分享图片</span><span>
		  	<img src="${contextPath}${bar.pic}" width="150px" height="150px" style="border: 1px solid #ccc;" id="productImg" /></span></div>
		    </div>
		  </li>
		 <li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">分享图片上传</span><span style="line-height: 15px;">
		  	<input type="file" name="picture" id="Tpic"  style="margin-top: 6px" onchange="imagePreview(this.files,'productImg')"/></span>&nbsp;</div>
		    </div>
		  </li>
		  <li>
		  	<div style="text-align: center;">
		 	<textarea style="" cols="60" rows="3"  placeholder="分享内容"  id="contentSharing" name="contentSharing" value="">${bar.contentSharing}</textarea>&nbsp;</span>
		   <font color="red">提示:限制50个字以内，切勿换行，添加空格</font>
		    </div>
		  </li>
		<div  class="rg_list">
    <table class="tb_mian">
        <thead>
       <li>
		  	  <div class="tab_txt01">
		  	   <span><font size="5">趣话列表</font> </span>
			 </div>
		   	</li> 
        </thead>
        <c:forEach items="${talk }" var="talk">
        <tr>
            <td>${talk.interestTalk }</td>
        </tr>
        </c:forEach>
    </table>
    </div>
    </ul>
    </div>
		<div class="btnlist" style="text-align:center; " >
		<a id="saveBtn" href="javascript:void(0);" onclick="mysubmit(document.editForm.contentSharing)" class="btn63_01 margin_let10">保存</a>
	   <a href="<ufa:url fieldName="FIND_BARGAIN" namespace="car-ms"/>" id="btnReset" class="btn63_02 margin_let10">取消</a>
		</div>	
		 </form>
		</div>
	</div>		
<script type="text/javascript">
function mysubmit(textAreaControl){
	  
	  var textToSplit = textAreaControl.value;
		if (textToSplit=='')
		{
			alert("请填写分享内容！");
		}else{
		 document.getElementById("editForm").submit();
		}
		}
function imagePreview(obj,imgObj){
	var f = obj[0];
	var src = window.URL.createObjectURL(f);
	$('#'+imgObj).attr('src',src) ;
}
</script>