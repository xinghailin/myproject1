define(function(require, exports, module) {
    function saveFun(){
    	var node=$("#node").val();
    	if(node==3){
    	var file1=$("#aproveprice").val(),file2=$("#missmoney").val(),reg=/^((([1-9])+\d*)|0)((\.[0-9]{1,2}){0,1})$/;
    	if(!reg.test(file1)||!reg.test(file2))
		{alert("审核通过时，审批金额、缺少金额都必填且格式无误");return;}
    	if($("#fapprovaltable").prop('files').length==0){alert('请上传消费贷贷审会审批表');return false;}}
    	$("#ret").val(1);
    	$('#editForm').submit();
}
    function noFun(pa){
    	var p=pa.data.pas;
    	if(2==p){var file2=$("#du-reason1").val();file2=file2.trim();
    	if(!file2||file2.length>200){
    		alert("补件时，补件原因必填（200字以内）");return false;
    	}$("#ret").val(2);
    	}else if(3==p){var file3=$("#du-reason2").val();file3=file3.trim();
    	if(!file3||file3.length>200){
    		alert("拒单时，拒单原因必填（200字以内）");return false;
    	}$("#ret").val(3);
    	}
    	$('#editForm').submit();
}
	function back(){
		location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val()+"&node="+$('#node').val();
	}
  //绑定新增按钮事件
	$('#saveBtn').bind("click",saveFun);
	$('#remainBtn').bind("click",{pas:2},noFun);
	$('#noBtn').bind("click",{pas:3},noFun);
	$("#backBtn").bind("click", back);
	var index,num;
	var pictrue=$('.form-inline img');
    pictrue.click(function(){
        $('body').css('overflow','hidden');
        var top=$(window).scrollTop();
        index= pictrue.index(this);
        num=pictrue.length;
        var n=1;
        $("<div class='du-mask' style='margin-top: "+top+"px'><div class='du-tool'><button class='du-prev'>上一张</button><button class='du-next'>下一张</button><button class='du-large'>放大</button><button class='du-small'>缩小</button><button class='du-close'>关闭</button></div><div class='du-contain'><img class='du-main'></div></div>").appendTo('body');
        var src=$(this).attr('src');
        var main= $(".du-main");
        main.attr('src',src);
        var width=main.width();
        main.css("left",($(window).width()-width)/2);
        //鼠标拖拽
//        drag(main.get(0));
//        function drag(aa){
//            aa.onmousedown=function(e){
//                ev=e||window.event;
//                ox=ev.offsetX;
//                oy=ev.offsetY;
//                document.onmousemove=function(e){
//                    ev=e||window.event;
//                    aa.style.left=ev.clientX-ox+"px";
//                    aa.style.top=ev.clientY-oy+"px";
//                    ev.preventDefault();
//                }
//            };
//            aa.onmouseup=function(){
//                document.onmousemove=null
//            };
//        }

//        上一页
        $(".du-prev").click(function(){
            to_left()
        });
        //       向上一页
        function to_left(){
            if(index==0){
//                alert("已经是第一张");
            }else{
                index=index-1;
                var psrc=pictrue.eq(index).attr('src');
                main.attr('src',psrc).css("transform","scale(1,1)");
                var width=main.width();
                main.css({left:($(window).width()-width)/2,top:0});
                n=1;
            }
        }
//        下一页
        $(".du-next").click(function(){
            to_right();
        });
        //       向下一页
        function to_right(){
            if(num==(index+1)){
//                alert("已经是最后一张");
            }else{
                index=index+1;
                var nsrc=pictrue.eq(index).attr('src');
                main.attr('src',nsrc).css("transform","scale(1,1)");
                var width=main.width();
                main.css({left:($(window).width()-width)/2,top:0});
                n=1;
            }
        }
//        放大
        $(".du-large").click(function(){
            n=n+0.2;
            main.css("transform","scale("+n,n+")");
            drag(main.get(0));
        });
//        缩小
        $(".du-small").click(function(){
            if(n>0.6){
                n=n-0.2;
                main.css("transform","scale("+n,n+")");
                drag(main.get(0))
            }
        });
//        关闭
        $(".du-close").click(function(){
            $('.du-mask').remove();
            $('body').css('overflow','auto');
        })
//        键盘绑定
        var timeoutflag=null;
      		$(document).unbind("keydown").keydown(function(event){
      			if(timeoutflag != null){
      				clearTimeout(timeoutflag);
      			}
      			timeoutflag=setTimeout(function(){
      				if((event.keyCode == 37) || (event.keyCode == 38)){
      					to_left();
      				}else if((event.keyCode == 39) || (event.keyCode == 40)){
      					to_right();
      				}//执行的代码自己写
      			},100);//500毫秒内不会重复触发
      		});
    });
});