<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/bootstrap.min.css" rel="stylesheet">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
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
		<form name="searchForm" id="searchForm">
			<div class="container">
				<h3 class="title">添加库容</h3>
				<input type="hidden" id="loginid" name="loginid" value="${loginid }"> <input
					type="hidden" id="id" name="id" value="${pool.id }"> <input type="hidden" id="currpage"
					name="currpage" value="${currpage }">
				<div class="form-inline">
					<div class="form-group newInput vali">
						<label><span style="color: red">*</span>库容名称：</label> <input type="text" class="form-control"
							name="name" value="${pool.name }">
					</div>
				</div>
				<div class="form-inline">
					<div class="form-group newInput vali">
						<label><span style="color: red">*</span>库容地址：</label> <input type="text" class="form-control"
							name="address" value="${pool.address }">
					</div>
				</div>
				<div class="form-inline">
					<div class="form-group newInput vali">
						<label><span style="color: red">*</span>手机号码：</label> <input type="text" class="form-control"
							name="phone" value="${pool.phone }">
					</div>
				</div>
				<div class="form-inline">
					<div class="form-group newInput vali">
						<label><span style="color: red">*</span>负责人：</label> <input type="text" class="form-control"
							name="principal" value="${pool.principal }">
					</div>
				</div>
				<div class="form-inline">
					<div class="form-group newInput vali">
						<label><span style="color: red">*</span>库容总额度：</label> <input type="text" class="form-control"
							name="totalmoney" value="${pool.totalmoney }">(万)
					</div>
				</div>
				<div class="form-inline">
					<div class="form-group newInput vali">
						<label><span style="color: red">*</span>备注：</label>
						<textarea rows="5" cols="30" name="note" style="resize: none;">${pool.note } </textarea>
					</div>
				</div>
				<div class="du-btn">
					<a href="javascript:;" class="btn btn-danger submit" role="button" onclick="submit()" >保存 </a>
					<a href="javascript:;" class="btn btn-warning" onclick="back()" style="padding: 6px 30px">
						取消 </a>
				</div>
			</div>
		</form>
	</div>
</body>
<script>
	function back() {
	
		location.href = $('#backUrl').val() + "?currpage="
				+ $('#currpage').val() + "&type=1";
	};
	 
	 function submit() {
		var flag = true;

		var addpoolsaveUrl = $('#addpoolsaveUrl').val();
		$("#searchForm").submit();
		$.each($('.has-error'), function() {
			$(this).find('.form-control').focus();
			flag = false;
			return false;
		})
		if (flag) {
			$.ajax({
				//几个参数需要注意一下
				type : "POST",//方法类型
				dataType : "json",//预期服务器返回的数据类型
				url : addpoolsaveUrl,//url
				data : $('#searchForm').serialize(),
				success : function(data) {
					if (data.status) {
						alert("保存成功");
						location.href = $('#backUrl').val() + "?currpage="
								+ $('#currpage').val() + "&type=1";
					} else {
						alert(data.msg);
					}
				}
			});
		}

	} 
	$("#searchForm")
			.bootstrapValidator(
					{
						ive : 'disabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证
						excluded : [ ':disabled', ':hidden', ':not(:visible)' ],//排除无需验证的控件，比如被禁用的或者被隐藏的
						submitButtons : '#submit',//指定提交按钮，如果验证失败则变成disabled，但我没试成功，反而加了这句话非submit按钮也会提交到action指定页面
						message : '通用的验证失败消息',//好像从来没出现过
						feedbackIcons : {//根据验证结果显示的各种图标
							valid : 'glyphicon',
							invalid : 'glyphicon glyphicon-remove',
							validating : 'glyphicon glyphicon-refresh'
						},
						fields : {
							name : {
								message : '库容名称验证失败',
								validators : {
									notEmpty : {
										message : '库容名称不能为空'
									},
									stringLength : {
										max : 255,
										message : '长度必须在小于255位字符'
									}
								}
							},
							address : {
								message : '地址验证失败',
								validators : {
									notEmpty : {
										message : '地址不能为空'
									},
									stringLength : {
										max : 255,
										message : '长度必须在小于255位字符'
									}
								}
							},
							phone : {
								message : '电话验证失败',
								validators : {
									notEmpty : {
										message : '电话不能为空'
									},
									regexp : {
										regexp : /^1\d{10}$/,
										message : '手机号码验证错误'
									}
								}
							},
							principal : {
								message : '负责人验证失败',
								validators : {
									notEmpty : {
										message : '负责人不能为空'
									},
									stringLength : {
										max : 255,
										message : '长度必须在小于255位字符'
									}
								}
							},
							totalmoney : {
								message : '总额度验证失败',
								validators : {
									notEmpty : {
										message : '总额度不能为空'
									},
									stringLength : {
										max : 15,
										message : '金额超过最大限额'
									},
									regexp : {
										regexp : /((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,
										message : '金额格式填写错误'
									}
								}
							}

						}
					})
</script>