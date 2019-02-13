<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>

	<input id="MaterialOutboundpassUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="MaterialOutboundpass"/>' />
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
  <form name="searchForm" id="searchForm" action="<ufa:url fieldName="MaterialOutboundpass" namespace="car-ms"/>" enctype="multipart/form-data" method="post">
<div class="box">
    <div class="container">
        <h3 class="title">材料出库</h3>
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
        <h4 style="padding: 10px 0;" class="list-group-item-danger">准备车辆出库材料</h4>
  
     <input id="loginid" value="${loginid }" name="loginid" type="hidden">
     <input id="id" value="${id }" name="id"  type="hidden">
     <input id="currpage" value="${currpage }" type="hidden">
        <div class="form-inline du-checkbox">
            <div class="form-group newInput" style="width: 415px;">
                <div class="checkbox" style="margin-left: 60PX;">
                    <label>
                        <input type="checkbox" id="handbook" name="handbook" value="1"> 车主手册宝（保养手册）
                    </label>
                </div>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <div class="checkbox">
                    <label>
                         <input type="checkbox" id="carkey" name="carkey"  value="1">车钥匙
                    </label>
                </div>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <div class="checkbox">
                    <label>
                         <input type="checkbox" id="threecer" name="threecer" value="1"> 车辆三证
                    </label>
                </div>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <div class="checkbox" style="margin-left: 8PX;">
                    <label>
                         <input type="checkbox" id="billthree" name="billthree" value="1">四联发票
                    </label>
                </div>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <div class="checkbox" style="margin-left: 64PX;">
                    <label>
                         <input type="checkbox" id="insurancebill" name="insurancebill" value="1">车辆保单（如购买保单）
                    </label>
                </div>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <div class="checkbox" style="margin-left: 43PX;">
                    <label>
                         <input type="checkbox" id="delaybill" name="delaybill" value="1">延保保单（如购买延保）
                    </label>
                </div>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <div class="checkbox" style="margin-left: 59PX;">
                    <label>
                         <input type="checkbox" id="qualitybill" name="qualitybill" value="1">质保保单（如购买质保）
                    </label>
                </div>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <div class="checkbox" style="margin-left: 14PX;">
                    <label>
                         <input type="checkbox" id="productcer" name="productcer" value="1">车辆产证
                    </label>
                </div>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <div class="checkbox" style="margin-left: -34PX;">
                    <label>
                         <input type="checkbox" id="carplate" name="carplate" value="1">牌照
                    </label>
                </div>
            </div>
            <div class="form-group newInput" style="width: 415px;">
                <div class="checkbox" style="margin-left: 15PX;">
                    <label>
                         <input type="checkbox" id="platebill" name="platebill" value="1"> 牌照发票
                    </label>
                </div>
            </div>
        </div>
        <div class="du-btn">
            <a href="#" class="btn btn-danger" role="button" onclick="submitBtn()">客户提车车辆出库
            </a>
              <a href="#" class="btn btn-warning" role="button" onclick="back()">返回
            </a>
            </div> 
      </div>
</div></form>
</body>
<script>
function back(){
	 location.href=$('#bizcontractfinancepageUrl').val()+"?currpage="+$('#currpage').val();
}
var status=true;
function submitBtn(){
	var MaterialOutboundpassUrl=$('#MaterialOutboundpassUrl').val();
	if(status){
		status=false;
		 $.ajax({
		      //几个参数需要注意一下
		          type: "POST",//方法类型
		          dataType: "json",//预期服务器返回的数据类型
		          url: MaterialOutboundpassUrl ,//url
		          data:$('#searchForm').serialize(),
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
</script>