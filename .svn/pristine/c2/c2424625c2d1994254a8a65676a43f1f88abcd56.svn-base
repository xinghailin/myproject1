<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<input type="hidden" id="backUrl"
	value="<ufa:url fieldName="BondedWarehouseEntryListPage" namespace="car-ms"/>">
<script src="${scriptBasePath}/base/jquery-2.1.4.min.js"></script>
<script src="${scriptBasePath}/base/jquery.jedate.js"></script>
<link href="${cssBasePath}/jedate.css" rel="stylesheet">
<div class="mian_right-new" id="EA">
	<div class="rg_list">
		<h1 class="tt_h1" id="He">入保税区仓库检验单</h1>
		<form name="editForm" id="editForm" method="POST"
			action="<ufa:url namespace="car-ms" fieldName="saveCheckTheBondedArea"/>"
			enctype="multipart/form-data">
			<div class="tb_list">
				<ul class="tb_ul02">
					<li style="border-bottom: none;">
						<div class="tab_txt01">
							<span class="td_01" style="width: 100px;">
								<font size="5">车辆信息</font>
							</span>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">采购计划编号：</span>
								<span class="td_02" style="margin-top: 10px;">${car.buycode }</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">采购计划名称：</span>
								<span class="td_02" style="margin-top: 10px;">${car.buyname }</span>
							</div>
						</div>
					</li>

					<li style="border-bottom: none;">
						<input id="currpage" value="${currpage }" type="hidden" name="currpage" />
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">品牌：</span>
								<span class="td_02" style="margin-top: 10px;">${car.brand}</span>
							</div>
						</div>

						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">型号：</span>
								<span class="td_02" style="margin-top: 10px;">${car.model}</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01" style="width: 600px">
								<span class="td_01" style="width: 240px">版别：</span>
								<span class="td_02" style="margin-top: 10px;">${car.version}</span>
							</div>
						</div>
					</li>
					<li style="border-bottom: none;">
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">车架号：</span>
								<span class="td_02" style="margin-top: 10px;">${car.vin}&nbsp;</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">外观颜色：</span>
								<span class="td_02" style="margin-top: 10px;">${car.outcolor}&nbsp;</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">内饰颜色：</span>
								<span class="td_02" style="margin-top: 10px;">${car.incolor}&nbsp;</span>
							</div>
						</div>
					</li>
					<li style="border-bottom: none;">
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">供应商名称：</span>
								<span class="td_02" style="margin-top: 10px; width: 150px;">${car.buyername}&nbsp;</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">货物运送地点：</span>
								<span class="td_02" style="margin-top: 10px;">${stor.name}&nbsp;</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">约定入库时间：</span>
								<span class="td_02" style="margin-top: 10px;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${car.appointtime}" />
									&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li>

						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px;">付款时间：</span>
								<span class="td_02" style="margin-top: 10px;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${car.createtime}" />
									&nbsp;
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01" style="width: 750px">
								<span class="td_01" style="width: 240px;">配置：</span>
								<span class="td_02" style="margin-top: 10px;">
									<textarea style="resize: none;" rows="5" cols="40" readonly="readonly">${car.config}</textarea>
									&nbsp;
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01" style="width: 650px;">
								<span class="td_01" style="width: 240px;">备注：</span>
								<span style="margin-top: 10px; resize: none;">
									<textarea rows="5" cols="40" readonly="readonly">${car.note}</textarea>
									&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 150px;">
								<font size="5">车辆价格信息</font>
							</span>
						</div>
					</li>
					</li>
					<li style="border-bottom: none;">
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">车价：</span>
								<span class="td_02" style="margin-top: 10px;">${car.price}&nbsp;
									<c:if test="${car.currency==1 }">C$</c:if>
									<c:if test="${car.currency==2 }">$</c:if>
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">成本价：</span>
								<span class="td_02" style="margin-top: 10px;">${car.costprice }&nbsp;<c:if
										test="${car.currency==1 }">C$</c:if>
									<c:if test="${car.currency==2 }">$</c:if>
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">买手返佣：</span>
								<span class="td_02" style="margin-top: 10px;">${car.rebate}&nbsp;<c:if
										test="${car.currency==1 }">C$</c:if>
									<c:if test="${car.currency==2 }">$</c:if>
								</span>
							</div>
						</div>
					</li>
					<li style="border-bottom: none;">

						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">4s店杂费：</span>
								<span class="td_02" style="margin-top: 10px;">${car.othercost }&nbsp;<c:if
										test="${car.currency==1 }">C$</c:if>
									<c:if test="${car.currency==2 }">$</c:if>
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">车辆保险：</span>
								<span class="td_02" style="margin-top: 10px;">${car.insurance}&nbsp;<c:if
										test="${car.currency==1 }">C$</c:if>
									<c:if test="${car.currency==2 }">$</c:if>
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">退保违约金：</span>
								<span class="td_02" style="margin-top: 10px;">${car.latecost }&nbsp;<c:if
										test="${car.currency==1 }">C$</c:if>
									<c:if test="${car.currency==2 }">$</c:if>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">消费税：</span>
								<span class="td_02" style="margin-top: 10px;">${car.expensetax}&nbsp;<c:if
										test="${car.currency==1 }">C$</c:if>
									<c:if test="${car.currency==2 }">$</c:if>
								</span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">4s销售佣金：</span>
								<span class="td_02" style="margin-top: 10px;">${car.salecost }&nbsp;<c:if
										test="${car.currency==1 }">C$</c:if>
									<c:if test="${car.currency==2 }">$</c:if>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 100px;">
								<font size="5">报关信息</font>
							</span>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">船名：</span>
								<span class="td_02" style="margin-top: 10px;">${car.shipname } </span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">航次：</span>
								<span class="td_02" style="margin-top: 10px;">${car.voyage } </span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">柜号：</span>
								<span class="td_02" style="margin-top: 10px;"> ${car.containernum } &nbsp;</span>
							</div>
						</div>
					</li>

					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">订舱号：</span>
								<span class="td_02" style="margin-top: 10px;">${car.bookingnum } </span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">出口单位名称：</span>
								<span class="td_02" style="margin-top: 10px;">${car.exportcorpname } </span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">收货单位名称：</span>
								<span class="td_02" style="margin-top: 10px;">${car.receivingcorpname } &nbsp;</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">货物名称：</span>
								<span class="td_02" style="margin-top: 10px;">${car.goodname } </span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">毛重：</span>
								<span class="td_02" style="margin-top: 10px;">${car.roughweight } </span>
							</div>
						</div>
						<div class="tbul02_right02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">启运时间：</span>
								<span class="td_02" style="margin-top: 10px;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${car.starttime}" />
									&nbsp;
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">到港时间：</span>
								<span class="td_02" style="margin-top: 10px;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${car.arrivetime}" />
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 30%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 240px">目标港口：</span>
								<span class="td_02" style="margin-top: 10px;">${car.goalhaven}</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 75px;">
								<font size="5">拥有证</font>
							</span>
						</div>
					</li>
					<li style="width: 240px; float: left;">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${car.iden1}" style="width: 100px; height: 100px;" id="productImg1">
							</span>
						</div>
						<div class="tab_txt01">
							<c:if test="${car.datatype!=2}">
								<span class="td_02" style="margin-left: 20px">拥有证 </span>
							</c:if>
							<c:if test="${car.datatype==2}">
								<span class="td_02" style="margin-left: 20px">国际提货单</span>
							</c:if>

						</div>
					</li>
					<c:if test="${car.country!=2 }">
						<li style="width: 20%; float: left">
							<div class="tab_txt01">
								<span class="td_01" style="margin-left: 50px">
									<img src="${contextPath}${car.iden2}" style="width: 100px; height: 100px;" id="productImg2">
								</span>
							</div>
							<div class="tab_txt01" id="divPD">
								<span class="td_02" style="margin-left: 20px">
									Invoice<br />
								</span>
							</div>
						</li>
					</c:if>
					<li style="width: 20%; float: left">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${car.iden3}" style="width: 100px; height: 100px;" id="productImg3">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<span class="td_02" style="margin-left: 20px">汽车名牌照片 </span>
						</div>

					</li>
					<li style="width: 20%; float: left">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${car.iden4}" style="width: 100px; height: 100px;" id="productImg5">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<c:if test="${car.datatype!=2}">
								<span class="td_02" style="margin-left: 20px">证件4</span>
							</c:if>
							<c:if test="${car.datatype==2}">
								<span class="td_02" style="margin-left: 20px">装货柜照片</span>
							</c:if>
						</div>
					</li>
					<li style="width: 20%; float: left">
						<div class="tab_txt01">
							<span class="td_01" style="margin-left: 50px">
								<img src="${contextPath}${car.iden5}" style="width: 100px; height: 100px;" id="productImg4">
							</span>
						</div>
						<div class="tab_txt01" id="divPD">
							<c:if test="${car.datatype!=2}">
								<span class="td_02" style="margin-left: 20px">证件5</span>
							</c:if>
							<c:if test="${car.datatype==2}">
								<span class="td_02" style="margin-left: 20px">货柜信息</span>
							</c:if>
						</div>
					</li>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 120px;">
								<font size="5">检验单照片</font>
							</span>
						</div>
					</li>
					<c:forEach var="file" items="${file }">
						<c:if test="${car.datatype!=2}">
							<c:if test="${file.type==3}">
								<li style="width: 20%; float: left">
									<div class="tab_txt01">
										<span class="td_01" style="margin-left: 50px">
											<img src="${contextPath}${file.location}" style="width: 100px; height: 100px;"
												id="productImg4">
										</span>
									</div>
									<div class="tab_txt01" id="divPD">
										<span class="td_02" style="margin-left: 20px">
											<c:if test="${car.currency==1 }">加拿大检验单图片</c:if>
											<c:if test="${car.currency==2 }">中东检验单图片</c:if>
										</span>
									</div>
								</li>
							</c:if>
						</c:if>
						<c:if test="${file.type==4}">
							<li style="width: 20%; float: left">
								<div class="tab_txt01">
									<span class="td_01" style="margin-left: 50px">
										<img src="${contextPath}${file.location}" style="width: 100px; height: 100px;"
											id="productImg4">
									</span>
								</div>
								<div class="tab_txt01" id="divPD">
									<span class="td_02" style="margin-left: 20px">
										中国检验单图片<br />
									</span>
								</div>
							</li>
						</c:if>
					</c:forEach>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 100px;">
								<font size="5">报关文件</font>
							</span>
						</div>
					</li>
					<c:forEach var="file" items="${file }">
						<c:if test="${file.type==1}">
							<li style="width: 20%; float: left">
								<div class="tab_txt01">
									<span class="td_01" style="margin-left: 50px">
										<img src="${contextPath}${file.location}" style="width: 100px; height: 100px;"
											id="productImg4">
									</span>
								</div>
							</li>
						</c:if>
					</c:forEach>
					<li>
						<div class="tab_txt01">
							<span class="td_01" style="width: 100px;">
								<font size="5">退税文件</font>
							</span>
						</div>
					</li>
					<c:forEach var="file" items="${file }">
						<c:if test="${file.type==2}">
							<li style="width: 20%; float: left">
								<div class="tab_txt01">
									<span class="td_01" style="margin-left: 50px">
										<img src="${contextPath}${file.location}" style="width: 100px; height: 100px;"
											id="productImg4">
									</span>
								</div>
							</li>
						</c:if>
					</c:forEach>
					<div id="check">
						<li style="border-bottom: none;">
							<div class="tab_txt01">
								<span class="td_01" style="width: 300px;">
									<font size="5">车辆外观与漆面检查(必选)</font>
								</span>
							</div>
						</li>
						<li style="border-bottom: none;" id="carimage1">
							<input type="hidden" name="id" value="${id }"> <input type="hidden" name="carid"
								value="${carid }">
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">前保险杠：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" id="frontBumper" name="frontbumper" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">引擎盖：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="bonnet" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">左右叶子板：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="leafboard" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">车顶：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="roof" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">车门：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="cardoor" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">左右后轮板：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="wheelplate" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">后箱盖：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="casecover" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">后保险杠：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="bumper" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">漆面是否有色差：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="lacquer" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">漆面是否有缝隙：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="gap" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">前后挡风玻璃：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="windshield" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">车门玻璃：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="cardoorglass" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">其他玻璃：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="otherglass" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">雨刮：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="wiperblade" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">雨刮臂：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="wiperbladearm" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">标志：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="sign" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">电镀饰条：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="electroplatepanel" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">车门把手：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="doorhandle" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">外照后视镜：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="rearviewmirror" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">头灯：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="headllight" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">测灯：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="sidelight" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">尾灯：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="taillight" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">第三刹车灯：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="stoplight" value="2" /> &nbsp;
									</span>
								</div>
							</div>

						</li>
						<li>
							<div class="tab_txt01" style="text-align: center; padding: 10px 0;">
								<input type="checkbox" onclick="selectCheckBoxes('carimage1', this.checked)" /><label
									style="color: red; position: relative; top: -3px; padding: 15px 0; left: 10px;">全选</label><br />
							</div>
						</li>
						<li style="border-bottom: none;">
							<div class="tab_txt01">
								<span class="td_01" style="width: 220px;">
									<font size="5">车辆室内检查(必选)</font>
								</span>
							</div>
						</li>
						<li id="carimage2" style="border-bottom: none;">
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">遥控器功能：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="remotecontrol" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">钥匙对车门开锁上锁功能：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="doorlock" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">方向盘：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="steeringwheel" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">仪表盘：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="instrumentpanel" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">手套箱：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="glovebox" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">顶棚：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="ceiling" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">遮阳板外观：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="sunlouver" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">排挡杆：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="gearlever" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">手刹：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="parkingbrake" value="2" /> &nbsp;
									</span>
								</div>

								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">中间置物箱外观及功能：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="englishconsole" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">仪表外观：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="instrument" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">喇叭：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="trumpet" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">室内灯：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="roomlight" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">雨刷及喷水：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="rwiperblade" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">头灯：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="rheadllight" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">转向灯：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="rturnlight" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">测灯：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="rsidelight" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">尾灯：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="rtaillight" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">刹车灯：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="rstoplight" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">空调：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="airconditioner" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">音响功能：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="sound" value="2" /> &nbsp;
									</span>
								</div>

								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">玻璃升降：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="liftingofglass" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">外后视镜调整功能：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="mirroradjustment" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">座椅调整：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="seatadjustment" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">安全带外观及功能：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="safetybelt" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">地毯及踏垫：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="carpet" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">车门饰板及胶条：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="doortrim" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">前、中、后柱饰板外观及安装定位：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="trimappearance" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">车门内外把手开启功能：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="panicrelease" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">引擎盖及后盖箱、油箱盖开启功能：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="bonnetopen" value="2" /> &nbsp;
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="tab_txt01" style="text-align: center; padding: 10px 0;">
								<input type="checkbox" onclick="selectCheckBoxes('carimage2', this.checked)" /><label
									style="color: red; position: relative; top: -3px; padding: 15px 0; left: 10px;">全选</label><br />
							</div>
						</li>
						<li style="border-bottom: none;">
							<div class="tab_txt01">
								<span class="td_01" style="width: 220px;">
									<font size="5">发动机室检查(必选)</font>
								</span>
							</div>
						</li>
						<li id="carimage3" style="border-bottom: none;">
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">刹车油壶：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="brakeoilpot" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">转向助力泵：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="boosterpump" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">副水箱：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="expansiontank" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">雨刷喷水壶：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="blowcan" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">电瓶外观：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="battery" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">各油管束夹有无泄漏：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="pipeline" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">各水管束夹有无泄漏：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="waterpipe" value="2" /> &nbsp;
									</span>
								</div>

								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">发动机是否能启动：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="engine" value="2" /> &nbsp;
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="tab_txt01" style="text-align: center; padding: 10px 0;">
								<input type="checkbox" onclick="selectCheckBoxes('carimage3', this.checked)" /><label
									style="color: red; position: relative; top: -3px; padding: 15px 0; left: 10px;">全选</label><br />
							</div>
						</li>
						<li style="border-bottom: none;">
							<div class="tab_txt01">
								<span class="td_01" style="width: 200px;">
									<font size="5">后箱室检查(必选)</font>
								</span>
							</div>
						</li>
						<li id="carimage4" style="border-bottom: none;">
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">后箱锁上锁及开锁功能：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="backboxlock" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">后箱照明灯功能：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="backboxlight" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">工具包：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="toolkit" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">后箱行李垫：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="newpassat" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">饰板外观：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="trimplank" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">油箱盖功能：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="fueltankcap" value="2" /> &nbsp;
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="tab_txt01" style="text-align: center; padding: 10px 0;">
								<input type="checkbox" onclick="selectCheckBoxes('carimage4', this.checked)" /><label
									style="color: red; position: relative; top: -3px; padding: 15px 0; left: 10px;">全选</label><br />
							</div>
						</li>
						<li style="border-bottom: none;">
							<div class="tab_txt01">
								<span class="td_01" style="width: 180px;">
									<font size="5">底盘检查(必选)</font>
								</span>
							</div>
						</li>
						<li id="carimage5" style="border-bottom: none;">
							<div class="tbul02_left02" style="width: 20%">

								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">发动机下方有无漏油及漏水痕迹：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="engineoilleak" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">变速箱下方有无漏油及漏水痕迹：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="gearboxoilleak" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">各水管有无渗漏痕迹：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="bwaterpipe" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">各油管有无渗漏痕迹：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="bpipeline" value="2" /> &nbsp;
									</span>
								</div>

								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">传动轴有无漏油痕迹：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="transmission" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">转向系统有无漏油痕迹：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="steeringsystem" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">制动系统有无漏油痕迹：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="brakingsystem" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">悬挂系统有无漏油痕迹：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="suspensionsystem" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">轮胎：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="tyre" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">轮毂外观：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="wheelhub" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">胎压：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="tirepressure" value="2" /> &nbsp;
									</span>
								</div>
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">叶子板内衬：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="fender" value="2" /> &nbsp;
									</span>
								</div>
							</div>
							<div class="tbul02_left02" style="width: 20%">
								<div class="tab_txt01">
									<span class="td_01" style="width: 200px;">说明书：</span>
									<span class="td_02" style="margin-top: 10px;">
										<input type="checkbox" name="specification" value="2" /> &nbsp;
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="tab_txt01" style="text-align: center; padding: 10px 0;">
								<input type="checkbox" onclick="selectCheckBoxes('carimage5', this.checked)" /><label
									style="color: red; position: relative; top: -3px; padding: 15px 0; left: 10px;">全选</label><br />
							</div>
						</li>
					</div>
					<li style="border-bottom: none;">
						<div class="tab_txt01">
							<span class="td_01" style="width: 280px;">
								<font size="5">车辆外观和内饰(非必选)</font>
							</span>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 20%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 200px;">天窗总成及外观：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input type="checkbox" name="louver" value="2" /> &nbsp;
								</span>
							</div>
							<div class="tab_txt01">
								<span class="td_01" style="width: 200px;">雾灯：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input type="checkbox" name="foglight" value="2" /> &nbsp;
								</span>
							</div>
							<div class="tab_txt01">
								<span class="td_01" style="width: 200px;">仪表各指示灯及危险警告灯功能：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input type="checkbox" name="instrumentlight" value="2" /> &nbsp;
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 20%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 200px;">烟灰缸：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input type="checkbox" name="ashtray" value="2" /> &nbsp;
								</span>
							</div>
							<div class="tab_txt01">
								<span class="td_01" style="width: 200px;">化妆镜含灯外观及功能：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input type="checkbox" name="cosmeticmirror" value="2" /> &nbsp;
								</span>
							</div>
							<div class="tab_txt01">
								<span class="td_01" style="width: 200px;">儿童锁功能：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input type="checkbox" name="childlock" value="2" /> &nbsp;
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 20%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 200px;">电座椅加热功能：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input type="checkbox" name="seatelectri" value="2" /> &nbsp;
								</span>
							</div>
							<div class="tab_txt01">
								<span class="td_01" style="width: 200px;">座椅折叠：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input type="checkbox" name=foldingseat value="2" /> &nbsp;
								</span>
							</div>
							<div class="tab_txt01">
								<span class="td_01" style="width: 200px;">点烟器：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input type="checkbox" name="cigarlighter" value="2" /> &nbsp;
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 20%">

							<div class="tab_txt01">
								<span class="td_01" style="width: 200px;">备胎是否磨损损伤：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input type="checkbox" name="backup" value="2" /> &nbsp;
								</span>
							</div>
							<div class="tab_txt01">
								<span class="td_01" style="width: 200px;">三角警示架：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input type="checkbox" name="triangularwarning" value="2" /> &nbsp;
								</span>
							</div>
							<div class="tab_txt01">
								<span class="td_01" style="width: 200px;">急救包：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input type="checkbox" name="firstaid" value="2" /> &nbsp;
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 20%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 200px;">灭火器：</span>
								<span class="td_02" style="margin-top: 10px;">
									<input type="checkbox" name="extinguisher" value="2" /> &nbsp;
								</span>
							</div>

						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 33%">
							<div class="tab_txt01">
								<span class="td_01" style="margin-left: 50px">
									<img src="" style="width: 100px; height: 100px;" id="productImg6">
								</span>
							</div>
							<div class="tab_txt01" id="divPD">
								<span class="td_02" style="margin-left: 20px">
									检验单照片<br /> <input type="file" name="location" id="location" style="margin-top: 6px"
										onchange="imagePreview(this.files,'productImg6')" />
								</span>
								&nbsp;
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 33%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 200px; color: red;">入保税库时间：</span>
								<span class="td_02" style="margin-top: 4px;">
									<input name="sinbondedtime" id="inbondedtime" class="" type="text" style="width: 150px;"
										readonly>
								</span>
							</div>
						</div>
						<div class="tbul02_left02" style="width: 33%">
							<div class="tab_txt01">
								<span class="td_02" style="margin-left: 20px">
									<a href="${contextPath}/file/验车单模板.xls" class="btn63_01" download>车辆检验单模板下载</a>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="tbul02_left02" style="width: 50%">
							<div class="tab_txt01">
								<span class="td_01" style="width: 200px; color: red;">备注：</span>
								<span class="td_02" style="margin-top: 10px;">
									<textarea name="chinaremarks"
										style="resize: none; width: 477px; height: 100px; overflow-y: auto; border: 1px solid #ccc;"></textarea>
								</span>
							</div>
						</div>
					</li>

					<li>
						<div class="btnlist" style="text-align: center;">
							<input type="button" value="提交" id="buttonSplit" class="btn63_01 margin_let10"
								onclick="mysubmit()">
							<a href="javascript:void(0);" onclick="back()" class="btn63_01 margin_let10">返回</a>
						</div>
					</li>
		</form>
		</ul>
	</div>
