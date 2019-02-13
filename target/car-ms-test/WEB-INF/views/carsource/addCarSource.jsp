<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>车源</title>
<link rel="stylesheet" href="${cssBasePath}/jedate1.css">
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizcontract.css" />
<link rel="stylesheet" href="${contextPath}/resources/style/jquery.css" />
<input type="hidden" id="BrandinitiaUrl" value="<ufa:url fieldName="queryBrandinitia" namespace="car-ms"/>">
<input type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input type="hidden" id="modelUrl" value="<ufa:url fieldName="QUERY_BY_BRANDID_MODEL" namespace="car-ms"/>">
<input type="hidden" id="versionUrl" value="<ufa:url fieldName="QUERY_VERSION" namespace="car-ms"/>">
<input type="hidden" id="cityUrl" value="<ufa:url fieldName="shopcity" namespace="car-ms"/>">
<input type="hidden" id="carSourcelistpage" value="<ufa:url fieldName="carSourcelistpage" namespace="car-ms"/>">
<input type="hidden" id="carSourcesaveUrl" value="<ufa:url fieldName="carSourcesave" namespace="car-ms"/>">
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
				<h3 class="title">零采车源渠道</h3>
				<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">基本信息</h4>
				<div class="form-inline">
					<div class="form-group newInput" style="width: 33%; color: red;"><label>渠道编号：</label>${car}</div>
			</div>
				<div class="form-inline">
					<div class="form-group newInput" style="width: 33%;"><label>门店名称：</label>${shop.name}</div> <br />
					<div class="form-group newInput" style="width: 33%;"><label>门店地址：</label>${shop.address}</div> <br />
					<div class="form-group newInput" style="width: 33%;"><label>门店电话：</label>${shop.tel}</div> <br />
					<div class="form-group newInput" style="width: 33%;"><label>所在城市：</label>${shop.province}&nbsp;${shop.city}</div> <br />
					<div class="form-group newInput" style="width: 33%;"><label>负责人：</label>${shop.principal}</div> <br />
			</div>
				<form name="searchForm" id="searchForm" action="<ufa:url fieldName="carSourcesave" namespace="car-ms"/>" enctype="multipart/form-data" method="post">
					<h4 style="padding: 8px 0; font-size: 16px; margin-top: 15px" class="list-group-item-success">车源信息</h4>
					<div class="form-inline"><input name="creatorname" value="${user.name }" hidden> <input name="shopid" value="${shop.id }" hidden> <input name="shopname" value="${shop.name }" hidden> <input name="code" value="${car }" hidden>
						<div id="car">
							<div class="form-group newInput select-box" style="width: 33%;"><label>品牌首字母：</label> <select class="letter" style="text-align: center;" id="letter">
									<option>请选择</option>
							</select></div> <br />
							<div class="form-group newInput select-box" style="width: 33%;"><label>品牌：</label> <select class="brand" style="text-align: center;" name="brand" id="brand">
									<option>请选择</option>
							</select></div> <br />
							<div class="form-group newInput select-box" style="width: 33%;"><label>型号：</label> <select class="model" style="text-align: center;" name="model" id="model">
									<option>请选择</option>
							</select></div> <br />
							<div class="form-group newInput select-box" style="width: 33%;"><label>版本：</label> <select class="version" style="text-align: center;" name="version" id="version">
									<option>请选择</option>
							</select></div>
					</div> <br />
						<div class="form-group newInput" style="width: 66%;"><label>外观颜色：</label><input type="text" style="width: 200px;" name="outcolour" id="outcolour"><label style="color: red;">多种颜色请使用“/”分割</label></div> <br />
						<div class="form-group newInput" style="width: 66%;"><label>内饰颜色：</label><input type="text" style="width: 200px;" name="incolour" id="incolour"><label style="color: red;">多种颜色请使用“/”分割</label></div> <br />
						<div class="form-group newInput" style="width: 100%;"><label>车源地：</label>
							<div class="tab_txt01" style="float: right; margin-right: 1070px;"><span class="td_01" style="width: 40px;">省：</span> <span class="" style="margin-top: 10px;"> <select id="Editprovinces" class="prov" name="province" id="province" style="width: 100px;" onchange="citys()">
										<option value="">请选择省</option>
										<c:forEach var="item" items="${lo}">
											<option value="<c:out value="${item.name}"></c:out>" <c:if test="${item.name}">selected="selected"</c:if>><c:out value="${item.name}"></c:out></option>
										</c:forEach>
								</select>
							</span> <span class="td_01" style="width: 40px;">市：</span> <span class="" style="margin-top: 10px;"> <select id="Editcities" name="city" class="city" style="width: 100px;">
										<option value="">请选择市</option>
										<c:forEach var="item" items="${lo1}">
											<option value="<c:out value="${item.name}"></c:out>" <c:if test="${item.name}">selected="selected"</c:if>><c:out value="${item.name}"></c:out></option>
										</c:forEach>
								</select></div></div> <br />
						<div class="form-group newInput" style="width: 33%;"><label>数量：</label><input type="text" style="width: 200px;" name="num" id="num"></div> <br />
						<div class="form-group newInput" style="width: 33%;"><label>采购价：</label><input type="text" name="purchaseprice" style="width: 200px;" id="purchaseprice">元</div> <br />
						<div class="form-group newInput" style="width: 66%;"><label>报价有效时间：</label><input type="text" style="width: 200px;" class="dateinput dateicon" id="inpstart" name="starttimes" readonly="readonly">～ <input type="text" style="width: 200px;" id="inpend" name="endtimes"
							class="dateinput dateicon" readonly="readonly"></div> <br /></div>
			</form>
				<div class="du-btn">
					<button type="button" class="btn btn-danger submit" style="padding: 6px 30px" onclick="save()">保存</button> <a href="javascript:;" class="btn btn-warning" role="button" style="padding: 6px 30px" onclick="back()"> 返回 </a>
			</div>
		</div>
	</div>
