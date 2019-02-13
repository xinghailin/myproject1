<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link rel="stylesheet" href="${contextPath}/resources/style/jquery.css" />
<input type="hidden" id="mallNeedAuditSaveUrl" value="<ufa:url fieldName="mallNeedAuditSave" namespace="car-ms"/>">
<input type="hidden" id="mallNeedAudit" value="<ufa:url fieldName="mallNeedAudit" namespace="car-ms"/>">
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
	width: 70px;
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
	width: 30%;
	padding: 10px 0 10px 0;
	float: left;
	box-sizing: border-box;
}

.select-box select {
	width: 190px;
}

.left-bottom {
	overflow: hidden;
}

.set {
	width: 40%;
	margin: 10px 0 10px 0;
	overflow: hidden;
	float: left;
	overflow: hidden;
}

.set span {
	display: block;
	float: left;
	margin-right: 10px;
}

.set textarea {
	width: 250px;
	height: 100px;
	overflow-y: auto;
	border: 1px solid #ccc;
}

.info {
	width: 60%;
	overflow: hidden;
	float: left;
}

.info>div {
	padding: 15px 0;
	box-sizing: border-box;
	width: 100%;
	overflow: hidden;
}

.info>div div {
	width: 50%;
	float: left;
}

.out_color {
	margin-right: 70px;
}

