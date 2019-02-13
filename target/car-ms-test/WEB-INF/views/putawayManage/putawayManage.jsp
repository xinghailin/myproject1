<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="PUTAWAY_MANAGE_INDEX" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="UPDTE_PUTAWAY" namespace="car-ms"/>">
<input type="hidden" id="deleteUrl" value="<ufa:url fieldName="UPDTE_PUTAWAY_SOLD_OUT" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm" action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>" method="post" target="hideiframe">	    
			<ul class="tb_ul02">
				<li>
					<div class="tbul02_left02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">车辆品牌：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="brand" id="brand"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_right02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">车辆型号：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="model" id="model"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
				<div class="tbul02_right02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">车辆版别：</span> <span class="td_02"
								style="margin-top: 4px;"><input class="input_text01" name="version" id="version"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					<div class="tbul02_left02" style="width:25%">
						<div class="tab_txt01">
							<span class="td_01">是否上架：</span> <span class="td_02" style="margin-top: 10px;">
		  	     <select id="putaway" name="putaway" style="width:100px;">
		  	  	  <option value="">--请选择--</option>
			             <option value="2">未上架</option>
			             <option value="1">已上架</option>
		          </select>
		  	 </span>
						</div>
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
			
            <th style="text-align:center">车辆品牌</th>
            <th style="text-align:center">车辆型号</th>
            <th style="text-align:center">车辆版别</th>
            <th style="text-align:center">0首期产品本金</th>
            <th style="text-align:center">车辆价格</th>  
            <th style="text-align:center">每月月供</th>
            <th style="text-align:center">利率</th>
            <th style="text-align:center">期数</th>
			<th style="text-align:center">推荐图片</th>
            <th style="text-align:center">状态</th>
            <th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
            <td>{{brand}}</td>
            <td>{{model}}</td>
            <td>{{version}}</td>
            <td>{{downPay}}</td>
            <td>{{firstMonthPay}}</td>
            <td>{{everyMonthPay}}</td>
            <td>{{rate}}%</td>
            <td>{{periodNum}}</td>
<td><img src="{{formatPic coverPic}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
           <td>{{_formatStatus putaway}}</td>             
            <td>{{_operate id putaway}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/putawayCarType/putawayCarType.js");
</script>