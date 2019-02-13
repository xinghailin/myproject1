 define(function(require, exports, module) {
		require('jquery-css');
		require('art-dialog')($);
		require('../base/jquey-bigic');
		require('../../styles/common/bigic.css');
		require('../base/validation-proxy');
		var datepickerUtil = require('../base/datepicker-util');	
		function back1(){
			 location.href=$('#backUrl').val()+"?currpage="+$('#currpage').val();
		 }
		function back2(){
			 location.href=$('#back2Url').val()+"?currpage="+$('#currpage').val();
		 }
		function back3(){
			 location.href=$('#back3Url').val()+"?currpage="+$('#currpage').val()+"&id="+$('#freightid').val()+"&username="+$('#username').val();
		 }
		function back4(){
			 location.href=$('#back4Url').val()+"?currpage="+$('#currpage').val()+"&id="+$('#freightid').val()+"&Updatefreight="+$('#Updatefreight').val();
		 }
			$("#back1").bind("click", back1);
		 	$("#back2").bind("click", back2);
			$("#back3").bind("click", back3);
			$("#back4").bind("click", back4);
			$('img').bigic();
	});