.submit {
	color: white;
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
		<input id="currpage" type="hidden" name="currpage" value='${currpage}' />
		<input id="ids" type="hidden" name="id" value='${jn.id}' />
		<div class="box">
			<h2 class="buy-title">车辆需求单</h2>
			<div class="select-box"><span style="font-weight: bold;">需求单名称：</span> <span style="font-weight: bold;">${jn.name}</span></div>
			<div class="select-box"><span style="font-weight: bold;">需求单编号：</span> <span style="font-weight: bold;">${jn.code}</span></div>
			<div class="select-box"><span style="font-weight: bold;">主动采购方：</span> <span style="font-weight: bold;">${jn.needer}</span></div>
			<div class="select-box"><span style="font-weight: bold;">商城合同编号：</span> <span style="font-weight: bold;">${jn.mallcontractcode}</span></div>
			<ul class="buy-need">
				<li class="need-list">
					<ul class="list-left">
						<c:forEach items="${lst }" var="need" varStatus="ss">
							<hr style="color: red; font-size: 12px;">
							<div style="font-weight: bold;">需求单</div>
							<li class="left-select">
								<div class="set"><span style="font-weight: bold;">商城订单编号：</span> <span>${need.mallordercode}&nbsp;</span></div>
							</li>
							<li class="left-select">
								<div class="set"><span style="font-weight: bold;">品牌：</span> <span>${need.brand}&nbsp;</span></div>
								<div class="select-box" style="margin-left: 30px;"><span style="font-weight: bold;">型号：</span> <span>${need.model}&nbsp;</span></div>
								<div class="select-box" style="margin-left: -30px;"><span style="font-weight: bold;">版别：</span> <span>${need.version}&nbsp;</span></div>
							</li>
							<li class="left-bottom">
								<div class="set"><span style="font-weight: bold;">配置：</span> <span>${need.config}&nbsp;</span></div>
								<div class="info">
									<div>
										<div><span style="font-weight: bold;">外观颜色：</span> <span>${need.outcolor}&nbsp;</span></div>
										<div><span style="font-weight: bold;">数量：</span> <span>${need.num}辆&nbsp;</span></div>
								</div>
									<div><span style="font-weight: bold;">内饰颜色：</span> <span>${need.incolor}&nbsp;</span></div>
							</div>
							</li>
							<li class="left-bottom vinnum">
								<div style="margin-top: 15px; margin-left: 45px;"><span style="font-weight: bold;">是否匹配库存：</span> <input type="radio" name="matching${ss.index }" value="1"
									onclick="hideVin1(this)"> 是<input type="radio" name="matching${ss.index }" style="margin-left: 60px;" checked onclick="hideVin2(this)"> 否</div>
								<div class="hideVin" style="display: none;">
									<div style="margin-top: 15px; margin-left: 75px;"><span style="font-weight: bold;">库存数量：</span> <input value="${need.id}" hidden class="mallordercode">
										<input value="${need.num}" hidden class="num"> <input type="text" class="num3" name="num3" onblur="num(this)"></div>
									<div style="margin-top: 15px;"><span style="font-weight: bold;">添加对应库存车架号：</span>
										<button onclick="add(this)">添加</button></div>
							</div>
							</li>
						</c:forEach>
				</ul>
			</li>
		</ul>
			<div class="btnlist" style="margin-bottom: 20px;">
				<div style="text-align: center;"><a href="javascript:void(0);" id="btnSearch" class="btn63_01" onclick="submit()">提交</a> <a href="javascript:void(0);"
					class="btn63_02 margin_let10" onclick="back()">返回</a></div>
		</div>
	</div>
</body> <script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script> <script type="text/javascript">
	var reg=/(^[1-9](\d+)?$)/;
	function hideVin1(obj){
		$(obj).parent().siblings('.hideVin').show();
	}
	function hideVin2(obj){
		$(obj).parent().siblings('.hideVin').hide();
	}
	function del(obj){
		$(obj).parent().remove();
	}
	function num(obj){//console.log(obj);
		var th=$(obj),v=th.val();
		if(v.length){
			if(!reg.test(v)){
				th.val('');/* $(obj).focus(); */
				return false;
			}
			var si=th.siblings('.num').val();
			if(Number(v) > si){
				//alert("库存数量不能大于需求数量！");
				th.val(si);
			}
		}
	}
	function add(obj){
		var e=$(obj).parent().siblings().find("[name=num3]"),v=e.val();
		if(v.length){
			if(!reg.test(v)){
				alert("请输入正确的库存数量！！");
				e.focus();
				return false;
			}
			/* var cloneObj=$('.addvin').eq(0).clone(); */
			if(v <= $(obj).parent().siblings('.addvin').length){
				alert("添加的车架号数量不能大于填写的库存数量！");
			}else{
				var a="<div style='margin-top: 15px;margin-left: 90px;' class='addvin'><span style='font-weight:bold;'>车架号：</span> <input type='text' name='vin' class='vin'> <button onclick='del(this)'>删除</button></div>"
				$(obj).parent().parent().append(a);
			}
		}else{
			alert("请先输入库存数量！");
			e.focus();
		}
	}
	function submit(){
		var result=[];
		var status=0;
		var flag=false;
		$.each($('.vinnum'),function(i){
			if($(this).find('input').eq(0).prop('checked')){
				var arrVin=[];
				var inputs=$(this).find('.vin');
				if(inputs.length == 0){
					alert("第" + (i + 1) + "个需求单至少添加一个车架号，点击添加按钮添加！");
					flag=true;
					return false;
				}else{
					$.each(inputs,function(j){//至少加了一个车架号input
						var tri=$.trim($(this).val());
						if(tri.length){
							arrVin.push(tri);
						}else{
							alert("第" + (i + 1) + "个需求单第" + (j + 1) + "个车架号必填！");
							flag=true;
							return false;
						}
					})
					if(flag){
						return false;
					}
					var n3=$(this).find('[name=num3]').val();
					if(arrVin.length != n3){
						alert("第" + (i + 1) + "个需求填写的库存数量与添加的车架号数量不一致！");
						flag=true;
						return false;
					}
					var obj={num:n3,code:$(this).find('.mallordercode').val(),vin:arrVin};
					result.push(obj)
				}
			}
		})
		if(flag){
			return false;
		}
		console.log(result);
		$.ajax({url:$('#mallNeedAuditSaveUrl').val(),data:{result:JSON.stringify(result),id:$('#ids').val()},type:'post',datatype:'json',success:function(data){
			if(data.status){
				alert("保存成功！");
				location.href=$('#mallNeedAudit').val() + "?currpage=" + $('#currpage').val();
			}else{
				alert(data.msg);
			}
		}})
	}
	function back(){
		location.href=$('#mallNeedAudit').val() + "?currpage=" + $('#currpage').val();
	}
</script>