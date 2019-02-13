define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var handlebars = require('handlebars').Handlerbars;
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	var pagination = require('../base/pagination');
	require('../base/validation-proxy');
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTriggerSimple('#comeshoptime', null, new Date());
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
 $('#initials').bind('change', selectBrand);
 $('#brand').bind('change', selectModel);
 $('#model').bind('change', selectVersion);
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
	function selectBrand(){
	 $('#brand option').remove();
     $('#model option').remove();
     $('#version option').remove();
	 var brandinitial = $("#initials").val();
     var modelUrl=$('#brandUrl').val();
        $.ajax(modelUrl,{
        	type: "post",
            data: {brandinitial: brandinitial},
            datatype: "json",
            success: function (data) {
            	var brand=data.abrand;
            	var ddl = $("#brand");
                 ddl.append("<option value=''>请选择</option>");
                $.each(brand, function (idx, val) {
                	ddl.append($("<option value='"+val.brand+"'>" + val.brand + "</option>"))
                })
            }
        })
	}
	function selectModel(){
	 $('#model option').remove();
	 $('#version option').remove();
	 var brand = $("#brand").val();
     var modelUrl=$('#modelUrl').val();
        $.ajax(modelUrl,{
        	type: "post",
            data: {brand: brand},
            datatype: "json",
            success: function (data) {
            	var model=data.model;
            	var ddl = $("#model");
                ddl.append("<option value=''>请选择</option>");
                $.each(model, function (idx, val) {
                	ddl.append($("<option value='"+val.model+"'>" + val.model + "</option>"))
                })
            }
        })
	}
	function selectVersion(){
		 $('#version option').remove();
		 var model = $("#model").val();
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
//    	if($("input[name='clientLevel']:checked").val()=='G'&&!$("#carId").val()){
//    		$.dialog('您选择了客户级别为G，请在车辆窗口中选择车辆后再保存信息表!', function(){showcars();});return false;
//    	}
    	$('#editForm').validate({
    		rules : {
				name : {
					required : true,
					maxlength:20
				},companyname : {
					required : true,
					maxlength:20
				},identify : {
					cardNoCheckOrSpace:true
				},phone : {
					maxlength:20,mobile:true
				},brand : {
					required : true
				},model : {
					required:true
				},version : {
					required:true
				},nowcar : {
					required : true
				},oldintroduce : {
					required:true
				},haslicense : {
					required:true
				},clevel : {
					required : true
				},bizlicense : {
					maxlength:50
				},principle : {
					maxlength:50
				},color : {
					maxlength:50
				}
			},
			messages : {
				name : {
					required : "必填",
					maxlength:"输入过长"
				},companyname : {
					required : "必填",
					maxlength:"输入过长"
				},identify : {
					cardNoCheckOrSpace:"格式错误"
				},brand : {
					required : "必填"
				},model : {
					required:"必填"
				},version : {
					required:"必填"
				},nowcar : {
					required : "必填"
				},oldintroduce : {
					required:"必填"
				},haslicense : {
					required:"必填"
				},clevel : {
					required : "必填"
				},phone : {
					maxlength:"输入过长",mobile:"格式错误"
				},bizlicense : {
					maxlength:"输入过长"
				},principle : {
					maxlength:"输入过长"
				},color : {
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
		location.href=$("#backUrl").val()+"?worktype="+$("#worktype").val()+"&currpage="+$('#currpage').val();
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
	}
	function choosecar(){
		var realsale = $("#realsaleUrl").val()+"?stepflow="+$("#stepflow").val();
		showDialogue(realsale, 800, 500);}
	function showDialogue(url,w,h){
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
	$("#backBtn").bind("click", back);$("#resetBtn").bind("click", reset);
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
        $(this).hide();
    });
    $('#btn1').click(function(){
    	saveContent()})
    $('#btn2').click(function(){
    	$('#content').val('');
    	$('#addClientInfoBtn').show();
        $('#middle,#msg').hide();
    })
    load(1,10);
});