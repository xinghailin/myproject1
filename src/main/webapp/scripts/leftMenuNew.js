define(function(require, exports) {
	'use strict';
//	$(function() {
//		loadMenu() ;
//		window.localStorage.activeElement = "menu_1_1";
//	});
	//内容管理中的二级菜单点击事件
//	$("div[name='contentTwo']").bind("click",function(){
//		if($(this).next().is(":hidden")){
//			$(this).next().show();
//		}else{
//			$(this).next().hide();
//		}
//	});
//	var loadMenuUrl = $("#loadMenuUrl").val();
	(function(){
		$.ajax({
			type : 'GET',
			url : $("#loadMenuUrl").val() + '.json',
			dataType : 'json',
			async : true,
			success : function(response) {var globe=$('#globe_context_id').val();
				if (response.status) {
					var menuList = response.menuList ;
					var length = menuList.length ;
					var menuHtml = "" ;
					for(var i=0;i<length;i++){
						var item = menuList[i] ;
						if(item.parentId==0){
							menuHtml = menuHtml + "<li>" ;
							menuHtml = menuHtml + "<div class=\"navs01 nav_link\"><span class=\"span_img05\"></span><span id=\"menu_"+i+"\" class=\"fz_14px fc_white\">"+item.menuName+"</span></div>" ;
							var childNode = item.childNode ;
							if(childNode.length>0){
								menuHtml = menuHtml + "<div class=\"navs02 hide\">" ;
								for(var j=0;j<childNode.length;j++){
									var childItem = childNode[j] ;
									var menuId = "menu_"+i+"_"+j;
									menuHtml = menuHtml + "<a id=\""+menuId+"\" href=\""+globe+childItem.menuUrl+"\" class=\"navs02_a2\" target=\"mainFrame\">"+childItem.menuName+"</a>" ;
								}
								menuHtml = menuHtml + "</div>" ;
							}
							menuHtml = menuHtml + "</li>" ;
						}
					}
					$('#menuListItem').html(menuHtml) ;
					var navs01=$(".navs01"),navs02=$(".navs02");
//				    $(".navs01")//.attr("onclick","")
				    navs01.click(function(){
//				    	if(!navs01){navs01=$(".navs01");navs02=$(".navs02");}
				    	var $th=$(this);
				    	if($th.hasClass('nav_link2')){
				    		$th.removeClass('nav_link2').siblings().hide();
				    	}
				    	else{
				    	var index=navs01.index(this);
				    	navs01.removeClass('nav_link2').eq(index).addClass('nav_link2');
				    	navs02.hide().eq(index).show();}
				    	/*var $th=$(this);
						window.localStorage.activeDiv = $th.addClass("nav_link2") // 给当前元素添加"current"样式
						var next = $th.next().show() // 下一个元素显示
						var preElement = $th.parent().siblings().children("div").removeClass("nav_link2") // 父元素的兄弟元素的子元素<a>移除"current"样式
						$(preElement).next().hide(); // 它们的下一个元素隐藏
*/						return false;
				    });
				    var alla=navs02.find("a");//.attr("onclick","")
				    alla.click(function(){var $th=$(this);
//						var activeElement = window.localStorage.activeElement;
//						$("#" + activeElement)
//						$th.removeClass("navs02_a1").addClass("navs02_a2");
//						$th.removeClass("navs02_a2").addClass("navs02_a1");
						alla.removeClass("navs02_a1");
						$th.addClass("navs02_a1");
//						window.localStorage.activeElement = $th.attr("id");
						$("#mainFrame").attr("src", $th.attr("href"));
						var menuId = $th.attr("id");
						menuId = menuId.substring(0, menuId.lastIndexOf("_"));
						$("#firstMenu").html($("#"+menuId).html());
//						alert($(this).text());
						$("#secondMenu").html($th.text());
						return false;
					});

				} else {
					alert('无记录') ;
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert('获取记录失败') ;
			}
		});
	})();var oldw;
	$("#secondMenu").click(function(){
		var left=document.getElementById("main_left"),style=left.style;
		var fr=$(window.frames['mainFrame'].document);var view=null;//alert(fr.size());
		if(style.display=='none'){style.display='';view=fr.find(".main_right");//alert(view.size());
		if(view.size()>0){view.css({"margin-left":"300px","width":oldw+"px"})}
		else {view=fr.find(".mian_right-new");
		if(view.size()>0){view.css({"margin-left":"300px","width":oldw+"px"})}}}
		else{style.display='none';view=fr.find(".main_right");//alert(view.size());
		if(view.size()>0){oldw=view.css("width");oldw=oldw.substr(0,oldw.length-2);view.css({"margin-left":"10px","width":(parseInt(oldw)+parseInt(290))+"px"})}
		else {view=fr.find(".mian_right-new");
		if(view.size()>0){oldw=view.css("width");oldw=oldw.substr(0,oldw.length-2);view.css({"margin-left":"10px","width":(parseInt(oldw)+parseInt(290))+"px"})}}}
	})
});