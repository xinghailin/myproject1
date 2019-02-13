define(function(require) {
	require('jquery-css');
    require('../base/validation-proxy');
//    require('art-dialog')($);
    var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTriggerSimple('#shopFirstCreatTime', null, null);
	function addData() {
		if (validateAddForm()) {
			
			var hostlen=$("#hostid").val();
			if(!hostlen){
				alert("请选择主账号");
				return false;
				}
			
			var len=$("input[name='shopids']:checked").length;
			if(!len){
				alert("请选择同一组门店");return false;
				}
			var addUrl = $("#addUrl").val();
			$.ajax({
				type : "POST",
				url : addUrl,
				data : $("#addForm").serialize(),
				async : false,
				success : function(response) {
					if (response.status) {
						alert(response.message);
						refreshParent();
					}else {
						alert('新增失败！'+response.message);
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(jqXHR.responseText);
				}
			});
		}
	}

	// 重置form
	function reset() {
		$("#addForm")[0].reset();
	}
	
    /**
     * 关闭窗口
     */
	function refreshParent() {
		window.close();
		window.opener.searchclick(false);
	}
    
	function validateAddForm() {
		$("#addForm").validate({
			rules : {
				name : {
					required : true
				}
			},
			messages : {
				name : {
					required : "组名必填"
				}
			},
			errorPlacement : function(error, element) {
				var p = element.parent();
				error.appendTo(p);
			},
			validClass : "success",
			onkeyup : false
		});
		return $("#addForm").valid();
	}
	$("#addBtn").bind("click", addData);
	$("#resetBtn").bind("click", reset);
});



        function getContent(obj) {
            var searchId=jQuery(obj).prop('id');
            var resultId=jQuery(obj).parent().siblings(".result").attr('id');
            var fid=jQuery(obj).siblings(".fid").attr('id');
            var loginName = jQuery.trim($(obj).val());
            if (loginName == "") {
                $("#"+resultId).hide().html("");
                return false;
            }
            var searchUrl = $("#searchUrl").val();
			$.ajax({
				type : "POST",
				url : searchUrl,
				data : {loginName:loginName},
				async : false,
				success : function(date) {
					if (date.userlis) {
			            var html = "";
			            for (var i = 0; i < date.userlis.length; i++) {
			                    html = html + "<div class='item' onmouseenter='getFocus(this)'  name1="+date.userlis[i].loginName+" id="+date.userlis[i].id+" onClick='getCon(this,"+searchId+","+resultId+","+fid+");'>" + date.userlis[i].loginName+"..."+date.userlis[i].name+ "</div>"
			            }
			            if (html != "") {
			                $("#"+resultId).show().html(html);
			            } else {
			                $("#"+resultId).hide().html("");
			            }
					} else {
						alert('失败！');
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(jqXHR.responseText);
				}
			});
			

        }
        function getFocus(obj) {
            $(".item").removeClass("addbg");
            $(obj).addClass("addbg");
        }
        function getCon(obj,searchId,resultId,fid) {
            var value = $(obj).text();
            $(searchId).val($(obj).attr("name1"));
            $(fid).val($(obj).attr("id"));
            $(resultId).hide().html("");
        }