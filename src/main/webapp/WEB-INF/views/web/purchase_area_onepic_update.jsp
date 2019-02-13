<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/ajaxfileupload.js"></script>
<style>
    *[hidefocus], input, textarea, a {
        outline: none;
    }

    body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, textarea, p, blockquote, th, td {
        padding: 0;
        margin: 0;
    }

    fieldset, img, html, body, iframe {
        border: 0;
    }

    table {
        border-collapse: collapse;
        border-spacing: 0;
    }

    li {
        list-style: none;
    }

    i {
        font-style: normal;
    }

    h1, h2, h3, h4, h5, h6 {
        font-size: 100%;
    }

    caption, th {
        font-weight: normal;
        font-style: normal;
        text-align: left;
    }

    em, strong {
        font-weight: bold;
        font-style: normal;
    }

    body, textarea, select, input, pre {
        font-family: arial, microsoft yahei, helvetica, sans-serif;
        font-size: 14px;
        color: #555;
    }

    body {
        background: #f8f8f8;
        line-height: 1.5em;
        -webkit-text-size-adjust: none;
    }

    a, button {
        cursor: pointer;
    }

    textarea {
        resize: none;
        overflow: auto;
    }

    pre {
        white-space: pre-wrap;
    }

    a {
        color: #333;
        text-decoration: none;
    }

    input {
        -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
        -webkit-user-modify: read-write-plaintext-only;
    }

    button {
        -webkit-tap-highlight-color: rgba(255, 255, 255, 0)
    }

    input, select {
        border: 1px solid #ccc;
        border-radius: 2px;
        padding: 2px 0;
        text-align: center;
    }

    .box {
        width: 1524px;
        overflow: hidden;
        color: #555;
        margin-left: 50px;
    }

    .container,.container2 {
        overflow: hidden;
        padding: 15px 0;
    }
    
.area{
    padding: 40px 0 10px;
    font-size: 16px;
    font-weight: bold;
}
.area h2{
    padding:  10px 0 20px;
    font-size: 20px;
}
    .area>div{
        display: inline-block;
    }

    .title {
        padding: 50px 0 0;
        font-size: 16px;
        font-weight: bold;
    }
    .title>div{
        display: inline-block;
    }
    .box .item {
        float: left;
        width: 150px;
        height:370px;
        margin: 30px 40px 0 0;

        cursor: pointer;
    }
    .item-img{
        position: relative;
        width: 100%;
        height: 200px;
    }
    .item-img button {
        width: 60px;
        height: 25px;
        line-height: 25px;
        background: #05a8eb;
        color: #fff;
        position: absolute;
        left: 0;
        right: 0;
        bottom: 10px;
        margin: auto;
        border: 0;
    }

    .item-img span {
        display: block;
        background: #eee;
        text-align: center;
        line-height: 150px;
        position: absolute;
        font-size: 16px;
        left: 0;
        right: 0;
        top: 0;
        bottom: 50px;
        margin: auto;
        color: #777;
    }

    .item-img img {
        width: 150px;
        height: 150px;
        position: absolute;
        z-index: 99;
    }

    .item-img input {
        width: 146px;
        height: 146px;
        position: absolute;
        z-index: 100;
        opacity: 0;
        left: 0;
        top: 0;
    }
    .item-input{
        width: 100%;
        height: 170px;
    }
    .item-input li{
        width:100%;
        text-align: center;
    }
    .item-input input{
        width:150px;
        margin:6px 0 ;
    }

    .add-btn, .add-btn2{
        width: 150px;
        height: 370px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 60px;
        cursor: pointer;
        
      
    }
    .btn63_01 {
     color: white;
     text-shadow: none; 
     background-color: #4d90fe; 
     background-color: #ddd;
        }
     .btnlist a{
         background-color: #ddd;
    border: 0;
    padding: 7px 14px;
    font-size: 14px;
    color: #666;
    cursor: pointer;
    outline: none;
    margin-left:10px;
     }
