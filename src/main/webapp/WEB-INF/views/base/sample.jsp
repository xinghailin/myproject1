<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>

<div class="main_right">
	<div class="rg_list">
		<div class="tb_list">
			<ul class="tb_ul">
			  <li>
			  	<div class="tab_txt01"><span class="td_01"><label class="fc_red">*</label>会员类型：</span>
			  		<span class="td_02"><input type="radio"></span><span class="td_03">普通会员</span>
			  		<span class="td_02"><input type="radio"></span><span class="td_03">实名会员</span>
			  		<span class="td_02"><input type="radio"></span><span class="td_03">单身会员</span>
			  	</div>
			  </li>
			   <li>
			  	<div class="tab_txt01"><span class="td_01">认证点：</span>
			  		<span class="td_02">
			  			<select class="select">
			  				<option>--请选择--</option>
			  				<option>1</option>
			  			</select>
			  		</span>
			  	</div>
			  </li>
			   <li>
			  	<div class="tab_txt01"><span class="td_01">姓名：</span>
			  		<span class="td_02"><input type="text" class="input_text01"></span>
			  	</div>
			  </li>
			   <li>
			  	<div class="tab_txt01"><span class="td_01">性别：</span><span class="td_02"><input type="radio"></span>
			  		<span class="td_03">男</span>
			  		<span class="td_02"><input type="radio"></span>
			  		<span class="td_03">女</span>
			  	</div>
			  </li>
			   <li>
			  	<div class="tab_txt01"><span class="td_01">身高（cm）：</span>
			  		<span class="td_02"><input type="text" class="input_text01"></span>
			  	</div>
			  </li>
			   <li>
			  	<div class="tab_txt01"><span class="td_01">体重（kg）：</span>
			  		<span class="td_02"><input type="text" class="input_text01"></span>
			  	</div>
			  </li>
			   <li>
			  	<div class="tab_txt01"><span class="td_01">学历：</span>
			  		<span class="td_04"><select class="select">
			  			<option>--请选择--</option>
			  			<option>1</option>
			  		</select></span>
			  	</div>
			  </li>
			  <li>
			  	<div class="tab_txt01"><span class="td_01">职业：</span>
			  		<span class="td_04"><select class="select">
			  			<option>--请选择--</option>
			  			<option>1</option>
			  		</select></span>
			  	</div>
			  </li>
			    <li>
			  	<div class="tab_txt01"><span class="td_01">婚姻状况：</span><span class="td_02"><input type="radio"></span>
			  		<span class="td_03">未婚</span>
			  		<span class="td_02"><input type="radio"></span>
			  		<span class="td_03">已婚</span>
			  		<span class="td_02"><input type="radio"></span>
			  		<span class="td_03">离异</span>
			  	</div>
			  </li>
			  <li>
			  	<div class="tab_txt01"><span class="td_01">证件类型：</span>
			  		<span class="td_04"><select class="select">
			  			<option>--请选择--</option>
			  			<option>1</option>
			  		</select></span>
			  	</div>
			  </li>
			  <li>
			  	<div class="tab_txt01"><span class="td_01">证件号码：</span>
			  		<span class="td_02"><input type="text" class="input_text01"></span>
			  	</div>
			  </li>
			  <li>
			  	<div class="tab_txt01"><span class="td_01">手机号码：</span>
			  		<span class="td_02"><input type="text" class="input_text01"></span>
			  	</div>
			  </li>
			  <li>
			  	<div class="tab_txt01"><span class="td_01">邮编：</span>
			  		<span class="td_02"><input type="text" class="input_text01"></span>
			  	</div>
			  </li>
			  <li>
			  	<div class="tab_txt01"><span class="td_01">现居住地：</span>
			  		<span class="td_04"><select class="select">
			  			<option>--选择省--</option>
			  			<option>1</option>
			  		</select></span>
			  		<span class="td_04"><select class="select">
			  			<option>--选择市--</option>
			  			<option>1</option>
			  		</select></span>
			  		<span class="td_04"><select class="select">
			  			<option>--选择区--</option>
			  			<option>1</option>
			  		</select></span>
			  		<span class="td_02"><input type="text" class="input_text01"></span>
			  	</div>
			  </li>
			   <li>
			  	<div class="tab_txt01"><span class="td_01">上传头像：</span>
			  		<span class="td_02"><input type="file" class="input_text01"><br>
			  			<img src="images/mg_01.png" width="150" height="150">
			  		</span>
			  	</div>
			  </li>
			</ul>
		</div>
		<div class="btnlist">
			<a href="#" class="btn_120 fz_14px margin_let">保存会员</a> <a href="#" class="btn_131 margin_let10">重置</a>
		</div>
	</div>
</div>