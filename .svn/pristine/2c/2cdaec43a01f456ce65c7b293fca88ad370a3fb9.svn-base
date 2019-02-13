<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="MEET_SHOP" namespace="car-ms"/>">
<input type="hidden" id="addUrl" value="<ufa:url fieldName="MANAGE_MEET" namespace="car-ms"/>">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<div class="mian_right-new" id="EA">
	<div class="rg_list">
		<h1 class="tt_h1" id="He">预约详情</h1>
		<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="MANAGE_MEET"/>" enctype="multipart/form-data">
		
		<div class="tb_list">
		<ul class="tb_ul02">
		<li>
		<input type="hidden" id="id" name="id" value="${me.id}" />
		<input id="currpage" value="${currpage }" type="hidden" name="currpage"/>
		  	  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">预约车辆型号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${me.cartype}&nbsp;</span>
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">预约客户姓名：</span>
		  	  	<span style="line-height: 35px;width:300px;">${me.name}&nbsp;</span>
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">预约&nbsp;&nbsp;时间：</span>
		  	  	<span style="line-height: 35px;width:300px;"><fmt:formatDate value="${me.seetime}" pattern="yyyy-MM-dd"/>&nbsp;</span>
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">预约门店名称：</span>
		  	  	<span style="line-height: 35px;width:300px;">${me.shop}&nbsp;</span>
			 </div>
			<c:if test="${me.status==null||me.status==''}">
			<div class="tbul02_left02" style="width:30%">
				<div class="tab_txt01">
					<span class="td_01" style="width: 120px;">预约&nbsp;&nbsp;处理：</span> 
					<span class="td_02" style="line-height: 20px;width:300px;">
		  	      <input type="radio"  name="status" value="1"/>处理&nbsp;
						</div>
					</div>
			
		  	  	<div class="tab_txt01" >
		  	  	  <span class="td_01" style="width: 120px;">交谈&nbsp;&nbsp;详情：</span>
		  	  	<span style="width:300px;">
		  	  	<textarea style="" cols="60" rows="3"  placeholder=""  name="detail" id="detail" value=""></textarea>&nbsp;</span>
		     </div>
		     </c:if>
		     <c:if test="${me.status=='1'}">
		     <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">预约&nbsp;&nbsp;处理：</span>
		  	  	<span style="line-height: 35px;width:300px;">已经处理</span>
			 </div>
			<div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">交谈&nbsp;&nbsp;详情：</span>
		  	  	<span style="line-height: 35px;width:300px;">${me.detail}&nbsp;</span>
			 </div>
			 </c:if>
			</li>
			
			</ul>
		</div>
		<c:if test="${me.status==null||me.status==''}">
		<div class="btnlist" style="text-align:center; " >
		<input type="button" value="保存" name="buttonSplit" class="btn63_01 margin_let10" onclick="mysubmit(document.editForm.detail)">
			<a  href="javascript:void(0);" onclick="back()" class="btn63_01 margin_let10">取消</a>
		</div>
		 </c:if>
		  <c:if test="${me.status=='1'}">
		 	<div class="btnlist" style="text-align:center; " >
			<a  href="javascript:void(0);" onclick="back()" class="btn63_01 margin_let10">返回</a>
		</div>
		 </c:if>
		</form>
		
		</div>
	</div>		
</div>
<script type="text/javascript">
function mysubmit(textAreaControl){
	var   obj   =   document.getElementsByName('status');   
	  for   (i=0;i<obj.length;i++){   
	  if   (obj[i].checked){   
	  var textToSplit = textAreaControl.value;
		if (textToSplit=='')
		{
			alert("请填写交谈详情！");
		}else{
			alert("保存成功！");
		 document.getElementById("editForm").submit();
		}
	  return;   
	  }   
	  }   
	  alert('请勾选处理');   
	
	};
	function back(){
		location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val();
		}
</script>