</style>
<div class="mian_right-new" style="height: 100%;margin-left:300px;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
			<ul class="tb_ul02">
				<form name="editForm" id="editForm" method="POST"		action="<ufa:url namespace="car-ms" fieldName="WEB_PURCHASE_PIC_ONEUPDATE_SUBMIT"/>"
					enctype="multipart/form-data">
					<input type="hidden" id="parent_id" name="parent_id" value="${picdto.parent_id}" /> 
					<input type="hidden" id="id" name="id" value="${picdto.id}" /> 
					<input type="hidden" id="url" name="url" value="${picdto.url}" /> 
					<input type="hidden" id="id_pic_name_chinese" name="id_pic_name_chinese" value="${picdto.id_pic_name_chinese}" /> 
					<input type="hidden" id="id_pic_name_english" name="id_pic_name_english" value="${picdto.id_pic_name_english}" /> 
					<input type="hidden" id="id_pic_name_spaish" name="id_pic_name_spaish" value="${picdto.id_pic_name_spaish}" /> 
					
					<div class="box">
						<div class="import">
							<ul class="container">
								<li class="item">
									<div class="item-img">
										<span>点击上传</span>
										<img src="${ftpFileUrl}${picdto.url}" alt="" id="1importImg">
										<input type="file" class="uploadImg" id="1importFile" name="file" sign="1">
										<input type="hidden" name="import" id="1importHide" />
										<!-- <button class="button-remove">移除</button> -->
									</div>
									<div class="item-input">
										<ul class="item-input">
											<li>车型名称（中文）</li>
											<li>
												<input type="text"  id="pic_name_chinese" name="pic_name_chinese" value="${picdto.pic_name_chinese}">
											</li>
											<li>车型名称（英文）</li>
											<li>
												<input type="text" id="pic_name_english" name="pic_name_english" value="${picdto.pic_name_english}" >
											</li>
											<li>车型名称（西班牙文）</li>
											<li>
												<input type="text" id="pic_name_spaish" name="pic_name_spaish" value="${picdto.pic_name_spaish}" >
											</li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
					</div>
					
							<div class="btnlist">
			<div style="width: 230px; margin: auto; margin-top: 80px;">
				<a href="javascript:void(0);" class="btn63_01" id="saveBtn" style="color: white;text-shadow: none;background-color: #4d90fe;">保存</a>
				<a id='backBtn' href="javascript:void(0);" class="btn63_01 margin_let10">返回</a>
			</div>
		</div>

				</form>
			</ul>
		</div>

	</div>
</div>
<script>
	var num = 1;//初始界面可上传图片个数
	var num2 = 1;

	//点击上传
	$(document).delegate('.uploadImg', 'change', function() {
		var sign = $(this).attr('sign');
		var imgObj = sign + "importImg";
		var fl = sign + "importFile";
		var hid = sign + "importHide";
		imagePreview(this.files, imgObj, fl, hid);
	});
	function imagePreview(obj, imgObj, fl, hid) {
		var f = obj[0];
		var src = window.URL.createObjectURL(f);
		$('#' + imgObj).attr('src', src);
	}
	var uploadUrl = $("#uploadUrl").val();
	$(function() {
		var $msg = $('#hideMsg');
		if ($msg.val())
			alert($msg.val());
	})
	
	
	
		// 绑定新增按钮事件
	$('#saveBtn').bind("click", saveFun);
	
	function saveFun() {
		$form = $('#editForm');
		if(!$.trim($('#pic_name_chinese').val())){ 
	        alert("中文名称不能为空");
	        return;
	    }
		if(!$.trim($('#pic_name_english').val())){ 
	        alert("英文名称不能为空");
	        return;
	    }
		if(!$.trim($('#pic_name_spaish').val())){ 
	        alert("西班牙文名称不能为空");
	        return;
	    }
	 $form.submit();
	}
	
	function backFun(){
    	window.history.go(-1);
    }
	$("#backBtn").bind("click",backFun);

</script>
