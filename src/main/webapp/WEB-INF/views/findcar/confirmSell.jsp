<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input id="currpage" type="hidden" value='${currpage}'/>
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="QUERY_ALL_INITATOR" namespace="car-ms"/>">
<input type="hidden" id="editUrl" value="<ufa:url fieldName="CONFIRM_SELL_STATE" namespace="car-ms"/>">
<div class="main_right" id="viewList" style="margin-left:300px;width: 1550px;height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
		  <form name="searchForm" id="searchForm" action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>" method="post" target="hideiframe">	    
					<ul class="tb_ul02"> 
				 <li> 
					<div class="tbul02_left02" style="width:25%">
						<div style="text-align: center;">
							<span class="td_01">微信名称：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="name" id="name"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					
					<div class="tbul02_left02" style="width:25%">
						<div style="text-align: center;">
							<span class="td_01">优惠码：</span> <span
								class="td_02" style="margin-top: 4px;"><input name="flow" id="flow"
								class="input_text01" type="text" style="width:180px;"></span>
						</div>
					</div>
					</li>
			 </ul>
			<div class="btnlist" style="margin-bottom: 20px;">
				<div style="text-align: center;">
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
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
			<th style="text-align:center">发起人</th>
            <th style="text-align:center">发起人头像</th>
            <th style="text-align:center">电话</th>
            <th style="text-align:center">性别</th>
            <th style="text-align:center">国家</th>
            <th style="text-align:center">省份</th>
            <th style="text-align:center">城市</th>
            <th style="text-align:center">优惠码</th>
            <th style="text-align:center">发起时间</th>
            <th style="text-align:center">砍价总钱数</th>
            <th style="text-align:center">砍价人数</th>
            <th style="text-align:center">状态</th>
            <th style="text-align:center">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#result}}
        <tr>
             <td>{{name}}</td>
<td><img src="{{weixinPic}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
             <td>{{phone}}</td>
           	 <td>{{sex}}</td>
             <td>{{country}}</td>
 			 <td>{{province}}</td>
             <td>{{city}}</td>
             <td>{{flow}}</td>
           	 <td>{{_formatDatetime createTime}}</td>
			 <td>{{money}}</td>
             <td>{{num}}</td>
             <td>{{_formatStatus state}}</td>
             <td>{{_operate id state}}</td>
        </tr>
        {{/result}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    seajs.use("${scriptBasePath}/findcar/confirmSell.js");
</script>