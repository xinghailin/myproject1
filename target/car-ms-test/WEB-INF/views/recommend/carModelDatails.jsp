<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="queryUrl" value="<ufa:url fieldName="UPDATE_RECOMMEND_CAR" namespace="car-ms"/>">
<input type="hidden" id="modelUrl" value="<ufa:url fieldName="UPDATE_RECOMMEND_CAR_MODEL" namespace="car-ms"/>">
<input type="hidden" id="versionUrl" value="<ufa:url fieldName="UPDATE_RECOMMEND_CAR_VERSION" namespace="car-ms"/>">
<input type="hidden" id="caridUrl" value="<ufa:url fieldName="UPDATE_RECOMMEND_CAR_ID" namespace="car-ms"/>">
<input type="hidden" id="indexUrl" value="<ufa:url fieldName="FIND_CAR_MODEL" namespace="car-ms"/>">
<input type="hidden" id="saveUrl" value="<ufa:url fieldName="UPDATE_CAR_MODEL" namespace="car-ms"/>">
<input type="hidden" id="pageUrl" value="<ufa:url fieldName="RECOMMEND_CARTYPE" namespace="car-ms"/>">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<div class="mian_right-new" id="EA">
	<div class="rg_list">
	<input id="result" type="hidden" name="result" value="${result }"/>
	
	<c:choose>
   <c:when test="${re.id !=null}"> 
		<h1 class="tt_h1" id="He">推荐修改</h1>
   </c:when>
   <c:otherwise> 
       <h1 class="tt_h1" id="He">推荐添加</h1>
   </c:otherwise>
   </c:choose>
   <form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="UPDATE_CAR_MODEL"/>" enctype="multipart/form-data">
		<div class="tb_list" id="car">
		<ul class="tb_ul02" id="ff">
		<input id="currpage" type="hidden" name="currpage" value="${currpage }"/>
		<li>
		  	<div class="tbul02_left02"  style="width: 100%; border-right: 0px;">
		  	  <div class="tab_txt01">
		  	  	<span class="td_01" style="width: 90px;">车辆品牌：</span>
		  	  
		  	  	<span class="td_02" style="margin-top: 8px;">
		  	  	  <select id="pinpai" style="width:200px;">
		          </select> 
		        </span> 
		        <span class="td_01" style="width: 90px;">车辆型号：</span>
		  	  	 <span class="td_02" style="margin-top: 8px;">
		  	  	  <select id="xinghao" style="width:200px;">
