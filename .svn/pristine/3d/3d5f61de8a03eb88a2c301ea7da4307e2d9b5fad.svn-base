<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="IN_SMS" namespace="car-ms"/>">
<div class="main_right" id="viewList"
	style="margin-left: 300px; width: 1550px; height: 190%;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>"
				method="post" target="hideiframe">
				<ul class="tb_ul02">
					<li><input id="currpage" value="${currpage }" type="hidden" />

						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">手机号：</span> <span class="td_02"
									style="margin-top: 4px;"><input class="input_text01"
									name="mobile" id="mobile" class="input_text01" type="text"
									style="width: 180px;"></span>
							</div>
						</div>

						<div class="tbul02_right02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">发送日期：</span> <span class="td_02"
									style="margin-top: 4px;"><input class="input_text01"
									name="paydate" id="payDateTime" class="input_text01"
									type="text" style="width: 180px;"></span>
							</div>
						</div>

						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">短信类型：</span> <span class="td_02"
									style="margin-top: 4px;"> <select id="contenttype"
									name="contenttype" style="">
										<option value="">--请选择--</option>
										<option value="1">催款</option>
										<option value="2">保险</option>
								</select>
								</span>
							</div>
						</div>

						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01">
								<span class="td_01">用户接收状态：</span> <span class="td_02"
									style="margin-top: 4px;"> <select id="sendstatus"
									name="sendstatus" style="">
										<option value="">--请选择--</option>
										<option value="1">成功</option>
										<option value="2">失败</option>
								</select>
								</span>
							</div>
						</div></li>

				</ul>
				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="width: 400px; margin: auto;">
						<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
						<a href="javascript:void(0);" id="btnReset"
							class="btn63_02 margin_let10">重置</a>

					</div>
				</div>
			</form>
		</div>
		<div class="clear"></div>
		<div class="hide" id="J_DataList"></div>
		<div class="nodata hide" id="J_NoDataMsg">
			<p>暂无数据。</p>
		</div>
	</div>
</div>
<iframe name="hideiframe" style="display: none;"></iframe>	
<div id="imgLayer" class="ele_img_item clearfix" style="position:absolute;z-index:1;width: 260px; solid;display:none;" ></div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			
            <th style="text-align:center">手机号</th>
            <th style="text-align:center">内容</th>
            <th style="text-align:center">类型</th>
            <th style="text-align:center">扣款日期</th>
            <th style="text-align:center">实际发送时间</th>
            <th style="text-align:center">提交运营商状态</th>
            <th style="text-align:center">用户接收状态</th>
            <th style="text-align:center">失败状态码</th>
           
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{mobile}}</td>
            <td>{{content}}</td>
            <td>{{_formatSmsType contenttype}}</td>
            <td>{{_formatSimpleDate paydate}}</td>
            <td>{{_formatSimpleDatetime createtime}}</td>
            <td>{{_formatsubmitStatus submitstatus}}</td>
            <td>{{_formatsendStatus sendstatus}}</td>
            <td>{{_formatstatus status}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/sms/messageview.js?r=<%=new Date()%>");
</script>