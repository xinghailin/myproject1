define(function(require, exports, module) {
	require('jquery-css');
	require('art-dialog')($);
	var pagination = require('../base/pagination');
	var handlebars = require('handlebars').Handlerbars;
	var datepickerUtil = require('../base/datepicker-util');
	datepickerUtil.datesTrigger('#starttime', null, null);
	var PAGE_SIZE = 10;
	var submitButton = $("#btnSearch");
	var form = $('#searchForm');
	var dataList = $('#J_DataList');
	var noDataMsg = $('#J_NoDataMsg');
	// var sArr=[];
	var checkval = [];
	var userCountry = $('#userCountry').val();
	var searchCondition = null;
	submitButton.attr('disabled', 'disabled');

	handlebars.registerHelper('_operate', operate);
	handlebars.registerHelper('_formatDatetime', _formatDatetime);
	var globe_context_id = $('#globe_context_id').val();
	var source = $('#dataListTemplate').html(), template = handlebars
			.compile(source);
	$(function() {
		// pushAll();
		var cur = $('#currpage').val();
		if (cur)
			load(cur, PAGE_SIZE);
		else
			load(1, PAGE_SIZE);// 加载数据列表
		submitButton.bind("click", {
			curPageNo : 1,
			pageSize : PAGE_SIZE
		}, dataSearch);// 信息查询
	});
	function operate(id) {
		var nbsp = "&nbsp;";
		var look = $(
				"<a href='javascript:void(0);' target='_self' name='look2Btn' class='btn63_03' id='"
						+ id + "'/>").html('<span>view</span>');
		var html = $('<span />').append(look).html();
		return new handlebars.SafeString(html);
	}
	// 格式化时间
	function _formatDatetime(datetime) {
		if (datetime === null) {
			return '';
		}
		datetime = new Date(datetime);
		return datetime.getFullYear() + '-'
				+ _fillZero((datetime.getMonth() + 1)) + '-'
				+ _fillZero(datetime.getDate());
	}
	function look2Btn() {
		var $this = $(this);
		var theId = $this.attr('id');
		window.location.href = $('#detailsUrl').val() + "?id=" + theId
				+ "&currpage=" + $('#J_CurPageNo').text() + "&examine=2";
	}
	function _fillZero(data) {
		if (data < 10) {
			return "0" + data;
		}
		return data;
	}
	// 表单搜索
	function dataSearch(dataObj) {
		searchCondition = form.serialize();
		load(dataObj.data.curPageNo, dataObj.data.pageSize);
	}
	/*
	 * Array.prototype.unique3 = function(){ var res = []; var json = {};
	 * for(var i = 0; i < this.length; i++){ if(!json[this[i]]){
	 * res.push(this[i]); json[this[i]] = 'a'; } } return res; }
	 */
	// 分页数据加载
	function load(curPageNo, pageSize) {
		/* var obj =$("input[name='carID']:checked"); */
		var obj = $("input[name='carID']:checked").val();
		/*
		 * for(k in obj){ if(obj[k].checked) checkval.push(obj[k].value); }
		 */
		/* checkval=checkval.unique3(); */
		dataList.show();
		noDataMsg.hide();
		var queryUrl = $('#searchUrl').val() + "?start=" + curPageNo
				+ "&pageSize=" + pageSize + "&userCountry=" + userCountry; // 查询数据url
		$.ajax(queryUrl, {
			type : 'POST',
			dataType : 'json',
			data : searchCondition
		})
				.done(
						function(response) {
							$('#loginId').val(response.loginId);
							if (response.result.length > 0) {
								if (response.carp3 == 1) {
									$('#carp1').html(
											'车辆价格总和(vehicle price summation.):'
													+ response.carp1 + '&nbsp'
													+ 'C$');
									$('#carp2').html(
											'车辆成本价格总和(Total vehicle cost price):'
													+ response.carp2 + '&nbsp'
													+ 'C$');
								} else if (response.carp3 == 2) {
									$('#carp1').html(
											'车辆价格总和(vehicle price summation.):'
													+ response.carp1 + '&nbsp'
													+ '$');
									$('#carp2').html(
											'车辆成本价格总和(Total vehicle cost price):'
													+ response.carp2 + '&nbsp'
													+ '$');
								} else {
									$('#carp1').html('');
									$('#carp2').html('');
								}
								dataList.html(template(response)).css('height',
										'auto');
								pagination.init({
									'pageSize' : PAGE_SIZE,
									'totalCount' : response.num,
									'load' : load,
									'currentPage' : curPageNo
								});
								$('#J_CurPageNo').text(curPageNo);
								// $('img').bigic();
								$("a[name='look2Btn']").on("click", look2Btn);
							} else {
								dataList.empty().css('height', '40px').hide();
								noDataMsg.show();
							}
						});
	}
	;

	var status=true;
	function submit() {
		var obj = $("input[name='carID']:checked").val();

		var reg = /^((([1-9])+\d*)|0)((\.[0-9]{1,2}){0,1})$/;
		var freightUrl = $('#freightUrl').val() + "?checkval=" + obj;
		if (obj == undefined) {
			alert("Please select vehicle!")
			return false;
		} else if ($('#name').val() == "") {
			alert("apply name must fill in!")
			return false;
		} else if (!reg.test($('#fourtorep').val())) {
			alert("please fill in true 4s店到仓库运费!")
			return false;
		} else if (!reg.test($('#drayage').val())) {
			alert("please fill in true drayage!")
			return false;
		} else if (!reg.test($('#oceanfreight').val())) {
			alert("please fill in true  oceanfreight!")
			return false;
		} else if (!reg.test($('#brandprice').val())) {
			alert("please fill in true  LicenseFees!")
			return false;
		} else if (elsecost1.length > 0 && !reg.test($('#elsecost1').val())) {
			alert("please fill in true elsecost1!")
			return false;
		} else if ($('#elsecost2').val().length > 0
				&& !reg.test($('#elsecost2').val())) {
			alert("please fill in true elsecost2 !")
			return false;
		} else {
			if ($('#cartype').val() == 1) {
				if ($('#preinsuranceprice').text() != ""
						&& !reg.test($('#surepreinsuranceprice').val())) {
					alert("please fill in true premium!")
					return false;
				} else if ($('#preoilprice').text() != ""
						&& !reg.test($('#surepreoilprice').val())) {
					alert("please fill in true fuel charge!")
					return false;
				} else {
					if(status){
					status=false;
					$.ajax({
						url : freightUrl,
						data : $("#searchForm1").serialize(),
						type : 'post',
						datatype : 'json',
						success : function(data) {
							if (data.status == 1) {
								alert("apply succeed !");
								location.href = $('#freightindexUrl').val()
										+ "?currpage=1";
							} else {
								alert("保存失败!");
							}
						}
					})
					}
				}
			} else {
				$(".hiddenDiv").remove()
				if(status){
				status=false;
				$.ajax({
					url : freightUrl,
					data : $("#searchForm1").serialize(),
					type : 'post',
					datatype : 'json',
					success : function(data) {
						if (data.status == 1) {
							alert("apply succeed !");
							location.href = $('#freightindexUrl').val()
									+ "?currpage=1";
						} else {
							alert("保存失败!");
						}
					}
				})
				}
			}

		}
	}
	/*
	 * $(document).ready(function(){ $(".clear").change(function(){
	 * checkval.splice(0,checkval.length);//清空数组 }); });
	 */
	// 重置
	function reset() {
		form[0].reset();
	}
	$("#btnReset").bind("click", reset);
	$("#submit").bind("click", submit);
});
function selectcar() {
	var obj = $("input[name='carID']:checked").val();
	var selectJndCar = $('#selectJndCar').val();
	$.ajax({
		url : selectJndCar,
		data : {
			id : obj
		},
		type : 'post',
		datatype : 'json',
		success : function(data) {
			// console.info(data)
			if (data.car.preinsuranceprice != null
					|| data.car.predrayageprice != null
					|| data.car.prelicenseprice != null
					|| data.car.preoilprice != null) {
				$(".hiddenDiv").css("display", "block");
				$('#cartype').val("1");
				if (data.car.country == 1) {
					if(null == data.car.preinsuranceprice ){
						$('#preinsuranceprice').html(
								0 + '&nbsp' + 'C$');
					}else {
						$('#preinsuranceprice').html(
								data.car.preinsuranceprice + '&nbsp' + 'C$');
					}
					if(null ==data.car.predrayageprice){
						$('#predrayageprice').html(
								0 + '&nbsp' + 'C$');
					}else{
						$('#predrayageprice').html(
								data.car.predrayageprice + '&nbsp' + 'C$');
					}
					if(null == data.car.prelicenseprice){
						$('#prelicenseprice').html(
								0 + '&nbsp' + 'C$');
					}else{
						$('#prelicenseprice').html(
								data.car.prelicenseprice + '&nbsp' + 'C$');
					}
					if(null ==data.car.preoilprice){
						$('#preoilprice').html(
								0 + '&nbsp' + 'C$');
					}else{
						$('#preoilprice').html(
								data.car.preoilprice + '&nbsp' + 'C$');
					}
					
				} else {
					if(null == data.car.preinsuranceprice){
						$('#preinsuranceprice').html(
								0 + '&nbsp' + '$');
					}else{
						$('#preinsuranceprice').html(
								data.car.preinsuranceprice + '&nbsp' + '$');
					}
					if(null==data.car.predrayageprice){
						$('#predrayageprice').html(
								0 + '&nbsp' + '$');
					}else{
						$('#predrayageprice').html(
								data.car.predrayageprice + '&nbsp' + '$');
					}
					if(null ==data.car.prelicenseprice){
						$('#prelicenseprice').html(
								0 + '&nbsp' + '$');
					}else{
						$('#prelicenseprice').html(
								data.car.prelicenseprice + '&nbsp' + '$');
					}
					if(null == data.car.preoilprice){
						$('#preoilprice')
						.html(0 + '&nbsp' + '$');
					}else{
						$('#preoilprice')
						.html(data.car.preoilprice + '&nbsp' + '$');
					}
					
					
				}
			} else {
				$(".hiddenDiv").css("display", "none");
				$('#cartype').val("");
			}
		}
	})
}
/*
 * function site(event){ var country=$('#country').val(); if (!country) {
 * alert("请选择采购地址再申请 (Please select the purchase address to apply again)");
 * event.preventDefault(); checkval=0; } }
 */