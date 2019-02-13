<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>

<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/common/common.css" rel="stylesheet">
<link rel='stylesheet' type="text/css" href='${cssBasePath}/common/common.css' />
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery-default.css" />
<link rel="stylesheet" type="text/css" href="${cssBasePath}/common/index.css" />
<input type="hidden" id="saveUrl"
	value="<ufa:url fieldName="saveArea" namespace="car-ms"/>">
	<input type="hidden" id="MallAreaBrandListPage"
	value="<ufa:url fieldName="MallAreaBrandListPage" namespace="car-ms"/>">

<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<div class="mian_right-new" id="EA">
	<div class="rg_list">
		<c:choose>
			<c:when test="${area.id !=null}">
				<h1 class="tt_h1" id="He">区域修改</h1>
			</c:when>
			<c:otherwise>
				<h1 class="tt_h1" id="He">区域添加</h1>
			</c:otherwise>
		</c:choose>
		<form name="editForm" id="editForm" method="POST"
			action="<ufa:url namespace="car-ms" fieldName="UPDATE_CAR_MODEL"/>" enctype="multipart/form-data">
			<div class="tb_list" id="car">
				<ul class="tb_ul02" id="ff">
					<input id="currpage" type="hidden" name="currpage" value="${currpage }" />
					<input type="hidden" id="id" name="id" value="${area.id}" />
					<li>
						<div class="border_right" id="cc">
							<div class="tab_txt01">
								<span class="td_center border_right">区域名称</span>
								<span style="line-height: 15px;">
									<input type="text" id="name" name="name" value="${area.name }"
										style="width: 500px; height: 28px;margin-top: 3px;" />&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="border_right" id="cc">
							<div class="tab_txt01">
								<span class="td_center border_right">区域英文名称</span>
								<span style="line-height: 15px;">
									<input type="text" id="ename" name="ename" value="${area.ename }"
										style="width: 500px; height: 28px;margin-top: 3px;" />&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="border_right" id="cc">
							<div class="tab_txt01">
								<span class="td_center border_right">区域编号</span>
								<span style="line-height: 15px;">
									<input type="text" id="country" name="country" value="${area.country }"
										style="width: 500px; height: 28px;margin-top: 3px;" placeholder="填写整数" />&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="border_right" id="cc">
							<div class="tab_txt01">
								<span class="td_center border_right">货币符号</span>
								<span style="line-height: 15px;">
									<select class="brand" name="currencyunit" id="currencyunit" style="width: 500px; height: 28px;margin-top: 3px;">
										<option value="">请选择</option>
										<c:forEach var="item" items="${Currency}">
											<option value="<c:out value="${item}"></c:out>"
												<c:if test="${item eq area.currencyunit}">selected="selected"</c:if>><c:out
													value="${item}"></c:out></option>
										</c:forEach>
									</select>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="border_right" id="cc">
							<div class="tab_txt01">
								<span class="td_center border_right">汇率</span>
								<span style="line-height: 15px;">
									<input type="text" id="exchangerate" name=exchangerate value="${area.exchangerate }"
										style="width: 500px; height: 28px;margin-top: 3px;"  placeholder="数字最多保留四位小数" />&nbsp;
								</span>
							</div>
						</div>
					</li>
						<li>
						<div class="border_right" id="cc">
							<div class="tab_txt01">
								<span class="td_center border_right">区域状态</span>
								<span style="line-height: 15px;"><input hidden id="statuss" value="${area.status }">
									<select class="brand" name="status" id="status" style="width: 500px; height: 28px;margin-top: 3px;">
											<option value="1">可用</option>
											<option value="2">不可用</option>
									</select>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="border_right">
							<div class="tab_txt01">
								<span class="td_center border_right" style="line-height: 152px">地区图片(格式:jpg,png,gif,jpeg)</span>
								<span>
									<img src="${ftpFileUrl}${area.picurl}"  width="150px" height="150px"
										style="border: 1px solid #ccc;" id="productImg" alt="W3School" />
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="border_right">
							<div class="tab_txt01">
								<span class="td_center border_right">地区图片上传</span>
								<span style="line-height: 15px;">
									<input type="file" name="picurls" id="picurls" style="margin-top: 6px"
										onchange="imagePreview(this.files,'productImg')" />
								</span>
								<input hidden id="picurlss"  value="${area.picurl}" > 
								&nbsp;
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="btnlist" style="text-align: center;">
				<a id="saveBtn" href="javascript:void(0);" onclick="mysubmit()" class="btn63_01 margin_let10">保存</a>
				<a href="javascript:void(0);" onclick="back()" class="btn63_02 margin_let10">取消</a>
			</div>
		</form>
	</div>
</div>
</div>

<script type="text/javascript">
	$(function(){
		if($('#id').val()!=""){
			$('#status').val($('#statuss').val());
		}
	})
	function mysubmit() {
		var num=/^(([1-9]\d)|[1-9])$/;
		var nums=/((^[1-9](\d+)?(\.\d{1,4})?$)|(^(0){1}$)|(^\d\.\d{1,4}?$))/;
		if($('#name').val()==""){
			alert("请填写区域名称！")
			return false;
		}
		if($('#ename').val()==""){
			alert("请填写区域英文名称！");
			return false;
		}
		if($('#country').val()==""){
			alert("请填写区域编号！");
			return false;
		}
		if($('#currencyunit').val()==""){
			alert("请选择区域符号！");
			return false;
		}if($('#exchangerate').val()==""){
			alert("请填写汇率！");
			return false;
		}
		
		if($('#id').val()==""&&$('#picurls').val()==""){
			alert("请选择上传地区图片！");
			return false;
		}
	 if(!num.test($("input[name='country']").val())){
			alert('区域编号格式不正确！');
			return false;
	 }
	 if(!nums.test($("input[name='exchangerate']").val())){
			alert('汇率格式不正确！');
			return false;
	 }
		 var url=$('#saveUrl').val();
		$.ajax({
		    url: url,
		    type: 'POST',
		    cache: false,
		    data:new FormData($('#editForm')[0]),
		    processData: false,
		    contentType: false
		}).done(function(data) {
			if(data.status){
				alert('保存成功!');
					location.href = $("#MallAreaBrandListPage").val()+"?currpage="+$('#currpage').val();
			}else{
				alert(data.msg);
			}
		})  
	};
	function imagePreview(obj, imgObj) {
		var f = obj[0];
		var src = window.URL.createObjectURL(f);
		$('#' + imgObj).attr('src', src);
	}
	function back() {
		location.href = $("#MallAreaBrandListPage").val() + "?currpage="
				+ $('#currpage').val();
	}
</script>