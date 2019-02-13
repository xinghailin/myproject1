<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link rel='stylesheet' type="text/css" href='${cssBasePath}/common/common.css' />
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css" />
<link rel="stylesheet" type="text/css" href="${cssBasePath}/common/index.css" />
<link rel="stylesheet" href="${cssBasePath}/jeDate-test.css">
<link rel="stylesheet" href="${cssBasePath}/jedate1.css">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="SHOP_LST" namespace="car-ms"/>">
<input id="provincesQueryUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="DATA_GETPROVINCES"/>' />
<input id="backUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="SHOP_INDEX"/>' />
<input type="hidden" id="addshopUrl" value="<ufa:url fieldName="SHOP_EDIT" namespace="car-ms"/>">
<input type="hidden" id="cityUrl" value="<ufa:url fieldName="shopcity" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px;">
	<div class="rg_list"><c:if test="${id==null }">
			<h1 class="tt_h1" id="He">添加门店</h1>
		</c:if> <c:if test="${id!=null }">
			<h1 class="tt_h1" id="He">添加编辑</h1>
		</c:if>
		<div class="tb_list">
			<ul class="tb_ul02">
				<form name="searchForm" id="searchForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="SHOP_EDIT"/>" enctype="multipart/form-data"><input id="id" name="id" type="hidden" value='${id }' /> <input id="currpage" name="currpage" type="hidden" value='${currpage }' />
					<li>
						<div class="border_right">
							<div class="tab_txt01"><span class="td_center border_right"> <label class="fc_red">*</label>门店名称
							</span> <span style="line-height: 35px;"> <input type="text" id="name" name="name" value="${shop.name }" style="width: 500px" />&nbsp;
							</span></div>
					</div>
				</li>
					<li>
						<div class="border_right">
							<div class="tab_txt01"><span class="td_center border_right"> <label class="fc_red">*</label>门店地址
							</span> <span style="line-height: 35px;"> <input type="text" id="address" name="address" value="${shop.address }" style="width: 500px" />&nbsp;
							</span></div>
					</div>
				</li>
					<li>
						<div class="border_right">
							<div class="tab_txt01"><span class="td_center border_right">门店电话</span> <span style="line-height: 35px;"> <input type="text" id="tel" name="tel" value="${shop.tel }" style="width: 500px" />&nbsp;
							</span></div>
					</div>
				</li>
					<li>
						<div class="border_right">
							<div class="tab_txt01" id="city_1"><span class="td_center border_right">省市</span> <span style="line-height: 0px;">
									<div class="tab_txt01"><span class="td_01" style="width: 40px;">省 :</span> <span class="" style="margin-top: 10px;"> <select id="Editprovinces" class="prov" name="province" style="width: 100px;" onchange="citys()">
												<option value="">--请选择市--</option>
												<c:forEach var="item" items="${lo}">
													<option value="<c:out value="${item.name}"></c:out>" <c:if test="${item.name eq shop.province}">selected="selected"</c:if>><c:out value="${item.name}"></c:out></option>
												</c:forEach>
										</select>
									</span> <span class="td_01" style="width: 40px;">市 :</span> <span class="" style="margin-top: 10px;"> <select id="Editcities" name="city" class="city" style="width: 100px;">
												<option value="">--请选择市--</option>
												<c:forEach var="item" items="${lo1}">
													<option value="<c:out value="${item.name}"></c:out>" <c:if test="${item.name eq shop.city}">selected="selected"</c:if>><c:out value="${item.name}"></c:out></option>
												</c:forEach>
										</select>
									</span></div> &nbsp;
							</span></div>
					</div>
				</li>
					<li>
						<div class="border_right">
							<div class="tab_txt01"><span class="td_center border_right">负责人</span> <span style="line-height: 35px;"> <input type="text" id="principal" name="principal" value="${shop.principal }" style="width: 500px" />&nbsp;
							</span></div>
					</div>
				</li>
					<li>
						<div class="border_right">
							<div class="tab_txt01"><span class="td_center border_right">联系方式</span> <span style="line-height: 35px;"> <input type="text" id="priTel" name="priTel" value="${shop.priTel }" style="width: 500px" />&nbsp;
							</span></div>
					</div>
				</li>
					<li><input type="hidden" id="type" value="${shop.type}">
						<div class="border_right">
							<div class="tab_txt01"><span class="td_center border_right">门店类型</span> <span style="line-height: 35px; margin-top: 6px;"> <select id="types" name="type" style="width: 100px;" onchange="self1()">
										<option value="">--请选择--</option>
										<option value="0">虚拟</option>
										<option value="1">自营</option>
										<option value="2">城市合伙人</option>
										<option value="3">寄售</option>
								</select>
							</span></div>
					</div></li> <input id="financeTypes" name="financeTypes" type="hidden" value="${shop.financeType }">
					<li style="display: none;" id="finance">
						<div class="border_right">
							<div class="tab_txt01"><span class="td_center border_right">合伙人类别</span> <span style="line-height: 35px; margin-top: 6px;"> <input id="financeType1" name="financeType" value="1" type="radio" onclick="newoldtime()">样车金融 <input id="financeType2" name="financeType" value="2"
									type="radio" onclick="newoldtime1()">采购金融
							</span></div>
					</div>
				</li> <input id="userrole" value="${userrole }" type="hidden"> <input id="shopnewtime" value="${shop.newtime }" type="hidden">
					<div id="newoldtime" style="display: none;">
						<li>
							<div class="border_right">
								<div class="tab_txt01"><span class="td_center border_right">免息开始时间</span> <span style="line-height: 35px; margin-top: 10px;"> <c:if test="${shop.newtime!=null&&shop.newtime!=''}">
											<fmt:formatDate pattern="yyyy-MM-dd" value="${shop.newtime }" />&nbsp;<lable style="color: red;margin-left:430px;">(第一次配车门店部使用)</lable>
										</c:if> <c:if test="${shop.newtime==null||shop.newtime==''}">
											<input type="text" id="newtime" name="snewtime" class="mesTime" readonly="readonly" onchange="newtime()" style="width: 500px" />&nbsp;<lable style="color: red;">(第一次配车门店部使用)</lable>
										</c:if>
								</span></div>
						</div>
					</li>
						<li>
							<div class="border_right">
								<div class="tab_txt01"><span class="td_center border_right mesTime">免息结束时间</span> <span style="line-height: 35px; margin-top: 10px;"> <c:if test="${shop.oldtime!=null&&shop.oldtime!='' }">
											<fmt:formatDate pattern="yyyy-MM-dd" value="${shop.oldtime }" />&nbsp;<lable style="color: red;margin-left:430px;">(算成老店的时间)</lable>
										</c:if> <c:if test="${shop.oldtime==null||shop.oldtime=='' }">
											<input type="text" id="soldtime" name="soldtime" style="width: 500px" readonly="readonly" />&nbsp;<lable style="color: red;">(算成老店的时间)</lable>
										</c:if>
								</span></div>
						</div>
					</li>
				</div>
					<li>
						<div class="border_right">
							<div class="tab_txt01"><span class="td_center border_right">样车金融额度</span> <span style="line-height: 35px;"> <input type="text" id="credit" name="credit" value="${shop.credit }" style="width: 500px" />万 <lable style="color: red;">(计算好的总额度)</lable>
							</span></div>
					</div>
				</li>
					<li>
						<div class="border_right">
							<div class="tab_txt01"><span class="td_center border_right">样车金融利率</span> <span style="line-height: 35px;"> <input type="text" id="creditinterestrate" name="creditinterestrate" value="${shop.creditinterestrate }" style="width: 500px" /> <lable style="color: red">%</lable> &nbsp;
							</span></div>
					</div>
				</li>
					<li>
						<div class="border_right">
							<div class="tab_txt01"><span class="td_center border_right">样车金融放大比例</span> <span style="line-height: 35px;"> <input type="text" id="simplecarf" name="simplecarf" value="${shop.simplecarf }" style="width: 500px" />
							</span></div>
					</div>
				</li>
					<li>
						<div class="border_right">
							<div class="tab_txt01"><span class="td_center border_right">押金</span> <span style="line-height: 35px;"> <input type="text" id="deposit" name="deposit" value="${shop.deposit }" style="width: 500px" />&nbsp;
							</span></div>
					</div>
				</li>
					<li>
						<div class="border_right">
							<div class="tab_txt01"><span class="td_center border_right">采购金融额度</span> <span style="line-height: 35px;"> <input type="text" id="financial" name="financial" value="${shop.financial }" style="width: 500px" />万
							</span></div>
					</div>
				</li>
					<li>
						<div class="border_right">
							<div class="tab_txt01"><span class="td_center border_right">采购金融利率</span> <span style="line-height: 35px;"> <input type="text" id="financialinterestrate" name="financialinterestrate" value="${shop.financialinterestrate }" style="width: 500px" /> <lable style="color: red">%</lable>
							</span></div>
					</div>
				</li>
					<li>
						<div class="border_right">
							<div class="tab_txt01"><span class="td_center border_right">签约日期</span> <span style="line-height: 35px;"> <input type="text" id="signtime" name="Ssigntime" class="mesTime2" readonly="readonly" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${shop.signtime }" />"
									style="width: 500px" />&nbsp;
							</span></div>
					</div>
				</li>
					<li>
						<div class="border_right">
							<div class="tab_txt01"><span class="td_center border_right">公司</span> <span style="line-height: 35px;"> <input type="text" id="company" name="company" value="${shop.company }" style="width: 500px" />&nbsp;
							</span></div>
					</div>
				</li> <c:if test="${id!=null }">
						<li>
							<div class="border_right">
								<div class="tab_txt01"><span class="td_center border_right">状态</span> <span style="line-height: 35px;"> <input type="radio" id="invalid" name="invalid" value="" <c:if test="${empty shop.invalid}">checked="checked"</c:if> />正常&nbsp; <input type="radio" id="invalid1"
										name="invalid" value="1" <c:if test="${shop.invalid eq '1'}">checked="checked"</c:if> />停业
								</span></div>
						</div>
						</li>
					</c:if></form>
		</ul>
	</div>
		<div class="btnlist">
			<div style="width: 200px; margin: auto;"><a href="javascript:void(0);" class="btn63_01" onclick="addshop()" id="saveBtn1">确定</a> <a id='cancelBtn1' href="javascript:void(0);" onclick="back()" class="btn63_02 margin_let10">取消</a></div>
	</div></div>
