<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input id="carcasesaveUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="carcasesave"/>'/> 
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<div class="table_list2">
  <div class="tablist_margin0">
      <div class="tablist" style="overflow-y: scroll;height:800px;">
       <c:if test="${type==2 }">
        <p class="title_p2 fz_14px">添加车辆情况</p>
        </c:if>
         <c:if test="${type==1 }">
        <p class="title_p2 fz_14px">车辆情况</p>
        </c:if>
        <form name="configForm" id="configForm">
          <ul >
           <c:if test="${type==2 }">
            <li>
            <input type="hidden" id="id" name="id" value="${id }">
		        <table align="center" cellpadding="0" cellspacing="0" class="kft_all_table"> 
			   	<tr>
			      <td width="100%" > 
			         <table>
			        <textarea id="carcase" name="carcase" style="margin-left:10px" cols="45" rows="10" id="reason"></textarea>
			        </table>
			      </td>
			   </tr>
			 </table>
            </li>
               
            <li>
              <div class="btnlist">
			   <a onclick="submitBtn()" href="javascript:void(0);" class="btn63_03" style="margin-left:30%"><span>保存</span></a>
			   <a  onclick="closeBtn()" href="javascript:void(0);" class="btn63_04 margin_let10"><span>关闭</span></a>
		      </div>
            </li></c:if>
             <c:if test="${type==1 }">
          	<c:forEach var="item" items="${carcase}">
          	<div>
          		<span class="td_01" style="width: 240px;margin-left: 20px">门店名称：</span>
				<span class="td_02" style="margin-top: 10px;">${item.shopname }
				</span>
				<span class="td_01" style="width: 240px;">填写时间：</span>
				<span class="td_02" style="margin-top: 10px;"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${item.createtime }" />
				</span><br/>
					<span class="td_01" style="display:block;margin-left:-60px">车况：</span>
					
				<span class="td_02" style="margin-top: 10px;"><textarea  style="margin-left:10px;resize:none" cols="45" rows="5" >${item.carcase }</textarea>
				</span>
          	</div>
             </c:forEach>
              <div class="btnlist" align="center">
			   <a  onclick="closeBtn()" href="javascript:void(0);"  class="btn63_04 margin_let10"><span>关闭</span></a>
		      </div>
             </c:if>
          </ul>
	   </form>
      </div>
  </div>
</div>
<script type="text/javascript">
function closeBtn(){window.close()};

function submitBtn(){
	var carcasesave=$('#carcasesaveUrl').val();
	var id=$('#id').val();
	var carcase=$('#carcase').val();
	$.ajax({
        url:carcasesave,
        type:'post',
        datatype:'json',
        data: {carcase:carcase,id:id},
        success:function(data){
        	if(data.status){
        		alert('保存成功');
        		window.close()
        	}else{
        		alert(data.msg);
        	}
        }
	});
}
</script>