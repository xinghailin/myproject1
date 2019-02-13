<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="submitUrl" value="<ufa:url fieldName="WEB_TOP_BANNER_SUBMIT" namespace="car-ms"/>"> 
<input type="hidden" id="nextUrl" value="<ufa:url fieldName="WEB_TOP_BANNER" namespace="car-ms"/>"> 
<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
			<ul class="tb_ul02">
				<form name="editForm" id="editForm" method="POST"
					action="<ufa:url namespace="car-ms" fieldName="WEB_TOP_BANNER_SUBMIT"/>"
					enctype="multipart/form-data">
					
					<input name="id_introduce" id="id_introduce" type="hidden" value='${webBannerDto.id_introduce}' />
					<input name="id_organize"  id="id_organize" type="hidden" value='${webBannerDto.id_organize}' />
					<input name="id_layout"  id="id_layout" type="hidden" value='${webBannerDto.id_layout}' />
					<input name="id_brand" id="id_brand" type="hidden" value='${webBannerDto.id_brand}' />
					<input name="id_global_dev"  id="id_global_dev" type="hidden" value='${webBannerDto.id_global_dev}' />
					<input name="id_global_model"  id="id_global_model" type="hidden" value='${webBannerDto.id_global_model}' />
					<li style="width: 20%; float: left">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${webBannerDto.url_introduce}" style="width: 200px; height: 200px;" id="productImg1">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<span class="td_02" style="margin-left: 20px">
								<label class="fc_red"></label>公司介绍<br />
								<input type="file" name="pic_introduce" id="pic_introduce" style="margin-top: 6px"
									onchange="imagePreview(this.files,'productImg1')" />
								&nbsp;
							</span>
						</div>
					</li>
					<li style="width: 20%; float: left">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${webBannerDto.url_organize}" style="width: 200px; height: 200px;" id="productImg2">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<span class="td_02" style="margin-left: 20px">
								<label class="fc_red"></label>组织架构<br />
								<input type="file" name="pic_organize" id="pic_organize" style="margin-top: 6px"
									onchange="imagePreview(this.files,'productImg2')" />
								&nbsp;
							</span>
						</div>
					</li>
					<li style="width: 20%; float: left">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${webBannerDto.url_layout}" style="width: 200px; height: 200px;" id="productImg3">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<span class="td_02" style="margin-left: 20px">
								<label class="fc_red"></label>中国布局<br />
								<input type="file" name="pic_layout" id="pic_layout" style="margin-top: 6px"
									onchange="imagePreview(this.files,'productImg3')" />
								&nbsp;
							</span>
						</div>
					</li>
					<li style="width: 20%; float: left">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${webBannerDto.url_brand}" style="width: 200px; height: 200px;" id="productImg4">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<span class="td_02" style="margin-left: 20px">
								<label class="fc_red"></label>品牌介绍<br />
								<input type="file" name="pic_brand" id="pic_brand" style="margin-top: 6px"
									onchange="imagePreview(this.files,'productImg4')" />
								&nbsp;
							</span>
						</div>
					</li>
					<li style="width: 20%; float: left">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${webBannerDto.url_global_dev}" style="width: 200px; height: 200px;" id="productImg5">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<span class="td_02" style="margin-left: 20px">
								<label class="fc_red"></label>全球开拓<br />
								<input type="file" name="pic_global_dev" id="pic_global_dev" style="margin-top: 6px"
									onchange="imagePreview(this.files,'productImg5')" />
								&nbsp;
							</span>
						</div>
					</li>
					<li style="width: 20%; float: left">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${webBannerDto.url_global_model}" style="width: 200px; height: 200px;" id="productImg6">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<span class="td_02" style="margin-left: 20px">
								<label class="fc_red"></label>全球车型介绍<br />
								<input type="file" name="pic_global_model" id="pic_global_model" style="margin-top: 6px"
									onchange="imagePreview(this.files,'productImg6')" />
								&nbsp;
							</span>
						</div>
					</li>

				</form>
			</ul>
		</div>
		<div class="btnlist">
			<div style="width: 200px; margin: auto; margin-top: 80px;">
				<a href="javascript:void(0);" class="btn63_01" id="saveBtn">保存</a>
				<a id='resetBtn' href="javascript:void(0);" class="btn63_02 margin_let10">重置</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	seajs.use("${scriptBasePath}/web/top_banner.js?r=<%=new Date()%>");
</script>
