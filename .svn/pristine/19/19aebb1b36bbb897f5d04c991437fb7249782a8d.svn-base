<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>风控案件</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizrisk.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css" />
<input type="hidden" id="backUrl" value="<ufa:url fieldName="caseotherlawlst" namespace="car-ms"/>">
<input type="hidden" id="pagenum" value="9">
<input type="hidden" id="ershen" value="<c:if test="${riskcase.need2judge eq 1}">1</c:if>">
</head>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container kv-main">
				<h3 class="title">二抵/其他类案件跟进</h3>
				<h4 style="padding: 10px 10px;" class="list-group-item-danger">案件名称：<span style="display: inline-block; width: 300px;">${riskcase.casename }</span></h4>
				<div class="form-inline"><c:if test="${not empty riskcase.f1}">
						<div class="form-group newInput"><label>文件1：</label><a href="${contextPath}${riskcase.f1 }" class="btn btn-primary" download="${riskcase.f1 }" role="button">下载 </a></div>
					</c:if> <c:if test="${not empty riskcase.f2}">
						<div class="form-group newInput"><label>文件2：</label><a href="${contextPath}${riskcase.f2 }" class="btn btn-primary" download="${riskcase.f2 }" role="button">下载 </a></div>
					</c:if> <c:if test="${not empty riskcase.f3}">
						<div class="form-group newInput"><label>文件3：</label><a href="${contextPath}${riskcase.f3 }" class="btn btn-primary" download="${riskcase.f3 }" role="button">下载 </a></div>
					</c:if>
					<div class="form-group newInput"><label>情况描述：</label> ${riskcase.note }</div></div>
				<div class="form-inline">
					<div class="form-group newInput"><label>诉前保全：</label> <c:if test="${riskcase.prefixsafe eq '1'}">是</c:if> <c:if test="${riskcase.prefixsafe eq '2'}">否</c:if></div>
			</div> <c:if test="${riskcase.prefixsafe eq '1'}">
					<div class="form-inline" id="part1"><c:if test="${not empty riskcase.pf1}">
							<div class="form-group newInput"><label style="font-weight: normal;">文件1：</label><a href="${contextPath}${riskcase.pf1}" download="${riskcase.pf1}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
						</c:if> <c:if test="${not empty riskcase.pf2}">
							<div class="form-group newInput"><label style="font-weight: normal;">文件2：</label><a href="${contextPath}${riskcase.pf2}" download="${riskcase.pf2}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
						</c:if> <c:if test="${not empty riskcase.pf3}">
							<div class="form-group newInput"><label style="font-weight: normal;">文件3：</label><a href="${contextPath}${riskcase.pf3}" download="${riskcase.pf3}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
						</c:if> <c:if test="${not empty riskcase.pnote}">
						<div class="form-group newInput"><label style="font-weight: normal;">情况描述：</label> ${riskcase.pnote}</div></c:if></div>
				</c:if>
				<div class="form-inline">
					<div class="form-group newInput"><label>立案：</label> <c:if test="${riskcase.type2 eq 1}">民事立案</c:if> <c:if test="${riskcase.type2 eq 2}">刑事立案</c:if></div>
			</div>
				<div class="form-inline">
					<div class="form-group newInput"><label>诉讼保全：</label> <c:if test="${riskcase.suffixsafe eq 1}">是</c:if> <c:if test="${riskcase.suffixsafe eq 2}">否</c:if></div>
			</div>
				<div class="form-inline" id="part2"><c:if test="${not empty riskcase.sf1}">
						<div class="form-group newInput"><label style="font-weight: normal;">文件1：</label><a href="${contextPath}${riskcase.sf1}" download="${riskcase.sf1}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
					</c:if> <c:if test="${not empty riskcase.sf2}">
						<div class="form-group newInput"><label style="font-weight: normal;">文件2：</label><a href="${contextPath}${riskcase.sf2}" download="${riskcase.sf2}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
					</c:if> <c:if test="${not empty riskcase.sf3}">
						<div class="form-group newInput"><label style="font-weight: normal;">文件3：</label><a href="${contextPath}${riskcase.sf3}" download="${riskcase.sf3}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
					</c:if> <c:if test="${not empty riskcase.snote}">
						<div class="form-group newInput"><label style="font-weight: normal;">情况描述：</label> ${riskcase.snote}</div></c:if></div>
				<div class="form-inline">
					<div class="form-group newInput"><label>一审开庭时间：</label> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${riskcase.instancetime}" /></div>
					<div class="form-group newInput"><label style="font-weight: normal;">立案时间：</label> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${riskcase.casetime}" /></div>
			</div>
				<div class="form-inline">
					<div class="form-group newInput"><label>判决结果：</label> ${riskcase.judgeresult}</div>
					<div class="form-group newInput"><label style="font-weight: normal;">判决书：</label><a href="${contextPath}${riskcase.book}" download="${riskcase.book}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
					<div class="form-group newInput"><label style="font-weight: normal;">判决生效时间：</label> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${riskcase.judgetime1}" /></div>
			</div>
				<form name="editForm" id="editForm" method="POST" enctype="multipart/form-data" class="upload" action="<ufa:url namespace="car-ms" fieldName="casesave9"/>"><input type="hidden" id="id" name="id" value="${riskcase.id}"> <input type="hidden" id="currpage" name="currpage"
					value="${currpage}"> <input type="hidden" id="status" name="status" value="${riskcase.status}"> <c:if test="${riskcase.status eq 6}">
						<div class="form-inline">
							<div class="form-group newInput"><label>是否二审：</label> 否</div>
						</div>
						<div class="form-inline">
							<div class="form-group newInput"><label>申请执行：</label> <label class="radio-inline" style="margin-right: 20px"> <input type="radio" name="applyexecute" id="inlineRadio5" value="1">是
							</label> <label class="radio-inline"> <input type="radio" name="applyexecute" id="inlineRadio6" value="2">否
							</label></div><div class="form-group newInput" id="ae2div"><label style="font-weight: normal;">申请执行时间：</label> <label class="radio-inline"> <input id="applyexe1" name="applyexe1" type="text" placeholder="请选择时间" readonly="readonly" style="display: inline-block">
						</div>
						</div>
					</c:if> <c:if test="${riskcase.status eq 8}">
						<div class="form-inline">
							<div class="form-group newInput"><label>是否二审：</label> 是</div>
						</div>
						<div class="form-inline">
							<div class="form-group newInput"><label>二审开庭时间：</label> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${riskcase.instancetime2}" /></div>
						</div>
						<div class="form-inline">
							<div class="form-group newInput"><label>判决结果：</label> ${riskcase.judgeresult2}</div>
							<div class="form-group newInput"><label style="font-weight: normal;">判决书：</label><a href="${contextPath}${riskcase.book2}" download="${riskcase.book2}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
							<div class="form-group newInput"><label style="font-weight: normal;">判决生效时间：</label> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${riskcase.judgetime2}" /></div>
						</div>
						<div class="form-inline">
							<div class="form-group newInput"><label>申请执行：</label> <label class="radio-inline" style="margin-right: 20px"> <input type="radio" name="applyexecute2" id="inlineRadio5" value="1">是
							</label> <label class="radio-inline"> <input type="radio" name="applyexecute2" id="inlineRadio6" value="2">否
							</label></div><div class="form-group newInput" id="ae2div"><label style="font-weight: normal;">申请执行时间：</label> <label class="radio-inline"> <input id="applyexe2" name="applyexe2" type="text" placeholder="请选择时间" readonly="readonly" style="display: inline-block">
						</div>
						</div>
					</c:if> <c:if test="${riskcase.status eq 9}">
						<c:if test="${riskcase.need2judge eq 2}">
							<div class="form-inline">
								<div class="form-group newInput"><label>是否二审：</label> 否</div>
							</div>
							<div class="form-inline">
								<div class="form-group newInput"><label>申请执行：</label> <label class="radio-inline" style="margin-right: 20px"> <input type="radio" name="applyexecute" id="inlineRadio5" value="1">是
								</label> <label class="radio-inline"> <input type="radio" name="applyexecute" id="inlineRadio6" value="2" <c:if test="${riskcase.applyexecute eq 2}">checked="checked"</c:if>>否
								</label></div><div class="form-group newInput" id="ae2div" style="display: none;"><label style="font-weight: normal;">申请执行时间：</label> <label class="radio-inline"> <input id="applyexe1" name="applyexe1" type="text" placeholder="请选择时间" readonly="readonly" style="display: inline-block">
						</div>
							</div>
						</c:if>
						<c:if test="${riskcase.need2judge eq 1}">
							<div class="form-inline">
								<div class="form-group newInput"><label>是否二审：</label> 是</div>
							</div>
							<div class="form-inline">
								<div class="form-group newInput"><label>二审开庭时间：</label> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${riskcase.instancetime2}" /></div>
							</div>
							<div class="form-inline">
								<div class="form-group newInput"><label>判决结果：</label> ${riskcase.judgeresult2}</div>
								<div class="form-group newInput"><label style="font-weight: normal;">判决书：</label><a href="${contextPath}${riskcase.book2}" download="${riskcase.book2}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
								<div class="form-group newInput"><label style="font-weight: normal;">判决生效时间：</label> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${riskcase.judgetime2}" /></div>
							</div>
							<div class="form-inline">
								<div class="form-group newInput"><label>申请执行：</label> <label class="radio-inline" style="margin-right: 20px"> <input type="radio" name="applyexecute2" id="inlineRadio5" value="1">是
								</label> <label class="radio-inline"> <input type="radio" name="applyexecute2" id="inlineRadio6" value="2" <c:if test="${riskcase.applyexecute2 eq 2}">checked="checked"</c:if>>否
								</label></div><div class="form-group newInput" id="ae2div" style="display: none;"><label style="font-weight: normal;">申请执行时间：</label> <label class="radio-inline"> <input id="applyexe2" name="applyexe2" type="text" placeholder="请选择时间" readonly="readonly" style="display: inline-block">
						</div>
							</div>
						</c:if>
					</c:if></form>
				<div class="du-btn"><a href="javascript:;" class="btn btn-danger" role="button" id="saveBtn" style="padding: 6px 38px">提交</a> <a href="javascript:;" class="btn btn-warning" role="button" id="backBtn" style="padding: 6px 38px">返回</a></div>
		</div>
	</div>
</div>
</body>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script>
	seajs.use("${scriptBasePath}/biz/caseoperate.js?r=<%=new Date()%>");
</script>
</html>