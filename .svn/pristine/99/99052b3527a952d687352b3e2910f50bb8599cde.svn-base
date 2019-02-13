define(function(require, exports) {
	'use strict';

	$(".navs01").click(function() {var $this=$(this);
		window.localStorage.activeDiv = $this.addClass("nav_link2") // 给当前元素添加"current"样式
		var next = $this.next().show() // 下一个元素显示
		var preElement = $this.parent().siblings().children("div").removeClass("nav_link2") // 父元素的兄弟元素的子元素<a>移除"current"样式
		$(preElement).next().hide(); // 它们的下一个元素隐藏
		return false;
	});
	$(".navs02").on("click", "a", function() {var $this=$(this);
		var activeElement = window.localStorage.activeElement;
		$("#" + activeElement).removeClass("navs02_a1").addClass("navs02_a2");
		$this.removeClass("navs02_a2").addClass("navs02_a1");
		window.localStorage.activeElement = $this.attr("id");
		$("#mainFrame").attr("src", $this.attr("href"));
		var menuId = $this.attr("id");
		menuId = menuId.substring(0, menuId.lastIndexOf("_"));
		$("#firstMenu").html($("#"+menuId).html());
		$("#secondMenu").html($this.html());
		return false;
	});

	$(function() {
		window.localStorage.activeElement = "menu_1_1";
	});
	
	//内容管理中的二级菜单点击事件
	$("div[name='contentTwo']").bind("click",function(){
		if($(this).next().is(":hidden")){
			$(this).next().show();
		}else{
			$(this).next().hide();
		}		
	});

});