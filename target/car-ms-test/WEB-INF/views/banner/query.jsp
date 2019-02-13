<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input id="searchUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="BANNER_QUERY"/>'/>
<input id="deleteUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="BANNER_DELETE"/>'/>
<div class="main_right" id="MainView" style="height: 100%;">
	<div class="rg_list">
		<div class="tb_list">
		<form name="searchForm" id="searchForm">
			<ul class="tb_ul02">
  			  <li>
			  <div class="btnlist02">
			       <a href="javascript:void(0)" id='addBtn' class="btn63_01 margin_let10">新增</a>
 			  </div>
			  </li>
			</ul>
			</form>
		</div>
		<div class="clear"></div>
		  <div  class="hide" id="J_DataList"></div>
		  <div class="nodata hide" id="J_NoDataMsg">
		      <p>暂无数据。</p>
		  </div>
	</div>
</div>
<div class="mian_right-new hide" id="EA">
	<div class="rg_list">
		<h1 class="tt_h1" id="He"></h1>
		<div class="tb_list">
		<ul class="tb_ul02">
		<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="BANNER_EDIT"/>" enctype="multipart/form-data">
		<input id="hideId" name="id" type="hidden" value=''/>
		<li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">链接</span><span style="line-height: 35px;">
		  	<input type="text" id="Turi" name="uri" value="uri" style="width: 500px;"/>&nbsp;
		  	</span></div>
		    </div>
		</li>
	  <li>
	  	<div class="border_right">
	  	<div class="tab_txt01"><span class="td_center border_right" style="line-height:152px">图片</span><span>
	  	<img src="" width="150px" height="150px" style="border: 1px solid #ccc;" id="productImg"/></span></div>
	    </div>
	  </li>
	  <li>
	  	<div class="border_right">
	  	<div class="tab_txt01"><span class="td_center border_right">图片上传</span><span style="line-height: 35px;">
	  	<input type="file" name="pic" id="Tpic" style="margin-top: 6px" onchange="imagePreview('Tpic','productImg')"/></span>&nbsp;</div>
	    </div>
	  </li>
	  <li>
	  	<div class="border_right">
	  	<div class="tab_txt01"><span class="td_center border_right">排序</span><span style="line-height: 35px;">
	  	<input type="text" id="Tsort" name="sort" value="" style="width: 500px"/>&nbsp;
	  	</span></div>
	    </div>
	  </li>
	  </form>
		</ul>
		</div>
		<div class="btnlist">
		<div style="width: 200px; margin: auto;"><a href="javascript:void(0);" class="btn63_01" id="saveBtn">确定</a>
		<a id='cancelBtn' href="javascript:void(0);" class="btn63_02 margin_let10">取消</a>
		</div>
		</div>
	</div>		
</div>
<div id="imgLayer" class="ele_img_item clearfix" style="position:absolute;z-index:1;width: 260px; solid;display:none;" ></div>
<script id="dataListTemplate"  type="text/x-handlebars-template">
<div class="table_list" >
    <table cellpadding="0" cellspacing="0" class="tb_mian">
        <thead>
        <tr>
<th style="text-align:center;width:40%;">链接</th>
			<th style="text-align:center;width:15%;">推荐图片</th>  
<th style="text-align:center;width:10%;">排序</th>
<th style="text-align:center;width:15%;">创建时间</th>
			<th style="text-align:center;width:20%;">操作</th>
        </tr>
        </thead>
        <tbody>
        {{#lst}}
        <tr>
<td>{{uri}}</td>
<td><img src="{{pic}}" heith="40" width="40" id="imgShow" onmouseout="hiddenPic();" onmousemove="showPic(event,this.src);"/></td>
<td>{{sort}}</td>
			<td>
				{{formatTime createTime}}
			</td>
			<td>
				{{addButton id}}
			</td>
        </tr>
        {{/lst}}
        </tbody>
    </table>
</div>
<div id="J_Pagination"  class="pagelist"></div>
</script>
<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/banner/query.js");
</script>
