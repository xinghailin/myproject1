define(function(require, exports, module) {
	require('jquery-css');
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');	
	datepickerUtil.datesTrigger('#payDateTime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	var searchCondition = null ;
	submitButton.attr('disabled', 'disabled');
	$(function() {
		load();//加载历史数据
	});


    var tbody=$("#du-table tbody");
    tbody.dblclick(function(e){
        var target= $(e.target);
        if(!target.hasClass('aa')){
            var oldv=target.html();
            if(oldv=="&nbsp"){
                oldv=""
            }
            target.html("");
            var input=$("<input type='text' value='"+oldv+"'>");
            target.append(input);
            input.focus();
            input.on("blur keydown",function(e){
                if(e.type=="blur"||(e.type=="keydown"&&e.keyCode==13)){
                    input.remove();
                    target.html(input.val());
                }
            })
        }
    });
    $(".adds").click(function(){
       var tr=$('<tr><td></td> <td></td> <td></td> <td></td> <td></td> <td></td><td></td> <td></td> <td></td> <td class="aa"> <button type="button" class="btn btn-danger btn-sm aa del">删除</button></td></tr>')
        tr.appendTo(tbody)
    });
    $(tbody).delegate('.del','click',function(){
        $(this).parent().parent().remove();
    });
    $(".submit").click(function(){
       /* var result=[];
        var tr=$("#du-table tbody tr");
        var title=$("table thead tr th");
        var JsonData = {
            brand:"",carModel:"",version:"", configure:"",colour:"",number:"", type:"",settlementPrice:"",marketPrice:""
        };
        var rows = document.getElementById("du-table").rows.length;
        //获得行数(包括thead)
        var colums = document.getElementById("du-table").rows[0].cells.length;
        //获得列数
        for (var i = 1;i < rows;i++) {
            var JsonData = new Object();
            JsonData.brand = document.getElementById("du-table").rows[i].cells[0].innerHTML;
            JsonData.carModel = document.getElementById("du-table").rows[i].cells[1].innerHTML;
            JsonData.version = document.getElementById("du-table").rows[i].cells[2].innerHTML;
            JsonData.configure = document.getElementById("du-table").rows[i].cells[3].innerHTML;
            JsonData.colour = document.getElementById("du-table").rows[i].cells[4].innerHTML;
            JsonData.number = document.getElementById("du-table").rows[i].cells[5].innerHTML;
            JsonData.type = document.getElementById("du-table").rows[i].cells[6].innerHTML;
            JsonData.settlementPrice = document.getElementById("du-table").rows[i].cells[7].innerHTML;
            JsonData.marketPrice = document.getElementById("du-table").rows[i].cells[8].innerHTML;
            result.push(JsonData);
        }*/
    	
        var result = [];
        var tr = $("#du-table tbody tr");
        var title = $("table thead tr th");
        var txt = "["
        for (var i = 0; i < tr.length; i++) {
            var aa = '{';
            for (var j = 0; j < tr.eq(0).find('td').length - 1; j++) {
                if (j == tr.eq(0).find('td').length - 2) {
                    if (tr.eq(i).find("td").eq(j).html() == "") {
//                        console.log("第" + i + "行第" + j + "个");
                        var input = $("<input type='text'>");
                        tr.eq(i).find("td").eq(j).append(input);
                        input.focus();
                        input.on("blur keydown", function (e) {
                            if (e.type == "blur" || (e.type == "keydown" && e.keyCode == 13)) {
                                input.remove();
                                tr.eq(i).find("td").eq(j).html(input.val());
                            }
                        });
                        return;
                    } else {
                        aa += '"' + title.eq(j).attr("v") + '":"' + tr.eq(i).find("td").eq(j).html() + '"';
                    }
                } else {
                    if (tr.eq(i).find("td").eq(j).html() == "") {
//                        console.log("第" + i + "行第" + j + "个");
                        var input = $("<input type='text'>");
                        tr.eq(i).find("td").eq(j).append(input);
                        input.focus();
                        input.on("blur keydown", function (e) {
                            if (e.type == "blur" || (e.type == "keydown" && e.keyCode == 13)) {
                                input.remove();
                                tr.eq(i).find("td").eq(j).html(input.val());
                            }
                        });
                        return;
                    } else {
                        aa += '"' + title.eq(j).attr("v") + '":"' + tr.eq(i).find("td").eq(j).html() + '"' + ",";
                    }
                }
            }
            if (i == tr.length - 1) {
                aa += '}';
            } else {
                aa += '},';
            }
            txt += aa;
        }
        txt += "]";
        var dateJson = JSON.stringify(result);
		var queryUrl = $('#searchUrl').val() ; // 提交url
		var quoteName = $('#quoteName').val() ; 
		var quoteDate = $('#payDateTime').val() ; 


		
		
		if(''==quoteName){
			alert("报价名称不能为空");
			return;
			
		}
		if(''==quoteDate){
			alert("报价日期不能为空");
		}
        $.ajax(queryUrl, {
            async: false,
            type : 'POST',
			dataType : 'json',
			data : {dateList:txt,quoteName:quoteName,quoteDate:quoteDate},
        }).success(function (data) {
        	    msg = data.msg;
                alert(msg);
                window.history.go(-1);
            }).error(function () {
            	msg = "系统内部异常";
            	 alert(msg);
            });
    })


	

	
	

	//加载
	function load() {
    	
    	var queryUrl = $('#findListMaxDateUrl').val()
        $.ajax(queryUrl, {
            async: false,
            type : 'POST',
			dataType : 'json',
        }).success(function (data) {
        	if(data.length>0){
	        	 $("table tbody").html("");
	           	 var tr='';
	           	 for(var i=0 ;i<data.length;i++){
	           		 tr+='<tr><td>'+data[i].brand+'</td> <td>'+data[i].carModel+'</td> <td>'+data[i].version+'</td> <td>'+data[i].configure+'</td> <td>'+data[i].colour+'</td> <td>'+data[i].number+'</td><td>'+data[i].type+'</td> <td>'+data[i].settlementPrice+'</td> <td>'+data[i].marketPrice+'</td>';
	           		 tr+='<td class="aa"> <button type="button" class="btn btn-danger btn-sm aa del">删除</button></td></tr>';
	           	 }
	           	 
	           	 var trr =$(tr);
	           	 trr.appendTo(tbody);
        	}
            }).error(function () {
            	msg = "系统内部异常";
            	 alert(msg);
            });
        
        
        
    	/*$("table tbody").html("");
    	 var tr='';
    	 for(var i=0 ;i<5;i++){
    		 tr+='<tr><td>'+i+'</td> <td>'+i+'</td> <td>'+i+'</td> <td>'+i+'</td> <td>'+i+'</td> <td>'+i+'</td><td>'+i+'</td> <td>'+i+'</td> <td>'+i+'</td>';
    		 tr+='<td class="aa"> <button type="button" class="btn btn-danger btn-sm aa del">删除</button></td></tr>';
    	 }
    	 
    	 var trr =$(tr);
    	 trr.appendTo(tbody);*/
    	/* var tr=$('<tr><td></td> <td></td> <td></td> <td></td> <td></td> <td></td><td></td> <td></td> <td></td> <td class="aa"> <button type="button" class="btn btn-danger btn-sm aa del">删除</button></td></tr>')
         tr.appendTo(tbody);*/
	};
	

	function reset() {       
		form[0].reset();
	}
	$("#btnReset").bind("click", reset);
	$("#backBtn").bind("click", back);
	function back(){
		window.history.go(-1);
	}
	
});
