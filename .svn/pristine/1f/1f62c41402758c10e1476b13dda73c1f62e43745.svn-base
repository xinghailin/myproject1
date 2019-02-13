<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>

	<input id="totalpaymentpassUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="totalpaymentpass"/>' />
	<input id="bizcontractfinancepageUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="bizcontractfinancepage"/>' />

<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/jquery.jedate.js"></script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${cssBasePath}/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${cssBasePath}/jedate.css">
</head>
<style>
    @media (min-width: 1330px) {
        .container {
            width: 1300px;
        }
    }

    table td, table th {
        text-align: center;
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
        min-width: 120px;
        text-align: right;
    }

    .du-btn {
        text-align: center;
        margin: 50px 0;
    }

    .du-btn a {
        margin: 0 20px;
    }

</style>
<body>
<div class="box">
    <div class="container">
    <input id="loginid" value="${loginid }" type="hidden">
     <input id="id" value="${id }" type="hidden">
     <input id="currpage" value="${currpage }" type="hidden">
        <h3 class="title">全款车辆回款确认</h3>
        <h4 style="padding: 10px 0;" class="list-group-item-danger">车辆销售合同</h4>
        <div class="form-inline">
             <div class="form-group newInput" style="width: 415px;">
                <label>合同编号：</label>
                <label>${con.filecode }</label>
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label>合同下载：</label>
                <a href="${contextPath}${con.salecontract }" class="btn btn-primary"  role="button" download="${con.salecontract }" role="button">
                    合同下载
                </a>
            </div>
        </div>
        <div class="form-inline">
             <div class="form-group newInput" style="width: 415px;">
                <label>客户姓名：</label>
                <label>${con.bname }</label>
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label>客户身份证：</label>
                <label>${con.identify }</label>
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label>联系电话：</label>
                <label>${con.bphone }</label>
            </div>
        </div>
        <h4 style="padding: 10px 0;" class="list-group-item-danger">合同信息</h4>
        <div class="form-inline">
             <div class="form-group newInput" style="width: 415px;" style="width: 415px;">
                <label>车架号：</label>
                <label>${con.vin }</label>
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label>品牌：</label>
                <label>${con.brand }</label>
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label>型号：</label>
                <label>${con.model }</label>
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label>版别：</label>
                <label>${con.version }</label>
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label>外观颜色：</label>
                <label>${con.outcolor }</label>
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label>内饰颜色：</label>
                <label>${con.incolor }</label>
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label>购车类型：</label>
                <label>全款</label>
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label>验车结果：</label>
                <label>通过</label>
            </div>
        </div>
         <h4 style="padding: 10px 0;" class="list-group-item-danger">填写金额</h4>
        <div class="form-inline" style="padding-top: 30px">
             <div class="form-group newInput" style="width: 415px;">
                <label>车辆销售价格：</label>
                <label>${con.saleprice }</label>
              
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label>定金金额：</label>
                <label>${con.downpay }</label>
              
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label>保险费：</label>
                <label>${money3 }</label>
              
            </div>
             <div class="form-group newInput" style="width: 415px;margin-left:-45px;">
                <label>购置税(不计算尾款中)：</label>
                <label>${con.purchasetax }</label>
              
            </div>
             <div class="form-group newInput" style="width: 415px;margin-left:45px;">
                <label>上牌费：</label>
                <label>${con.plateprice }</label>
              
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label>质保费：</label>
                <label>${con.qualityprice }</label>
              
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label>装潢费：</label>
                <label>${con.decorateprice }</label>
              
            </div>
        </div>
        <div>
             <div class="form-group newInput" style="width: 415px;">
                <label>实到定金金额：</label>
                <label>${con.realdownpay }</label>
            </div>
            <div class="form-group newInput" style="width: 415px;color: red;">
                <label>车价尾款：</label>
               <label id="money2">${money2 }</label>
            </div> 
             <div class="form-group newInput" style="width: 415px;color: red;">
                <label>实到尾款：</label>
               <input id="realfinalpay" value="${money }">
            </div> 
       </div>
       <div class="du-btn">
		<a href="#" class="btn btn-danger" onclick="submitBtn()" style="padding: 6px 38px">通过</a>
		<a href="#" class="btn btn-warning" onclick="back()" style="padding: 6px 38px">返回</a>
	</div>
    </div>
</div>
</body>
<script>

function back(){
	 location.href=$('#bizcontractfinancepageUrl').val()+"?currpage="+$('#currpage').val();
}
var status=true;
function submitBtn(){
	var reg =/(^\-?[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^\-?(0){1}$)|(^\-?[0-9]\.[0-9]([0-9])?$)/;
	var realfinalpay=$('#realfinalpay').val();
	var totalpaymentpassUrl=$('#totalpaymentpassUrl').val();
	var finalpay=$('#money2').text();
	var id=$('#id').val();
	var loginid=$('#loginid').val();
	if(!reg.test(realfinalpay)){
		$('#realfinalpay').focus();
	}else{
		if(status){
		status=false;
		$.ajax({
		      //几个参数需要注意一下
		          type: "POST",//方法类型
		          dataType: "json",//预期服务器返回的数据类型
		          url: totalpaymentpassUrl ,//url
		          data:{realfinalpay:realfinalpay,id:id,loginid:loginid,finalpay:finalpay},
		          success: function (data) {
		        	 if(data.status){
		        		 alert("保存成功");
		        		 location.href=$('#bizcontractfinancepageUrl').val()+"?currpage="+$('#currpage').val();
		        	 }else{
		        		 alert(data.msg);
		        	 }
		          }
		         
		      }); 
		}
	}
};
</script>