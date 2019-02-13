<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/common/common.css" rel="stylesheet">
<link rel='stylesheet' type="text/css" href='${cssBasePath}/common/common.css' />
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery-default.css" />
<link rel="stylesheet" type="text/css" href="${cssBasePath}/common/index.css" />
<input type="hidden" id="saveUrl"
	value="<ufa:url fieldName="saveIssuingCompany" namespace="car-ms"/>">
<input type="hidden" id="issuingCompany"
	value="<ufa:url fieldName="issuingCompany" namespace="car-ms"/>">
<!-- 百度编辑器 -->
<!-- 配置文件 -->
<script type="text/javascript" src="${contextPath}/js/ueditor1_4_3_3/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${contextPath}/js/ueditor1_4_3_3/ueditors.all.js"></script>
<script type="text/javascript" src="${contextPath}/js/ueditor1_4_3_3/lang/zh-cn/zh-cn.js"></script>
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>

<div class="mian_right-new" id="EA">
	<div class="rg_list">
		<c:choose>
			<c:when test="${issuingCompany.id !=null}">
				<h1 class="tt_h1" id="He">开证公司修改</h1>
			</c:when>
			<c:otherwise>
				<h1 class="tt_h1" id="He">开证公司添加</h1>
			</c:otherwise>
		</c:choose>
		<form name="editForm" id="editForm" method="POST"
			action="<ufa:url namespace="car-ms" fieldName="UPDATE_CAR_MODEL"/>" enctype="multipart/form-data">
			<div class="tb_list" id="car">
				<ul class="tb_ul02" id="ff">
					<input id="currpage" type="hidden" name="currpage" value="${currpage }" />
					<input type="hidden" id="id" name="id" value="${issuingCompany.id}" />
					<li>
						<div class="border_right" id="cc">
							<div class="tab_txt01">
								<span class="td_center border_right">开证公司名称</span>
								<span style="line-height: 15px;">
									<input type="text" id="name" name="name" value="${issuingCompany.name }"
										style="width: 500px; height: 28px; margin-top: 3px;" />&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="border_right" id="cc">
							<div class="tab_txt01">
								<span class="td_center border_right">收件单位</span>
								<span style="line-height: 15px;">
									<input type="text" id="receiveunit" name="receiveunit"
										value="${issuingCompany.receiveunit }"
										style="width: 500px; height: 28px; margin-top: 3px;" />&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="border_right" id="cc">
							<div class="tab_txt01">
								<span class="td_center border_right">发件单位</span>
								<span style="line-height: 15px;">
									<input type="text" id="sendunit" name="sendunit" value="${issuingCompany.sendunit }"
										style="width: 500px; height: 28px; margin-top: 3px;" />&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="border_right" id="cc">
							<div class="tab_txt01">
								<span class="td_center border_right">激活状态</span>
								<span style="line-height: 15px;">
									<input hidden id="statuss" value="${issuingCompany.status }">
									<select class="brand" name="status" id="status"
										style="width: 500px; height: 28px; margin-top: 3px;">
										<option value="1">启用</option>
										<option value="2">未启用</option>
									</select>
								</span>
							</div>
						</div>
					</li>
					<%-- <li>
						<div class="border_right" id="cc">
							<div class="tab_txt01">
								<span class="td_center border_right" style="height: 125px;">开证公司费用介绍</span>
								<span style="line-height: 15px;"><textarea rows="5" style="resize:none;" placeholder="长度不超过255" cols="45" name="introduce" id="introduce" >${issuingCompany.introduce }
								
								</textarea>
								</span>
							</div>
						</div>
						
					</li> --%>
					<input hidden name="introduce" id="introduce">
					<li>
						<div class="border_right" id="cc">
							<div class="tab_txt01">
								<span class="td_center border_right" style="height: 310px;">开证公司费用介绍(字体颜色为白色)</span>
								<span style="line-height: 15px;">
									<td><script id="introduces" type="text/plain" style="width: 1200px; height: 200px;">${issuingCompany.introduce }</script>
									</td>
								</span>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="btnlist" style="text-align: center;">
				<a id="saveBtn" href="javascript:void(0);" onclick="mysubmit()" class="btn63_01 margin_let10">保存</a>
				<a href="javascript:void(0);" onclick="back()" class="btn63_02 margin_let10">取消</a>
			</div>
		</form>
	</div>
</div><p><span style="color: rgb(255, 255, 255);">6666666666666</span><br/></p>
</div>
<style>

.view {

  background-color: #C7EDCC;

  font-size: 18px;

  line-height: 1.8;

}

</style>
<script type="text/javascript">
	var ue2 = UE.getEditor('introduces');
	function mysubmit() {
		var introduces = [];
		introduces.push(UE.getEditor('introduces').getContent());
		$('#introduce').val(introduces);
		var num = /^(([1-9]\d)|[1-9])$/;
		var nums = /^[0-9]+(.[0-9]{2})?$/;
		if ($('#name').val() == "") {
			alert("请填写开证公司名称！")
			return false;
		}
		if ($('#receiveunit').val() == "") {
			alert("请填写收件单位！");
			return false;
		}
		if ($('#sendunit').val() == "") {
			alert("请填写发件单位！");
			return false;
		}
		if ($('#introduce').val() == "") {
			alert("请填写开证公司费用介绍！");
			return false;
		} 
		var url = $('#saveUrl').val();
		$.ajax({
			url : url,
			type : 'POST',
			cache : false,
			data : new FormData($('#editForm')[0]),
			processData : false,
			contentType : false
		}).done(
				function(data) {
					if (data.status) {
						alert('保存成功!');
						location.href = $("#issuingCompany").val()
								+ "?currpage=" + $('#currpage').val();
					} else {
						alert(data.msg);
					}
				})
	};

	function back() {
		location.href = $("#issuingCompany").val() + "?currpage="
				+ $('#currpage').val();
	}
</script>