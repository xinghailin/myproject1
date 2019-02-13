<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="queryUrl" value="<ufa:url fieldName="UPDATE_RECOMMEND_CAR" namespace="car-ms"/>">
<input type="hidden" id="saveUrl" value="<ufa:url fieldName="UPDATE_CAR_MODEL" namespace="car-ms"/>">
<input type="hidden" id="pageUrl" value="<ufa:url fieldName="RECOMMEND_CARTYPE" namespace="car-ms"/>">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<div class="mian_right-new" id="EA">
	<div class="rg_list">
	<c:choose>
   <c:when test="${talk.id !=null}"> 
		<h1 class="tt_h1" id="He">趣话修改</h1>
   </c:when>
   <c:otherwise> 
       <h1 class="tt_h1" id="He">趣话添加</h1>
   </c:otherwise>
   </c:choose>
   <form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="ADD_INTEREST_TALK"/>" enctype="multipart/form-data">
		<div class="tb_list">
		<ul class="tb_ul02">
		<input type="hidden" id="id" name="id" value="${talk.id}"/>
		  <li>
		  	<div style="text-align: center;">
		 	<textarea style="" cols="60" rows="3"  placeholder="趣话"  id="interestTalk" name="interestTalk" value="">${talk.interestTalk}</textarea>&nbsp;</span>
		   <font color="red">提示:限制20个字</font>
		    </div>
		  </li>
		</ul>
		</div>
		<div class="btnlist" style="text-align:center; " >
		<a id="saveBtn" href="javascript:void(0);" onclick="mysubmit(document.editForm.interestTalk)" class="btn63_01 margin_let10">保存</a>
	   <a href="<ufa:url fieldName="INTEREST_TALK" namespace="car-ms"/>" id="btnReset" class="btn63_02 margin_let10">取消</a>
		</div>	
		 </form>
		</div>
	</div>		
<script type="text/javascript">
function mysubmit(textAreaControl){
	  
	  var textToSplit = textAreaControl.value;
		if (textToSplit=='')
		{
			alert("请填写趣话！");
		}else{
		 document.getElementById("editForm").submit();
		}
		}
</script>