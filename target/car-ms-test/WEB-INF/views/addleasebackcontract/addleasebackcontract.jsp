<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
 <%@ include file="/WEB-INF/views/base/base.jsp"%>
<input type="hidden" id="addleasebacksaveUrl" value="<ufa:url fieldName="addleasebacksave" namespace="car-ms"/>">
<input type="hidden" id="BrandinitiaUrl" value="<ufa:url fieldName="queryBrandinitia" namespace="car-ms"/>">
<input type="hidden" id="calculate1Url" value="<ufa:url fieldName="calculate1" namespace="car-ms"/>">
<input type="hidden" id="bizcontractindexUrl" value="<ufa:url fieldName="bizcontractindex" namespace="car-ms"/>">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/jquery.jedate.js"></script>
<script src="${scriptBasePath}/base/bootstrapValidator.min.js"></script>
<input type="hidden" id="backUrl" value="<ufa:url fieldName="financialcontracts" namespace="car-ms"/>">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>融资租赁售后回租合同</title>
    <link href="${cssBasePath}/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${cssBasePath}/jedate.css">
</head> 
<style>
    @media (min-width: 1330px) {
        .container {
            width: 1300px;
        }
    }

    .box {
        /*width: 1524px;*/
        overflow: hidden;
        color: #555;
        /*margin-left: 50px;*/
    }

    .title {
        padding: 10px 0 30px;
    }

    .newInput {
        padding: 10px 15px 10px 15px;
        min-width: 300px;
    }

    .newInput label:first-child {
        min-width: 110px;
        text-align: right;
    }

    .du-info {
        width: 100%;
        text-align: center;
        padding-top: 15px;
        display: flex;
    }

    .du-info span {
        width: 120px;
        display: inline-block;
        font-weight: 700;
        margin-left: 8px;
        line-height: 154px;
    }

    .du-info textarea {
        width: 50%;
        resize: none;
    }

    .du-btn {
        text-align: center;
        margin: 50px 0;
    }

    .du-btn a {
        margin: 0 30px;
    }
    /*验证插件*/
    .bv-form .help-block {
        margin-bottom: 0;
    }

    .nav-tabs li.bv-tab-success > a {
        color: #3c763d;
    }

    .nav-tabs li.bv-tab-error > a {
        color: #a94442;
    }

    .help-block {
        text-align: right;
    }

    .form-inline .has-feedback .form-control-feedback {
        top: 10px;
        right: 10px;
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
</style>
<body>
<div class="box">
    <div class="container">
        <h3 class="title">融资租赁售后回租合同</h3>
            <form name="searchForm" id="searchForm" action="" enctype="multipart/form-data" method="get">	    
        <div class="form-inline">
            <div class="form-group newInput vali">
                <label>车辆销售合同档案编号：</label>
                <label>${bizc.filecode }</label>
            </div>
            <div class="form-group newInput vali">
                <label>车辆销售合同：</label>
                <a href="${contextPath}${bizc.salecontract }" class="btn btn-danger" download="${bizc.salecontract}" role="button" >
                    合同下载
                </a>
                
            </div>
        </div> 
          <div class="form-inline">
        <div class="form-group newInput vali">
                <span style="margin-left: -100px;">
                    <label style="color: red">*</label>第一年租赁文件:</span>
                    <input id="saleborrowfile3" name="saleborrowfile3" type="file">   
                </div>
                <div class="form-group newInput vali" >
                <span style="margin-left: -100px;">
                    <label style="color: red" >*</label>第二到四年租赁文件: </span>
                    <input id="saleborrowfile4" name="saleborrowfile4" type="file">   
                </div>
                  <div class="form-group newInput vali" >
                <span style="margin-left: -100px;">
                    <label style="color: red" >*</label>抵押文件: </span>
                    <input id="pledgefile1" name="pledgefile11" type="file">   
                </div>
                  <div class="form-group newInput vali" >
                <span style="margin-left: -100px;">
                    <label style="color: red" >*</label>其他文件: </span>
                    <input id="pledgefile2" name="pledgefile22" type="file">   
                </div></div>
        <h4 style="padding: 10px 0;" class="list-group-item-danger">基本信息</h4>
         
        <div class="form-inline">
        <input type="hidden" id="cid" name="cid" value="${id }">
        <input type="hidden" id="currpage" value="${currpage }">
            <div class="form-group newInput vali" style="margin-left: -17px;">
                <label><span style="color: red">*</span>甲方（出租人）：</label>
                <input type="text" name="name" class="form-control required" value="瑞新(上海)融资租赁有限公司" style="min-width: 290px"
                       oninput="rent(this)">
                <label style="color: red">*注：甲方只能为瑞新(上海)融资租赁有限公司 或者瑞新(上海)融资租赁有限公司XXX分公司</label>
            </div>
            <div class="form-group newInput vali" >
               <label><span style="color: red">*</span>住所：</label>
                <input type="text" name="address"  class="form-control required">
            </div>
            <div class="form-group newInput vali">
              <label><span style="color: red">*</span>实际经营场所：</label>
                <input type="text" name="runaddress"  class="form-control required">
            </div>
            <div class="form-group newInput vali">
                <label><span style="color: red">*</span>联系人：</label>
                <input type="text" name="principle"  class="form-control required">
            </div>
            <div class="form-group newInput vali">
               <label><span style="color: red">*</span>电话：</label>
                <input type="text" name="phone"  class="form-control required phone">
            </div>
        </div>
        <div class="form-inline" style="margin-top: 15px;">
            <div class="form-group newInput vali" style="margin-left: -17px;">
                 <label><span style="color: red">*</span>乙方（承租人）：</label>${bizc.bname }
                <input type="hidden" name="bname"  class="form-control required" value="${bizc.bname }">
            </div>
            <div class="form-group newInput vali" style="margin-left: 70px;">
              <label ><span style="color: red">*</span>身份证号：</label>${bizc.identify }
                <input type="hidden" name="identify"   class="form-control required card" value="${bizc.identify }">
            </div>
            <div class="form-group newInput vali" style="margin-left: 50px;">
                <label><span style="color: red">*</span>电话：</label>
                <input type="text" name="bphone"  class="form-control required phone">
            </div><br/>
            <div class="form-group newInput vali">
                <label>住所：</label>
                <input type="text" name="baddress"  class="form-control">
            </div>
            <div class="form-group newInput vali">
                <label>实际经营场所：</label>
                <input type="text" name="brunaddress"  class="form-control">
            </div>
            <div class="form-group newInput vali">
                <label>传真：</label>
                <input type="text" name="faxes"  class="form-control">
            </div>
            <div class="form-group newInput vali">
                <label>联系人：</label>
                <input type="text" name="bprinciple"  class="form-control">
            </div>
            <div class="form-group newInput vali">
                 <label><span style="color: red">*</span>签订日期：</label>
                <input type="text" id="sightime1" name="sightime1" class="form-control required mesTime" readonly="readonly" placeholder="请选择时间"  >
            </div>
             <div class="form-group newInput vali" style="width: 30%;">
             <label><span style="color: red">*</span>品牌：</label>${bizc.brand }
                <input class="form-control required brand" name="brand" type="hidden"  style="min-width: 176px" value="${bizc.brand }">
            </div>
             <div class="form-group newInput vali">
                <label><span style="color: red">*</span>型号：</label>${bizc.model }
 				<input class="form-control required brand" name="model" type="hidden" style="min-width: 176px" value="${bizc.model }">

            </div>
            <div class="form-group newInput vali" style="width: 50%;">
                <label style="margin-left: 50px;"><span style="color: red">*</span>版别：</label>${bizc.version }
			<input class="form-control required brand" name="version"  type="hidden" style="min-width: 176px" value="${bizc.version }">
            </div><br/>
            <div class="form-group newInput vali" >
                <label><span style="color: red">*</span>车架号：</label>
                <input  name="vin" type="hidden"  class="form-control required"  value="${bizc.vin }">${bizc.vin }
            </div>
             
        </div>
        <h4 style="padding: 10px 0;" class="list-group-item-danger">融资租赁售后回租第一年</h4>
        <div class="form-inline">
            <div class="form-group newInput vali">
                 <label><span style="color: red">*</span>合同编号：</label>
                <input type="text" name="firstyearccode"  class="form-control required">
            </div>
            <div class="form-group newInput vali">
                <label><span style="color: red">*</span>租赁物货款：</label>
                <input type="text" id="leaseprice" name="leaseprice" value="${bizr }"  class="form-control required money" placeholder="此处为风控审批  金额(元)"  onchange="aproveprice(this.value)">
            </div>
            <div class="form-group newInput vali">
                <label>GPS费用：</label>
                <input type="text" name="gpsprice" class="form-control money" placeholder="金额(元)">
            </div>
            <div class="form-group newInput vali">
                <label>手续费：</label>
                <input type="text" name="handcharge" class="form-control money" placeholder="金额(元)">
            </div>
            <div class="form-group newInput vali">
                 <label><span style="color: red">*</span>动态监管费：</label>
                <input type="text" id="superviseprice" name="superviseprice" class="form-control required money" placeholder="租赁物货款的1%  金额(元)">
            </div>
            <div class="form-group newInput vali">
               <label><span style="color: red">*</span>履约险：</label>
                <input type="text" name="promiseprice" id="promiseprice" class="form-control required money" placeholder="租赁物货款的 1.5%">
            </div>
            <div class="form-group newInput vali">
                <label>期限：</label>
                <label><span style="color: red;font-size: 16px;padding: 0 5px">12</span>个月<span
                        style="color: red;font-size: 16px;padding: 0 5px">12</span>期</label>
            </div>
             <div class="form-group newInput vali" style="margin-left: 50px;" >
              
                <label>额外利率：</label>
                <input  name="additionalinterestrate" id="additionalinterestrate" type="text"  class="form-control required"  >%
            </div>
        </div>
        <h4 style="padding: 10px 0;font-size: 16px;" class="list-group-item-success">扣款账户如下</h4>
        <div class="form-inline">
            <div class="form-group newInput vali">
                 <label><span style="color: red">*</span>开户行：</label>
                 <select class="form-control required" name="openbank"  style="min-width: 176px">
                 <option >中国工商银行</option>
                 <option >中国建设银行</option>
                 <option >中国银行</option>
                 <option >中国交通银行</option>
                 <option >兴业银行</option>
                 <option >中信银行</option>
                 <option >中国光大银行</option> 
                 <option >平安银行</option>
                 <option >中国邮政储蓄银行</option>
                 <option >上海银行</option>
                 <option >浦东发展银行</option>
                 <option >广发银行</option>
                 </select>
            </div>
            <div class="form-group newInput vali">
                 <label><span style="color: red">*</span>账户名：</label>
                <input type="text" name="accountname"  class="form-control required">
            </div>
            <div class="form-group newInput vali">
                 <label><span style="color: red">*</span>账号：</label>
                <input type="text"  name="accountcode" class="form-control required" id=userName1 oninput="user(this)"  style="font-weight: 700">
            </div>
        </div>
        <h4 style="padding: 10px 0;font-size: 16px;" class="list-group-item-success">还款计划表第一年</h4>
        <p style="text-align: center;padding: 10px 0">
            <button type="button" class="btn btn-danger calculate1">自动计算还款</button>
        </p>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
                <thead>
                <tr>
                    <th class="success">首付</th>
                    <th>租赁期限</th>
                    <th>月租金</th>
                    <th>支付日</th>
                    <th>每年总租金合计</th>
                </tr>
                </thead>
                <tbody class="table1">
                <tr>
                    <td align="center" >0</td>
                    <td>第一期</td>
                    <td></td>
                    <td></td>
                    <td rowspan="12" style="text-align: center;vertical-align: inherit;font-weight: 700"></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第二期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第三期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第四期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第五期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第六期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第七期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第八期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第九期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第十期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第十一期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第十二期</td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="du-contain">
        <div class="form-inline ensure1" style="margin-top: 20px">
            <button type="button" class="close" aria-label="Close" style="color: red;opacity:1" onclick="del(this)"><span aria-hidden="true" style="color: red;">&times;</span></button>
            <div class="form-group newInput vali">
                <label>担保人：</label>
                <input type="text" name="bondsman"  class="form-control">
            </div>
            <div class="form-group newInput vali">
                <label>住所：</label>
                <input type="text" name="bmaddress"  class="form-control">
            </div>
            <div class="form-group newInput vali">
                <label>实际经营场所：</label>
                <input type="text" name="bmrunaddress"  class="form-control">
            </div>
            <div class="form-group newInput vali">
                <label>传真：</label>
                <input type="text" name="bmfaxes"  class="form-control">
            </div>
            <div class="form-group newInput vali">
                <label>电话：</label>
                <input type="text" name="bmphone"  class="form-control">
            </div>
        </div>
        </div>
        <p style="text-align: center;padding: 10px 0">
            <button type="button" class="btn btn-warning ensure1-btn">添加担保人</button>
        </p>
        <h4 style="padding: 10px 0;margin-top: 30px" class="list-group-item-danger">融资租赁售后回租第二到四年</h4>
        <div class="form-inline">
            <div class="form-group newInput vali">
                  <label><span style="color: red">*</span>合同编号：</label>
                <input type="text" name="secondyearccode" class="form-control required" placeholder="第二到四年">
            </div>
            <div class="form-group newInput vali">
                  <label><span style="color: red">*</span>租赁物货款：</label>
                <input type="text" id="sleaseprice" name="sleaseprice" class="form-control required money" placeholder="第二到四年   金额（元）">
            </div>
            <div class="form-group newInput vali">
                <label>GPS费用：</label>
                <input type="text" name="sgpsprice" class="form-control money" placeholder="金额(元)">
            </div>
            <div class="form-group newInput vali">
                <label>手续费：</label>
                <input type="text" name="shandcharge" class="form-control money" placeholder="金额(元)">
            </div>
            <div class="form-group newInput vali">
                  <label><span style="color: red">*</span>动态监管费：</label>
                <input type="text" id="ssuperviseprice" name="ssuperviseprice" class="form-control required money" placeholder="租赁物货款的1%  金额(元)">
            </div>
            <div class="form-group newInput vali">
                  <label><span style="color: red">*</span>履约险：</label>
                <input type="text" id="spromiseprice" name="spromiseprice" class="form-control required money" placeholder="租赁物货款的 1.5%">
            </div>
            <div class="form-group newInput vali">
                <label>期限：</label>
                <label><span style="color: red;font-size: 16px;padding: 0 5px">36</span>个月<span
                        style="color: red;font-size: 16px;padding: 0 5px">36</span>期</label>
            </div>
        </div>
        <h4 style="padding: 10px 0;font-size: 16px;" class="list-group-item-success">扣款账户如下</h4>
        <div class="form-inline">
            <div class="form-group newInput vali">
                  <label><span style="color: red">*</span>开户行：</label> 
                 <select class="form-control required" name="sopenbank"  style="min-width: 176px">
                 <option >中国工商银行</option>
                 <option >中国建设银行</option>
                 <option >中国银行</option>
                 <option >中国交通银行</option>
                 <option >兴业银行</option>
                 <option >中信银行</option>
                 <option >中国光大银行</option> 
                 <option >平安银行</option>
                 <option >中国邮政储蓄银行</option>
                 <option >上海银行</option>
                 <option >浦东发展银行</option>
                 <option >广发银行</option>
                 </select>
            </div>
            <div class="form-group newInput vali">
                   <label><span style="color: red">*</span>账户名：</label>
                <input type="text" name="saccountname"  class="form-control required">
            </div>
            <div class="form-group newInput vali">
                   <label><span style="color: red">*</span>账号：</label>
                <input type="text" name="saccountcode" class="form-control required" id=userName2 oninput="user(this)" style="font-weight: 700">
            </div>
        </div>
        <h4 style="padding: 10px 0;font-size: 16px;" class="list-group-item-success">还款计划表第二到四年</h4>
        <p style="text-align: center;padding: 10px 0">
            <button type="button" class="btn btn-danger calculate2">自动计算还款</button>
        </p>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
                <thead>
                <tr>
                    <th class="success">首付</th>
                    <th>租赁期限</th>
                    <th>月租金</th>
                    <th>支付日</th>
                    <th>每年总租金合计</th>
                </tr>
                </thead>
                <tbody class="table2">
                <tr>
                    <td align="center" >0</td>
                    <td>第十三期</td>
                    <td></td>
                    <td></td>
                    <td rowspan="12" style="text-align: center;vertical-align: inherit;font-weight: 700"></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第十四期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第十五期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第十六期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第十七期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第十八期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第十九期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第二十期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第二十一期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第二十二期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第二十三期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第二十四期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第二十五期</td>
                    <td></td>
                    <td></td>
                    <td rowspan="12" style="text-align: center;vertical-align: inherit;font-weight: 700"></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第二十六期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第二十七期</td>
                    <td></td>
                    <td></td>
                </tr>
                
                <tr>
                    <td align="center" >0</td>
                    <td>第二十八期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第二十九期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第三十期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第三十一期</td>
                    <td></td>
                    <td></td>
                </tr><tr>
                    <td align="center" >0</td>
                    <td>第三十二期</td>
                    <td></td>
                    <td></td>
                </tr>
                
                <tr>
                    <td align="center" >0</td>
                    <td>第三十三期</td>
                    <td></td>
                    <td></td>
                </tr><tr>
                    <td align="center" >0</td>
                    <td>第三十四期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第三十五期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第三十六期</td>
                    <td></td>
                    <td id="cc"></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第三十七期</td>
                    <td></td>
                    <td></td>
                    <td rowspan="12" style="text-align: center;vertical-align: inherit;font-weight: 700"></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第三十八期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第三十九期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第四十期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第四十一期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第四十二期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第四十三期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第四十四期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第四十五期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第四十六期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第四十七期</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" >0</td>
                    <td>第四十八期</td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="du-contain2">
        <div class="form-inline ensure2" style="margin-top: 20px">
            <button type="button" class="close" aria-label="Close" style="color: red;opacity:1" onclick="del(this)"><span aria-hidden="true">×</span></button>
            <div class="form-group newInput vali">
                <label>担保人：</label>
                <input type="text" name="bondsman2"  class="form-control">
            </div>
            <div class="form-group newInput vali">
                <label>住所：</label>
                <input type="text" name="bmaddress2"  class="form-control">
            </div>
            <div class="form-group newInput vali">
                <label>实际经营场所：</label>
                <input type="text" name="bmrunaddress2"  class="form-control">
            </div>
            <div class="form-group newInput vali">
                <label>传真：</label>
                <input type="text" name="bmfaxes2"  class="form-control">
            </div>
            <div class="form-group newInput vali">
                <label>电话：</label>
                <input type="text" name="bmphone2"  class="form-control">
            </div>
        </div>
        </div>
        <p style="text-align: center;padding: 10px 0">
            <button type="button" class="btn btn-warning ensure2-btn">添加担保人</button>
        </p>
        <div class="du-info">
            <span>合同信息补充：</span>
            <textarea class="form-control" name="note" rows="7"></textarea>
        </div>
        <div class="du-btn">
            <a href="javascript:;" class="btn btn-danger submit" role="button" >合同提交保存
            </a>
            <a href="javascript:;" class="btn btn-warning" role="button" onclick="back()" style="padding: 6px 38px">
                取消
            </a>
        </div>
        </form>
    </div>
</div>
</body>
</html>
<script>
function back(){location.href=$('#backUrl').val()+"?currpage="+$('#currpage').val()+"&type=1";} ;

function aproveprice(val){
	 $('#superviseprice').val(parseFloat(val*0.01).toFixed(2));
	 $('#promiseprice').val(parseFloat(val*0.015).toFixed(2));
	 $('#sleaseprice').val(parseFloat(val*3/4).toFixed(2));
	 $('#ssuperviseprice').val(parseFloat(val*0.03/4).toFixed(2));
	 $('#spromiseprice').val(parseFloat(val*0.045/4).toFixed(2));
}
$(".calculate1").click(function () {
	var additionalinterestrate=$("#additionalinterestrate").val();//额外利率
	var c=/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/;
	if(!c.test(additionalinterestrate)&&additionalinterestrate!=""){
		$("#additionalinterestrate").focus();
		return false;
	}
	var calculate1=$('#calculate1Url').val();
	var sightime1=$('#sightime1').val();
	var leaseprice=$('#leaseprice').val();
	if(sightime1==""){
		 $("#sightime1").focus();
	}else{
	$.ajax({
        //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: calculate1 ,//url
            data: {sightime1:sightime1,leaseprice:leaseprice,type:1,additionalinterestrate:additionalinterestrate},
            success: function (data) {
                console.log(data);//打印服务端返回的数据(调试用)
                var table1=$('.table1 tr');
                for(var i=0;i<table1.length;i++){
                    if(i==0){
                        table1.eq(0).find('td').eq(2).html(data.leaseprice2);
                        table1.eq(0).find('td').eq(3).html(data.time2[0].time1);
                        table1.eq(0).find('td').eq(4).html(data.totalleaseprice1);
                    }else{
                        table1.eq(i).find('td').eq(2).html(data.leaseprice3);
                        table1.eq(i).find('td').eq(3).html(data.time2[i].time1);
                    }
                }
            },
        });
	}
	});
$(".calculate2").click(function () {
	var calculate1=$('#calculate1Url').val();
	var sightime1=$('#sightime1').val();
	var leaseprice=$('#leaseprice').val();
	if(sightime1==""){
		 $("#sightime1").focus();
	}else{
	$.ajax({
        //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: calculate1 ,//url
            data: {sightime1:sightime1,leaseprice:leaseprice,type:2},
            success: function (data) {
                console.log(data);//打印服务端返回的数据(调试用)
                var table=$('.table2 tr');
                for(var i=0;i<table.length;i++){
                    if(i==0){
                        table.eq(0).find('td').eq(2).html(data.leaseprice2);
                        table.eq(0).find('td').eq(3).html(data.time2[0].time1);
                    }else{
                        table.eq(i).find('td').eq(2).html(data.leaseprice3);
                        table.eq(i).find('td').eq(3).html(data.time2[i].time1);
                    }
                }
                table.eq(0).find('td').eq(4).html(data.totalleaseprice2);
                table.eq(12).find('td').eq(4).html(data.totalleaseprice3);
                table.eq(24).find('td').eq(4).html(data.totalleaseprice3);
            },
        });
	}
	});
$(function(){
	var leaseprice=$('#leaseprice').val();
	 $('#superviseprice').val(parseFloat(leaseprice*0.01).toFixed(2));
	 $('#promiseprice').val(parseFloat(leaseprice*0.015).toFixed(2));
	 $('#sleaseprice').val(parseFloat(leaseprice*3/4).toFixed(2));
	 $('#ssuperviseprice').val(parseFloat(leaseprice*0.03/4).toFixed(2));
	 $('#spromiseprice').val(parseFloat(leaseprice*0.045/4).toFixed(2));
    
   });
//时间初始化
$('.mesTime').jeDate({
    isinitVal:true,
    format: "YYYY-MM-DD",
    isTime: false,
    isClear: false,
    minDate: "2014-09-19 00:00:00",
    today:'NOW'
});
//添加担保人
var div = $(".ensure1").clone();
var div2 = $(".ensure2").clone();
$(".ensure1-btn").click(function () {
    var aa = div.clone();
    aa.appendTo($(".du-contain")).find("input").val("");
});
$(".ensure2-btn").click(function () {
    var aa = div2.clone();
    aa.appendTo($(".du-contain2")).find("input").val("");
});
//删除担保人
function del(target) {
    $(target).parent().remove();
}

//银行卡号正则匹配
function user(code) {
    //[^\d\s] 除了数字和任何空白字符
//   $(code).val($(code).val().replace(/[^\d\s]+$/g,""));
    $(code).val($(code).val().replace(/[^\d\s]/g, '').replace(/(\d{4})(?=\d)/g, "$1 "));
    if (!/\d{14,19}/.test($(code).val())) {
//        alert(1)
        $(this).focus();
    }
}
var flag=true;
$(".submit").click(function () {
    var saleborrowfile3=$('#saleborrowfile3').val();
    var saleborrowfile4=$('#saleborrowfile4').val();
    var pledgefile1=$('#pledgefile1').val();
    if(pledgefile1==""){
    	$('#pledgefile1').focus()
    	return  false;
    }
    if(saleborrowfile3!=""){
    	if(saleborrowfile4!=""){
    	        //提交
    	          $("#searchForm").submit();
    $.each($('.has-error'),function(){
        $(this).find('.form-control').focus();
        
        flag=false;
        return false;
    })
    if(flag){
    	flag=false;
    	    	var addleasebacksaveUrl=$('#addleasebacksaveUrl').val();
    	      	 var formData = new FormData($( "#searchForm" )[0]); 
    	      
    		 	 $.ajax({
    	          //几个参数需要注意一下
    	              type: "POST",//方法类型
    	              dataType: "json",//预期服务器返回的数据类型
    	              url: addleasebacksaveUrl ,//url
    	              data: formData,
    	              async: false,  
    	              cache: false,  
    	              contentType: false,  
    	              processData: false, 
    	              success: function (data) {
    	            	 if(data.status){
    	            		 alert("保存成功");
    	            		 location.href=$('#backUrl').val()+"?currpage="+$('#currpage').val()+"&type=1";
    	            	 }else{
    	            		 alert(data.msg);
    	            	 }
    	              }
    	             
    	          });}
    	   
   			}else{
	   		$("#saleborrowfile4").focus();
   			}
   	 }else{
    	$("#saleborrowfile3").focus();
    	}
   


});

function rent(code) {
    var ss = $(code).val();
    if (ss.slice(0, 14) != "瑞新(上海)融资租赁有限公司") {
        $(code).val("瑞新(上海)融资租赁有限公司");
    }
}
;


$("#searchForm").bootstrapValidator({
    ive: 'disabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证
    excluded: [':disabled', ':hidden', ':not(:visible)'],//排除无需验证的控件，比如被禁用的或者被隐藏的
    submitButtons: '#btn-test',//指定提交按钮，如果验证失败则变成disabled，但我没试成功，反而加了这句话非submit按钮也会提交到action指定页面
    message: '通用的验证失败消息',//好像从来没出现过
    feedbackIcons: {//根据验证结果显示的各种图标
        valid: 'glyphicon',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	additionalinterestrate:{
    		 validators: {
                 regexp: {
                     regexp:/((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,
                     message: '额外利率格式不正确'
                 }
             }
    	},
        address: {
            message: '住址验证失败',
            validators: {
                notEmpty: {
                    message: '住址不能为空'
                },
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        runaddress: {
            message: '实际经营场所验证失败',
            validators: {
                notEmpty: {
                    message: '实际经营场所不能为空'
                },
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        principle: {
            message: '联系人验证失败',
            validators: {
                notEmpty: {
                    message: '联系人不能为空'
                },
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        phone: {
            validators: {
                notEmpty: {
                    message: '手机号不能为空'
                },
                regexp: {
                    regexp: /^1[34578]\d{9}$/,
                    message: '手机号码验证错误'
                }
            }
        },
        bname: {
            message: '乙方验证失败',
            validators: {
                notEmpty: {
                    message: '乙方不能为空'
                },
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        identify: {
            message: '信息验证失败',
            validators: {
                notEmpty: {
                    message: '身份证不能为空'
                },
                regexp: {
                    regexp: /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,
                    message: '身份证格式填写错误'
                }
            }
        },
        bphone: {
            validators: {
                notEmpty: {
                    message: '手机号不能为空'
                },
                regexp: {
                    regexp: /^1[34578]\d{9}$/,
                    message: '手机号码验证错误'
                }
            }
        },
        baddress: {
            validators: {
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        brunaddress: {
            validators: {
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        faxes: {
            validators: {
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        bprinciple: {
            validators: {
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        sightime1: {
            validators: {
                notEmpty: {
                    message: '日期不能为空'
                },
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        brand: {
            validators: {
                notEmpty: {
                    message: '品牌不能为空'
                },
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        model: {
            validators: {
                notEmpty: {
                    message: '型号不能为空'
                },
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        version: {
            validators: {
                notEmpty: {
                    message: '版别不能为空'
                },
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        vin: {
            validators: {
                notEmpty: {
                    message: '车架号不能为空'
                },
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        firstyearccode: {
            validators: {
                notEmpty: {
                    message: '合同编号不能为空'
                },
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        leaseprice: {
            validators: {
                notEmpty: {
                    message: '租赁物货款不能为空'
                },
                stringLength: {
                    max: 20,
                    message: '金额超过最大限额'
                },
                regexp: {
                    regexp: /((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,
                    message: '金额格式填写错误'
                }
            }
        },
        gpsprice: {
            validators: {
                stringLength: {
                    max: 20,
                    message: '金额超过最大限额'
                },
                regexp: {
                    regexp: /((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,
                    message: '金额格式填写错误'
                }
            }
        },
        handcharge: {
            validators: {
                stringLength: {
                    max: 20,
                    message: '金额超过最大限额'
                },
                regexp: {
                    regexp: /((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,
                    message: '金额格式填写错误'
                }
            }
        },
        superviseprice: {
            validators: {
                notEmpty: {
                    message: '动态监管费不能为空'
                },
                stringLength: {
                    max: 20,
                    message: '金额超过最大限额'
                },
                regexp: {
                    regexp: /((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,
                    message: '金额格式填写错误'
                }
            }
        },
        promiseprice: {
            validators: {
                notEmpty: {
                    message: '履约险不能为空'
                },
                stringLength: {
                    max: 20,
                    message: '金额超过最大限额'
                },
                regexp: {
                    regexp: /((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,
                    message: '金额格式填写错误'
                }
            }
        },
        openbank: {
            validators: {
                notEmpty: {
                    message: '开户行不能为空'
                },
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        accountname: {
            validators: {
                notEmpty: {
                    message: '账户名不能为空'
                },
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        accountcode: {
            validators: {
                notEmpty: {
                    message: '账号不能为空'
                }
            }
        },
        bondsman: {
            validators: {
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        bmaddress: {
            validators: {
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        bmrunaddress: {
            validators: {
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        bmfaxes: {
            validators: {
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        bmphone: {
            validators: {
                regexp: {
                    regexp: /^1[34578]\d{9}$/,
                    message: '手机号码验证错误'
                }
            }
        },
        secondyearccode: {
            validators: {
                notEmpty: {
                    message: '合同编号不能为空'
                },
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },

        sleaseprice: {
            validators: {
                notEmpty: {
                    message: '租赁物货款不能为空'
                },
                stringLength: {
                    max: 20,
                    message: '金额超过最大限额'
                },
                regexp: {
                    regexp: /((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,
                    message: '金额格式填写错误'
                }
            }
        },
        sgpsprice: {
            validators: {
                stringLength: {
                    max: 20,
                    message: '金额超过最大限额'
                },
                regexp: {
                    regexp: /((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,
                    message: '金额格式填写错误'
                }
            }
        },
        shandcharge: {
            validators: {
                stringLength: {
                    max: 20,
                    message: '金额超过最大限额'
                },
                regexp: {
                    regexp: /((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,
                    message: '金额格式填写错误'
                }
            }
        },
        ssuperviseprice: {
            validators: {
                notEmpty: {
                    message: '动态监管费不能为空'
                },
                stringLength: {
                    max: 20,
                    message: '金额超过最大限额'
                },
                regexp: {
                    regexp: /((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,
                    message: '金额格式填写错误'
                }
            }
        },
        spromiseprice: {
            validators: {
                notEmpty: {
                    message: '履约险不能为空'
                },
                stringLength: {
                    max: 20,
                    message: '金额超过最大限额'
                },
                regexp: {
                    regexp: /((^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$))/,
                    message: '金额格式填写错误'
                }
            }
        },
        sopenbank: {
            validators: {
                notEmpty: {
                    message: '开户行不能为空'
                },
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        saccountname: {
            validators: {
                notEmpty: {
                    message: '账户名不能为空'
                },
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        saccountcode: {
            validators: {
                notEmpty: {
                    message: '账号不能为空'
                }
            }
        },
        bondsman2: {
            validators: {
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        bmaddress2: {
            validators: {
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        bmrunaddress2: {
            validators: {
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        bmfaxes2: {
            validators: {
                stringLength: {
                    max: 255,
                    message: '长度必须在小于255位字符'
                }
            }
        },
        bmphone2: {
            validators: {
                regexp: {
                    regexp: /^1[34578]\d{9}$/,
                    message: '手机号码验证错误'
                }
            }
        }
    }
});
</script>