<%-- 		        <option>${re.model}</option>
 --%>		          </select>
		        </span> 
		      <%--   <span class="td_01" style="width: 90px;">车辆版别：</span>
		  	  	<span class="td_02" style="margin-top: 8px;">
		  	  	  <select id="banbie" value="${re.version}" style="width:200px;">
		  	  <option>${re.version}</option>
		          </select>
		        </span>
		          </select> --%>
			 </div>
		     </div>
		   	</li>
		<input type="hidden" id="id" name="id" value="${re.id}" />
		  <li>
		  <div class="border_right"  hidden>
		  	<div class="tab_txt01"><span class="td_center border_right"></span><span style="line-height: 35px;">
		  	<input type="text" id="brand" name="brand" value="${re.brand }" style="width: 500px;"/>&nbsp;
		  	</span></div>
		    </div>
		    <div class="border_right" hidden>
		  	<div class="tab_txt01"><span class="td_center border_right"></span><span style="line-height: 35px;">
		  	<input type="text" id="model" name="model" value="${re.model}" style="width: 500px;"/>&nbsp;
		  	</span></div>
		    </div>
		 <%--    <div class="border_right" hidden>
		  	<div class="tab_txt01"><span class="td_center border_right"></span><span style="line-height: 35px;">
		  	<input type="text" id="version" name="version" value="${re.version}" style="width: 500px;"/>&nbsp;
		  	</span></div>
		    </div> --%>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right" style="line-height:152px">推荐图片</span><span>
		  	<img src="${contextPath}${re.pic}" width="150px" height="150px" style="border: 1px solid #ccc;" id="productImg" alt="W3School"/></span></div>
		  <%--  <a href="${contextPath}${re.pic}" download="${re.pic}">下载</a> --%>
		    </div>
		  </li>
		  <li>
		  	<div class="border_right">
		  	<div class="tab_txt01"><span class="td_center border_right">推荐图片上传</span><span style="line-height: 15px;">
		  	<input type="file" name="picture" id="Tpic"  style="margin-top: 6px" onchange="imagePreview(this.files,'productImg')"/></span>&nbsp;</div>
		    </div>
		  </li>
		  <li>
		  	<div class="border_right" id="cc">
		  	<div class="tab_txt01"><span class="td_center border_right">排序</span><span style="line-height: 15px;">
		  	<input type="text" id="Tsort" name="sort" value="${re.sort }" style="width: 500px;margin-top:7px;"/>&nbsp;
		  	</span></div>
		    </div>
		  </li>
		 
		</ul>
		</div>
		<div class="btnlist" style="text-align:center; " >
		<a id="saveBtn" href="javascript:void(0);" onclick="mysubmit()" class="btn63_01 margin_let10">保存</a>
	   <a href="javascript:void(0);" onclick="back()" class="btn63_02 margin_let10">取消</a>
		</div>	
		 </form>
		</div>
	</div>	
</div>

<script type="text/javascript">
 $(function() {
	
	 if ($('#result').val()==1) {
		alert("这个品牌的车型已经推荐");
	}
		selectBrand();//查询车型
	 $('#pinpai').bind('change', selectModel);
	 $('#xinghao').bind('change', selectVersion); 
	/*  $('#banbie').bind('change', Version);   */
	});
 
	function selectBrand(){
	var query=$('#queryUrl').val();
		$.ajax(query,{
        type: "get",
        contentType: "json",
        success: function (data) {
        	var car=data.car;
           var ddl = $("#pinpai");
            ddl.append("<option value=''>请选择</option>");
            $.each(car, function (idx, val) {
            	ddl.append($("<option>" + val.brand + "</option>"))
            })
        }
    })} 
	function selectModel(){
	  var brand = $("#pinpai").val();
	  $("#brand").val(brand);
       var modelUrl=$('#modelUrl').val();
   $('#xinghao option').remove(); 
        $.ajax(modelUrl,{
        	type: "post",
            data: {brand: brand},
            datatype: "json",
            success: function (data) {
            	var models=data.models;
            	 var ddl = $("#xinghao");
                 ddl.append("<option value=''>请选择</option>");
                $.each(models, function (idx, val) {
                	ddl.append($("<option>" + val.model + "</option>"))
                })
            }
        })
	}
   function selectVersion(){
                    $('#banbie option').remove();
                    var model =  $('#xinghao').val();
                    var brand = $("#pinpai").val();
                    $('#version option').remove();
                    $("#model").val(model);
                    var versionUrl=$('#versionUrl').val();
                    $.ajax(versionUrl,{
                    	type: "post",
                        data: {model: model,brand:brand},
                        datatype: "json",
                        success: function (data) {
                        	var versions=data.versions;
                        	 var ddl = $("#banbie");
                        	 ddl.append("<option value=''>请选择</option>");
                            $.each(versions, function (idx, val) {
                             $('#banbie').append($("<option>" + val.version + "</option>"))
                            })
                        }
                    })
            }  
   function mysubmit()
	    {
		  document.getElementById("editForm").submit();
	    };
    function imagePreview(obj,imgObj){
        	var f = obj[0];
        	var src = window.URL.createObjectURL(f);
        	$('#'+imgObj).attr('src',src) ;
        }
    function back(){
    	location.href=$("#pageUrl").val()+"?currpage="+$('#currpage').val();
    	}
</script>