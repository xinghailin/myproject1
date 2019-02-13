<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<input id="wholesaleCarsaveUrl" type="hidden"
	value='<ufa:url namespace="car-ms" fieldName="wholesaleCarsave"/>' />
<input id="backUrl" type="hidden"
	value='<ufa:url namespace="car-ms" fieldName="wholesaleCarLibrary"/>' />
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/zdialog.js"></script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${cssBasePath}/bootstrap.min.css" rel="stylesheet">
<link href="${cssBasePath}/zdialog.css" rel="stylesheet">
</head>
<style>
@media ( min-width : 1330px) {
	.container {
		width: 1300px;
	}
}

table td,table th {
	text-align: center;
}

.box {
	/*width: 1524px;*/
	overflow: hidden; color: #555;
	/*margin-left: 50px;*/
}

.title {
	padding: 10px 0 30px;
}

.newInput {
	padding: 10px 15px 10px 15px; min-width: 100px;
}

.newInput label:first-child {
	min-width: 120px; text-align: right;
}

.du-btn {
	text-align: center; margin: 30px 0 50px;
}

.du-btn a {
	margin: 0 30px;
}
</style>
<div class="box">
	<div class="container">
		<form name="searchForm" id="searchForm"
			action="<ufa:url fieldName="supplycarsave" namespace="car-ms"/>" enctype="multipart/form-data"
			method="post">
			<h3 class="title">批发信息</h3>

			<div class="table-responsive">
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th class="success">车架号</th>
							<th>车辆品牌</th>
							<th>车辆型号</th>
							<th>车辆版本</th>
							<th>颜色</th>
							<th>结算价</th>
							<th>现所在地</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>${car.vin }</th>
							<th>${car.brand }</th>
							<th>${car.model }</th>
							<th>${car.version }</th>
							<th>${car.outlookColor }</th>
							<th>${car.settlementprice }</th>
							<th>${car.carAddress }</th>
						</tr>
					</tbody>
				</table>
				<input id="id" name="id" value="${car.id}" type="hidden">
				<input id="currpage" name="currpage" value="${currpage}" type="hidden"> 
				<input id="loginName" name="loginName" value="${loginName}" type="hidden">

				<div class="form-group newInput" style="width: 405px;">
					<label> <span style="color: red">*</span>水单:
					</label> <input style="float: right;" id="monads" name="monads" type="file">
				</div>
				<div class="form-group newInput" style="width: 400px; margin-left: 20px;">
					<label> <span style="color: red">*</span>批发价:
					</label> <input id="price" name="price" type="text" style="width: 180px; height: 34px;">
				</div>
				<div class="du-btn">
					<a href="#" class="btn btn-danger" onclick="submitBtn()" style="padding: 6px 38px">确认</a>
					<a href="#" class="btn btn-warning" onclick="back()" style="padding: 6px 38px">取消</a>
				</div>
			</div>
		</form>
	</div>
</div>
<script>
	function submitBtn() {
       var reg=/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/;
       var price=$('#price').val();
       var monads=$("#monads").val();
      /*  if(monads==""){
    	  alert("请上传水单文件!"); 
    	  return false;
       } */
       if (!reg.test(price)) {
    	 alert("批发价格式不正确!");
           return false;
           }
		var supplycarsave = $('#wholesaleCarsaveUrl').val();
		var formData = new FormData($("#searchForm")[0]);
		$.ajax({
			//几个参数需要注意一下
			type : "POST",//方法类型
			dataType : "json",//预期服务器返回的数据类型
			url : supplycarsave,//url
			data : formData,
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function(data) {
				if (data.status) {
					alert("保存成功");
					location.href = $('#backUrl').val()+"?currpage"+$('#currpage').val();
				} else {
					alert(data.msg);
				}
			}
		});
	}
	function back() {
		location.href = $('#backUrl').val()+"?currpage"+$('#currpage').val();;
	}
	  /*   function alerts(){
	    	  $.DialogByZ.Alert({Title: "提示", Content: "批发价格式不正确",BtnL:"确定",FunL:alerts}) 
     	  $.DialogByZ.Close();
     } */
</script>