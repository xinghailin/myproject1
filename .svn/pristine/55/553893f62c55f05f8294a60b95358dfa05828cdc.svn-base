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
				name="status" value="${riskcase.status}"> <c:if test="${riskcase.status==1}">
					<div class="form-inline" style="margin-top: 20px;">
						<div class="form-group newInput"><label>诉前保全：</label> <label class="radio-inline" style="margin-right: 20px"> <input type="radio" name="prefixsafe" id="inlineRadio1" value="1">是
						</label> <label class="radio-inline"> <input type="radio" name="prefixsafe" id="inlineRadio2" value="2">否
						</label></div>
					</div>
					<div class="form-inline" id="part1">
						<div class="form-group newInput"><label style="font-weight: normal;">文件1：</label><input id="pf1" name="pf1" type="file"></div>
						<div class="form-group newInput"><label style="font-weight: normal;">文件2：</label><input id="pf2" name="pf2" type="file"></div>
						<div class="form-group newInput"><label style="font-weight: normal;">文件3：</label><input id="pf3" name="pf3" type="file"></div>
						<div class="form-group newInput"><label style="font-weight: normal;">情况描述：</label> <textarea class="form-control" rows="4" style="resize: none; min-width: 300px" id="du-reason1" name="pnote"></textarea></div>
					</div>
				</c:if> <c:if test="${riskcase.status==2}">
					<div class="form-inline" style="margin-top: 20px;">
						<div class="form-group newInput"><label>诉前保全：</label> <c:if test="${riskcase.prefixsafe eq '1'}">是</c:if> <c:if test="${riskcase.prefixsafe eq '2'}">否</c:if></div>
					</div>
					<c:if test="${riskcase.prefixsafe eq '1'}">
						<div class="form-inline" id="part1"><c:if test="${not empty riskcase.pf1}">
								<div class="form-group newInput"><label style="font-weight: normal;">文件1：</label><a href="${contextPath}${riskcase.pf1}" download="${riskcase.pf1}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
							</c:if> <c:if test="${not empty riskcase.pf2}">
								<div class="form-group newInput"><label style="font-weight: normal;">文件2：</label><a href="${contextPath}${riskcase.pf2}" download="${riskcase.pf2}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
							</c:if> <c:if test="${not empty riskcase.pf3}">
								<div class="form-group newInput"><label style="font-weight: normal;">文件3：</label><a href="${contextPath}${riskcase.pf3}" download="${riskcase.pf3}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
							</c:if>
							<div class="form-group newInput"><label style="font-weight: normal;">情况描述：</label> ${riskcase.pnote}</div></div>
					</c:if>
					<div class="form-inline">
						<div class="form-group newInput"><label>立案：</label> <label class="radio-inline" style="margin-right: 20px"> <input type="radio" name="type2" id="inlineRadio1" value="1">民事立案
						</label> <label class="radio-inline"> <input type="radio" name="type2" id="inlineRadio2" value="2">刑事立案
						</label></div>
					</div>
					<div class="form-inline">
						<div class="form-group newInput"><label>诉讼保全：</label> <label class="radio-inline" style="margin-right: 20px"> <input type="radio" name="suffixsafe" id="inlineRadio3" value="1">是
						</label> <label class="radio-inline"> <input type="radio" name="suffixsafe" id="inlineRadio4" value="2">否
						</label></div>
					</div>
					<div class="form-inline" id="part2">
						<div class="form-group newInput"><label style="font-weight: normal;">文件1：</label><input id="sf1" name="sf1" type="file" style="display: inline-block"></div>
						<div class="form-group newInput"><label style="font-weight: normal;">文件2：</label><input id="sf2" name="sf2" type="file" style="display: inline-block"></div>
						<div class="form-group newInput"><label style="font-weight: normal;">文件3：</label><input id="sf3" name="sf3" type="file" style="display: inline-block"></div>
						<div class="form-group newInput"><label style="font-weight: normal;">情况描述：</label> <textarea class="form-control" rows="4" style="resize: none; min-width: 300px" id="du-reason1" name="snote"></textarea></div>
					</div>
				</c:if> <c:if test="${riskcase.status==3}">
					<div class="form-inline" style="margin-top: 20px;">
						<div class="form-group newInput"><label>诉前保全：</label> <c:if test="${riskcase.prefixsafe eq '1'}">是</c:if> <c:if test="${riskcase.prefixsafe eq '2'}">否</c:if></div>
					</div>
					<c:if test="${riskcase.prefixsafe eq '1'}">
						<div class="form-inline" id="part1"><c:if test="${not empty riskcase.pf1}">
								<div class="form-group newInput"><label style="font-weight: normal;">文件1：</label><a href="${contextPath}${riskcase.pf1}" download="${riskcase.pf1}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
							</c:if> <c:if test="${not empty riskcase.pf2}">
								<div class="form-group newInput"><label style="font-weight: normal;">文件2：</label><a href="${contextPath}${riskcase.pf2}" download="${riskcase.pf2}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
							</c:if> <c:if test="${not empty riskcase.pf3}">
								<div class="form-group newInput"><label style="font-weight: normal;">文件3：</label><a href="${contextPath}${riskcase.pf3}" download="${riskcase.pf3}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
							</c:if>
							<div class="form-group newInput"><label style="font-weight: normal;">情况描述：</label> ${riskcase.pnote}</div></div>
					</c:if>
					<div class="form-inline">
						<div class="form-group newInput"><label>立案：</label> <c:if test="${riskcase.type2 eq '1'}">民事立案</c:if> <c:if test="${riskcase.type2 eq '2'}">刑事立案</c:if></div>
					</div>
					<div class="form-inline">
						<div class="form-group newInput"><label>诉讼保全：</label> <c:if test="${riskcase.suffixsafe eq '1'}">是</c:if> <c:if test="${riskcase.suffixsafe eq '2'}">否</c:if></div>
					</div>
					<div class="form-inline" id="part2"><c:if test="${not empty riskcase.sf1}">
							<div class="form-group newInput"><label style="font-weight: normal;">文件1：</label><a href="${contextPath}${riskcase.sf1}" download="${riskcase.sf1}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
						</c:if> <c:if test="${not empty riskcase.sf2}">
							<div class="form-group newInput"><label style="font-weight: normal;">文件2：</label><a href="${contextPath}${riskcase.sf2}" download="${riskcase.sf2}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
						</c:if> <c:if test="${not empty riskcase.sf3}">
							<div class="form-group newInput"><label style="font-weight: normal;">文件3：</label><a href="${contextPath}${riskcase.sf3}" download="${riskcase.sf3}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
						</c:if>
						<div class="form-group newInput"><label style="font-weight: normal;">情况描述：</label> ${riskcase.snote}</div></div>
					<div class="form-inline">
						<div class="form-group newInput"><label>一审开庭时间：</label> <label class="radio-inline"> <input id="instancetime" name="instancetime" type="text" placeholder="请选择时间" readonly="readonly" style="display: inline-block">
						</label></div>
					</div>
				</c:if> <c:if test="${riskcase.status gt 3}">
					<div class="form-inline" style="margin-top: 20px;">
						<div class="form-group newInput"><label>诉前保全：</label> <c:if test="${riskcase.prefixsafe eq '1'}">是</c:if> <c:if test="${riskcase.prefixsafe eq '2'}">否</c:if> </label></div>
					</div>
					<c:if test="${riskcase.prefixsafe eq '1'}">
						<div class="form-inline" id="part1"><c:if test="${not empty riskcase.pf1}">
								<div class="form-group newInput"><label style="font-weight: normal;">文件1：</label><a href="${contextPath}${riskcase.pf1}" download="${riskcase.pf1}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
							</c:if> <c:if test="${not empty riskcase.pf2}">
								<div class="form-group newInput"><label style="font-weight: normal;">文件2：</label><a href="${contextPath}${riskcase.pf2}" download="${riskcase.pf2}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
							</c:if> <c:if test="${not empty riskcase.pf3}">
								<div class="form-group newInput"><label style="font-weight: normal;">文件3：</label><a href="${contextPath}${riskcase.pf3}" download="${riskcase.pf3}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
							</c:if>
							<div class="form-group newInput"><label style="font-weight: normal;">情况描述：</label> ${riskcase.pnote}</div></div>
					</c:if>
					<div class="form-inline">
						<div class="form-group newInput"><label>立案：</label> <c:if test="${riskcase.type2 eq '1'}">民事立案</c:if> <c:if test="${riskcase.type2 eq '2'}">刑事立案</c:if></div>
					</div>
					<div class="form-inline">
						<div class="form-group newInput"><label>诉讼保全：</label> <c:if test="${riskcase.suffixsafe eq '1'}">是</c:if> <c:if test="${riskcase.suffixsafe eq '2'}">否</c:if></div>
					</div>
					<div class="form-inline" id="part2"><c:if test="${not empty riskcase.sf1}">
							<div class="form-group newInput"><label style="font-weight: normal;">文件1：</label><a href="${contextPath}${riskcase.sf1}" download="${riskcase.sf1}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
						</c:if> <c:if test="${not empty riskcase.sf2}">
							<div class="form-group newInput"><label style="font-weight: normal;">文件2：</label><a href="${contextPath}${riskcase.sf2}" download="${riskcase.sf2}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
						</c:if> <c:if test="${not empty riskcase.sf3}">
							<div class="form-group newInput"><label style="font-weight: normal;">文件3：</label><a href="${contextPath}${riskcase.sf3}" download="${riskcase.sf3}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
						</c:if>
						<div class="form-group newInput"><label style="font-weight: normal;">情况描述：</label> ${riskcase.snote}</div></div>
					<div class="form-inline">
						<div class="form-group newInput"><label>一审开庭时间：</label> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${riskcase.instancetime}" /></div>
					</div>
					<c:if test="${riskcase.status eq 4}">
						<div class="form-inline">
							<div class="form-group newInput"><label>判决结果：</label> <textarea class="form-control" rows="4" style="resize: none; min-width: 300px" id="du-reason1" name="judgeresult"></textarea></div>
							<div class="form-group newInput"><label>判决书：</label><input id="book" name="book" type="file" style="display: inline-block"></div>
						</div>
					</c:if>
					<c:if test="${riskcase.status eq 5}">
						<div class="form-inline">
							<div class="form-group newInput"><label>判决结果：</label>${riskcase.judgeresult}</div>
							<div class="form-group newInput"><label style="font-weight: normal;">判决书：</label><a href="${contextPath}${riskcase.book}" download="${riskcase.book}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
						</div>
						<div class="form-inline">
							<div class="form-group newInput"><label>是否二审：</label> <label class="radio-inline" style="margin-right: 20px"> <input type="radio" name="need2judge" id="inlineRadio5" value="1">是
							</label> <label class="radio-inline"> <input type="radio" name="need2judge" id="inlineRadio6" value="2">否
							</label></div>
						</div>
					</c:if>
					<c:if test="${riskcase.status eq 6 and riskcase.need2judge eq 2}">
						<div class="form-inline">
							<div class="form-group newInput"><label>判决结果：</label>${riskcase.judgeresult}</div>
							<div class="form-group newInput"><label style="font-weight: normal;">判决书：</label><a href="${contextPath}${riskcase.book}" download="${riskcase.book}" class="btn btn-primary" role="button" style="margin-top: -7px;">下载 </a></div>
						</div>
						<div class="form-inline">
							<div class="form-group newInput"><label>是否二审：</label>否</div>
						</div>
						<div class="form-inline">
							<div class="form-group newInput"><label>申请执行：</label> <label class="radio-inline" style="margin-right: 20px"> <input type="radio" name="applyexecute" id="inlineRadio5" value="1">是
							</label> <label class="radio-inline"> <input type="radio" name="applyexecute" id="inlineRadio6" value="2">否
							</label></div>
						</div>
					</c:if>
				</c:if>
				<div class="du-btn"><a href="javascript:;" class="btn btn-warning" role="button" id="backBtn" style="padding: 6px 38px">返回</a></div>
		</div>
	</div>
</div>
</body>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script>
	seajs.use("${scriptBasePath}/biz/caseview.js?r=<%=new Date()%>");
</script>
</html>