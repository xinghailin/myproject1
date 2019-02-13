define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var handlebars = require('handlebars').Handlerbars;
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	var pagination = require('../base/pagination');
	require('../base/validation-proxy');
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#comeshopTime', null, null);
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
//	var $form;//var $check=$('#checkUrl').val();
	function saveContent(){
		if (validateContentForm()) {
			$('#addClientInfoBtn').show();
	        $('#middle,#msg').hide();//$("#content").blur();
			var url=$('#commuAddQueryUrl').val();
			dataList.show();
			noDataMsg.hide();
			$.ajax({
				type : "POST",
				url : url,
				dataType : "json",
				data : {"sellerId":$('#sellerId').val(),"clientId":$('#id').val(),"content":$('#content').val()},
				async : false,
				success : function(response) {
					if (response.status=="1") {
						if (response.result.length>0) {
							var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
							dataList.html(template(response)).css('height', 'auto');
							pagination.init({
								'pageSize' : 10,
								'totalCount' : response.total,
								'load' : load,
								'currentPage' : 1
							});
							$('#J_CurPageNo').text(1);
						} else {
							dataList.empty().css('height', '40px').hide();
							noDataMsg.show();
						}
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					$.dialog('请稍后重试!', function(){});
				}
			});
			$('#content').val('');
		}
	}
	$(function() {
		 $('#brandinitial').bind('change', selectBrand);
		 $('#wantBrand').bind('change', selectModel);
		 $('#wantcar').bind('change', selectVersion);
		});
			function selectBrand(){
				 $('#wantBrand option').remove();
			     $('#wantcar option').remove();
			     $('#version option').remove();
			  var brandinitial = $("#brandinitial").val();
		       var modelUrl=$('#brandUrl').val();
		        $.ajax(modelUrl,{
		        	type: "post",
		            data: {brandinitial: brandinitial},
		            datatype: "json",
		            success: function (data) {
		            	var brand=data.abrand;
		            	 var ddl = $("#wantBrand");
		                 ddl.append("<option value=''>请选择</option>");
		                $.each(brand, function (idx, val) {
		                	ddl.append($("<option value='"+val.brand+"'>" + val.brand + "</option>"))
		                })
		            }
		        })
			}
			function selectModel(){
			 $('#wantcar option').remove();
			 $('#version option').remove();
			  var brand = $("#wantBrand").val();
		       var modelUrl=$('#modelUrl').val();
		        $.ajax(modelUrl,{
		        	type: "post",
		            data: {brand: brand},
		            datatype: "json",
		            success: function (data) {
		            	var model=data.model;
		            	 var ddl = $("#wantcar");
		                 ddl.append("<option value=''>请选择</option>");
		                $.each(model, function (idx, val) {
		                	ddl.append($("<option value='"+val.model+"'>" + val.model + "</option>"))
		                })
		            }
		        })
			}
			function selectVersion(){
				 $('#version option').remove();
				  var model = $("#wantcar").val();
			       var versionUrl=$('#versionUrl').val();
			        $.ajax(versionUrl,{
			        	type: "post",
			            data: {model:model},
			            datatype: "json",
			            success: function (data) {
			            	var version=data.version;
			            	 var ddl = $("#version");
			                 ddl.append("<option value=''>请选择</option>");
			                $.each(version, function (idx, val) {
			                	ddl.append($("<option value='"+val.version+"'>" + val.version + "</option>"))
			                })
			            }
			        })
				}
	//分页数据加载
	function load(curPageNo, pageSize) {
        dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?start="+curPageNo+"&pageSize="+pageSize; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : {infoId:$('#id').val()}
		}).done(function(response) {
			if (response.result.length>0) {
				var source = $('#dataListTemplate').html(), template = handlebars.compile(source);
				dataList.html(template(response)).css('height', 'auto');
				pagination.init({
					'pageSize' : 10,
					'totalCount' : response.total,
					'load' : load,
					'currentPage' : curPageNo
				});
				$('#J_CurPageNo').text(curPageNo);
			} else {
				dataList.empty().css('height', '40px').hide();
				noDataMsg.show();
			}
		});
	};
    function saveFun(){
//    	if (validateForm()) {
    	if(!$("#shopId").val()){
    		$.dialog('该登陆账号不属于任何门店，请先将该账号关联某个门店!', function(){});return false;
    	}
    	if($("input[name='clientLevel']:checked").val()=='G'&&!$("#carId").val()){
    		$.dialog('您选择了客户级别为G，请在车辆窗口中选择车辆后再保存信息表!', function(){showcars();});return false;
    	}
    	$('#editForm').validate({
			rules : {
				name : {
					required : true,
					maxlength:20
				},
				identify : {
					cardNoCheckOrSpace:true
				},
				phone : {
					maxlength:20
				},
				bizLicense : {
					maxlength:50
				},
				principal : {
					maxlength:50
				},
				wantcar : {
					maxlength:50
				},
				color : {
					maxlength:50
				}
			},
			messages : {
				name : {
					required : "必填",
					maxlength:"输入过长"
				},
				identify : {
					cardNoCheckOrSpace:"格式错误"
				},
				phone : {
					maxlength:"输入过长"
				},
				bizLicense : {
					maxlength:"输入过长"
				},
				principal : {
					maxlength:"输入过长"
				},
				wantcar : {
					maxlength:"输入过长"
				},
				color : {
					maxlength:"输入过长"
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
    		$('#editForm').submit();
//    }
}
  //格式化时间
	function _formatDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate()) + ' '
				+ _fillZero(datetime.getHours()) + ':' + _fillZero(datetime.getMinutes()) + ':' + _fillZero(datetime.getSeconds());
	}
	//格式化时间
	function _formatSimpleDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-' + _fillZero((datetime.getMonth() + 1)) + '-' + _fillZero(datetime.getDate());
	}
	//补零
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
	function validateForm() {
    	$('#contentForm').validate({
			rules : {
				identify : {
					cardNoCheckOrSpace : true
				}
			},
			messages : {
				identify : {
					cardNoCheckOrSpace : "格式错误"
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
		return $('#contentForm').valid();
	}
    function validateContentForm() {
    	$('#contentForm').validate({
			rules : {
				content : {
					required : true,
					maxlength:200
				}
			},
			messages : {
				content : {
					required : "必填",
					maxlength:"输入过长"
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
		return $('#contentForm').valid();
	}
	// 重置
	function reset() {       
		$("#editForm")[0].reset();
	}
	function back(){
		location.href=$("#backUrl").val()+"?worktype="+$("#worktype").val();
	}
	function showcars(){
		var v=$("input[name='clientLevel']:checked").val();
		if(v=="G"){
		var realsale = $("#realsaleUrl").val()+"?stepflow="+$("#stepflow").val();
		showDialogue(realsale, 800, 500);}
	}
	function showchoose(){
		var v=$("input[name='clientLevel']:checked").val();
		if(v=="G"){
			$("#chooseCarBtn").show();
		}
		else{
			$("#chooseCarBtn").hide();}
//		var realsale = $("#realsaleUrl").val()+"?stepflow="+$("#stepflow").val();
//		showDialogue(realsale, 800, 500);}
	}
	function choosecar(){
		var realsale = $("#realsaleUrl").val()+"?stepflow="+$("#stepflow").val();
		showDialogue(realsale, 800, 500);}
	function showDialogue(url,w,h){
//		var iWidth = w;
//		var iHeight = h;
//		var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
//		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
//		var iTop = 100;
//		var iLeft = 100;
//		var iWidth = window.screen.availHeight - 10 - iLeft*2;;
//		var iHeight = window.screen.availHeight - 30 - iTop*2;
		var iTop = 100;
		var iLeft = 100;
		var iWidth = window.parent.screen.availWidth-iLeft*2;
		var iHeight = window.parent.screen.availHeight-iTop*2;
		var win = window.open(url, "弹出窗口24", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
	}
	function changeArea(){
		var v=$("input[name='workType']:checked").val();
		if(v==1){
			$("#clientTypeArea").html($("#clientType1").html());
		}
		else if(v==2){
			$("#clientTypeArea").html($("#clientType2").html());
		}
	}
	$("input[name='workType']").bind("change", changeArea);
	//绑定新增按钮事件
	$('#saveBtn').bind("click",saveFun);
//	$("#addClientInfoBtn").bind("click", addClientInfo);
	$("#backBtn").bind("click", back);$("#resetBtn").bind("click", reset);
//	$("input[name='clientLevel']").bind("change",showcars);
	$("input[name='clientLevel']").bind("change",showchoose);
	$("#chooseCarBtn").bind("click",choosecar);
	$('#addClientInfoBtn').click(function(){
        var width = document.body.clientWidth+'px';
        var height = document.documentElement.clientHeight+'px';

         var p = {
             width:$('#msg').width(),
             height:$('#msg').height()
         }

        var left = ($(window).width() - p.width) / 2 + 'px';
        var top = ($(window).height() - p.height) / 2 + 'px';

        $('#middle').css({'width':width,'height':height,'position':'fixed'}).show();
        $('#msg').css({'left':left,'top':top}).show();$("#content").focus();
//        $('#output').hide();
        $(this).hide();
    });

    $('#btn1').click(function(){
//        $('#ff').html($('#inp').val());
//        $('#inp').val('');
//        $('#output').show();
//        $('#btn0').show();
    	saveContent()})

    $('#btn2').click(function(){
    	$('#content').val('');
    	 $('#addClientInfoBtn').show();
        $('#middle,#msg').hide();
    })
    noDataMsg.show();
//  load(1,10);
//	$(function(){
//		var $msg=$('#hideMsg');
//		if($msg.val())$.dialog($msg.val(), function(){});
//	})
	/*$(function(){
		$.ajax({
			//请求方式（post或get）默认为get。注意其他http请求方法，例如put和delete也可以使用，但仅部分浏览器支持。
		    type: 'POST',
		    //String类型URL请求字符串。默认为当前页地址
		    url: "http://www.baidu.com/12345.action" ,
		    //// 发送到服务器的数据，它将被自动转为字符串类型。如果是GET请求，它将被附加到URL后面。jQuery会自动将对象数据转换为 "name=codeplayer&age=18&uid=1&uid=2&uid=3"
		    data: { name:"codeplayer", age:18, uid: [1, 2, 3] } ,
		    // 服务器返回的数据类型：
		    //xml：返回XML文档，可用JQuery处理。
		    //json：返回JSON数据
		    //text：返回纯文本字符串。
		    dataType: "json", 
		    // 同步请求，发送请求后浏览器将被锁定，只有等到该请求完成(无论成功或失败)后，用户才能操作，js代码才会继续执行
		    async: false,
		    //指定请求完成(无论成功或失败)后需要执行的回调函数。该函数还有两个参数：
		    //一个是jqXHR对象，一个是表示请求状态的字符串('success'、 'notmodified'、 'error'、 'timeout'、 'abort'或'parsererror')。
		    complete:function(textStatus, jqXHR){
		    },
		    // 假设返回的字符串数据为{ "name": "CodePlayer", age: 20 }
		    // jQuery已帮我们将该JSON字符串转换为对应的JS对象，可以直接使用
		    success: function( data, textStatus, jqXHR ){
		        alert( data.name ); // CodePlayer
		    } ,
		    // 请求失败时执行
		    // errorMsg 可能为： "Not Found"、"Internal Server Error"等
		    error: function(jqXHR, textStatus, errorMsg){
		        alert("请求失败：" + errorMsg);
		    }
		});
	});*/
});
function imagePreview(obj,imgObj){
	var f = obj[0];
	var src = window.URL.createObjectURL(f);
	$('#'+imgObj).attr('src',src) ;
//	window.URL.revokeObjectURL(src);
}
var $check=$('#checkUrl').val();
function onBlur(param,type){
	var $pa=$(param);var exp="";var exp= type=='1'?"发动机号已存在":"车架号已存在";
	$.ajax({
		type : "POST",
		url : $check + ".json",
		dataType : "json",
		data : {"param":$pa.val(),"type":type},
		async : false,
		success : function(response) {
			if (response.status=="0") {
				var p = $pa.parent();
//				error.appendTo(p);
				p.append('<label class="invalid" for="'+$pa.attr("name")+'">'+exp+'</label>');
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
//			$.dialog('请稍后重试!', function(){});
			var p = $pa.parent();
//			error.appendTo(p);
			p.append('验证中');
		}
	});
}