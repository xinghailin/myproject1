define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	 $(function(){
	        var box=$('.buy-need');
	        var BrandinitiaUrl=$('#BrandinitiaUrl').val();
	        var brandUrl=$('#brandUrl').val();
	        var modelUrl=$('#modelUrl').val();
	        var versionUrl=$('#versionUrl').val();
	        $.ajax({
	            url: BrandinitiaUrl,
	            type: 'get',
	            datatype: 'json',
	            success:function(data){
	                $.each(data.result, function() {
	                    $('.letter').append($("<option>" + this.brandInitial + "</option>"))
	                });
	                $(document).delegate('.letter','change',function(){
	                    var br=$(this).parent().siblings();
	                    $(this).parent().siblings().find('select').html("<option>请选择</option>");
	                    $.ajax({
	                        url: brandUrl,
	                        type: 'post',
	                        data:{brandinitial: $(this).val()},
	                        datatype: 'json',
	                        success:function(data){
	                            $.each(data.abrand, function() {
	                                br.find('.brand').append($("<option>" + this.brand + "</option>"))
	                            });
	                            $(document).delegate('.brand','change',function(){
	                                $(this).parent().siblings().find('.model,.version').html("<option>请选择</option>");
	                                $.ajax({
	                                    url: modelUrl,
	                                    type: 'post',
	                                    data:{brand: $(this).val()},
	                                    datatype: 'json',
	                                    success:function(data){
	                                        $.each(data.model, function() {
	                                            br.find('.model').append($("<option>" + this.model + "</option>"))
	                                        });
	                                        $(document).delegate('.model','change',function(){
	                                            $(this).parent().siblings().find('.version').html("<option>请选择</option>");
	                                            $.ajax({
	                                                url:versionUrl,
	                                                type: 'post',
	                                                data:{model: $(this).val()},
	                                                datatype: 'json',
	                                                success:function(data){
	                                                    $.each(data.version, function() {
	                                                        br.find('.version').append($("<option>" + this.version + "</option>"))
	                                                    });
	                                                }
	                                            })
	                                        })
	                                    }
	                                })
	                            })
	                        }
	                    })
	                })
	            }
	        });
	        $(document).delegate('.addss','click',function(){
	            var aa=$('.need-list').eq(0).clone();
	            aa.find('input,textarea').val("");
	            aa.find('.brand,.model,.version').html('<option>请选择</option>');
	            aa.appendTo(box);
	        });
	        $(document).delegate('.delete','click',function(){
	           $(this).parent().parent().remove();
	        });
	        $('.submit').click(function(){
	            var arr=[];
	            $.each($('.need-list'),function(){
	                if($(this).find('.letter').val()=="请选择") alert("品牌首字母未选择");
	                else if($('#names').val()=="") alert("填写需求单名称");
	                else if($(this).find('.brand').val()=="请选择") alert("品牌未选择");
	                else if($(this).find('.model').val()=="请选择") alert("型号未选择");
	                else if($(this).find('.version').val()=="请选择") alert("版别未选择");
	                else if($(this).find('textarea').val()=="") {alert("配置为空");$(this).find('textarea').focus();}
	                else if($(this).find('.out_color').val()=="") {alert("外观颜色为空");$(this).find('.out_color').focus();}
	                else if($(this).find('.num').val()=="") {alert("数量为空");$(this).find('.num').focus();}
	                else if($(this).find('.in_color').val()=="") {alert("内饰颜色为空");$(this).find('.in_color').focus();}
	                else{
	                    var ss={
	                    	initials:$(this).find('.letter').val(),	
	                        brand:$(this).find('.brand').val(),
	                        model:$(this).find('.model').val(),
	                        version:$(this).find('.version').val(),
	                        set:$(this).find('.set textarea').val(),
	                        outcolor:$(this).find('.out_color').val(),
	                        num:$(this).find('.num').val(),
	                        incolor:$(this).find('.in_color').val()
	                        
	                    };
	                    arr.push(ss);
	                }
	            })
	            var code=$('#filenum').val();
	            var names=$('#names').val();
	            var addUrl=$('#addUrl').val();
	            var ids=$('#ids').val();
	            $.ajax({
	                url:addUrl,
	                data:{result:JSON.stringify(arr) ,code:code,name:names,id:ids},
	                type:'post',
	                datatype:'json',
	                success:function(data){
	                    if( data.status==1){
	                        alert("保存成功");
	                        location.href=$('#jndneedUrl').val();
	                    }else{
	                    	alert("保存失败!");
	                    	location.href=$('#canadaneedUrl').val();
	                    }

	                }
	            })
	        })
	    }); 
});