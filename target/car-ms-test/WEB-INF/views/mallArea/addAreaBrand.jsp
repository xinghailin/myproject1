<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/common/common.css" rel="stylesheet">
<link rel='stylesheet' type="text/css" href='${cssBasePath}/common/common.css' />
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery-default.css" />
<link rel="stylesheet" type="text/css" href="${cssBasePath}/common/index.css" />
<input type="hidden" id="saveUrl" value="<ufa:url fieldName="saveAreaBrand" namespace="car-ms"/>">
<input type="hidden" id="brandUrl" value="<ufa:url fieldName="QUERY_ABRAND" namespace="car-ms"/>">
<input type="hidden" id="MallAreaBrandListPage"
	value="<ufa:url fieldName="MallAreaBrandListPage" namespace="car-ms"/>">
	<input type="hidden" id="areaBrandListPage"
	value="<ufa:url fieldName="areaBrandListPage" namespace="car-ms"/>">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<div class="mian_right-new" id="EA">
	<div class="rg_list"><input hidden id="brandinitials" value="${abrand.brandinitial }">
	<input hidden id="brands" value="${abrand.brand }">
	<c:choose>
			<c:when test="${brand.id !=null}">
				<h1 class="tt_h1" id="He">区域品牌修改</h1>
			</c:when>
			<c:otherwise>
				<h1 class="tt_h1" id="He">区域品牌添加</h1>
			</c:otherwise>
		</c:choose>
		<form name="editForm" id="editForm" method="POST"
			action="<ufa:url namespace="car-ms" fieldName="UPDATE_CAR_MODEL"/>" enctype="multipart/form-data">
			<div class="tb_list" id="car">
				<ul class="tb_ul02" id="ff">
					<input id="currpage" hidden name="currpage" value="${currpage }" />
					<input  id="areaid" hidden name="areaid" value="${site.id}" />
					<input  id="id" hidden name="id" value="${brand.id}" />
					<li>
						<div class="border_right" id="cc">
							<div class="tab_txt01">
								<span class="td_center border_right">区域名称</span>
								<span style="margin-top: 15px;"> ${site.name } </span>
							</div>
						</div>
					</li>
					
					<li>
						<div class="tab_txt01">
							<span class="td_center border_right">品牌首字母</span>
							<span style="line-height: 15px;">
								<select class="brand" name="" id="brandinitial" onclick="selectBrand()" style="width: 500px; height: 28px; margin-top: 3px;">
									<option value="">请选择</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
									<option value="F">F</option>
									<option value="G">G</option>
									<option value="H">H</option>
									<option value="I">I</option>
									<option value="J">J</option>
									<option value="K">K</option>
									<option value="L">L</option>
									<option value="M">M</option>
									<option value="N">N</option>
									<option value="O">O</option>
									<option value="P">P</option>
									<option value="Q">Q</option>
									<option value="R">R</option>
									<option value="S">S</option>
									<option value="T">T</option>
									<option value="U">U</option>
									<option value="V">V</option>
									<option value="W">W</option>
									<option value="X">X</option>
									<option value="Y">Y</option>
									<option value="Z">Z</option>
								</select>
							</span>
						</div>
					</li>
					
					<li>
						<div class="tab_txt01">
							<span class="td_center border_right">地区品牌</span>
							
							<span style="line-height: 15px;">
								<select class="brand" name="brand" id="brand"
									style="width: 500px; height: 28px; margin-top: 3px;">
								</select>
							</span>
						</div>
					</li>
					<li>
						<div class="border_right" id="cc">
							<div class="tab_txt01"><input hidden id="statuss" value="${brand.status }">
								<span class="td_center border_right">品牌状态</span>
								<span style="line-height: 15px;"><input hidden id="statuss" value="${brand.status }">
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
								<span class="td_center border_right" style="line-height: 152px">品牌LOGO(格式:jpg,png,jpeg)</span>
								<span>
									<img src="${ftpFileUrl}${brand.logourl}" width="150px" height="150px" style="border: 1px solid #ccc;"
										id="productImg" alt="W3School" />
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="border_right">
							<div class="tab_txt01">
								<span class="td_center border_right">品牌图片上传</span>
								<span style="line-height: 15px;">
								<input hidden value="${brand.logourl}" id="logourlss">
									<input type="file" name="logourls" id="logourls" style="margin-top: 6px"
										onchange="imagePreview(this.files,'productImg')" />
								</span>
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
	$(function() {
		if($('#id').val()!=""){
			$('#status').val($('#statuss').val());
			$('#brandinitial').val($('#brandinitials').val())
			selectBrand();
		}
		
	})
	var c=1;
	function selectBrand(){
		$('#brand option').remove();
		var brandinitial = $("#brandinitial").val();
		var brandUrl = $('#brandUrl').val();
		$.ajax(brandUrl, {
			type : "post",
			data : {
				brandinitial : brandinitial
			},
			datatype : "json",
			success : function(data) {
				var brand = data.abrand;
				var ddl = $("#brand");
				/* ddl.append("<option value=''>请选择</option>"); */
				$.each(brand, function(idx, val) {
					ddl.append($("<option value='" + val.brand + "'>"
							+ val.brand + "</option>"))
				})
				if(c==1){
				$('#brand').val($('#brands').val());
				c++;
				}
			}
		})
	}
	function mysubmit() {
		if($('#brandinitial').val()==''){
			alert("请选择品牌首字母")
			return false;
		}
		if ($('#id').val() =="" && $('#logourls').val()=="") {
			alert("请选择上传品牌logo图片！");
			return false;
		}
		var url = $('#saveUrl').val();
		$.ajax({
			url : url,
			type : 'POST',
			cache : false,
			data : new FormData($('#editForm')[0]),
			processData : false,
			contentType : false
		}).done(
				function(data) {
					if (data.status) {
						alert('保存成功!');
						if($('#id').val()){
							
							location.href = $("#areaBrandListPage").val()
							+ "?currpage=" + $('#currpage').val();
						}else{
							location.href = $("#MallAreaBrandListPage").val()
							+ "?currpage=" + $('#currpage').val();
						}
						
					} else {
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
		if($('#id').val()){
			location.href = $("#areaBrandListPage").val()
			+ "?currpage=" + $('#currpage').val();
		}else{
			location.href = $("#MallAreaBrandListPage").val()
			+ "?currpage=" + $('#currpage').val();
		}
	}
</script>