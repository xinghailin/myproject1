<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${cssBasePath}/jedate.css">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/jquery.jedate.js"></script>
<script src="${scriptBasePath}/base/bootstrapValidator.min.js"></script>
<input type="hidden" id="backUrl" value="<ufa:url fieldName="Poolmanagement" namespace="car-ms"/>">
<input type="hidden" id="addpoolsaveUrl"
	value="<ufa:url fieldName="addpoolsave" namespace="car-ms"/>">
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
	padding: 10px 15px 10px 15px; min-width: 300px;
}

.newInput label:first-child {
	min-width: 120px; text-align: right;
}

.du-btn {
	text-align: center; margin: 50px 0;
}

.du-btn a {
	margin: 0 20px;
}

/*验证插件*/
.bv-form .help-block {
	margin-bottom: 0;
}

.nav-tabs li.bv-tab-success>a {
	color: #3c763d;
}

.nav-tabs li.bv-tab-error>a {
	color: #a94442;
}

.help-block {
	text-align: right;
}

.form-inline .has-feedback .form-control-feedback {
	top: 10px; right: 10px;
}

.form-inline .form-group.vali {
	height: 62px;
}

.has-success .form-control {
	border-color: #ccc;
}

.glyphicon-ok {
	display: none;
}

.form-inline {
	padding: 5px 0 5px 50px; margin: 10px 0;
}
</style>
<body>
	<div class="box">
		<form name="searchForm" id="searchForm" method="get" enctype="multipart/form-data">
			<div class="container">
				<h3 class="title">添加库容</h3>
				<input type="hidden" id="loginid" name="loginid" value="${loginid }"> <input
					type="hidden" id="id" name="id" value="${pool.id }"> <input type="hidden" id="currpage"
					name="currpage" value="${currpage }">
				<div class="form-inline">
					<div class="form-group newInput vali">
						<label>库容名称：</label> ${pool.name }
					</div>
				</div>
				<div class="form-inline">
					<div class="form-group newInput vali">
						<label>库容地址：</label>${pool.address }
					</div>
				</div>
				<div class="form-inline">
					<div class="form-group newInput vali">
						<label>联系电话：</label>${pool.phone }
					</div>
				</div>
				<div class="form-inline">
					<div class="form-group newInput vali">
						<label>负责人：</label> ${pool.principal }
					</div>
				</div>
				<div class="form-inline">
					<div class="form-group newInput vali">
						<label>库容总额度：</label> ${pool.totalmoney }(万)
					</div>
				</div>
				<div class="form-inline">
					<div class="form-group newInput vali">
						<label>放款时间：</label>
						 <input id="loantime1" name="loantime1" class="mesTime" readonly="readonly">
					</div>
				</div>
				<div class="form-inline">
					<div class="form-group newInput vali">
						<label>备注：</label>
						${pool.note }
					</div>
				</div>
				<div class="du-btn">
					<a href="javascript:;" class="btn btn-danger submit" role="button" id="submit">保存 </a>
					<a href="javascript:;" class="btn btn-warning" onclick="back()" style="padding: 6px 30px">
						取消 </a>
						
				</div>
			</div>
		</form>
	</div>
</body>
<script>
//时间初始化
$('.mesTime').jeDate({
    format: "YYYY-MM-DD",
    isTime: false,
    isClear: false, 
    minDate: "2014-09-19 00:00:00",
});
	function back() {
		location.href = $('#backUrl').val() + "?currpage="
				+ $('#currpage').val()+"&type=2";
	};
	$("#submit").click(
			function(){
			var loantime1=$('#loantime1').val();
			
			if(loantime1==""){
				alert("放款时间必填!");
				return false;
			}
				var addpoolsaveUrl = $('#addpoolsaveUrl').val();
					$.ajax({
						//几个参数需要注意一下
						type : "POST",//方法类型
						dataType : "json",//预期服务器返回的数据类型
						url : addpoolsaveUrl,//url
						data : $('#searchForm').serialize(),
						success : function(data) {
							if (data.status) {
								alert("保存成功");
								location.href = $('#backUrl').val()
										+ "?currpage=" + $('#currpage').val()+"&type=2";
							} else {
								alert(data.msg);
							}
						}
					});
			}
			);
</script>