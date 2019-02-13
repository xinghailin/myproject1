<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="FIND_CAR" namespace="car-ms"/>">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<div class="mian_right-new" id="EA">
	<div class="rg_list">
		<h1 class="tt_h1" id="He">询底价</h1>
		
			<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="HELP_FIND_CAR_MANAGE"/>" enctype="multipart/form-data">
		<div class="tb_list">
		<ul class="tb_ul02">
		<li>
		<input type="hidden" id="id" name="id" value="${findcar.id}" />
		<input type= "hidden" id="userid" name="userid" value="${findcar.userid}" />
		<input type="hidden" id="wechatid" name="wechatid" value="${findcar.wechatid}" />
		<input id="currpage" value="${currpage }" type="hidden"/>
		  	  <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">品牌车系：</span>
		  	  	<span style="line-height: 35px;width:300px;">${findcar.brand}&nbsp;</span>
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">姓&nbsp;&nbsp;名：</span>
		  	  	<span style="line-height: 35px;width:300px;">${findcar.name}&nbsp;</span>
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">手机&nbsp;号：</span>
		  	  	<span style="line-height: 35px;width:300px;">${findcar.phone}&nbsp;</span>
			 </div>
			 <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">城&nbsp;&nbsp;市：</span>
		  	  	<span style="line-height: 35px;width:300px;">${findcar.city}&nbsp;</span>
			 </div>
			   <c:if test="${findcar.detail==null||findcar.detail==''}">
			 <div class="tbul02_left02" style="width:30%">
				<div class="tab_txt01">
					<span class="td_01" style="width: 120px;">找车情况：</span> 
					<span class="td_02" style="line-height: 20px;width:300px;">
		  	  <input type="radio"  name="status" value="1"/>找到车&nbsp;
		  	  	<input type="radio"  name="status" value="2"/>未找到车&nbsp;
						</div>
					</div>
			
		  	  	<div class="tab_txt01" >
		  	  	  <span class="td_01" style="width: 120px;">沟通详情：</span>
		  	  	<span style="width:300px;">
		  	  	<textarea style="" cols="60" rows="3"  placeholder="" id="detail" name="detail" value=""></textarea>&nbsp;</span>
		     </div>	
		 	    
			</li>
			</form>
			</ul>
		</div>
		
		<div class="btnlist" style="text-align:center; " >
	<input type="button" value="保存" name="buttonSplit" class="btn63_01 margin_let10" onclick="mysubmit(document.editForm.detail)">
	<a href="<ufa:url fieldName="FIND_CAR" namespace="car-ms"/>" id="btnReset" class="btn63_02 margin_let10">取消</a>
	<a  href="javascript:void(0);" onclick="back()" class="btn63_01 margin_let10">返回</a>
		</div>	
		</c:if>	
		   <c:if test="${findcar.detail!=null&&findcar.detail!=''}"><!-- 已经处理 -->
	        <div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">找车情况：</span>
		  	    <c:if test="${findcar.status=='1'}">
		  	  	<span style="line-height: 35px;width:300px;">找到车&nbsp;</span>
		  	  		</c:if>	
		  	  		 <c:if test="${findcar.status=='2'}">
		  	  	<span style="line-height: 35px;width:300px;">未找到车&nbsp;</span>
		  	  		</c:if>	
			 </div>
			
		  	  	<div class="tab_txt01">
		  	   <span class="td_01" style="width: 120px;">沟通详情：</span>
		  	  	<span style="line-height: 35px;width:300px;">${findcar.detail}&nbsp;</span>
			 </div>
		 	    
			</li>
			</form>
			</ul>
		</div>
		<div class="btnlist" style="text-align:center; " >
		<a  href="javascript:void(0);" onclick="back()" class="btn63_01 margin_let10">返回</a>
		</div>	
		</c:if>	
		
		</div>
	</div>		
</div>

<script type="text/javascript">
function mysubmit(textAreaControl){
	  var  obj  =  document.getElementsByName('status');   
	  for   (i=0;i<obj.length;i++){   
	  if   (obj[i].checked){   
	  var textToSplit = textAreaControl.value;
		if (textToSplit=='')
		{
			alert("请填写沟通详情！");
		}else{
			alert("保存成功！");
		 document.getElementById("editForm").submit();
		}
	  return;   
	  }   
	  }  
	  alert('请勾选找车情况！');
	  }   
function back(){
	location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val();
	}
</script>