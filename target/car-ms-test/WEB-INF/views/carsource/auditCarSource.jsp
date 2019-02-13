<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>车源审核</title>
<link rel="stylesheet" href="${cssBasePath}/jedate1.css">
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizcontract.css" />
<input type="hidden" id="cityUrl" value="<ufa:url fieldName="shopcity" namespace="car-ms"/>">
<input type="hidden" id="carSourcelistpage" value="<ufa:url fieldName="carSourcelistpage" namespace="car-ms"/>">
<input type="hidden" id="auditCarSourcePassUrl" value="<ufa:url fieldName="carSourcesavePass" namespace="car-ms"/>">
</head>
<style>
.letter {
	width: 200px;
}

.brand {
	width: 200px;
}

.model {
	width: 200px;
}

.version {
	width: 200px;
}
</style>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container">
				<h3 class="title">零采车源渠道审核</h3>
				<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">基本信息</h4>
				<div class="form-inline">
					<div class="form-group newInput" style="width: 33%; color: red;"><label>渠道编号：</label>${carsource.code}</div>
			</div>
				<div class="form-inline">
					<div class="form-group newInput" style="width: 33%;"><label>门店名称：</label>${shop.name}</div> <br />
					<div class="form-group newInput" style="width: 33%;"><label>门店地址：</label>${shop.address}</div> <br />
					<div class="form-group newInput" style="width: 33%;"><label>门店电话：</label>${shop.tel}</div> <br />
					<div class="form-group newInput" style="width: 33%;"><label>所在城市：</label>${shop.province}&nbsp;${shop.city}</div> <br />
					<div class="form-group newInput" style="width: 33%;"><label>负责人：</label>${shop.principal}</div> <br />
			</div>
				<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">车源信息</h4>
				<div class="form-inline"><input name="currpage" value="${currpage }" id="currpage" hidden> <input name="id" value="${carsource.id }" id="id" hidden> <input name="id" value="${loginid}" id="loginid" hidden>
					<div id="car">
						<div class="form-group newInput select-box" style="width: 33%;"><label>品牌：</label>${carsource.brand }</div> <br />
						<div class="form-group newInput select-box" style="width: 33%;"><label>型号：</label>${carsource.model }</div> <br />
						<div class="form-group newInput select-box" style="width: 33%;"><label>版本：</label>${carsource.version }</div>
				</div> <br />
					<div class="form-group newInput" style="width: 66%;"><label>外观颜色：</label>${carsource.outcolour }</div> <br />
					<div class="form-group newInput" style="width: 66%;"><label>内饰颜色：</label>${carsource.incolour }</div> <br />
					<div class="form-group newInput" style="width: 100%;"><label>车源地：</label>${carsource.province }&nbsp;${carsource.city }</div> <br />
					<div class="form-group newInput" style="width: 33%;"><label>数量：</label>${carsource.num }辆</div> <br />
					<div class="form-group newInput" style="width: 33%;"><label>采购价：</label>${carsource.purchaseprice }元</div> <br />
					<div class="form-group newInput" style="width: 66%;"><label>报价有效时间：</label> <fmt:formatDate pattern="yyyy-MM-dd" value="${carsource.starttime}" /> ～<fmt:formatDate pattern="yyyy-MM-dd" value="${carsource.endtime}" /></div>
					<div class="form-group newInput" style="width: 66%;"><label>审核结果：</label> <input name="status" id="status" value="2" type="radio" onclick="Switch()">通过 <input name="status" id="status" value="3" type="radio" onclick="Switch()">不通过</div>
					<div class="form-group newInput cause" style="width: 66%; display: none;" id="typediv1"><label>不通过原因：</label> <textarea class="form-control" rows="4" style="resize: none; min-width: 220px" id="cause" name="cause"></textarea></div> <br /></div>
				<div class="du-btn">
					<button type="button" class="btn btn-danger submit" style="padding: 6px 30px" onclick="pass()">提交审核结果</button> <a href="javascript:;" class="btn btn-warning" role="button" style="padding: 6px 30px" onclick="back()"> 返回 </a>
			</div>
		</div>
	</div>
</div>
</body>
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/jedate.min.js"></script>
<script>
var flag=true;
	function pass(){
		var status=$('input[name="status"]:checked').val();
		var cause=$('#cause').val();
		var id=$('#id').val();
		var loginid=$('#loginid').val();
		if(status == undefined){
			alert("请选择审核结果！");
			return false;
		}
		if(status == 3 && cause == ""){
			alert("请填写审核不通过原因！");
			return false;
		}
		if(cause.length > 255){
			alert("审核不通过原因超过255长度！");
			return false;
		}
		var auditCarSourcePassUrl=$('#auditCarSourcePassUrl').val();
		if(flag){
		flag=false;
		$.ajax({
		//几个参数需要注意一下
		type:"POST",//方法类型
		dataType:"json",//预期服务器返回的数据类型
		url:auditCarSourcePassUrl,//url
		data:{id:id,status:status,cause:cause,loginid:loginid},success:function(data){
			if(data.status){
				alert("保存成功");
				location.href=$('#carSourcelistpage').val() + "?type=2" + "&currpage=" + $('#currpage').val();
			}else{
				alert(data.msg);
			}
		}});
		}
	};
	function Switch(){//隐藏显示div 
		$('input[type=radio]').each(function(index,item){
			if(this.checked){
				document.getElementById("typediv1").style.display="";
				$('#cause').val("");
			}else{
				document.getElementById("typediv1").style.display="none";
			}
		});
	};
	function back(){
		location.href=$('#carSourcelistpage').val() + "?type=2&currpage=" + $('#currpage').val();
	};
</script>