<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<input id="configUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="PERMISSION_ROLE_CONFIG_MENU_URL"/>'/> 
<div class="table_list2">
  <div class="tablist_margin0">
      <div class="tablist" style="overflow-y: scroll;height:800px;">
        <p class="title_p2 fz_14px">角色菜单维护</p>
        <form name="configForm" id="configForm">
          <ul class="tb_ul">
            <li>
		        <table align="center" cellpadding="0" cellspacing="0" class="kft_all_table"> 
			   	<tr>
			      <td width="100%" > 
			         <table>
			         <c:forEach var="item" items="${remainList}">
			         <tr>
			          <td id="menuItems">
 			            <c:if test="${item.parentId!=0}">
			               &nbsp;
			            </c:if>
			            <input type="checkbox" name="menuItems" id="menuItems${item.id}" <c:if test="${item.parentId==0}"> onclick="checkAll(${item.id});"</c:if><c:if test="${item.parentId!=0}"> onclick="checkParent(${item.parentId});"</c:if>  ${item.isUsed} value="${item.id}" parentId="${item.parentId}" /> ${item.menuName}
			          </td>
			          </tr>
			         </c:forEach>
			        </table>
			      </td>
			   </tr>
			 </table>
            </li>
            <li>
              <div class="btnlist">
			   <a id='submitBtn' href="javascript:void(0);" class="btn63_03" style="margin-left:30%"><span>保存</span></a>
			   <a id='closeBtn' href="javascript:void(0);" class="btn63_04 margin_let10"><span>关闭</span></a>
		      </div>
            </li>
          </ul>
 	      <input type="hidden" name="roleId" value="${role}"/>
	   </form>
      </div>
  </div>
</div>
<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/permission/role/configMenu.js?t=201607211014");
</script>