</div>
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/jedate.min.js"></script>
<script type="text/javascript">
	function citys(){
		var city=$('#cityUrl').val();
		$.ajax({
		//几个参数需要注意一下
		type:"POST",//方法类型
		dataType:"json",//预期服务器返回的数据类型
		url:city,//url
		data:{province:$('#Editprovinces').val()},success:function(data){
			console.log(data);
			$(".city").find("option").remove();
			$.each(data.lo1,function(){
				$('.city').append($("<option>" + this.name + "</option>"))
			});
		}});
	};
	function back(){
		location.href=$('#backUrl').val() + "?currpage=" + $('#currpage').val();
	}
	function addshop(){
		var name=$('#name').val();
		if(!$.trim(name)){
			alert("门店名称必填！");
			return false;
		}
		var address=$('#address').val();
		if(!$.trim(address)){
			alert("门店地址必填！");
			return false;
		}
		if($('#types').val() == 2){
			if($("input[name='financeType']:checked").val() == null){
				alert("合伙人类别必选!");
				return false;
			}
		}
		var addshopUrl=$('#addshopUrl').val();
		$.ajax({
		//几个参数需要注意一下
		type:"POST",//方法类型
		dataType:"json",//预期服务器返回的数据类型
		url:addshopUrl,//url
		data:$('#searchForm').serialize(),success:function(data){
			if(data.status){
				alert("保存成功");
				location.href=$('#backUrl').val() + "?currpage=" + $('#currpage').val();
			}else{
				alert(data.msg);
			}
		}});
	};
	$(function(){
		jeDate(".mesTime",{format:"YYYY-MM-DD",isTime:false,isClear:false,onClose:false,minDate:"2014-09-19 00:00:00",donefun:function(obj){
			var str=obj.val.replace(/-/g,'/');
			var date=new Date(str);
			date.setDate(date.getDate() + 90);
			var newTime=date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
			$("#soldtime").val(newTime);
		}});
		if($('#shopnewtime').val() != ""){
			document.getElementById("newoldtime").style.display="block";
		}
		$('#types').val($('#type').val());
		if($('#type').val() == 2){
			document.getElementById("finance").style.display="block";
			/* $('input:radio[name=financeType]').attr('checked', false); */
			if($('#financeTypes').val() == 1){
				$("#financeType1").prop('checked',true);
			}else{
				$('#financeType2').prop('checked',true);
			}
		}
		/* $("#city_1").citySelect({
			prov : $('#province').val(),
			city : $('#city').val()
		}); */
	});
	jeDate(".mesTime2",{format:"YYYY-MM-DD",isTime:false,isClear:false,onClose:false,minDate:"2014-09-19 00:00:00",});
	function newoldtime(){
		if($('#userrole').val() == 1){
			document.getElementById("newoldtime").style.display="block";
		}
	}
	function newoldtime1(){
		if($('#shopnewtime').val() == ""){
			document.getElementById("newoldtime").style.display="none";
			$('#soldtime').val("");
			$('#newtime').val("");
		}
	}
	function self1(){
		if($('#types').val() == 2){
			document.getElementById("finance").style.display="block";
			$('input:radio[name=financeType]').attr('checked',false);
		}else{
			document.getElementById("newoldtime").style.display="none";
			$('#soldtime').val("");
			$('#newtime').val("");
			$('input:radio[name=financeType]').attr('checked',false);
			document.getElementById("finance").style.display="none";
		}
	}
</script>