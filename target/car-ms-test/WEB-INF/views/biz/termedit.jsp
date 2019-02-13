<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input id="addUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="bizshoptermedit"/>' />
<form name="addForm" id="addForm"><input type="hidden" id="infoid" name="id" value="${term.id }">
	<div class="table_list2">
		<div class="tablist_margin0">
			<div class="tablist">
				<p class="title_p2 fz_14px">编辑组</p>
				<ul class="tb_ul">
					<li>
						<div class="tab_txt01"><span class="td_01"><label class="fc_red">* </label>组名：</span> <span class="td_02" style="margin-top: 4px;"><input name="name" id="name" type="text" class="input_text" value="${term.name}" /></span></div>
				</li>
					<li>
						<div class="tab_txt01"><span class="td_01"><label class="fc_red">* </label>总额度：</span> <span class="td_02" style="margin-top: 4px;"><input name="totalmoney" id="totalmoney" type="text" class="input_text" value="${term.totalmoney}" /></span><span>单位：万</span></div>
				</li>
					<li>
						<div class="tab_txt01"><span class="td_01">放大比例：</span> <span class="td_02" style="margin-top: 4px;"> <input name="bigScale" id="bigScale" type="text" class="input_text" value="${term.bigScale}" /></span></div>
				</li>
					<li>
						<div class="tab_txt01"><span class="td_01"><label class="fc_red"></label>负责人：</span> <span class="td_02" style="margin-top: 4px;"> <input name="principal" id="principal" type="text" class="input_text" value="${term.principal}" /></span></div>
				</li>
					<li>
						<div class="tab_txt01"><span class="td_01"><label class="fc_red"></label>最早开店日期：</span> <span class="td_02" style="margin-top: 4px;"> <input name="shopFirstCreatTime" id="shopFirstCreatTime" type="text" class="input_text"
								value="<fmt:formatDate pattern="yyyy-MM-dd" value="${term.shopFirstCreatTime}"/>" readonly="readonly" /></span></div>
				</li>
					<li>
						<div class="tab_txt01"><span class="td_01"><label class="fc_red">* </label>门店：</span> <span class="td_02" style="overflow-y: auto; height: 450px; width: 300px;">
								<table>
									<c:forEach items="${shopList}" var="item">
										<tr><td><input name="shopId" id="shopId${item.id}" type="checkbox" class="input_text" value="${item.id}" <c:if test="${item.flag eq '1'}">checked="checked"</c:if> /> ${item.name}</td></tr>
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
	seajs.use("${scriptBasePath}/biz/termedit.js");
</script>
