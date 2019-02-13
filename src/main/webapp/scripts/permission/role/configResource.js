define(function(require) {

	$(function() {
		$("#addAllBtn").bind("click", addAll);
		$("#addOneBtn").bind("click", addOne);
		$("#removeOneBtn").bind("click", removeOne);
		$("#removeAllBtn").bind("click", removeAll);
		$("#resetBtn").bind("click", removeAll);
		$("#submitBtn").bind("click", submit);
		$("#closeBtn").bind("click",closeDialog);
	});

	function submit() {
		$("#target option").attr("selected","selected");
		var configUrl = $("#configUrl").val();
		$.ajax({
			type : "POST",
			url : configUrl + ".json",
			dataType : "json",
			data : $("#configForm").serialize(),
			async : false,
			success : function(response) {
				if (response.status) {
					alert('设置成功');
					window.close();
				} else {
					alert('设置失败');
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert('请稍后重试!');
			}
		});
	}
	
	

	function addAll() {
		moveAllOption("source", "target");
	}

	function addOne() {
		moveOneOption("source", "target");
	}

	function removeOne() {
		moveOneOption("target", "source");
	}

	function removeAll() {
		moveAllOption("target", "source");
	}

	function moveOneOption(source, target) {
		$("#"+source+" option:selected").clone().appendTo("#"+target); 
	    $("#"+source+" option:selected").remove();
	        
		/*var options = $("#" + source).find("option:selected");
		for ( var i = 0; i < options.length; i++) {
			var item = options[i];
			var option = $("<option>").val($(item).val()).text($(item).text());
			$("#" + target).append(option);
			$("#" + source + " option[value='" + $(item).val() + "']").remove();
		}*/
	}

	function moveAllOption(source, target) {
		$("#"+source+" option").clone().appendTo("#"+target); 
	    $("#"+source+" option").remove();
		/*var options = $("#" + source).find("option");
		for ( var i = 0; i < options.length; i++) {
			var item = options[i];
			var option = $("<option>").val($(item).val()).text($(item).text());
			$("#" + target).append(option);
			$("#" + source + " option[value='" + $(item).val() + "']").remove();
		}*/
	}
	
	//关闭子窗口
	function closeDialog(){
		window.close();
	}
});