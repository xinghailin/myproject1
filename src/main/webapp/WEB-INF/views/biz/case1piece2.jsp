<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="form-group newInput"><label>文件1：</label><a href="${contextPath}${riskcase.f1 }" class="btn btn-primary" download="${riskcase.f1 }" role="button">下载 </a></div>
<div class="form-group newInput"><label>文件2：</label><a href="${contextPath}${riskcase.f2 }" class="btn btn-primary" download="${riskcase.f2 }" role="button">下载 </a></div>
<div class="form-group newInput"><label>文件3：</label><a href="${contextPath}${riskcase.f3 }" class="btn btn-primary" download="${riskcase.f3 }" role="button">下载 </a></div>
<div class="form-group newInput"><label>情况描述：</label>${riskcase.note }</div>