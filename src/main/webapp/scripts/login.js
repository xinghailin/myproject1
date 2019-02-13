define(function(require, exports) {
	'use strict';
//	exports.init = function() {
		//$('.login_02_mian').css('height', $(document).height());
//		$(document).resize(function() {
//			// 改变窗体大小时适应浏览器高度
//			$('.login_02_mian').css('height', $(document).height());
//		});
	var $u=$("#j_username"),$p=$("#j_password")
	function sbmt(){
		if($.trim($u.val()).length==0){
			$u.focus()
		}else{
			if($.trim($p.val()).length==0){
				$p.focus()
			}else{
				$("#loginForm").submit();
			}
		}
	}
	$u.focus();
	$("#loginBtn").click(sbmt);
	$u.keydown(function(e){
	  var keycode = e.which; 
	  if (keycode==13&&$.trim($u.val()).length>0) {
		  $p.focus();
	  }		  
	 });
	$p.keydown(function(e){
	  var keycode = e.which;
	  if (keycode==13&&$.trim($p.val()).length>0) {
//		  $("#loginForm").submit();
		  sbmt()
	  }
	 });	 	 
//	}
	/*
	 * function _initCaptcha() { require('./base/captcha-util.js').init(); }
	 */
});	
