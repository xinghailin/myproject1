<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="submitUrl"	value="<ufa:url fieldName="WEB_BOTTOM_BANNER_SUBMIT" namespace="car-ms"/>">
<input type="hidden" id="nextUrl"	value="<ufa:url fieldName="WEB_BOTTOM_BANNER" namespace="car-ms"/>">

<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
			
				<form name="editForm" id="editForm" method="POST"
					enctype="multipart/form-data">
					<ul class="tb_ul02">
				    <input name="id_organize_chinese" id="id_organize_chinese" type="hidden" value='${bottom_BannerDto.id_organize_chinese}' />
				    <input name="id_organize_english" id="id_organize_english" type="hidden" value='${bottom_BannerDto.id_organize_english}' />
				    <input name="id_organize_spaish"  id="id_organize_spaish"  type="hidden" value='${bottom_BannerDto.id_organize_spaish}' />
				    <input name="id_layout" id="id_layout" type="hidden" value='${bottom_BannerDto.id_layout}' />
				    <input name="id_brand_chinese" id="id_brand_chinese" type="hidden" value='${bottom_BannerDto.id_brand_chinese}' />
				    <input name="id_brand_english" id="id_brand_english" type="hidden" value='${bottom_BannerDto.id_brand_english}' />
				    <input name="id_brand_spaish" id="id_brand_spaish" type="hidden" value='${bottom_BannerDto.id_brand_spaish}' />
				    <input name="id_global_dev" id="id_global_dev" type="hidden" value='${bottom_BannerDto.id_global_dev}' />
					<li style="width: 100%">
						<div style="float: left">
							<div class="tab_txt01">
								<span class="td_01" style="margin-left: 50px">
									<img src="${contextPath}${bottom_BannerDto.url_organize_chinese}" style="width: 200px; height: 200px;"
										id="productImg1">
								</span>
							</div>
							<div class="tab_txt01" id="divPD">
								<span class="td_02" style="margin-left: 20px">
									<label class="fc_red"></label>组织架构(中文)<br />
									<input type="file" name="pic_organize_chinese" id="pic_organize_chinese" style="margin-top: 6px"
										onchange="imagePreview(this.files,'productImg1')" />
									&nbsp;
								</span>
							</div>
						</div>
						<div style="float: left">
							<div class="tab_txt01">
								<span class="td_01" style="margin-left: 50px">
									<img src="${contextPath}${bottom_BannerDto.url_organize_english}" style="width: 200px; height: 200px;"
										id="productImg2">
								</span>
							</div>
							<div class="tab_txt01" id="divPD">
								<span class="td_02" style="margin-left: 20px">
									<label class="fc_red"></label>组织架构(英文)<br />
									<input type="file" name="pic_organize_english" id="pic_organize_english" style="margin-top: 6px"
										onchange="imagePreview(this.files,'productImg2')" />
									&nbsp;
								</span>
							</div>
						</div>
						<div style="float: left">
							<div class="tab_txt01">
								<span class="td_01" style="margin-left: 50px">
									<img src="${contextPath}${bottom_BannerDto.url_organize_spaish}" style="width: 200px; height: 200px;"
										id="productImg3">
								</span>
							</div>
							<div class="tab_txt01" id="divPD">
								<span class="td_02" style="margin-left: 20px">
									<label class="fc_red"></label>组织架构(西班牙语)<br />
									<input type="file" name="pic_organize_spaish" id="pic_organize_spaish" style="margin-top: 6px"
										onchange="imagePreview(this.files,'productImg3')" />
									&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li style="width: 100%">
						<div style="float: left">
							<div class="tab_txt01">
								<span class="td_01" style="margin-left: 50px">
									<img src="${contextPath}${bottom_BannerDto.url_layout}" style="width: 200px; height: 200px;"
										id="productImg4">
								</span>
							</div>
							<div class="tab_txt01" id="divPD">
								<span class="td_02" style="margin-left: 20px">
									<label class="fc_red"></label>中国布局<br />
									<input type="file" name="pic_layout" id="pic_layout" style="margin-top: 6px"
										onchange="imagePreview(this.files,'productImg4')" />
									&nbsp;
								</span>
							</div>
						</div>						
					</li>
					<li style="width: 100%">
						<div style="float: left">
							<div class="tab_txt01">
								<span class="td_01" style="margin-left: 50px">
									<img src="${contextPath}${bottom_BannerDto.url_brand_chinese}" style="width: 200px; height: 200px;"
										id="productImg5">
								</span>
							</div>
							<div class="tab_txt01" id="divPD">
								<span class="td_02" style="margin-left: 20px">
									<label class="fc_red"></label>品牌介绍(中文)<br />
									<input type="file" name="pic_brand_chinese" id="pic_brand_chinese" style="margin-top: 6px"
										onchange="imagePreview(this.files,'productImg5')" />
									&nbsp;
								</span>
							</div>
						</div>
						<div style="float: left">
							<div class="tab_txt01">
								<span class="td_01" style="margin-left: 50px">
									<img src="${contextPath}${bottom_BannerDto.url_brand_english}" style="width: 200px; height: 200px;"
										id="productImg6">
								</span>
							</div>
							<div class="tab_txt01" id="divPD">
								<span class="td_02" style="margin-left: 20px">
									<label class="fc_red"></label>品牌介绍(英文)<br />
									<input type="file" name="pic_brand_english" id="pic_brand_english" style="margin-top: 6px"
										onchange="imagePreview(this.files,'productImg6')" />
									&nbsp;
								</span>
							</div>
						</div>
						<div style="float: left">
							<div class="tab_txt01">
								<span class="td_01" style="margin-left: 50px">
									<img src="${contextPath}${bottom_BannerDto.url_brand_spaish}" style="width: 200px; height: 200px;"
										id="productImg7">
								</span>
							</div>
							<div class="tab_txt01" id="divPD">
								<span class="td_02" style="margin-left: 20px">
									<label class="fc_red"></label>品牌介绍(西班牙)<br />
									<input type="file" name="pic_brand_spaish" id="pic_brand_spaish" style="margin-top: 6px"
										onchange="imagePreview(this.files,'productImg7')" />
									&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li style="width: 100%">
						<div style="float: left">
							<div class="tab_txt01">
								<span class="td_01" style="margin-left: 50px">
									<img src="${contextPath}${bottom_BannerDto.url_global_dev}" style="width: 200px; height: 200px;"
										id="productImg8">
								</span>
							</div>
							<div class="tab_txt01" id="divPD">
								<span class="td_02" style="margin-left: 20px">
									<label class="fc_red"></label>全球布局<br />
									<input type="file" name="pic_global_dev" id="pic_global_dev" style="margin-top: 6px"
										onchange="imagePreview(this.files,'productImg8')" />
									&nbsp;
								</span>
							</div>
						</div>						
					</li>
				
				</ul>
		</form>	
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
	seajs.use("${scriptBasePath}/web/bottom_banner.js?r=<%=new Date()%>");
</script>
