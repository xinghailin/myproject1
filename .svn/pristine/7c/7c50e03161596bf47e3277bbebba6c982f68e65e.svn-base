define(function(require, exports) {
	'use strict';
	$(".navs01").click(function() {
		window.localStorage.activeDiv = $(this).addClass("nav_link2") // 给当前元素添加"current"样式
		var next = $(this).next().show() // 下一个元素显示
		var preElement = $(this).parent().siblings().children("div").removeClass("nav_link2") // 父元素的兄弟元素的子元素<a>移除"current"样式
		$(preElement).next().hide(); // 它们的下一个元素隐藏
		return false;
	});
	$(".navs02").on("click", "a", function() {
		var activeElement = window.localStorage.activeElement;
		$("#" + activeElement).removeClass("navs02_a1").addClass("navs02_a2");
		$(this).removeClass("navs02_a2").addClass("navs02_a1");
		window.localStorage.activeElement = $(this).attr("id");
		$("#mainFrame").attr("src", $(this).attr("href"));
		$("#firstMenu").html($(this).parent().parent().children("div").html().replace('<span class="span_img01"></span>', ""));
		$("#secondMenu").html($(this).html());
		return false;
	});

//	$(function() {
//		window.localStorage.activeElement = "menu_1_1";
//		$('.mian_left').css('height', $(window).height());
//
//		$(window).resize(function() {
//			// 改变窗体大小时适应浏览器高度
//			$('.mian_left').css('height', $(window).height());
//		})
//
//	});

});