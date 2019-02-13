<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<input id="configUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="PERMISSION_ROLE_CONFIG_RESOURCE_URL"/>'/> 
<div class="table_list2">
  <div class="tablist_margin0">
      <div class="tablist">
        <p class="title_p2 fz_14px">角色权限维护</p>
        <form name="configForm" id="configForm">
          <ul class="tb_ul">
            <li>
              <table align="center" cellpadding="0" cellspacing="0" class="kft_all_table"> 
	  <tr> 
	      <td width="45%" style="text-align:right"> 
	          <select id="source" multiple="true" style="width:200px" size="10">
	          	<c:forEach var="item" items="${allResources}">
	          		<option value=${item.id}>${item.name}</option>
	          	</c:forEach>
	          </select>
	      </td> 
	      <td align="center" width="5%">
	    	  <div class="kftrow_button_left">
		            <ul class="kft_button">
		              <li><a id='addAllBtn' href="javascript:void(0);"><span><c:out value=">>"/></span></a></li><br>
		              <li><a id='addOneBtn' href="javascript:void(0);"><span><c:out value=">"/></span></a></li><br>
		              <li><a id='removeOneBtn' href="javascript:void(0);"><span><c:out value="<"/></span></a></li><br>
		              <li><a id='removeAllBtn' href="javascript:void(0);"><span><c:out value="<<"/></span></a></li><br>
		            </ul>
	          </div>
          </td>
	      <td width="45%" style="text-align:left"> 
	          <select id="target" name="target" multiple="true" style="width:200px" size="10">
	          	<c:forEach var="item" items="${usedResources}">
	          		<option value=${item.id}>${item.name}</option>
	          	</c:forEach>
	          </select> 
	      </td> 
	  </tr> 
	</table> 
            </li>
            <li>
              <div class="btnlist">
			   <a id='submitBtn' href="javascript:void(0);" class="btn63_01" style="margin-left:15%"><span>保存</span></a> 
			   <a id='resetBtn' href="javascript:void(0);" class="btn63_02 margin_let10"><span>重置</span></a>
			   <a id='closeBtn' href="javascript:void(0);" class="btn63_02 margin_let10"><span>关闭</span></a>
		      </div>
            </li>
          </ul>
  	     
	<input type="hidden" name="role" value="${role}"/>
  </form>
      </div>
  </div>
</div>
<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/permission/role/configResource.js");
</script>
