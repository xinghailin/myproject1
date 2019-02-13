<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<style>
.content2{
    position: relative;
}
.addbg{
    background: #2196f3;
    color: #fff;
}
.result{
    position: absolute;
    z-index: 999;
    background: #f0f0f0;
    border: 1px solid #ccc;
    overflow-y:auto;
}
</style>

<input id="editUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="bizshopgroupedit"/>' />
<input id="searchUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="USER_SERACH_BY_NAME"/>' />
 <form name="addForm" id="addForm"><input type="hidden" id="infoid" name="id" value="${shopGroup.id}"> 
	<div class="table_list2">
		<div class="tablist_margin0">
			<div class="tablist">
				<p class="title_p2 fz_14px">编辑组</p>
				<ul class="tb_ul">
					<li>
						<div class="tab_txt01"><span class="td_01"><label class="fc_red">* </label>组名：</span> <span class="td_02" style="margin-top: 4px;"><input name="name" id="name" type="text" class="input_text" value="${shopGroup.name}" /></span></div>
				</li>
									<li>
						<div class="tab_txt01">
							<span class="td_01">
								<label class="fc_red">* </label>主账号：
							</span>
							<span class="td_02" style=" width: 300px;">
								<div class="content2">
									<div class="first">
										<input id="hostname" value="${shopGroup.hostname}" name ="hostname" onKeyup="getContent(this);" type="text"/>
									     <input id="hostid"  value="${shopGroup.hostid}" name = "hostid" type="hidden" class="fid" /> 
									</div>
									<div id="append1" class="result"></div>
								</div>
							</span>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01">
								<label class="fc_red">* </label>副账号1：
							</span>
								<span class="td_02" style="width: 300px;">
									<div class="content2">
										<div class="first">
											<input id="assistant1name" value="${shopGroup.assistant1name}" name="assistant1name" onKeyup="getContent(this);" type="text"/>
											<input id="assistant1id" value="${shopGroup.assistant1id}" name="assistant1id" type="hidden" class="fid" />
										</div>
										<div id="append2" class="result"></div>
									</div>
								</span>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01">
								<label class="fc_red">* </label>副账号2：
							</span>
								<span class="td_02" style="width: 300px;">
									<div class="content2">
										<div class="first">
											<input id="assistant2name" value="${shopGroup.assistant2name}" name="assistant2name" onKeyup="getContent(this);" type="text"/>
											<input id="assistant2id" value="${shopGroup.assistant2id}" name="assistant2id" type="hidden" class="fid" />
										</div>
										<div id="append3" class="result"></div>
									</div>
								</span>
						</div>
					</li>
				<li>
						<div class="tab_txt01"><span class="td_01"><label class="fc_red">* </label>同一组：</span> <span class="td_02" style="overflow-y: auto; height: 450px; width: 300px;">
								<table>
									<c:forEach items="${shopList}" var="item">
										<tr><td><input name="shopids" id="shopids${item.id}" type="checkbox" class="input_text" value="${item.id}" <c:if test="${item.flag eq '1'}">checked="checked"</c:if> /> ${item.name}</td></tr>
									</c:forEach>
							</table>
						</span></div>
				</li>				
			</ul>
		</div>
			<div class="btnlist"><a href="javascript:void(0);" id="addBtn" class="btn63_01" style="margin-left: 30%">确定</a> <a id='resetBtn' href="javascript:void(0);" class="btn63_02 margin_let10">重置</a> <a href="javascript:window.close();" class="btn63_02 margin_let10">关闭</a></div>
	</div>
</div></form>
<script type="text/javascript">
	// 加载入口模块
	seajs.use("${scriptBasePath}/shopGroup/groupedit.js");
</script>
