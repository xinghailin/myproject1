 define(function(require, exports, module) {
		require('jquery-css');
		require('art-dialog')($);
		require('../base/jquey-bigic');
		require('../../styles/common/bigic.css');
		require('../base/validation-proxy');
		$('.out-add').click(function(){
		    $("<div class='up-box'> <input type='file' class='files' name='files' > <div class='delete'>delete</div> </div>").appendTo($('.out-box'));
		});
		$(document).delegate('.delete','click',function(){
			var len=$(".out-box>.up-box").size();
			if(len<2){
				alert("至少保留一条！at least retain one！");
			}else{
				$(this).parent().remove();}
		});
		var status=true;
		 function mysubmit(){
			 var stime=$('#starttime').val();
			 var atime=$('#arrivetime').val();
			 if($('#shipname').val()==""){alert("name Of The Ship must fill in !");return false;}
			 else if($('#voyage').val()==""){alert("voyage Number must fill in !");return false;}
			 else if($('#containernum').val()==""){alert("container Number must fill in !");return false;}
			 else if($('#bookingnum').val()==""){alert("booking Number must fill in !");return false;}
			 else if($('#exportcorpname').val()==""){alert("name Of Exporter must fill in !");return false;}
			 else if($('#receivingcorpname').val()==""){alert("receiving unit must fill in !");return false;}
			 else if($('#goodname').val()==""){alert("goods Name must fill in !");return false;}
			 else if($('#roughweight').val()==""){alert("rough Weight must fill in !");return false;}
			 else if($('#starttime').val()==""){alert("start ship date must fill in !");return false;}
			 else if($('#arrivetime').val()==""){alert("arrival time date must fill in !");return false;}
			 else if($('#goalhaven').val()==""){alert("goal haven must fill in !");return false;}
			 else if(stime>atime){alert("Time of shipment greater than arrival at port time!");return false;}
			 else{
				$.each($('.up-box'),function(){
					 if($(this).find('.files').val()==""){ alert("Please upload clearance of goods file !");return false;}
					 else{
						 if(status){
							status=false;
							document.getElementById("editForm").submit();
						 }
					 }
				})
			 }
		 }
		 function back(){
			 location.href=$('#backUrl').val()+"?currpage="+$('#currpage').val();
		 }
		 function reset() {       
			 $("#editForm")[0].reset();
			}
		 function  mysubmit1() {
			 var formData = new FormData($( "#editForm" )[0]); 
			 var ff=$('#updatesave').val();
			/* if ($('#country').val()!=2&&$('#iden2').val()=="") {
				 alert("please uploading car invoice！");return false;
			}else  if($('#iden1').val()==""){
   			 alert("please uploading car credentials！");return false;
   		 	}else{*/
			 if(status){
				status=false;
	            $.ajax(ff,{
	                    type: "POST",//方法类型
	                    dataType: "json",//预期服务器返回的数据类型
	                    data: formData,
	                    async: false,  
	                    cache: false,  
	                    contentType: false,  
	                    processData: false,  
	                    success: function (response) {
	                   if(response.status){
	                	   $.dialog('保存成功！', function(){location.href=$('#backUrl').val()+'?currpage='+$('#currpage').val();})
	                   }
	                    },
	                });
	            }
	            }/*}*/
			$("#btnReset").bind("click", reset);//重置
			$("#back").bind("click", back);//返回
			$("#mysubmit").bind("click", mysubmit);//提交
			$("#mysubmit1").bind("click", mysubmit1);//修改提交
			$('img').bigic();
	});
