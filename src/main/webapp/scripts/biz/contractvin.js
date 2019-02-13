define(function(require, exports, module) {
    function saveFun(parm){
    	var siz=$("#carid").val();
    	if(!siz){alert("请选车后再保存！");return false;}
    	var queryUrl = $('#editForm').attr('action');
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : {id:$("#id").val(),carid:$("#carid").val(),vin:$("#vin").val()}
		}).done(function(response) {
			if (response.status) {
				alert("操作成功！");
				location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val()+"&node="+$('#node').val();
			} else {
				alert(response.msg);
			}
		});
}
	function back(){
		location.href=$("#backUrl").val()+"?currpage="+$('#currpage').val()+"&node="+$('#node').val();
	}
	function chooseFun(){
		var zeropur=$("#zeropur").val();
		if(zeropur==1){//零采
			var queryUrl = $('#contractUrl').val();
			$.ajax(queryUrl, {
				type : 'get',
				dataType : 'json',
				data : {id:$("#id").val()}
			}).done(function(response) {
				if (response.status) {
					var co=response.result,carid=co.carid;
//					if(!carid){
////						alert("该合同的零采车辆还未入库")
//						if(confirm("因该合同的零采车辆还未入库，故车辆列表中不存在该车辆，确定要继续打开选车窗口以便查看其它可售车辆吗？")){
//							var realsale = $("#realsaleUrl").val()+"?stepflow=1";
//							showDialogue(realsale, 800, 500);	
//						}
//					}else{alert("该合同的零采车辆[车架号："+co.vin+"]已入库，故选车列表中最多存在一条可选车辆（若该车辆被其他合同选中，则不会出现在列表中），请知晓，点确定继续")
//						var realsale = $("#realsaleUrl").val()+"?stepflow=1&carid="+carid+"&vin="+co.vin;
//						showDialogue(realsale, 800, 500);
//					}
					if(!carid){
						alert("该合同的零采车辆还未入库，请先将车辆入库再选车！")
					}else{//alert("该合同的零采车辆[车架号："+co.vin+"]已入库，故选车列表中最多存在一条可选车辆（若该车辆被其他合同选中，则不会出现在列表中），请知晓，点确定继续")
						var realsale = $("#realsaleUrl").val()+"?stepflow=1&carid="+carid+"&vin="+co.vin;
						showDialogue(realsale, 800, 500);
					}
				} else {
					alert(response.msg);
				}
			});	
		}
		else{//非零采
			var realsale = $("#realsaleUrl").val()+"?stepflow=1";
			showDialogue(realsale, 800, 500);
		}
	}
	function showDialogue(url,w,h){
//		var iWidth = w;
//		var iHeight = h;
//		var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
//		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
		var iTop = 100;
		var iLeft = 100;
		var iWidth = window.parent.screen.availWidth - iLeft*2;;
		var iHeight = window.parent.screen.availHeight - iTop*2;
		var win = window.open(url, "弹出窗口24", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
	}
  //绑定新增按钮事件
	$("#chooseBtn").bind("click", chooseFun);
	$('#saveBtn').bind("click",saveFun);
	$("#backBtn").bind("click", back);
});