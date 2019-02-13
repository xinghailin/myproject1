<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link rel="stylesheet" href="${contextPath}/resources/style/jquery.css" />
<input type="hidden" id="BrandinitiaUrl" value="<ufa:url fieldName="queryBrandinitia" namespace="car-ms"/>">
<input type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input type="hidden" id="modelUrl" value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="versionUrl" value="<ufa:url fieldName="QUERY_VERSION" namespace="car-ms"/>">
<input type="hidden" id="addUrl" value="<ufa:url fieldName="jndneedadd" namespace="car-ms"/>">
<input type="hidden" id="canadaneedUrl" value="<ufa:url fieldName="canadaaddneed" namespace="car-ms"/>">
<input type="hidden" id="jndneedUrl" value="<ufa:url fieldName="canadarequirementlistpage" namespace="car-ms"/>">
<div class="mian_right-new" id="EA">
	<style>
*[hidefocus], input, textarea, a {
	outline: none;
}

body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, textarea, p,
	blockquote, th, td {
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

input, select {
	border: 1px solid #ccc;
	border-radius: 2px;
	padding: 2px 0;
	text-align: center;
}

select {
	padding: 2px 8px;
}

.box {
	width: 1524px;
	overflow: hidden;
	color: #333;
	margin-left: 50px;
}

.buy-title {
	font-size: 24px;
	padding: 10px 0 30px;
}

.need-list {
	overflow: hidden;
	border-bottom: 1px solid #aaa;
	width: 100%;
	padding: 20px 0;
}

.list-left {
	width: 80%;
	float: left;
}

.list-right {
	width: 20%;
	float: left;
	height: 167px;
}

.list-right button {
	width: 80px;
	border: none;
	background: #4d90fe;
	color: #fff;
	height: 30px;
	display: block;
	margin: 0 auto;
}

.list-right .addss {
	margin: 30px auto;
}

.left-select {
	overflow: hidden;
	width: 100%;
}

.select-box {
	width: 24%;
	margin: 10px 0 10px 0;
	float: left;
}

.select-box select {
	width: 190px;
}

.left-bottom {
	overflow: hidden;
	margin-top: 15px;
}

.set {
	width: 40%;
	overflow: hidden;
	float: left;
}

.set span {
	display: block;
	float: left;
	margin-right: 10px;
}

.set textarea {
	width: 477px;
	height: 100px;
	overflow-y: auto;
	border: 1px solid #ccc;
}

.info {
	width: 60%;
	overflow: hidden;
	float: left;
}

.info div {
	padding: 15px 0;
}

.out_color {
	margin-right: 70px;
}

.submit {
	width: 100px;
	height: 30px;
	line-height: 30px;
	color: #fff;
	background: #4d90fe;
	text-align: center;
	margin: 100px auto;
	cursor: pointer;
}

.back {
	width: 100px;
	height: 30px;
	line-height: 30px;
	color: #fff;
	background: #4d90fe;
	text-align: center;
	margin: 100px auto;
	cursor: pointer;
}
</style>
	<body>
		<div class="box"><input id="filenum" type="hidden" name="filenum" value='${filenum}' /> <input id="ids" type="hidden" name="id" value='${key}' />
			<h2 class="buy-title">车辆需求单</h2>
			<div class="select-box" style=""><span> <label class="fc_red">*</label>需求单名称：
			</span> <span> <input type="text" id="names" name="name" style="width: 190px;" />&nbsp;
			</span></div>
			<div class="select-box" style="margin-left: -60px;"><span> <label class="fc_red">*</label>需求地址：
			</span> <select id="site" name="site" style="width: 190px;" onchange="sitenum(this)">
					<option value="">--请选择--</option>
					<c:forEach var="item" items="${site}">
						<option value="<c:out value="${item.ename}"></c:out>"><c:out value="${item.name}"></c:out></option>
					</c:forEach>
			</select></div>
			<div class="select-box" style="margin-left: -90px;"><span> <label class="fc_red">*</label>需求单编号：
			</span> <span> <input type="text" id="filenums" name="filenums" style="width: 200px;" disabled="disabled" />
			</span></div>
			<div class="select-box" style="margin-left: -70px;"><span> <label class="fc_red">*</label>主动采购方：
			</span> <select id="needer">
					<option value="">--请选择--</option>
					<option value="中国采购">中国采购</option>
					<option value="海外采购">海外采购</option>
			</select></div>
			<ul class="buy-need">
				<li class="need-list">
					<ul class="list-left">
						<li class="left-select">
							<div class="select-box"><span> <label class="fc_red">*</label>品牌首字母：
							</span> <select class="letter">
									<option>请选择</option>
							</select></div>
							<div class="select-box" style="margin-left: 40px"><span> <label class="fc_red">*</label>品牌：
							</span> <select class="brand">
									<option>请选择</option>
							</select></div>
							<div class="select-box"><span> <label class="fc_red">*</label>型号：
							</span> <select class="model">
									<option>请选择</option>
							</select></div>
							<div class="select-box"><span> <label class="fc_red">*</label>版别：
							</span> <select class="version">
									<option>请选择</option>
							</select></div>
					</li>
						<li class="left-bottom">
							<div class="set"><span> <label class="fc_red">*</label>配置：
							</span> <textarea></textarea></div>
							<div class="info">
								<div style="margin-left: 110px;"><span> <label class="fc_red">*</label>外观颜色：
								</span> <input type="text" class="out_color"> <span style="margin-left: -13px;"> <label class="fc_red">*</label>数量：
								</span> <input type="text" class="num"></div>
								<div style="margin-left: 110px;"><span> <label class="fc_red">*</label>内饰颜色：
								</span> <input type="text" class="in_color"></div>
						</div>
					</li>
				</ul>
					<div class="list-right">
						<button class="addss">继续添加</button>
						<button class="delete">删除</button>
				</div>
			</li>
		</ul>
			<div class="btnlist" style="margin-bottom: 20px;">
				<div style="text-align: center;"><a href="javascript:void(0);" id="btnSearch" class="btn63_01">提交</a> <a href="javascript:void(0);" class="btn63_02 margin_let10"
					onclick="back()">返回</a></div>
		</div></div>
</body> <script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script> <script>
	function sitenum(site){
		var site=$('#site').val();
		var filenum=$('#filenum').val();
		var text=site + filenum;
		site ? $("#filenums").val(text) : $("#filenums").val('');
	}
	$(function(){
		var box=$('.buy-need');
		var BrandinitiaUrl=$('#BrandinitiaUrl').val();
		var brandUrl=$('#brandUrl').val();
		var modelUrl=$('#modelUrl').val();
		var versionUrl=$('#versionUrl').val();
		var BrandinitiaUrl=$('#BrandinitiaUrl').val();
		var brandUrl=$('#brandUrl').val();
		var modelUrl=$('#modelUrl').val();
		var versionUrl=$('#versionUrl').val();
		$.ajax({url:BrandinitiaUrl,type:'get',datatype:'json',success:function(data){
			var $letter=$('.letter');
			$.each(data.result,function(){
				$letter.append($("<option>" + this.brandInitial + "</option>"))
			});
		}});
		$(document).delegate('.letter','change',function(){
			var br=$(this).parent().siblings();
			br.find('select').html("<option>请选择</option>");
			$.ajax({url:brandUrl,type:'post',data:{brandinitial:$(this).val()},datatype:'json',success:function(data){
				var $brand=br.find('.brand');
				$.each(data.abrand,function(){
					$brand.append($("<option>" + this.brand + "</option>"))
				});
			}})
		})
		$(document).delegate('.brand','change',function(){
			var br=$(this).parent().siblings();
			$(this).parent().siblings().find('.model,.version').html("<option>请选择</option>");
			$.ajax({url:modelUrl,type:'post',data:{brand:$(this).val()},datatype:'json',success:function(data){
				var $model=br.find('.model');
				$.each(data.model,function(){
					$model.append($("<option>" + this.model + "</option>"))
				});
			}})
		})
		$(document).delegate('.model','change',function(){
			var br=$(this).parent().siblings();
			br.find('.version').html("<option>请选择</option>");
			$.ajax({url:versionUrl,type:'post',data:{model:$(this).val()},datatype:'json',success:function(data){
				var $version=br.find('.version');
				$.each(data.version,function(){
					$version.append($("<option>" + this.version + "</option>"))
				});
			}})
		})
		$(document).delegate('.addss','click',function(){
			var c=$('.need-list').eq(0).clone();
			c.find('input,textarea').val("");
			c.find('.brand,.model,.version').html('<option>请选择</option>');
			c.appendTo(box);
		});
		$(document).delegate('.delete','click',function(){
			$(this).parent().parent().remove();
		});
		$('#btnSearch').click(
		function(){
			var reg=/^[1-9][0-9]*$/;
			var arr=[];
			$.each($('.need-list'),function(){
				var $this=$(this)
				if($('#names').val() == ""){
					alert("需求单名称必填");
					return false
				}else if($('#site').val() == ""){
					alert("需求地址必选");
					return false
				}else if(!$('#needer').val()){
					alert("主动采购方必选");
					return false
				}else if($this.find('.letter').val() == "请选择"){
					alert("品牌首字母未选择");
					return false
				}else if($this.find('.brand').val() == "请选择"){
					alert("品牌未选择");
					return false
				}else if($this.find('.model').val() == "请选择"){
					alert("型号未选择");
					return false
				}else if($this.find('.version').val() == "请选择"){
					alert("版别未选择");
					return false
				}else if($.trim($this.find('textarea').val()) == ""){
					alert("配置为空");
					$this.find('textarea').focus();
					return false
				}else if($.trim($this.find('.out_color').val()) == ""){
					alert("外观颜色为空");
					$this.find('.out_color').focus();
					return false
				}else if($.trim($this.find('.num').val()) == ""){
					alert("数量为空");
					$this.find('.num').focus();
					return false
				}else if($.trim($this.find('.in_color').val()) == ""){
					alert("内饰颜色为空");
					$this.find('.in_color').focus();
					return false
				}else if($.trim($this.find('textarea').val()).length > 500){
					alert("配置不能大于500字");
					$this.find('textarea').focus();
					return false
				}else if($.trim($this.find('.out_color').val()).length > 50){
					alert("外观颜色不能大于50字");
					$this.find('.out_color').focus();
					return false
				}else if($.trim($this.find('.in_color').val()).length > 50){
					alert("内饰颜色不能大于50字");
					$this.find('.in_color').focus();
					return false
				}else if(reg.test($.trim($this.find('.num').val())) == false || $.trim($this.find('.num').val()).length > 10){
					alert("数量输入非法");
					$this.find('.num').focus();
					return false
				}else{
					var ss={initials:$this.find('.letter').val(),brand:$this.find('.brand').val(),model:$this.find('.model').val(),version:$this.find('.version').val(),set:$this.find('.set textarea').val().replace(
					/\n/g,''),outcolor:$this.find('.out_color').val(),num:$this.find('.num').val(),incolor:$this.find('.in_color').val()};
					arr.push(ss);
				}
			})
			if(arr.length == $('.need-list').length){
				var code=$('#filenums').val();
				var names=$('#names').val();
				var site=$('#site').val();
				var addUrl=$('#addUrl').val();
				var ids=$('#ids').val();
				$.ajax({url:addUrl,data:{result:JSON.stringify(arr),code:code,name:names,id:ids,site:site,needer:$('#needer').val()},type:'post',datatype:'json',success:function(data){
					if(data.status){
						alert("保存成功!");
						location.href=$('#jndneedUrl').val();
					}else{
						alert("保存失败!");
					}
				}})
			}
		})
	});
	function back(){
		location.href=$('#jndneedUrl').val();
	}
</script>