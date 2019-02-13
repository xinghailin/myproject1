<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/bootstrap.min.css" rel="stylesheet" >
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/echarts/echarts-all.js"></script>
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="FINLISTONE_INVENTORYQUOTATION" namespace="car-ms"/>">
<style>
    .selbox{
        width:100%;
        display: flex;
        display: -webkit-flex;
        justify-content: center;
    }
    #sel{
        padding: 5px 10px;
        font-size: 14px;
        border-radius: 4px;
    }
</style>
<div class="main_right" id="viewList" style="margin-left: 300px; width: 1550px; height: 190%;">
	<form name="searchForm" id="searchForm"
		action="<ufa:url fieldName="CAR_EXPORTEXCEL" namespace="car-ms"/>" method="post"
		target="hideiframe">
		<input type="hidden" name="shopId" id="shopId" value="${carFinanceShopDto.shopId}">
		<ul class="tb_ul02">
			<li>
				<input id="id" value="${id}" type="hidden" />
			</li>
		</ul>
	</form>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="height: 400px"></div>
	<div class="selbox">
		<select name="" id="sel">
			<option value="1">查询近一个月</option>
			<option value="2">查询近三个月</option>
			<option value="3">查询近半年</option>
		</select>
	</div>
	<div class="btnlist">
		<div style="width: 250px; margin: auto;">
			<a id='backBtn' href="javascript:void(0);" class="btn63_01 margin_let10">返回</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	// 基于准备好的dom，初始化echarts图表
	var myChart = echarts.init(document.getElementById('main'));
	var id = $('#id').val();
	$.when($.ajax({
		url : $('#searchUrl').val(),
		type : 'POST',
		data : {
			id : id
		}
	})).then(function(data) {
		data.reverse();
		var timeArr = [];
		var priceArr = [];
		var name = data[0].brand;
		var subtext = new Date(data[0].quoteDate);
		var year = subtext.getFullYear();
		$.each(data, function() {
			var date = new Date(this.quoteDate);
			var year = date.getFullYear();

			timeArr.push((date.getMonth() + 1) + "/" + date.getDate());
			priceArr.push(this.marketPrice);

		});
		echars(name, year, timeArr, priceArr);
		function echars(name, year, timeArr, priceArr) {
			option = {
				title : {
					x : 'left',
					text : name + '车价变化',
					subtext : year + "年",
					subtextStyle : {
						color : '#000', // 副标题文字颜色
						fontWeight : 'bold',
						fontSize : 14
					}
				},
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					data : [ '车价' ]
				},
				toolbox : {
					show : true,
					feature : {
						mark : {
							show : false,
							title : {
								mark : '辅助线开关',
								markUndo : '删除辅助线',
								markClear : '清空辅助线'
							},
							lineStyle : {
								width : 2,
								color : '#1e90ff',
								type : 'dashed'
							}
						},
						dataZoom : {
							show : true,
							title : {
								dataZoom : '区域缩放',
								dataZoomReset : '区域缩放后退'
							}
						},
						dataView : {
							show : true,
							readOnly : false
						},
						magicType : {
							show : true,
							type : [ 'line', 'bar' ]
						},
						restore : {
							show : true
						},
						saveAsImage : {
							show : true
						}
					}
				},
				calculable : true,
				xAxis : [ {
					type : 'category',
					boundaryGap : false,
					data : timeArr
				} ],
				yAxis : [ {
					type : 'value',
					axisLabel : {
						formatter : '{value} 元'
					}

				} ],

				calculable : false,
				series : [ {
					name : '车价',
					type : 'line',
					data : priceArr,
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
					markLine : {
						data : [ {
							type : 'average',
							name : '平均值'
						} ]
					}
				} ]
			};
		}
		// 为echarts对象加载数据
		myChart.setOption(option);

		$("#sel").change(function() {
			var val = $("#sel").val();
			var month = 1;
			if (val == 1) {
				month = 1;
			} else if (val == 2) {
				month = 3;
			} else if (val == 3) {
				month = 6;
			}
			myChart.clear();
			$.when($.ajax({
				url : $('#searchUrl').val(),
				type : 'POST',
				data : {
					id : id,
					month : month
				}
			})).then(function(data) {
				data.reverse();
				var timeArr = [];
				var priceArr = [];
				var name = data[0].quoteName;
				var subtext = new Date(data[0].quoteDate);
				var year = subtext.getFullYear();
				$.each(data, function() {
					var date = new Date(this.quoteDate);
					var year = date.getFullYear();
					timeArr.push((date.getMonth() + 1) + "/" + date.getDate());
					priceArr.push(this.marketPrice);
				});
				echars(name, year, timeArr, priceArr);
				myChart.setOption(option);
			})

		})
	});
	$("#backBtn").bind("click", back);
	function back(){
		window.history.go(-1);
	}
</script>