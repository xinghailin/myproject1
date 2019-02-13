<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%><!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>风控进件编辑</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizrisk.css" />
<input type="hidden" id="backUrl" value="<ufa:url fieldName="bizcontractindex" namespace="car-ms"/>">
<input type="hidden" id="uploadUrl" value="<ufa:url fieldName="bizriskfilesbatupload" namespace="car-ms"/>">
<input type="hidden" id="formUrl" value="<ufa:url fieldName="bizriskedit" namespace="car-ms"/>">
</head>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container kv-main">
				<h3 class="title">风控进件编辑</h3>
				<h4 style="padding: 10px 0;" class="list-group-item-danger">销售合同编号：<span>${co.filecode }</span></h4> <label style="color: red; padding: 15px 0 0; font-size: 15px">备注：不需要的图片请移除，增加新的图片请点击相应按钮进行操作，已经存在的图片不需要重复添加</label>
				<form name="du-form" id="du-form" method="POST" enctype="multipart/form-data" action="<ufa:url namespace="car-ms" fieldName="bizriskedit"/>" style="margin-top: 20px"><input type="hidden" id="id" name="id" value="${risk.id }"> <input type="hidden" id="conid" name="conid"
					value="${co.id }"> <input type="hidden" id="currpage" name="currpage" value="${currpage}"> <input type="hidden" name="dels" id="dels" value="">
					<h4>1.申请表（1张 正面 必选）</h4>
					<div class="form-inline upload">
						<div class="imgBOX"><img src="${contextPath}${risk.applybill}" alt="点击放大" class="img-thumbnail"> <span class="delete"> <i class="glyphicon glyphicon-trash"></i> 移除
						</span></div>
				</div>
					<div class="form-group"><input id="file-01" class="file-loading" type="file"></div>
					<h4>2.身份证（2张 正反面 必选）</h4>
					<div class="form-inline upload"><c:forEach var="item" items="${filelst2}">
							<div class="imgBOX"><img src="${contextPath}${item.address}" alt="..." class="img-thumbnail" imgid="${item.id}"> <span class="delete"> <i class="glyphicon glyphicon-trash"></i> 移除
							</span></div>
						</c:forEach></div>
					<div class="form-group"><input id="file-02" class="file-loading" type="file" multiple data-max-file-count="2"></div>
					<h4>3.驾驶证（1张 必选）</h4>
					<div class="form-inline upload">
						<div class="imgBOX"><img src="${contextPath}${risk.driverprove}" alt="点击放大" class="img-thumbnail"> <span class="delete"> <i class="glyphicon glyphicon-trash"></i> 移除
						</span></div>
				</div>
					<div class="form-group"><input id="file-03" class="file-loading" type="file" v="2"></div>
					<h4>4.工作证明（1张 必选）</h4>
					<div class="form-inline upload">
						<div class="imgBOX"><img src="${contextPath}${risk.workprove}" alt="点击放大" class="img-thumbnail"> <span class="delete"> <i class="glyphicon glyphicon-trash"></i> 移除
						</span></div>
				</div>
					<div class="form-group"><input id="file-04" class="file-loading" type="file"></div>
					<h4>5.征信报告（多张 必选）</h4>
					<div class="form-inline upload"><c:forEach var="item" items="${filelst5}">
							<div class="imgBOX"><img src="${contextPath}${item.address}" alt="..." class="img-thumbnail" imgid="${item.id}"> <span class="delete"> <i class="glyphicon glyphicon-trash"></i> 移除
							</span></div>
						</c:forEach></div>
					<div class="form-group"><input id="file-05" class="file-loading" type="file" multiple></div>
					<h4>6.工资卡或经营走账卡（多张 正面 必选）</h4>
					<div class="form-inline upload"><c:forEach var="item" items="${filelst6}">
							<div class="imgBOX"><img src="${contextPath}${item.address}" alt="..." class="img-thumbnail" imgid="${item.id}"> <span class="delete"> <i class="glyphicon glyphicon-trash"></i> 移除
							</span></div>
						</c:forEach></div>
					<div class="form-group"><input id="file-06" class="file-loading" type="file" multiple></div>
					<h4>7.流水（多张 必选）</h4>
					<div class="form-inline upload"><c:forEach var="item" items="${filelst7}">
							<div class="imgBOX"><img src="${contextPath}${item.address}" alt="..." class="img-thumbnail" imgid="${item.id}"> <span class="delete"> <i class="glyphicon glyphicon-trash"></i> 移除
							</span></div>
						</c:forEach></div>
					<div class="form-group"><input id="file-07" class="file-loading" type="file" multiple></div>
					<h4>8.房产证（多张 必选）</h4>
					<div class="form-inline upload"><c:forEach var="item" items="${filelst8}">
							<div class="imgBOX"><img src="${contextPath}${item.address}" alt="..." class="img-thumbnail" imgid="${item.id}"> <span class="delete"> <i class="glyphicon glyphicon-trash"></i> 移除
							</span></div>
						</c:forEach></div>
					<div class="form-group"><input id="file-08" class="file-loading" type="file" multiple></div>
					<h4>9.结婚证（1张 非必选）</h4>
					<div class="form-inline upload"><c:if test="${not empty risk.marryprove}">
							<div class="imgBOX"><img src="${contextPath}${risk.marryprove}" alt="点击放大" class="img-thumbnail" imgid="-1"> <span class="delete"> <i class="glyphicon glyphicon-trash"></i> 移除
							</span></div>
						</c:if></div>
					<div class="form-group"><input id="file-09" class="file-loading" type="file"></div>
					<h4>10.担保人身份证（多张 正反面 非必选）</h4>
					<div class="form-inline upload"><c:forEach var="item" items="${filelst10}">
							<div class="imgBOX"><img src="${contextPath}${item.address}" alt="..." class="img-thumbnail" imgid="${item.id}"> <span class="delete"> <i class="glyphicon glyphicon-trash"></i> 移除
							</span></div>
						</c:forEach></div>
					<div class="form-group"><input id="file-10" class="file-loading" type="file" multiple></div>
					<div class="form-inline">
						<div class="form-group newInput" style="width: 33%;"><label>审批金额：</label>${risk.aproveprice}</div>
						<div class="form-group newInput" style="width: 33%;"><label>缺少金额：</label>${risk.missmoney}</div>
						<div class="form-group newInput" style="width: 33%;"><label>消费贷贷审会审批表：</label> <c:if test="${not empty risk.approvaltableurl}">
								<a href="${contextPath}${risk.approvaltableurl}" download="${texturlname}" style="text-decoration: underline; margin-right: 10px; color: #4d90fe;" title="点击下载">${texturlname}</a>
							</c:if></div>
				</div> <c:if test="${not empty risk.repairreason}">
						<div class="form-inline">
							<div class="form-group newInput"><label>补件原因：</label>${risk.repairreason}</div>
						</div>
					</c:if> <c:if test="${not empty risk.refusereason}">
						<div class="form-inline">
							<div class="form-group newInput"><label>拒单原因：</label>${risk.refusereason}</div>
						</div>
					</c:if>
					<div class="form-inline">
						<div class="form-group newInput"><label>风控进件审核结果：</label>${risk.status eq '52'?'初审补件':risk.status eq '55'?'复审补件':''}</div>
				</div>
					<div class="du-btn"><a href="javascript:;" class="btn btn-danger" role="button" style="padding: 6px 38px" id="saveBtn">保存 </a> <a href="javascript:;" class="btn btn-warning" role="button" style="padding: 6px 38px" id="backBtn"> 取消 </a></div></form>
		</div>
	</div>
</div>
<div class="mask">
    <div class="loding">
        <img src="${contextPath}/img/loading1.gif" alt="">
        <p>正在上传中......</p>
    </div>
</div>
</body>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script>
seajs.use("${scriptBasePath}/biz/riskedit.js?r=<%=new Date()%>");
</script>
</html>