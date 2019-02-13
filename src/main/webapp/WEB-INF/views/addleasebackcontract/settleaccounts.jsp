<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>

	<input id="bizcontractbalanceUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="bizcontractbalance"/>' />
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
     <c:if test="${con.finance==1 }">
        <h3 class="title">金融车结算</h3>
     </c:if>
      <c:if test="${con.finance==2 }">
        <h3 class="title">全款车结算</h3>
     </c:if>
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
                <c:if test="${con.finance==1 }">
                <label>金融购车</label></c:if>
                  <c:if test="${con.finance==2 }">
                <label>全款购车</label></c:if>
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label>验车结果：</label>
                <label>通过</label>
            </div>
        </div>
        <c:if test="${con.finance==1 }"><!--金融购车  -->
         <div class="form-inline">
            <div class="form-group newInput" style="width: 415px;margin-left:-60px;">
                <label>第一份合同的租赁物货款：</label>
                <label>${leaseprice }</label>
                <label style="padding-left: 3px">元</label>
            </div>
            <div class="form-group newInput" style="width: 415px;margin-left:60px;">
                <label>合同保险：</label>
                <label>${money4 }</label>
                <label style="padding-left: 3px">元</label>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <label>合同质保：</label>
                <label>${con.qualityprice }</label>
                <label style="padding-left: 3px">元</label>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">合同装潢：</label>
                <label>${con.qualityprice }</label>
                <label style="padding-left: 3px">元</label>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">合同延保：</label>
                <label>${con.qualityprice }</label>
                <label style="padding-left: 3px">元</label>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">合同上牌：</label>
                <label>${con.qualityprice }</label>
                <label style="padding-left: 3px">元</label>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">报价保险：</label>
                <label >${con.insurancesure }</label>
                <label style="padding-left: 3px">元</label>
            </div>
            
            <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">报价质保：</label>
                <label>${con.qualityprice1 }</label>
                <label style="padding-left: 3px">元</label>
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">实收定金：</label>
                <label id="money1">${money5 }</label>
                <label style="padding-left: 3px">元</label>
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">应收首付：</label>
                <label id="money">${money6 }</label>
                <label style="padding-left: 3px">元</label>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">金融首付款补额：</label>
                <label id="money7">${money7 }</label>
                <label style="padding-left: 3px">元</label>
            </div>
         <c:if test="${loginid==1 }">
            <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">差额：</label>
                <input type="text" class="form-control" id="balance" value=""> <label style="padding-left: 3px">元</label><label style="color: red;">(负数是客户要付的钱，正数是要退给客户的钱)</label>
            </div>
            </c:if>
            <c:if test="${loginid!=1 }">
             <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">差额：</label>
                <input type="text" class="form-control" id="balance" disabled="disabled" value=""> <label style="padding-left: 3px">元</label><label style="color: red;">(负数是客户要付的钱，正数是要退给客户的钱)</label>
            </div>
            </c:if>
        </div>
       <div class="du-btn">
       <a href="#" class="btn btn-danger" onclick="balance1()" style="padding: 6px 38px">结算</a>
		<a href="#" class="btn btn-danger" onclick="submitBtn1()" style="padding: 6px 38px">通过</a>
		<a href="#" class="btn btn-warning" onclick="back()" style="padding: 6px 38px">返回</a>
	</div></c:if>
	<c:if test="${con.finance==2 }"><!-- 全款购车 -->
         <div class="form-inline">
         <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">购置税：</label>
                <label>${con.purchasetax }</label>
                <label style="padding-left: 3px">元</label>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <label>合同保险：</label>
                <label>${money4 }</label>
                <label style="padding-left: 3px">元</label>
            </div>
           <div class="form-group newInput" style="width: 415px;">
                <label>合同质保：</label>
                <label>${con.qualityprice }</label>
                <label style="padding-left: 3px">元</label>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">合同装潢：</label>
                <label>${con.qualityprice }</label>
                <label style="padding-left: 3px">元</label>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">合同延保：</label>
                <label>${con.qualityprice }</label>
                <label style="padding-left: 3px">元</label>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">合同上牌：</label>
                <label>${con.qualityprice }</label>
                <label style="padding-left: 3px">元</label>
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">报价保险：</label>
                <label>${con.insurancesure }</label>
                <label style="padding-left: 3px">元</label>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">报价质保：</label>
                <label>${con.qualityprice1 }</label>
                <label style="padding-left: 3px">元</label>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">报价车损险：</label>
                <label>${con.cardamageinsurance }</label>
                <label style="padding-left: 3px">元</label>
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">实收金额：</label>
                <label id="money1">${money }</label>
                <label style="padding-left: 3px">元</label>
            </div>
             <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">应收金额：</label>
                <label id="money">${money1 }</label>
                <label style="padding-left: 3px">元</label>
            </div>
            <c:if test="${loginid==1 }">
            <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">差额：</label>
                <input type="text" class="form-control" id="balance" value=""> <label style="padding-left: 3px">元</label><label style="color: red;">(负数是客户要付的钱，正数是要退给客户的钱)</label>
            </div>
            </c:if>
            <c:if test="${loginid!=1 }">
             <div class="form-group newInput" style="width: 415px;">
                <label style="color: red;">差额：</label>
                <input type="text" class="form-control" id="balance" disabled="disabled" value=""> <label style="padding-left: 3px">元</label><label style="color: red;">(负数是客户要付的钱，正数是要退给客户的钱)</label>
            </div>
            </c:if>
        </div>
       <div class="du-btn">
         <a href="#" class="btn btn-danger" onclick="balance2()" style="padding: 6px 38px">结算</a>
		<a href="#" class="btn btn-danger" onclick="submitBtn2()" style="padding: 6px 38px">通过</a>
		<a href="#" class="btn btn-warning" onclick="back()" style="padding: 6px 38px">返回</a>
	</div></c:if>
	
    </div>
</div>
</body>
<script>
function back(){
	 location.href=$('#bizcontractfinancepageUrl').val()+"?currpage="+$('#currpage').val();
}
function balance1(){//*金融  
	$("#balance").val($('#money1').text()-$('#money').text()-$('#money7').text());
};
function balance2(){
	$("#balance").val($('#money1').text()-$('#money').text());
};
var status=true;
function submitBtn2(){
	var bizcontractbalanceUrl=$('#bizcontractbalanceUrl').val();
	var id=$('#id').val();
	var balance=$('#balance').val();
	if(balance==""){
		$('#balance').focus();
		return false;
	}
	var totalreceiveprice=$('#money').text();
	var loginid=$('#loginid').val();
	if(status){
		status=false;
		$.ajax({
		          type: "POST",//方法类型
		          dataType: "json",//预期服务器返回的数据类型
		          url: bizcontractbalanceUrl ,//url
		          data:{balance:balance,id:id,loginid:loginid,totalreceiveprice:totalreceiveprice},
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
};
function submitBtn1(){//金融
	var bizcontractbalanceUrl=$('#bizcontractbalanceUrl').val();
	var id=$('#id').val();
	var balance=$('#balance').val();
	if(balance==""){
		$('#balance').focus();
		return false;
	}
	var totalreceiveprice=$('#money').text();
	var loginid=$('#loginid').val();
	if(status){
		status=false;
		$.ajax({
		          type: "POST",//方法类型
		          dataType: "json",//预期服务器返回的数据类型
		          url: bizcontractbalanceUrl ,//url
		          data:{balance:balance,id:id,loginid:loginid,totalreceiveprice:totalreceiveprice},
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
};
</script>