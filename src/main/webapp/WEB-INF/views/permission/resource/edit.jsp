<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<%-- <link rel='stylesheet' type="text/css" href='${cssBasePath}/index.css' />
<link rel='stylesheet' type="text/css" href='${cssBasePath}/common.css' />
<link rel='stylesheet' type="text/css" href='${cssBasePath}/jquery.css' /> --%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/common/taurus-common.css" rel="stylesheet">
<input id="editUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="PERMISSION_RESOURCE_EDIT_URL"/>' />
<form name="editForm" id="editForm">
<input name="id" id="id" value="<c:out value='${resource.id}'/>" type="hidden" />
<div class="table_list2" style="margin-left: 0px;">
	<div class="tablist_margin0">
		<div class="tablist">
		    <p class="title_p2 fz_14px">修改资源</p>
			<ul class="tb_ul">
			  <li>
			  	<div class="tab_txt01">
			  		<span class="td_01"><label class="fc_red">*</label>资源名称：</span>
			  		<span class="td_02"><input name="name" id="name" value="<c:out value='${resource.name}'/>" type="text" class="input_text" /></span>
			  	</div>
			  </li>
			   <li>
			  	<div class="tab_txt01"><span class="td_01">URI：</span>
			  		<span class="td_02"><input name="uri" id="uri" value="<c:out value='${resource.uri}'/>" type="text" class="input_text" /></span>
			  	</div>
			  </li>
			   <li>
			  	<div class="tab_txt01"><span class="td_01">请求方法：</span>
			  		<span class="td_02">
                    <select id="method" name="method" class="select">
						<option value="GET" <c:if test="${resource.method == 'GET'}">selected</c:if>>GET</option>
						<option value="POST" <c:if test="${resource.method == 'POST'}">selected</c:if>>POST</option>
					</select>
                    </span>
 			  	</div>
			  </li>
			  <li>
			  	<div class="tab_txt01">
			  		<span class="td_01">所属系统：</span>
			  		<span class="td_02">
					<select id="appId" name="appId" class="select">
						<!-- <option>请选择</option> -->
						<option value="1" <c:if test="${resource.appId == 1}">selected</c:if> >门户</option>
						<option value="2" <c:if test="${resource.appId == 2}">selected</c:if> >管理平台</option>
					</select>
			  		</span>
			  	</div>
			  </li>
			  <li>
			  	<div class="tab_txt01"><span class="td_01">状态：</span>
			  		<span class="td_02">
						<select id="status" name="status" class="select">
							<option value="1" <c:if test="${resource.status == 1}">selected</c:if> >有效</option>
							<option value="0" <c:if test="${resource.status == 0}">selected</c:if> >无效</option>
						</select>
			  		</span>
			  	</div>
			  </li>
			 <li>
			  	<div class="tab_txt01"><span class="td_01">描述：</span>
			  		<span class="td_02">
						<input name="description" id="description" value="<c:out value='${resource.description}'/>" class="input_text"/>
			  		</span>
			  	</div>
			  </li>
			</ul>
		</div>
		<div class="btnlist">
				<a id='submitBtn' class="btn63_01" style="margin-left:15%" href="javascript:void(0);"><span>保存</span></a>
				<a id='resetBtn' class="btn63_02 margin_let10" href="javascript:void(0);"><span>重置</span></a>
				<a href="javascript:window.close();"  class="btn63_02 margin_let10">关闭</a>
		</div>
	</div>
</div>
</form>


<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/permission/resource/edit.js");
</script>
