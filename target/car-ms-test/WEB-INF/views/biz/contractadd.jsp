<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新建销售合同</title>
    <link rel="stylesheet" href="${cssBasePath}/bootstrap.min.css">
    <link rel="stylesheet" href="${cssBasePath}/fileinput.min.css">
	<link rel="stylesheet" href="${cssBasePath}/css/bizcontract.css"/>
	<link rel="stylesheet" href="${cssBasePath}/common/index.css"/>
	<input type="hidden" id="worktype" name="worktype" value="${worktype}">
	<input type="hidden" id="realworktype"  value="${realworktype}">
	<input type="hidden" id="currpage" name="currpage" value="${currpage}">
	<input type="hidden" id="backUrl" value="<ufa:url fieldName="bizclientinfoindex" namespace="car-ms"/>">
</head>
<body>
<div class="main_right" id="viewList" style="margin-left:300px;height: 100%;">
<div class="box">
    <div class="container">
        <h3 class="title">新增车辆销售合同</h3>
        <h4 style="padding: 10px 0;" class="list-group-item-danger">合同档案编号：<span>${clientInfoDto.filenum}</span></h4>
        <h4 style="padding: 8px 0;font-size: 16px;margin-top: 15px" class="list-group-item-success">基本信息</h4>
        <form name="editForm" id="editForm" method="POST" enctype="multipart/form-data" class="upload" action="<ufa:url namespace="car-ms" fieldName="bizcontractsave"/>">
        <input type="hidden" id="infoid" name="infoid" value="${clientInfoDto.id }">
        <input type="hidden" id="filecode" name="filecode" value="${clientInfoDto.filenum }">
        <div class="form-inline">
            <div class="form-group newInput" style="width:33%;">
                <label>甲方（卖方）：</label>
                <input type="text" class="form-control" name="name" value="${sp.name}">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>住所（址）：</label>
                <input type="text" class="form-control" name="address" value="${sp.address}">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>联系人：</label>
                <input type="text" class="form-control" name="principle" value="${sp.principal}">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>联系电话：</label>
                <input type="text" class="form-control" name="phone" value="${sp.priTel}">
            </div>
        </div>
        <div class="form-inline">
            <div class="form-group newInput" style="width:33%;">
                <label>乙方（买方）：</label>
                <input type="text" class="form-control" name="bname" value="${clientInfoDto.name}">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>住所（址）：</label>
                <input type="text" class="form-control" name="baddress">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>公司名称：</label>
                <input type="text" class="form-control" name="companyname" value="${clientInfoDto.companyname}">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>联系电话：</label>
                <input type="text" class="form-control" name="bphone" value="${clientInfoDto.phone}">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>身份证号：</label>
                <input type="text" class="form-control" name="identify" value="${clientInfoDto.identify}">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>企业代码：</label>
                <input type="text" class="form-control" name="corpcode">
            </div>
        </div>
        <h4 style="padding: 8px 0;font-size: 16px;margin-top: 15px" class="list-group-item-success">合同信息</h4>
        <div class="form-inline">
            <%-- <div class="form-group newInput" style="width:33%;">
                <label>品牌首字母：</label>
                <input type="text" class="form-control" name="initials" value="${clientInfoDto.initials}">
            </div> --%>
            <div class="form-group newInput" style="width:33%;">
                <label>品牌：</label>
                <input type="text" class="form-control" name="brand" value="${clientInfoDto.brand}">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>型号：</label>
                <input type="text" class="form-control" name="model" value="${clientInfoDto.model}">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>版本：</label>
                <input type="text" class="form-control" name="version" value="${clientInfoDto.version}">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>外观颜色：</label>
                <input type="text" class="form-control" name="outcolor">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>内饰颜色：</label>
                <input type="text" class="form-control" name="incolor">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>配置：</label>
                <input type="text" class="form-control" name="config">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>运费：</label>
                <input type="text" class="form-control" placeholder="单位：元" name="transprice">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>上牌费：</label>
                <input type="text" class="form-control" placeholder="单位：元" name="plateprice">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>商业险：</label>
                <input type="text" class="form-control" placeholder="单位：元" name="cinsurance">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>交强险：</label>
                <input type="text" class="form-control" placeholder="单位：元" name="insurance">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>购置税：</label>
                <input type="text" class="form-control" placeholder="单位：元" name="purchasetax">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>质保费：</label>
                <input type="text" class="form-control" placeholder="单位：元" name="qualityprice">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>延保费：</label>
                <input type="text" class="form-control" placeholder="单位：元" name="delayprice">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>装潢费：</label>
                <input type="text" class="form-control" placeholder="单位：元" name="decorateprice">
            </div>
        </div>
        <div class="form-inline">
            <div class="form-group newInput" style="width:33%;">
                <label>车辆销售价格（结算价）：</label>
                <input type="text" class="form-control" placeholder="单位：元" name="saleprice">
            </div>
            <div class="form-group newInput" style="width:33%;">
                <label>定金金额：</label>
                <input type="text" class="form-control" placeholder="单位：元" name="downpay">
            </div>
        </div>
        <div class="form-inline">
            <div class="form-group newInput du-choose-category">
                <label>金融购车：</label>
                <c:if test="${realworktype eq '1'}">
                <label class="radio-inline" style="margin-right: 20px">
                    <input type="radio" name="finance" id="inlineRadio1" value="1">是
                </label></c:if>
                <label class="radio-inline">
                    <input type="radio" name="finance" id="inlineRadio2" value="2">否
                </label>
            </div>
        </div>
            <div class="form-inline">
                <label>上传车辆销售合同：</label>
                <div class="form-group">
                    <input id="file-01" class="file-loading" type="file" name="fsalecontract">
                </div>
            </div>
            <div class="form-inline">
                <label>上传报价单：</label>
                <div class="form-group">
                    <input id="file-02" class="file-loading" type="file" name="freportbill">
                </div>
            </div>
            <div class="form-inline">
                <label>上传定金POS单：</label>
                <div class="form-group">
                    <input id="file-03" class="file-loading" type="file" name="fdownposbill">
                </div>
            </div>
        <div class="form-inline" style="margin-top: 20px">
            <div class="form-group newInput">
                <label>合同补充信息：</label>
                <textarea class="form-control" rows="5" style="resize: none;min-width:500px" id="du-reason" name="note"></textarea>
            </div>
        </div></form>
        <div class="du-btn">
            <a href="javascript:;" class="btn btn-danger" role="button" id="saveBtn">合同提交审核
            </a>
            <a href="javascript:;" class="btn btn-warning" role="button" style="padding: 6px 30px" id="backBtn">
                取消
            </a>
        </div>
    </div>
</div>
</div>
</body>
<script src="${contextPath}/resources/seajs/2.0.0/sea-debug.js" data-config="${contextPath}/resources/config-debug.js?ts=${ts}" id="seajsnode"></script>
<script>
seajs.use("${scriptBasePath}/biz/contractadd.js?r=<%=new Date()%>");
</script>
</html>