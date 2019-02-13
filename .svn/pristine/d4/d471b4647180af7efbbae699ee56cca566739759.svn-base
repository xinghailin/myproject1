define(function(require, exports, module) {
	require('jquery-css');
	require('../base/jquery.jedate');
	require('art-dialog')($);
	require('../base/validation-proxy');
	require('../../styles/jedate.css');
//	var date=new Date();
//	var year=date.getFullYear();
//	var month=date.getMonth()+1;
//	var day=date.getDate();
//	var mindate=year+"-"+month+"-"+day;
	var $userCountry=$('#userCountry');
	var userCountry=$userCountry.size()?$userCountry.val():"";
	$(".datainp").jeDate({
	    format: "YYYY-MM-DD",
	    isTime: false,
	    isClear: true,
	    minDate: "2017-01-01 00:00:00"
	});
//	var submitButton = $("#btnSearch");
	function JqValidate(id) {
		$(id).validate({
			rules : {
				config : {
					required : true,maxlength:500
				},outcolor : {
					required : true,maxlength:50
				},incolor : {
					required : true,maxlength:50
				},num : {
					required : true,
					integergtzero:true
				},supplyname : {
					required : true,maxlength:100
				},totalprice : {
					required : true,
					amountFmtCheck:true,maxlength:11
				},appointtime : {
					dateorspace : true
				},paytime : {
					dateorspace : true
				},othercost : {
					numberOrSpace : true
				},insurance : {
					numberOrSpace : true
				},expensetax : {
					numberOrSpace : true
				},cmsn1 : {
					numberOrSpace:true
				},cmsn2 : {
					numberOrSpace:true
				},cmsn3 : {
					numberOrSpace:true
				},cmsn4 : {
					numberOrSpace:true
				},cmsn5 : {
					numberOrSpace:true
				},other1 : {
					numberOrSpace:true
				},other2 : {
					numberOrSpace:true
				},other3 : {
					numberOrSpace:true
				},other4 : {
					numberOrSpace:true
				},other5 : {
					numberOrSpace:true
				}
				,transcost : {
					numberOrSpace:true
				},transname : {
					maxlength:50
				}
			},
			messages : {
				config : {
					required : "required",
					maxlength : "输入过长"
				},
				outcolor : {
					required : "required",
					maxlength : "输入过长"
				},
				incolor : {
					required : "required",
					maxlength : "输入过长"
				},num : {
					required : "required"
				},totalprice: {
					required : "required"
						}
				
			
			},
			errorPlacement : function(error, element) {
				element.parent().append(error);
			},
			validClass : "success",
			onkeyup : false
		});var bl=$(id).valid();
		return bl;
	}
	function saveFun(){
	var result=true;var buyna=$('.right-title').find("input[name='buyname']");
	if(buyna.val().trim()==''){buyna.focus();alert("请输入 input please");return false;}
	else if(buyna.val().trim().length>100){buyna.focus();alert("输入过长，最多100字 too long，maxlength is 100");return false;}
	var k = 0;
    var right = $('.rightbox .rightVli');
    for (var i = 0; i < right.length; i++) {
        if (JqValidate("#rightVli" + i)) {
            k++;
        }
    }
    if (k == right.length) {
        var ss="";
//        $.each(right,function(){
//            for(var j=0;j<$(this).find("div>div input").length;j++){
//                ss=ss+$(this).find("div>div input").eq(j).attr('name')+"="+ $.trim($(this).find("div>div input").eq(j).val())+"&";
//            }
//            ss=ss+"config="+$.trim($(this).find("textarea[name='config']").val())+"&bmv="+$(this).find("select[name='bmv']").val()+"&tostoreid="+$(this).find("select[name='tostoreid']").val()+"&";
//        });
        $.each(right,function(){
//            for(var j=0;j<$(this).find("div>div input").length;j++){
//                ss=ss+$(this).find("div>div input").eq(j).attr('name')+"="+ $.trim($(this).find("div>div input").eq(j).val())+"&";
//            }
        	var temp=$(this).serialize();
            ss=ss+temp+"&";
        });
        ss=ss+"id="+$("[name='id']").val()+"&buyname="+$.trim($("input[name='buyname']").val())+"&buycode="+$("input[name='buycode']").val()+"&needid="+$("input[name='needid']").val()+"&puradd="+$("input[name='puradd']").val();
//        console.log(ss);
//        $.ajax({
//            url: '',
//            data: ss,
//            type: 'get',
//            datatype: 'json',
//            success: function () {
//                alert("提交成功");
//            }
//        });
        $.ajax($("#saveUrl").val(), {
			type : 'POST',
			dataType : 'json',
			data : ss
		}).done(function(response) {
			if (response.status) {
//				$.dialog('提交成功！', function(){window.location.href = $('#indexUrl').val()+"?currpage="+$('#currpage').val();})//返回之前的当前页
				alert('Submitted Successfully！');window.location.href = $('#indexUrl').val()+"?userCountry="+userCountry+"&currpage="+$('#currpage').val();
			} else {
				$.dialog(response.msg, function(){})//提示错误信息
			}
		});
    }
	  return result;
	}
	$("#cancelBtn").bind("click", back);
	function back(){
		window.location.href=$('#indexUrl').val()+"?userCountry="+userCountry+"&currpage="+$('#currpage').val();
	}
	$(document).delegate('.checkbox', 'click', function () {
		var tts=$(this);
        if (tts.prop('checked')) {tts.siblings("input").val(1);
        	tts.parent().siblings('.info').find('textarea,input').removeAttr("readonly");
        } else {tts.siblings("input").val("");
//            $(this).parent().siblings('.info').find('textarea,input').val("");
        	var val=tts.parent().siblings('.brand').find('select').val();
        	var cc=tts.parent().siblings('.info');
        	for(var i=0,len=needconfigarr.length;i<len;i++){
        		if(needconfigarr[i].id==val){
        			cc.find('textarea').val(needconfigarr[i].config);cc.find('.out_color').val(needconfigarr[i].outcolor);cc.find('.in_color').val(needconfigarr[i].incolor);break;
        		}
        	}
            cc.find('textarea,input').attr("readonly",true);
        }
    });
    $(document).delegate('.selectchange', 'change', function () {
    	var $this=$(this),val=$this.val(),cc=$this.parent().siblings('.info');
		for(var i=0,len=needconfigarr.length;i<len;i++){
    		if(needconfigarr[i].id==val){
    			cc.find('textarea').val(needconfigarr[i].config);cc.find('.out_color').val(needconfigarr[i].outcolor);cc.find('.in_color').val(needconfigarr[i].incolor);
    		}
    	}
//      $(this).parent().siblings('.info').show();
    });
    var parent=$("#hideItem").html();
    $(document).delegate('.addgoon', 'click', function () {
//        var parent = $(this).parent().parent().clone();
//        var parent=$("#hideItem").html();
//        parent.find('input,textarea').val("");
//        parent.find('.checkbox').prop('checked', false);
//        parent.find('.info').hide();
//        $(parent).appendTo($('.rightbox'));
        $('.rightbox').append(parent);
//        datepickerUtil.datesTriggerSimple('.datainp');
//        $(".datainp").datepicker({});
        $(".datainp").jeDate({
            format: "YYYY-MM-DD",
            isTime: false,
            isClear: true,
            minDate: "2017-01-01 00:00:00"
        });
        var right = $(".rightbox .rightVli");
        for (var i = 0; i < right.length; i++) {
            right.eq(i).prop("id", "rightVli" + i);
        }
    });
    $(document).delegate('.delete', 'click', function () {
    	var right=$(".rightbox .rightVli");
    	if(right.size()<2){$.dialog("至少保留一条！at least retain one！", function(){});}
    	else{
        $(this).parent().parent().parent().remove();
        right=$(".rightbox .rightVli");
        for (var i = 0; i < right.length; i++) {
            right.eq(i).prop("id", "rightVli" + i);
        }
    	}
//    	setTimeout(alert(right.length+"**"+$(".rightbox .rightVli").length),2000);
    });
    $('#saveBtn').bind("click",saveFun);
});