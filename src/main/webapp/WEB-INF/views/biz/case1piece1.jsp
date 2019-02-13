<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="form-group newInput"><label>乙方（承租人）：</label>${co.bname }</div>
<div class="form-group newInput"><label>住所：</label>${co.baddress}</div>
<div class="form-group newInput"><label>实际经营场所：</label>${co.brunaddress}</div>
<div class="form-group newInput"><label>身份证号：</label>${co.identify}</div>
<div class="form-group newInput"><label>联系人：</label>${co.bprinciple}</div>
<div class="form-group newInput"><label>传真：</label>${co.faxes}</div>
<div class="form-group newInput"><label>签订日期：</label> <fmt:formatDate pattern="yyyy-MM-dd" value="${co.sightime}" /></div>
<div class="form-group newInput"><label>电话：</label>${co.bphone}</div>
<div class="form-group newInput"><label>销售合同：</label><a href="${contextPath}${con.salecontract }" class="btn btn-danger" download="${con.salecontract }" role="button">下载 </a></div>
<div class="form-group newInput"><label>报价单：</label><a href="${contextPath}${con.reportbill }" download="${con.reportbill }" class="btn btn-danger" role="button">下载 </a></div>
<div class="form-group newInput"><label>融资租赁合同第一年：</label><a href="${contextPath}${co.saleborrowfile1 }" download="${co.saleborrowfile1 }" class="btn btn-danger" role="button" style="margin-top: -7px;"> 下载 </a></div>
<div class="form-group newInput"><label>融资租赁合同后三年：</label><a href="${contextPath}${co.saleborrowfile2}" download="${co.saleborrowfile2}" class="btn btn-danger" role="button" style="margin-top: -7px;"> 下载 </a></div>
<div class="form-group newInput"><label>抵押文件1：</label><a href="${contextPath}${co.pledgefile1}" download="${co.pledgefile1}" class="btn btn-danger" role="button" style="margin-top: -7px;"> 下载 </a></div>
<div class="form-group newInput"><label>抵押文件2：</label><a href="${contextPath}${co.pledgefile2}" download="${co.pledgefile2}" class="btn btn-danger" role="button" style="margin-top: -7px;"> 下载 </a></div>
