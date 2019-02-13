define(function(require, exports, module) {
	// require('jquery-css');
	require('../base/jquery.jedate');
	// require('art-dialog')($);
	// var pagination = require('../base/pagination');
	// var handlebars = require('handlebars').Handlerbars;
	// var datepickerUtil = require('../base/datepicker-util');
	// datepickerUtil.datesTrigger(null, '#sleavefactime', null);
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	if (month < 10) {
		month = "0" + month;
	}
	if (day < 10) {
		day = "0" + day;
	}
	$("#sleavefactime").jeDate({
		format : "YYYY-MM-DD",
		isTime : false,
		isClear : false,
		maxDate : year + "-" + month + "-" + day
	});
	$("#instoreid").change(function() {
		var v = $(this).find("option:selected").text();
		$('#selectvalue').val(v);
		if (v == '--请选择--') {
			$('#hiddenDiv').show();
			$('#hiddenDiv1').show();
		} else if (v == "境外港口") {
			$('#hiddenDiv').hide();
			$('#hiddenDiv1').show()
		} else {
			$('#hiddenDiv').show();
			$('#hiddenDiv1').hide()
		}
	})
	function back() {
		location.href = $('#backUrl').val() + "?currpage="
				+ $('#currpage').val();
	}
	var status = true;
	function mysubmit() {
		var reg = /(^[0-9]{1,1}$)/;
		// var seatnum = $('#seatnum').val();
		// var enginenum = $('#enginenum').val();
		// var enginenumUrl = $('#enginenumUrl').val();
		var vin = $('#vin').val();
		if (!$.trim(vin)) {
			alert("vin must fill in！");
			return false;
		} else if (!$.trim($('#sleavefactime').val())) {
			alert("please enter dateOfProduction！");
			return false;
		} else if (!$.trim($('#instoreid').val())) {
			alert("please choose Warehouse！");
			return false;
		} else if (!reg.test($('#seatnum').val())) {
			alert("please fill in true seatNum！");
			return false;
		} else if (!$.trim($('#Tiretype').val())) {
			alert("TireType must fill in！");
			return false;
		}/*
			 * else if($('#enginenum').val()==""){ alert("engine number must
			 * fill in！");return false; }
			 */
		// var myselect = document.getElementById("instoreid");
		// var index = myselect.selectedIndex; // selectedIndex代表的是你所选中项的index
		// var myselects = myselect.options[index].text;
		var myselects = $('#instoreid').find("option:selected").text();
		var vinVerifyUrl = $('#vinVerifyUrl').val();
		var c = 0;
		if (!(myselects == "境外港口")) {
			$.each($('#check .tab_txt01 .td_02 input'), function() {
				if (!$(this).prop('checked')) {
					alert($(this).parent().siblings('span').html().slice(0, -1)
							+ "Unselected");
					return false;
				} else {
					c++;
				}
			});
			if ($('#check .tab_txt01 .td_02 input').length == c) {
				/*if ($('#iden1').val() == "") {
					alert("please uploading car credentials！");
					return false;
				} else if ($('#country').val() != 2 && $('#iden2').val() == "") {
					alert("please uploading car invoice！");
					return false;
				} else if ($('#iden3').val() == "") {
					alert("please uploading  pictures of car brands！");
					return false;
				} else*/ if ($('#location').val() == "") {
					alert("No pictures of the vehicle inspection！");
					return false;
				} else if ($('#canadaremarks').val().length > 500) {
					alert("Note length is greater than 500！");
					return false;
				} else {
					$.ajax({
						url : vinVerifyUrl,
						data : {
							vin : vin
						},
						type : 'post',
						datatype : 'json',
						success : function(data) {
							if (data.status) {
								if (status) {
									status = false;
									/*
									 * $.ajax({ url:enginenumUrl,
									 * data:{enginenum:enginenum}, type:'post',
									 * datatype:'json', success:function(data){
									 * if(data.status){
									 */
									$("#hiddenDiv1").remove();
									document.getElementById("editForm")
											.submit();
									/*
									 * }else{ alert("engine number already
									 * existed！"); } } })
									 */
								}
							} else {
								alert("vin already existed！");
							}
						}
					})
				}
			}
		} else {
			/*if ($('#iden11').val() == "") {
				alert("please uploading international bill of lading！");
				return false;
			} else if ($('#iden22').val() == "") {
				alert("please uploading car invoice！");
				return false;
			} else if ($('#iden33').val() == "") {
				alert("please uploading  pictures of car brands！");
				return false;
			} else if ($('#iden44').val() == "") {
				alert("please uploading car container loading photograph！");
				return false;
			} else if ($('#iden55').val() == "") {
				alert("please uploading car the container in formation！");
				return false;
			} else*/ if ($('#canadaremarks1').val().length > 500) {
				alert("Note length is greater than 500！");
				return false;
			} else {
				$.ajax({
					url : vinVerifyUrl,
					data : {
						vin : vin
					},
					type : 'post',
					datatype : 'json',
					success : function(data) {
						if (data.status) {
							if (status) {
								status = false;
							/*
							 * $.ajax({ url:enginenumUrl,
							 * data:{enginenum:enginenum}, type:'post',
							 * datatype:'json', success:function(data){
							 * if(data.status){
							 */
							$("#hiddenDiv").remove();
							document.getElementById("editForm").submit();
							/*
							 * }else{ alert("engine number already existed！"); } } })
							 */
							}
						} else {
							alert("vin already existed！");
						}
					}
				})
			}
		}
	}
	$("#back").bind("click", back);
	$("#mysubmit").bind("click", mysubmit);
});
