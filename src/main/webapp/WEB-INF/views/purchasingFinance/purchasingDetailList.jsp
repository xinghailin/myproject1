<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="FINDLISTMETHOD_PURCHASINGFINANCE_METHOD" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 190%;">
	<div class="rg_list">
		<div class="tb_list">
			<form name="searchForm" id="searchForm"
				action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>" method="post"
				target="hideiframe">
				<ul class="tb_ul02">

					<li>
						<input id="currpage" value="${currpage }" type="hidden" />
						<div class="tab_txt01">

							<span class="td_01" style="width: 120px;">组名称：</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" name="name" id="name" width="280px" />
								&nbsp;
							</span>
							<span class="td_01" style="width: 120px;">组ID：</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" name="id" id="id" width="280px" />
								&nbsp;
							</span>	
							<span class="td_01" style="width: 120px;">采购金融总额：</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" name="totalmoney" id="totalmoney" width="280px" />
								&nbsp;
							</span>													
							<span class="td_01" style="width: 120px;">负责人：</span>
							<span style="line-height: 35px; width: 200px;">
								<input type="text" name="principal" id="principal" width="280px" />
								&nbsp;
							</span>
						</div>
					</li>

				</ul>

				<div class="btnlist" style="margin-bottom: 20px;">
					<div style="width: 400px; margin: auto;">
						<a href="javascript:void(0);" id="btnSearch" class="btn63_01">查询</a>
						<a href="javascript:void(0);" id="btnReset" class="btn63_02 margin_let10">重置</a>
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
            <th style="text-align:center">组ID</th>
            <th style="text-align:center">组名称</th>
            <th style="text-align:center">采购金融总额(单位:万)</th>
            <th style="text-align:center">放大比例</th>
            <th style="text-align:center">负责人</th>
            <th style="text-align:center">已用额度(单位:元)</th>
            <th style="text-align:center">剩余额度(单位:元)</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr> 
            <td>{{id}}</td>
            <td>{{name}}</td>
            <td>{{totalmoney}}</td>
            <td>{{bigScale}}</td>
            <td>{{principal}}</td>
            <td>{{realmoney}}</td>
			<td>{{beleftmoney}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/purchasingFinance/purchasingDetailList.js?r=<%=new Date()%>");
</script>