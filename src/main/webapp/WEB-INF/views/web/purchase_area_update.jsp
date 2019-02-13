<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="updateUrl" value="<ufa:url fieldName="WEB_PURCHASE_AREA_SUBMIT" namespace="car-ms"/>">
<input type="hidden" id="nextUrl" value="<ufa:url fieldName="WEB_PURCHASE_AREA_LISTPAGE" namespace="car-ms"/>"> 

<div class="mian_right-new" style="height: 100%;">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
			<ul class="tb_ul02">
				<form name="editForm" id="editForm" method="POST"
					action="<ufa:url namespace="car-ms" fieldName="WEB_PURCHASE_AREA_SUBMIT"/>">
					<input name="groupId"  id="groupId" type="hidden" value='${purchaseareaDto.groupId}' />
					
					<input name="id_content_chinese"  id="id_content_chinese" type="hidden" value='${purchaseareaDto.id_content_chinese}' />
					<input name="id_content_english"  id="id_content_english" type="hidden" value='${purchaseareaDto.id_content_english}' />
					<input name="id_content_spaish"  id="id_content_spaish" type="hidden" value='${purchaseareaDto.id_content_spaish}' />
					
					<input name="id_title_chinese"  id="id_title_chinese" type="hidden" value='${purchaseareaDto.id_title_chinese}' />
					<input name="id_title_english"  id="id_title_english" type="hidden" value='${purchaseareaDto.id_title_english}' />
					<input name="id_title_spaish"  id="id_title_spaish" type="hidden" value='${purchaseareaDto.id_title_spaish}' />
					
					<input name="id_title_2_chinese"  id="id_title_2_chinese" type="hidden" value='${purchaseareaDto.id_title_2_chinese}' />
					<input name="id_title_2_english"  id="id_title_2_english" type="hidden" value='${purchaseareaDto.id_title_2_english}' />
					<input name="id_title_2_spaish"  id="id_title_2_spaish" type="hidden" value='${purchaseareaDto.id_title_2_spaish}' />
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;">
								<label class="fc_red">*</label>车源区域(中文)：
							</span>
							<span class="td_02" style="margin-top: 4px;">
								<input name="content_chinese" id="content_chinese" class="input_text01" type="text" style="width: 280px;"
									value="${purchaseareaDto.content_chinese}">
							</span>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;">
								<label class="fc_red">*</label>车源区域(英文)：
							</span>
							<span class="td_02" style="margin-top: 4px;">
								<input name="content_english" id="content_english" class="input_text01" type="text" style="width: 280px;"
									value="${purchaseareaDto.content_english}">
							</span>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;">
								<label class="fc_red">*</label>车源区域(西班牙)：
							</span>
							<span class="td_02" style="margin-top: 4px;">
								<input name="content_spaish" id="content_spaish" class="input_text01" type="text" style="width: 280px;"
									value="${purchaseareaDto.content_spaish}">
							</span>
						</div>
					</li>



					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;">
								<label class="fc_red">*</label>标题一(中文)：
							</span>
							<span class="td_02" style="margin-top: 4px;">
								<input name="title_chinese" id="title_chinese" class="input_text01" type="text" style="width: 180px;"
									value="${purchaseareaDto.title_chinese}">
							</span>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;">
								<label class="fc_red">*</label>标题一(英文)：
							</span>
							<span class="td_02" style="margin-top: 4px;">
								<input name="title_english" id="title_english" class="input_text01" type="text" style="width: 180px;"
									value="${purchaseareaDto.title_english}">
							</span>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;">
								<label class="fc_red">*</label>标题一(西班牙)：
							</span>
							<span class="td_02" style="margin-top: 4px;">
								<input name="title_spaish" id="title_spaish" class="input_text01" type="text" style="width: 180px;"
									value="${purchaseareaDto.title_spaish}">
							</span>
						</div>
					</li>


					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;">
								标题二(中文)：
							</span>
							<span class="td_02" style="margin-top: 4px;">
								<input name="title_2_chinese" id="title_2_chinese" class="input_text01" type="text" style="width: 180px;"
									value="${purchaseareaDto.title_2_chinese}">
							</span>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;">
								标题二(英文)：
							</span>
							<span class="td_02" style="margin-top: 4px;">
								<input name="title_2_english" id="title_2_english" class="input_text01" type="text" style="width: 180px;"
									value="${purchaseareaDto.title_2_english}">
							</span>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 200px;">
								标题二(西班牙)：
							</span>
							<span class="td_02" style="margin-top: 4px;">
								<input name="title_2_spaish" id="title_2_spaish" class="input_text01" type="text" style="width: 180px;"
									value="${purchaseareaDto.title_2_spaish}">
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
				<a id='backBtn' href="javascript:void(0);" class="btn63_01 margin_let10">返回</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	seajs.use("${scriptBasePath}/web/purchase_area_update.js?r=<%=new Date()%>");
</script>