</div>
</div>
</div>

<script type="text/javascript">
	var status = true;
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	$("#inbondedtime").jeDate({
		format : "YYYY-MM-DD",
		isTime : false,
		isClear : false,
	});
	$("#inbondedtime").click(function() {
		$("#jedatebox").css({
			top : 2093
		});
	})
	function imagePreview(obj, imgObj) {
		var f = obj[0];
		var src = window.URL.createObjectURL(f);
		$('#' + imgObj).attr('src', src);
		//	window.URL.revokeObjectURL(src);
	}
	function selectCheckBoxes(domId, value) {
		var inputs = document.getElementById(domId).getElementsByTagName(
				"input");
		for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].type == 'checkbox') {
				inputs[i].checked = value;
			}
		}
	}
	function back() {
		location.href = $('#backUrl').val() + "?currpage="
				+ $('#currpage').val();
	}
	function mysubmit() {
		var c = 0;
		$.each($('#check .tab_txt01 .td_02 input'), function() {
			/*  alert($('#location').val()); */
			if (!$(this).prop('checked')) {
				alert($(this).parent().siblings('span').html().slice(0, -1)
						+ "未选择");
				return false;
			} else {
				c++;
			}
		});
		if ($('#check .tab_txt01 .td_02 input').length == c) {
			if ($('#location').val().length == 0) {
				alert("验车单图片未上传！");
				return false;
			} else if ($('#inbondedtime').val().length == 0) {
				alert("入保税区时间必填 ！");
				return false;
			} else {
				if (status) {
					status = false;
					document.getElementById("editForm").submit();
				}
			}
		}
	};
	seajs.use("${scriptBasePath}/jndAssetlibrarylist/jndcardetails.js");
</script>