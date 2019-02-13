<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="updateUrl" value="<ufa:url fieldName="WEB_INTRODUCE_SUBMIT" namespace="car-ms"/>">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="WEB_INTRODUCE" namespace="car-ms"/>">
<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
			<ul class="tb_ul02">
				<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="WEB_INTRODUCE_SUBMIT"/>" enctype="multipart/form-data"><input
					name="id_chinese" id="id_chinese" type="hidden" value='${introduceDto.id_chinese}' /> <input name="id_english" id="id_english" type="hidden"
					value='${introduceDto.id_english}' /> <input name="id_spaish" id="id_spaish" type="hidden" value='${introduceDto.id_spaish}' /> <input name="content_chinese"
					id="content_chinese" type="hidden" /> <input name="content_english" id="content_english" type="hidden" /> <input name="content_spaish" id="content_spaish" type="hidden" />
			</form>
				<li>
					<h2 style="font-size: 20px; color: #333; margin-bottom: 20px;"><span style="color: red">*</span> 公司内容介绍(中文)：</h2>
					<td><script id="editor_chinese" type="text/plain" style="width: 1200px; height: 200px;">${introduceDto.content_chinese}</script></td>
			</li>
				<li style="padding: 30px 0;">
					<h2 style="font-size: 20px; color: #333; margin-bottom: 20px;">公司内容介绍(英文)：</h2>
					<td><script id="editor_english" type="text/plain" style="width: 1200px; height: 200px;">${introduceDto.content_english}</script></td>
			</li>
				<li style="padding: 30px 0;">
					<h2 style="font-size: 20px; color: #333; margin-bottom: 20px;">公司内容介绍(西班牙)：</h2>
					<td><script id="editor_spaish" type="text/plain" style="width: 1200px; height: 200px;">${introduceDto.content_spaish}</script></td>
			</li>
		</ul>
	</div>
		<div class="btnlist">
			<div style="width: 200px; margin: auto; margin-top: 80px;"><a href="javascript:void(0);" class="btn63_01" id="saveBtn">保存</a></div>
	</div>
</div>
</div>
<script src="${contextPath}/js/jquery-2.1.4.min.js"></script>
<!-- 百度编辑器 -->
<!-- 配置文件 -->
<script type="text/javascript" src="${contextPath}/js/ueditor1_4_3_3/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${contextPath}/js/ueditor1_4_3_3/ueditor.all.js"></script>
<script type="text/javascript" src="${contextPath}/js/ueditor1_4_3_3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
var editor=UE.getEditor('editor_chinese');
var ue1=UE.getEditor('editor_english');
var ue2=UE.getEditor('editor_spaish');
editor.ready(function() {
	this.execCommand("background", '#0000FF'); //设置字体背景颜色
	});
function saveFun(){
	var $form=$('#editForm');
	var arr_chinese=[];
	arr_chinese.push(editor.getContent());
	$('#content_chinese').val(arr_chinese);
	var arr_english=[];
	arr_english.push(ue1.getContent());
	$('#content_english').val(arr_english);
	var arr_spaish=[];
	arr_spaish.push(ue2.getContent());
	$('#content_spaish').val(arr_spaish);
	if($('#content_chinese').val().trim() == ''){
		alert("请输入公司内容介绍中文");
		return false;
	}
	if($('#content_english').val().trim() == ''){
		alert("请输入公司内容介绍英文");
		return false;
	}
	if($('#content_spaish').val().trim() == ''){
		alert("请输入公司内容介绍西班牙语");
		return false;
	}
	var queryUrl=$('#updateUrl').val();
	$.ajax(queryUrl,{async:false,type:'POST',dataType:'json',data:$form.serialize(),}).success(function(data){
		msg=data.result;
		alert(msg);
		if(data.rescode == 1){
			window.location.href=$('#searchUrl').val();
		}
	}).error(function(){
		msg="系统内部异常";
		alert(msg);
	});
}
// 绑定新增按钮事件
$('#saveBtn').bind("click",saveFun);
</script>