</div>
</body>
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/jedate.min.js"></script>
<script>
var status=true;
	function save(){
		var regexp=/^[1-9]\d{0,8}$/;
		var reg=/(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/;
		var brand=$('#brand').val();
		var model=$('#model').val();
		var version=$('#version').val();
		var outcolour=$('#outcolour').val();
		var incolour=$('#incolour').val();
		var province=$('#province').val();
		var city=$('#city').val();
		var purchaseprice=$('#purchaseprice').val();
		var starttime=$('#inpstart').val();
		var endtime=$('#inpend').val();
		var num=$('#num').val();
		if(brand == '请选择'){
			alert("请选择品牌！");
			return false;
		}
		if(model == '请选择'){
			alert("请选择型号！");
			return false;
		}
		if(version == '请选择'){
			alert("请选择版别！");
			return false;
		}
		if(outcolour == ''){
			alert("请填写外观颜色！");
			return false;
		}
		if(incolour == ''){
			alert("请填写内饰颜色！");
			return false;
		}
		if(province == '请选择'){
			alert("请选择省！");
			return false;
		}
		if(!regexp.test(num)){
			alert("数量格式不正确！");
			return false;
		}
		if(!reg.test(purchaseprice)){
			alert("采购价格式不正确！");
			return false;
		}
		if(starttime == ""){
			alert("填写开始日期！");
			return false;
		}
		if(endtime == ""){
			alert("填写结束日期！");
			return false;
		}
		var carSourcesave=$('#carSourcesaveUrl').val();
		if(status){
			status=false;
		$.ajax({
		//几个参数需要注意一下
		type:"POST",//方法类型
		dataType:"json",//预期服务器返回的数据类型
		url:carSourcesave,//url
		data:$('#searchForm').serialize(),success:function(data){
			if(data.status){
				alert("保存成功");
				location.href=$('#carSourcelistpage').val() + "?type=1";
			}else{
				alert(data.msg);
			}
		}});
		}
	};
	function back(){
		location.href=$('#carSourcelistpage').val() + "?type=1";
	}
	$("#inpend").click(function(){
		if(!$("#inpstart").val()){
			alert("请先选择开始日期")
		}
	});
	var start={},end={};
	jeDate('#inpstart',{onClose:false,format:'YYYY-MM-DD',minDate:'2010-06-16', //设定最小日期为当前日期
	donefun:function(obj){
		//选择的开始日期与现在时间比较，选择较大的那个日期
		var large=obj.val > jeDate.nowDate({DD:0}) ? obj.val : jeDate.nowDate({DD:0})
		end.minDate=large; //开始日选好后，重置结束日的最小日期
		//         jeDate("#inpend",LinkageEndDate(false));
		jeDate('#inpend',LinkageEndDate);
	}});
	function LinkageEndDate(istg){
		return {trigger:istg || "click",format:'YYYY-MM-DD',onClose:false,minDate:function(that){
			//that 指向实例对象
			var nowMinDate=jeDate.valText('#inpstart') == "" && jeDate.valText(that.valCell) == "";
			console.log(that.valCell)
			console.log(nowMinDate)
			return nowMinDate ? jeDate.nowDate({DD:0}) : end.minDate;
		}, //设定最小日期为当前日期
		maxDate:'2099-06-16', //设定最大日期为当前日期
		donefun:function(obj){
			start.maxDate=obj.val; //将结束日的初始值设定为开始日的最大日期
		}};
	}
	function citys(){
		var city=$('#cityUrl').val();
		$.ajax({
		//几个参数需要注意一下
		type:"POST",//方法类型
		dataType:"json",//预期服务器返回的数据类型
		url:city,//url
		data:{province:$('#Editprovinces').val()},success:function(data){
			console.log(data);
			$(".city").find("option").remove();
			$.each(data.lo1,function(){
				$('.city').append($("<option>" + this.name + "</option>"))
			});
		}});
	};
	var BrandinitiaUrl=$('#BrandinitiaUrl').val();
	var brandUrl=$('#brandUrl').val();
	var modelUrl=$('#modelUrl').val();
	var versionUrl=$('#versionUrl').val();
	$.ajax({url:BrandinitiaUrl,type:'get',datatype:'json',success:function(data){
		var $letter=$('#letter');
		$.each(data.result,function(){
			$letter.append($("<option>" + this.brandInitial + "</option>"))
		});
		$(document).delegate('#letter','change',function(){//首字母改变时触发
			var $this=$(this);
			$this.parent().siblings().find('select').html("<option>请选择</option>");
			$.ajax({url:brandUrl,type:'post',data:{brandinitial:$this.val()},datatype:'json',success:function(data){
				var $brand=$('#brand');
				$.each(data.abrand,function(){
					$brand.append($("<option>" + this.brand + "</option>"))
				});
			}})
		})
		$(document).delegate('#brand','change',function(){
			var $this=$(this);
			$('#model').html("<option>请选择</option>");
			$('#version').html("<option>请选择</option>");
			$.ajax({url:modelUrl,type:'post',data:{brand:$this.val()},datatype:'json',success:function(data){
				var $model=$('#model');
				$.each(data.model,function(){
					$model.append($("<option>" + this.model + "</option>"))
				});
			}})
		})
		$(document).delegate('#model','change',function(){
			$('#version').html("<option>请选择</option>");
			var $this=$(this);
			$.ajax({url:versionUrl,type:'post',data:{model:$this.val()},datatype:'json',success:function(data){
				var $version=$('#version');
				$.each(data.version,function(){
					$version.append($("<option>" + this.version + "</option>"))
				});
			}})
		})
	}});
</script>