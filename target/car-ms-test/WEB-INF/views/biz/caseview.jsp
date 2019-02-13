<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>风控案件</title>
<link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssBasePath}/css/bizrisk.css" />
<input type="hidden" id="backUrl" value="<ufa:url fieldName="caselst" namespace="car-ms"/>">
<input type="hidden" id="currpage" name="currpage" value="${currpage}">
</head>
<body>
	<div class="main_right" id="viewList" style="margin-left: 300px; height: 100%;">
		<div class="box">
			<div class="container kv-main">
				<h3 class="title">融资租赁逾期案件查看</h3>
				<h4 style="padding: 10px 10px;" class="list-group-item-danger">案件名称：<span style="display: inline-block; width: 300px;">${riskcase.casename }</span></h4>
				<div class="form-inline"><%@ include file="/WEB-INF/views/biz/case1piece3.jsp"%></div> <%@ include file="/WEB-INF/views/biz/case1piece.jsp"%> <input type="hidden" id="id" name="id" value="${riskcase.id}"> <input type="hidden" id="status"
				name="status" value="${riskcase.status}"> <c:if test="${riskcase.status==2}">
					<div class="form-inline">
						<div class="form-group newInput"><label>诉前保全：</label> <c:if test="${riskcase.prefixsafe eq '1'}">是</c:if> <c:if test="${riskcase.prefixsafe eq '2'}">否</c:if></div>
					</div>
					<c:if test="${riskcase.prefixsafe eq '1'}">
						<div class="form-inline" id="part1"><c:if test="${not empty riskcase.pf1}">
								<div class="form-group newInput"><label style="font-weight: normal;">文件1：</label><a href="${contextPath}${riskcase.pf1}" download="${riskcase.pf1}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
							</c:if> <c:if test="${not empty riskcase.pf2}">
								<div class="form-group newInput"><label style="font-weight: normal;">文件2：</label><a href="${contextPath}${riskcase.pf2}" download="${riskcase.pf2}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
							</c:if> <c:if test="${not empty riskcase.pf3}">
								<div class="form-group newInput"><label style="font-weight: normal;">文件3：</label><a href="${contextPath}${riskcase.pf3}" download="${riskcase.pf3}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
							</c:if> <c:if test="${not empty riskcase.pnote}">
						<div class="form-group newInput"><label style="font-weight: normal;">情况描述：</label> ${riskcase.pnote}</div></c:if></div>
					</c:if>
				</c:if> <c:if test="${riskcase.status==3}">
					<div class="form-inline">
						<div class="form-group newInput"><label>诉前保全：</label> <c:if test="${riskcase.prefixsafe eq '1'}">是</c:if> <c:if test="${riskcase.prefixsafe eq '2'}">否</c:if></div>
					</div>
					<c:if test="${riskcase.prefixsafe eq '1'}">
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
						<div class="form-group newInput"><label>立案：</label> <c:if test="${riskcase.type2 eq '1'}">民事立案</c:if> <c:if test="${riskcase.type2 eq '2'}">刑事立案</c:if></div>
					</div>
					<div class="form-inline">
						<div class="form-group newInput"><label>诉讼保全：</label> <c:if test="${riskcase.suffixsafe eq '1'}">是</c:if> <c:if test="${riskcase.suffixsafe eq '2'}">否</c:if></div>
					</div>
					<div class="form-inline"><c:if test="${not empty riskcase.sf1}">
							<div class="form-group newInput"><label style="font-weight: normal;">文件1：</label><a href="${contextPath}${riskcase.sf1}" download="${riskcase.sf1}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
						</c:if> <c:if test="${not empty riskcase.sf2}">
							<div class="form-group newInput"><label style="font-weight: normal;">文件2：</label><a href="${contextPath}${riskcase.sf2}" download="${riskcase.sf2}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
						</c:if> <c:if test="${not empty riskcase.sf3}">
							<div class="form-group newInput"><label style="font-weight: normal;">文件3：</label><a href="${contextPath}${riskcase.sf3}" download="${riskcase.sf3}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
						</c:if> <c:if test="${not empty riskcase.snote}">
						<div class="form-group newInput"><label style="font-weight: normal;">情况描述：</label> ${riskcase.snote}</div></c:if></div>
				</c:if> <c:if test="${riskcase.status gt 3}">
					<div class="form-inline">
						<div class="form-group newInput"><label>诉前保全：</label> <c:if test="${riskcase.prefixsafe eq '1'}">是</c:if> <c:if test="${riskcase.prefixsafe eq '2'}">否</c:if> </label></div>
					</div>
					<c:if test="${riskcase.prefixsafe eq '1'}">
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
						<div class="form-group newInput"><label>立案：</label> <c:if test="${riskcase.type2 eq '1'}">民事立案</c:if> <c:if test="${riskcase.type2 eq '2'}">刑事立案</c:if></div>
					</div>
					<div class="form-inline">
						<div class="form-group newInput"><label>诉讼保全：</label> <c:if test="${riskcase.suffixsafe eq '1'}">是</c:if> <c:if test="${riskcase.suffixsafe eq '2'}">否</c:if></div>
					</div>
					<div class="form-inline"><c:if test="${not empty riskcase.sf1}">
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
				</c:if> <c:if test="${riskcase.status gt 4}">
					<div class="form-inline">
						<div class="form-group newInput"><label>判决结果：</label> ${riskcase.judgeresult}</div>
						<div class="form-group newInput"><label style="font-weight: normal;">判决书：</label><a href="${contextPath}${riskcase.book}" download="${riskcase.book}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
						<div class="form-group newInput"><label style="font-weight: normal;">判决生效时间：</label> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${riskcase.judgetime1}" /></div>
					</div>
				</c:if> <c:if test="${riskcase.status gt 5}">
					<div class="form-inline">
						<div class="form-group newInput"><label>是否二审：</label> ${riskcase.need2judge eq 1?'是':'否'}</div>
					</div>
				</c:if> <c:if test="${riskcase.status gt 6 and riskcase.need2judge eq 1}">
					<div class="form-inline">
						<div class="form-group newInput"><label>二审开庭时间：</label> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${riskcase.instancetime2}" /></div>
					</div>
				</c:if> <c:if test="${riskcase.status gt 7 and riskcase.need2judge eq 1}">
					<div class="form-inline">
						<div class="form-group newInput"><label>判决结果：</label> ${riskcase.judgeresult2}</div>
						<div class="form-group newInput"><label style="font-weight: normal;">判决书：</label><a href="${contextPath}${riskcase.book2}" download="${riskcase.book2}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
						<div class="form-group newInput"><label style="font-weight: normal;">判决生效时间：</label> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${riskcase.judgetime2}" /></div>
					</div>
				</c:if> <c:if test="${riskcase.status gt 8 and riskcase.need2judge eq 1}">
					<div class="form-inline">
						<div class="form-group newInput"><label>申请执行：</label> ${riskcase.applyexecute2 eq 2?'否':'是'}</div>
						<div class="form-group newInput"><label style="font-weight: normal;">申请执行时间：</label> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${riskcase.applyexe2}" /></div>
					</div>
				</c:if> <c:if test="${riskcase.status gt 8 and riskcase.need2judge eq 2}">
					<div class="form-inline">
						<div class="form-group newInput"><label>申请执行：</label> ${riskcase.applyexecute eq 2?'否':'是'}</div>
						<div class="form-group newInput"><label style="font-weight: normal;">申请执行时间：</label> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${riskcase.applyexe1}" /></div>
					</div>
				</c:if> <c:if test="${riskcase.status gt 9 and riskcase.need2judge eq 1}">
					<div class="form-inline">
						<div class="form-group newInput"><label>执行结果：</label> <label class="radio-inline" style="margin-right: 20px"> <input type="radio" name="excecute2result" id="inlineRadio5" value="1" <c:if test="${riskcase.excecute2result eq 1}">checked</c:if> disabled="disabled">正常执行
						</label> <label class="radio-inline" style="margin-right: 20px"> <input type="radio" name="excecute2result" id="inlineRadio6" value="2" <c:if test="${riskcase.excecute2result eq 2 or riskcase.excecute2result eq 3}">checked="checked"</c:if> disabled="disabled">终止执行
						</label><label class="radio-inline"> </label></div>
						<div class="form-group newInput"><label style="font-weight: normal;">情况描述(正常执行/和解/法院要求)：</label> <c:if test="${(not empty riskcase.ex2cecute1) or (not empty riskcase.ex2cecute2) or (not empty riskcase.ex2cecute3)}">${riskcase.ex2cecute1}${riskcase.ex2cecute2}${riskcase.ex2cecute3}</c:if></div>
					</div>
					<div class="form-inline" id="sresult" <c:if test="${!(riskcase.excecute2result eq 2 or riskcase.excecute2result eq 3)}">style="display: none;"</c:if>>
						<div class="form-group newInput"><label class="radio-inline" style="margin-right: 20px"> <input type="radio" name="excecute2result2" id="inlineRadio5" value="1" <c:if test="${riskcase.excecute2result eq 2}">checked="checked"</c:if> disabled="disabled">和解
						</label> <label class="radio-inline"> <input type="radio" name="excecute2result2" id="inlineRadio6" value="2" <c:if test="${riskcase.excecute2result eq 3}">checked="checked"</c:if> disabled="disabled">法院要求
						</label></div>
					</div>
				</c:if> <c:if test="${riskcase.status gt 9 and riskcase.need2judge eq 2}">
					<div class="form-inline">
						<div class="form-group newInput"><label>执行结果：</label> <label class="radio-inline" style="margin-right: 20px"> <input type="radio" name="excecuteresult" id="inlineRadio5" value="1" <c:if test="${riskcase.excecuteresult eq 1}">checked</c:if> disabled="disabled">正常执行
						</label> <label class="radio-inline" style="margin-right: 20px"> <input type="radio" name="excecuteresult" id="inlineRadio6" value="2" <c:if test="${riskcase.excecuteresult eq 2 or riskcase.excecuteresult eq 3}">checked="checked"</c:if> disabled="disabled">终止执行
						</label><label class="radio-inline"> </label></div>
						<div class="form-group newInput"><label style="font-weight: normal;">情况描述(正常执行/和解/法院要求)：</label> <c:if test="${(not empty riskcase.excecute1) or (not empty riskcase.excecute2) or (not empty riskcase.excecute3)}">${riskcase.excecute1}${riskcase.excecute2}${riskcase.excecute3}</c:if></div>
					</div>
					<div class="form-inline" id="sresult" <c:if test="${!(riskcase.excecuteresult eq 2 or riskcase.excecuteresult eq 3)}">style="display: none;"</c:if>>
						<div class="form-group newInput"><label class="radio-inline" style="margin-right: 20px"> <input type="radio" name="excecuteresult2" id="inlineRadio5" value="1" <c:if test="${riskcase.excecuteresult eq 2}">checked="checked"</c:if> disabled="disabled">和解
						</label> <label class="radio-inline"> <input type="radio" name="excecuteresult2" id="inlineRadio6" value="2" <c:if test="${riskcase.excecuteresult eq 3}">checked="checked"</c:if> disabled="disabled">法院要求
						</label></div>
					</div>
				</c:if>
				<div class="du-btn"><a href="javascript:;" class="btn btn-warning" role="button" id="backBtn" style="padding: 6px 38px">返回</a></div>
		</div>
	</div>
</div>
</body>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script>
	seajs.use("${scriptBasePath}/biz/caseview.js");
</script>
</html>