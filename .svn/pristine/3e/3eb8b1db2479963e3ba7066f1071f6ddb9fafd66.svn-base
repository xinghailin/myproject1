<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input id="addUrl" type="hidden" value='<ufa:url namespace="car-ms" fieldName="SYS_BASIC_DATA_ADD_URL"/>' />
<form name="addForm" id="addForm" >
<div class="table_list2">
	<div class="tablist_margin0">
		<div class="tablist">
		  <p class="title_p2 fz_14px">新增基础数据</p>
			<ul class="tb_ul">
 			<li>
		        <div class="tab_txt01">
		          <span class="td_01"><label class="fc_red">*</label>类型：</span>
		          <span class="td_02">
		            <select name="type" id="type" style="width:140px">
					   <option value="">--请选择--</option> 
					   <c:forEach items="${basicDataType}" var="item">  
						 <option  value="${item.key}">${item.value}</option>
						</c:forEach>
				    </select>
				    </span>
				    <span class="td_07"></span>
			  	</div>
			  </li>
			  <li>
			  	<div class="tab_txt01"><span class="td_01"><label class="fc_red">*</label>值：</span>
			  		<span class="td_02"><input name="dvalue" id="dvalue" type="text" class="input_text"   maxlength="20" minlength="1"/></span>
			  	</div>
			  </li>
			   <li>
			  	<div class="tab_txt01"><span class="td_01"><label class="fc_red"></label>排序序号：</span>
			  		<span class="td_02">
			  		     <input name="sortNum" id="sortNum" type="text" class="input_text" maxlength="2"/>
			  		</span>
			  	</div>
			  </li>
		     <li>
			  	<div class="tab_txt01"><span class="td_01"><label class="fc_red"></label>是否默认：</span>
			  		<span class="td_02">
			  		     <input name="isDefault" id="isDefault0" type="radio" checked class="input_text"  value="0"/> 否
			  		      <input name="isDefault" id="isDefault1" type="radio" class="input_text"  value="1"/> 是
			  		</span>
			  	</div>
			  </li>
			  <li>
			  	<div class="tab_txt01"><span class="td_01">描述：</span>
			  		<span class="td_02">
			  		   <input name="description" id="description" type="text" class="input_text"   maxlength="50"/>
			  		</span>
			  	</div>
			  </li>
			</ul>
		</div>
		<div class="btnlist">
			<a href="javascript:void(0);" id="addBtn" class="btn63_01" style="margin-left:15%">确定</a>
			<a id='resetBtn' href="javascript:void(0);" class="btn63_02 margin_let10">重置</a>  
			<a href="javascript:window.close();" class="btn63_02 margin_let10">关闭</a>
		</div>
	</div>
</div>
</form>


<script type="text/javascript">
    // 加载入口模块
    seajs.use("${scriptBasePath}/system/basicdata/add.js");
</script>
