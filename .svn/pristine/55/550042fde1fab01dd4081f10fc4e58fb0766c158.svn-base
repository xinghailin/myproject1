<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/style/jquery.css" />
<link href="${cssBasePath}/jedate.css" rel="stylesheet">
<input type="hidden" id="backUrl" value="<ufa:url fieldName="PreEntryVehicleListpage" namespace="car-ms"/>">
<input type="hidden" id="saveUrl" value="<ufa:url fieldName="jndAdmissionCheckListsave" namespace="car-ms"/>">
<input type="hidden" id="vinVerifyUrl" value="<ufa:url fieldName="vinVerify" namespace="car-ms"/>">
<input type="hidden" id="enginenumUrl" value="<ufa:url fieldName="enginenumVerify" namespace="car-ms"/>">
<style>
.file input {
	margin: 10px 0;
	width: 227px;
}
</style>
</style>
<div class="mian_right-new" id="EA">
	<div class="rg_list">
		<h1 class="tt_h1" id="He">车辆预入库(Vehicle Pre-Entry Warehouse)</h1>
		<form name="editForm" id="editForm" method="POST" action="<ufa:url namespace="car-ms" fieldName="jndAdmissionCheckListsave"/>" enctype="multipart/form-data">
			<div class="tb_list">
				<ul class="tb_ul02">
					<input type="hidden" id="currpage" name="currpage" value="${currpage }">
					<input type="hidden" name="carid" id="carid" value="${id }">
					<input type="hidden" name="country" id="country" value="${car.country }">
					<input type="hidden" name="selectvalue" id="selectvalue">
					<!-- 选择的仓库名称  -->
					<input type="hidden" id="svin">
					<li style="border-bottom: none;">
						<div class="tab_txt01"><span class="td_01" style="width: 450px;"> <font size="5">车辆信息vehicleInformation(required)</font>
						</span></div>
				</li>
					<li>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01"><span class="td_01" style="width: 150px;">约定入库时间(planArriveRepertoryTime)：</span> <span class="td_02" style="margin-top: 10px;"> <fmt:formatDate
										pattern="yyyy-MM-dd" value="${car.appointtime}" /> &nbsp;
							</span></div>
					</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01"><span class="td_01" style="width: 150px">品牌(brand)：</span> <span class="td_02" style="margin-top: 10px;">${car.brand}</span></div>
					</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01"><span class="td_01" style="width: 180px">型号(model)：</span> <span class="td_02" style="margin-top: 10px;">${car.model}</span></div>
					</div>
						<div class="tbul02_left02" style="width: 25%; margin-left: -20px;">
							<div class="tab_txt01" style="width: 600px"><span class="td_01" style="width: 180px">版别(version)：</span> <span class="td_02" style="margin-top: 10px; width: 190px;">${car.version}</span>
						</div>
					</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01"><span class="td_01" style="width: 150px"> <label class="fc_red">*</label>车架号(vin)：
							</span> <span class="td_02" style="margin-top: 4px;"> <input name="vin" id="vin" class="" type="text" style="width: 150px;">
							</span></div>
					</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01"><span class="td_01" style="width: 150px"> <label class="fc_red">*</label>发动机号(engineNumber)：
							</span> <span class="td_02" style="margin-top: 4px;"> <input name="enginenum" id="enginenum" class="" type="text" style="width: 150px;">
							</span></div>
					</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01"><span class="td_01" style="width: 180px"> <label class="fc_red">*</label>出厂日期(dateOfProduction)：
							</span> <span class="td_02" style="margin-top: 4px;"> <input name="sleavefactime" id="sleavefactime" class="" type="text" style="width: 150px;" readonly>
							</span></div>
					</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01"><span class="td_01" style="width: 180px; margin-left: -20px;"> <label class="fc_red">*</label>仓库(Warehouse)：
							</span> <span class="td_02" style="margin-top: 4px;"> <select id="instoreid" name="instoreid" style="width: 150px;">
										<option value="">--请选择(please select)--</option>
										<c:forEach var="item" items="${store}">
											<option value="<c:out value="${item.id}"></c:out>"><c:out value="${item.name}"></c:out></option>
										</c:forEach>
								</select>
							</span></div>
					</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01"><span class="td_01" style="width: 180px; margin-left: -30px;"> <label class="fc_red">*</label>内饰颜色(incolor)：
							</span> <span class="td_02" style="margin-top: 4px;"> <select id="incolor" name="incolor" style="width: 150px;">
										<c:forEach var="item" items="${list2}">
											<option value="<c:out value="${item}"></c:out>"><c:out value="${item}"></c:out></option>
										</c:forEach>
								</select>
							</span></div>
					</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01"><span class="td_01" style="width: 180px; margin-left: -30px;"> <label class="fc_red">*</label>外饰颜色(outcolor)：
							</span> <span class="td_02" style="margin-top: 4px;"> <select id="outcolor" name="outcolor" style="width: 150px;">
										<c:forEach var="item" items="${list1}">
											<option value="<c:out value="${item}"></c:out>"><c:out value="${item}"></c:out></option>
										</c:forEach>
								</select>
							</span></div>
					</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01"><span class="td_01" style="width: 150px; margin-left: 30px;"> <label class="fc_red">*</label>座位数(seatNum)：
							</span> <span class="td_02" style="margin-top: 4px;"> <input name="seatnum" id="seatnum" class="" type="text" style="width: 150px;">
							</span></div>
					</div>
						<div class="tbul02_left02" style="width: 25%">
							<div class="tab_txt01"><span class="td_01" style="width: 150px; margin-left: 10px;"> <label class="fc_red">*</label>轮胎型号(TireType)：
							</span> <span class="td_02" style="margin-top: 4px;"> <input name="Tiretype" id="Tiretype" class="" type="text" style="width: 150px;">
							</span></div>
					</div>
				</li>
					<div id="hiddenDiv">
						<div id="check">
							<li style="border-bottom: none;">
								<div class="tab_txt01"><span class="td_01" style="width: 800px;"> <font size="5">车辆外观与漆面检查InspectionOfVehicleAppearanceAndPaint(required)</font>
								</span></div>
						</li>
							<li style="border-bottom: none;" id="carimage1">
								<div class="tbul02_left02" style="width: 33%">
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">前保险杠frontGuard：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											id="frontBumper" name="frontbumper" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">引擎盖engineCover：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="bonnet" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">左右叶子板LeftAndRightLeafBoard：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="leafboard" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">车顶carRoof：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="roof" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">车门carDoors：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="cardoor" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">左右后轮板LeftAndRightRearWheel：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="wheelplate" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">后箱盖carTankCover：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="casecover" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">后保险杠tailBumper：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="bumper" value="2" /> &nbsp;
									</span></div>
							</div>
								<div class="tbul02_left02" style="width: 33%">
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">漆面是否有色差lacquerColorCorrect：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="lacquer" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">漆面是否有缝隙withoutCrevice：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="gap" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">前后挡风玻璃front(back)Windshield：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="windshield" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">车门玻璃autoDoorGlass：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="cardoorglass" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">其他玻璃otherGlass：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="otherglass" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">雨刮windscreeWiper：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="wiperblade" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">雨刮臂wiperArm：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="wiperbladearm" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">标志autoLogo：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="sign" value="2" /> &nbsp;
									</span></div>
							</div>
								<div class="tbul02_left02" style="width: 33%">
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">电镀饰条electroplatingDecorations：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="electroplatepanel" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">车门把手doorHandle：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="doorhandle" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">外照后视镜encloserRearviewMirror ：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="rearviewmirror" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">头灯automotiveHeadlamp：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="headllight" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">测灯lightMeasurement：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="sidelight" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">尾灯rearLamp：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="taillight" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">第三刹车灯theThirdBrakeLights：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="stoplight" value="2" /> &nbsp;
									</span></div>
							</div>
						</li>
							<li>
								<div class="tab_txt01" style="text-align: center; padding: 10px 0;"><input type="checkbox" onclick="selectCheckBoxes('carimage1', this.checked)" /><label
									style="color: red; position: relative; top: -3px; padding: 15px 0; left: 10px;">全选(checkAll)</label><br /></div>
						</li>
							<li style="border-bottom: none;">
								<div class="tab_txt01"><span class="td_01" style="width: 560px;"> <font size="5">车辆室内检查vehicleIndoorInspection(required)</font>
								</span></div>
						</li>
							<li id="carimage2" style="border-bottom: none;">
								<div class="tbul02_left02" style="width: 33%">
									<div class="tab_txt01"><span class="td_01" style="width: 430px;"> 遥控器功能<br />remote-controllerFunction：
									</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox" name="remotecontrol" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">钥匙对车门开锁上锁功能keyOpen(lock)TheDoor ：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="doorlock" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">方向盘steeringWheel：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="steeringwheel" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">仪表盘dashboard：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="instrumentpanel" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">手套箱glovebox：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="glovebox" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">顶棚Headlining：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="ceiling" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">遮阳板外观sunVisorAppearance：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="sunlouver" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">排挡杆shiftLever：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="gearlever" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">手刹handbrake：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="parkingbrake" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">中间置物箱外观及功能middleStorageBoxAppearanceAndFunction：</span> <span class="td_02"
										style="margin-top: 10px;"> <input type="checkbox" name="englishconsole" value="2" /> &nbsp;
									</span></div>
							</div>
								<div class="tbul02_left02" style="width: 33%">
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">仪表外观dashboardAppearance：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="instrument" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">喇叭speaker：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="trumpet" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">室内灯interiorLights：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="roomlight" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">雨刷及喷水wipersAndWipersSprayWater：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="rwiperblade" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">头灯automotiveHeadlamp：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="rheadllight" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">转向灯turnLights：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="rturnlight" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">测灯lightMeasurement：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="rsidelight" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">尾灯taillight：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="rtaillight" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">刹车灯stopLamp：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="rstoplight" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">空调air-conditional：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="airconditioner" value="2" /> &nbsp;
									</span></div>
							</div>
								<div class="tbul02_left02" style="width: 33%">
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">音响功能soundFunction：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="sound" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">玻璃升降glassUpAndDown：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="liftingofglass" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">外后视镜调整功能exteriorMirrorAdjustmentFunction：</span> <span class="td_02" style="margin-top: 10px;">
											<input type="checkbox" name="mirroradjustment" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">座椅调整seatAdjustment：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="seatadjustment" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">安全带外观及功能SeatBeltAppearanceAndFunction：</span> <span class="td_02" style="margin-top: 10px;">
											<input type="checkbox" name="safetybelt" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">地毯及踏垫carpetAndMats：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="carpet" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">车门饰板及胶条doorTrimAndDoorStrips：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="doortrim" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">前、中、后柱饰板外观及安装定位frontMiddleAndRearPillarTrimAppearanceAndInstallationOfPositioning：</span> <span
										class="td_02" style="margin-top: 10px;"> <input type="checkbox" name="trimappearance" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">车门内外把手开启功能insideAndOutsideTheHandle0penTheDoorFunction：</span> <span class="td_02"
										style="margin-top: 10px;"> <input type="checkbox" name="panicrelease" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">引擎盖及后盖箱、油箱盖开启功能engineCoverTrunkUelTankCapOpenFunction：</span> <span class="td_02"
										style="margin-top: 10px;"> <input type="checkbox" name="bonnetopen" value="2" /> &nbsp;
									</span></div>
							</div>
						</li>
							<li>
								<div class="tab_txt01" style="text-align: center; padding: 10px 0;"><input type="checkbox" onclick="selectCheckBoxes('carimage2', this.checked)" /><label
									style="color: red; position: relative; top: -3px; padding: 15px 0; left: 10px;">全选(checkAll)</label><br /></div>
						</li>
							<li style="border-bottom: none;">
								<div class="tab_txt01"><span class="td_01" style="width: 650px;"> <font size="5">发动机室检查engineCompartmentAnExamination(required)</font>
								</span></div>
						</li>
							<li id="carimage3" style="border-bottom: none;">
								<div class="tbul02_left02" style="width: 33%">
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">刹车油壶brakeOilPot：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="brakeoilpot" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">转向助力泵powerSteeringPump：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="boosterpump" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">副水箱viceTank：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="expansiontank" value="2" /> &nbsp;
									</span></div>
							</div>
								<div class="tbul02_left02" style="width: 33%">
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">雨刷喷水壶wiperWaterSprayCans：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="blowcan" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">电瓶外观BatteryAppearance：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="battery" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">各油管束夹有无泄漏oilTubeWhetherLeakage：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="pipeline" value="2" /> &nbsp;
									</span></div>
							</div>
								<div class="tbul02_left02" style="width: 33%">
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">各水管束夹有无泄漏 waterPipeWhetherLeakage：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="waterpipe" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">发动机是否能启动engineCanWork：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="engine" value="2" /> &nbsp;
									</span></div>
							</div>
						</li>
							<li>
								<div class="tab_txt01" style="text-align: center; padding: 10px 0;"><input type="checkbox" onclick="selectCheckBoxes('carimage3', this.checked)" /><label
									style="color: red; position: relative; top: -3px; padding: 15px 0; left: 10px;">全选(checkAll)</label><br /></div>
						</li>
							<li style="border-bottom: none;">
								<div class="tab_txt01"><span class="td_01" style="width: 440px;"> <font size="5">后箱室检查theRearBoxCheck(required)</font>
								</span></div>
						</li>
							<li id="carimage4" style="border-bottom: none;">
								<div class="tbul02_left02" style="width: 33%">
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">后箱锁上锁及开锁功能theRearBoxLocksTheLockAndOpenFunction：</span> <span class="td_02"
										style="margin-top: 10px;"> <input type="checkbox" name="backboxlock" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">后箱照明灯功能theRearBoxLightingFunction：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="backboxlight" value="2" /> &nbsp;
									</span></div>
							</div>
								<div class="tbul02_left02" style="width: 33%">
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">工具包toolkit：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="toolkit" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">后箱行李垫theRearBoxLuggagePadAppearance：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="newpassat" value="2" /> &nbsp;
									</span></div>
							</div>
								<div class="tbul02_left02" style="width: 33%">
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">饰板外观afterTheBoxTrimAppearance：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="trimplank" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">油箱盖功能fuelTankFeatures：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="fueltankcap" value="2" /> &nbsp;
									</span></div>
							</div>
						</li>
							<li>
								<div class="tab_txt01" style="text-align: center; padding: 10px 0;"><input type="checkbox" onclick="selectCheckBoxes('carimage4', this.checked)" /><label
									style="color: red; position: relative; top: -3px; padding: 15px 0; left: 10px;">全选(checkAll)</label><br /></div>
						</li>
							<li style="border-bottom: none;">
								<div class="tab_txt01"><span class="td_01" style="width: 440px;"> <font size="5">底盘检查chassisInspection(required)</font>
								</span></div>
						</li>
							<li id="carimage5" style="border-bottom: none;">
								<div class="tbul02_left02" style="width: 33%">
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">发动机下方有无漏油及漏水痕迹noOilAndWateLeakUnderTheEngine：</span> <span class="td_02" style="margin-top: 10px;">
											<input type="checkbox" name="engineoilleak" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">变速箱下方有无漏油及漏水痕迹noOilAndWaterLeakUnderTheGearbox：</span> <span class="td_02" style="margin-top: 10px;">
											<input type="checkbox" name="gearboxoilleak" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">各水管有无渗漏痕迹noTraceOfWaterPipeLeak：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="bwaterpipe" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">各油管有无渗漏痕迹noTraceOfOilTubeLeak：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="bpipeline" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">传动轴有无漏油痕迹transmissionShaftHasNoOilLeakTrace：</span> <span class="td_02" style="margin-top: 10px;">
											<input type="checkbox" name="transmission" value="2" /> &nbsp;
									</span></div>
							</div>
								<div class="tbul02_left02" style="width: 33%">
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">转向系统有无漏油痕迹steeringSystemHasNoOilLeakTrace：</span> <span class="td_02" style="margin-top: 10px;">
											<input type="checkbox" name="steeringsystem" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">制动系统有无漏油痕迹brakingSystemHasNoOilLeakTrace：</span> <span class="td_02" style="margin-top: 10px;">
											<input type="checkbox" name="brakingsystem" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">悬挂系统有无漏油痕迹suspensionSystemHasNoOilLeakTrace：</span> <span class="td_02" style="margin-top: 10px;">
											<input type="checkbox" name="suspensionsystem" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">轮胎tire：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="tyre" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">轮毂外观wheelHub：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="wheelhub" value="2" /> &nbsp;
									</span></div>
							</div>
								<div class="tbul02_left02" style="width: 33%">
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">胎压tirePressure：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="tirepressure" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">叶子板内衬leafBoardLining：</span> <span class="td_02" style="margin-top: 10px;"> <input
											type="checkbox" name="fender" value="2" /> &nbsp;
									</span></div>
									<div class="tab_txt01"><span class="td_01" style="width: 430px;">说明书instructions：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
											name="specification" value="2" /> &nbsp;
									</span></div>
							</div>
						</li>
							<li>
								<div class="tab_txt01" style="text-align: center; padding: 10px 0;"><input type="checkbox" onclick="selectCheckBoxes('carimage5', this.checked)" /><label
									style="color: red; position: relative; top: -3px; padding: 15px 0; left: 10px;">全选(checkAll)</label><br /></div>
						</li>
					</div>
						<li style="border-bottom: none;">
							<div class="tab_txt01"><span class="td_01" style="width: 668px;"> <font size="5">车辆外观和内饰VehicleAppearanceAndInterior(NotAChoice)</font>
							</span></div>
					</li>
						<li style="border-bottom: none;">
							<div class="tbul02_left02" style="width: 33%">
								<div class="tab_txt01"><span class="td_01" style="width: 430px;">天窗总成及外观skylightAssemblyAndAppearance：</span> <span class="td_02" style="margin-top: 10px;"> <input
										type="checkbox" name="louver" value="2" /> &nbsp;
								</span></div>
								<div class="tab_txt01"><span class="td_01" style="width: 430px;">雾灯fogLamp：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
										name="foglight" value="2" /> &nbsp;
								</span></div>
								<div class="tab_txt01"><span class="td_01" style="width: 430px;">仪表各指示灯及危险警告灯功能dashboardInteriorLightsAndHazardWarningLightUseful：</span> <span class="td_02"
									style="margin-top: 10px;"> <input type="checkbox" name="instrumentlight" value="2" /> &nbsp;
								</span></div>
								<div class="tab_txt01"><span class="td_01" style="width: 430px;">烟灰缸ashtray：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
										name="ashtray" value="2" /> &nbsp;
								</span></div>
								<div class="tab_txt01"><span class="td_01" style="width: 430px;">化妆镜含灯外观及功能make-upMirrorLightAppearanceAndFunction：</span> <span class="td_02"
									style="margin-top: 10px;"> <input type="checkbox" name="cosmeticmirror" value="2" /> &nbsp;
								</span></div>
						</div>
							<div class="tbul02_left02" style="width: 33%">
								<div class="tab_txt01"><span class="td_01" style="width: 430px;">儿童锁功能childLockFunction：</span> <span class="td_02" style="margin-top: 10px;"> <input
										type="checkbox" name="childlock" value="2" /> &nbsp;
								</span></div>
								<div class="tab_txt01"><span class="td_01" style="width: 430px;">电座椅加热功能electricSeatHeatingFunction：</span> <span class="td_02" style="margin-top: 10px;"> <input
										type="checkbox" name="seatelectri" value="2" /> &nbsp;
								</span></div>
								<div class="tab_txt01"><span class="td_01" style="width: 430px;">座椅折叠seatFolded：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
										name=foldingseat value="2" /> &nbsp;
								</span></div>
								<div class="tab_txt01"><span class="td_01" style="width: 430px;">点烟器cigaretteLighter：</span> <span class="td_02" style="margin-top: 10px;"> <input
										type="checkbox" name="cigarlighter" value="2" /> &nbsp;
								</span></div>
								<div class="tab_txt01"><span class="td_01" style="width: 430px;">备胎是否磨损损伤spareTireWearAndTearDamage：</span> <span class="td_02" style="margin-top: 10px;"> <input
										type="checkbox" name="backup" value="2" /> &nbsp;
								</span></div>
						</div>
							<div class="tbul02_left02" style="width: 33%">
								<div class="tab_txt01"><span class="td_01" style="width: 430px;">三角警示架triangleWarningFrame：</span> <span class="td_02" style="margin-top: 10px;"> <input
										type="checkbox" name="triangularwarning" value="2" /> &nbsp;
								</span></div>
								<div class="tab_txt01"><span class="td_01" style="width: 430px;">急救包firstAidKit：</span> <span class="td_02" style="margin-top: 10px;"> <input type="checkbox"
										name="firstaid" value="2" /> &nbsp;
								</span></div>
								<div class="tab_txt01"><span class="td_01" style="width: 430px;">灭火器fireExtinguisher：</span> <span class="td_02" style="margin-top: 10px;"> <input
										type="checkbox" name="extinguisher" value="2" /> &nbsp;
								</span></div>
						</div>
					</li>
						<li class="file">
							<div class="tbul02_left02" style="width: 33%">
								<div class="tab_txt01"><span class="td_01" style="width: 430px;">备注remarks：</span> <span class="td_02" style="margin-top: 10px;"> <textarea id="canadaremarks"
										name="canadaremarks" style="resize: none; width: 477px; height: 100px; overflow-y: auto; border: 1px solid #ccc;"></textarea>
								</span></div>
						</div>
							<div class="tbul02_left02" style="width: 33%">
								<div class="tab_txt01"><span class="td_01" style="margin-left: 50px"> <img src="" style="width: 100px; height: 100px;" id="productImg11">
								</span></div>
								<div class="tab_txt01" id="divPD"><span class="td_02" style="margin-left: 100px"> <label class="fc_red">*</label>检验单照片testPicture<br /> <input type="file"
										name="location" id="location" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg11')" />
								</span> &nbsp; </span></div>
						</div>
							<div class="tbul02_left02" style="width: 33%">
								<div class="tab_txt01"><a href="${contextPath}/file/VehicleCheckList.xlsx" class="btn63_01" download>检车单模板下载(CheckSheetTemplateDownload)</a></div>
						</div>
					</li>
						<li style="width: 20%; float: left;" class="file">
							<div class="tab_txt01"><span class="td_01" style="margin-left: 50px"> <img src="" style="width: 100px; height: 100px;" id="productImg1">
							</span></div>
							<div class="tab_txt01" id="divPL"><span class="td_02" style="margin-left: 20px"> <label class="fc_red">*</label>拥有证carCredentials<br /> <input type="file"
									name="siden1" id="iden1" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg1')" />&nbsp;
							</span></div>
					</li> <c:if test="${car.country!=2 }">
							<li style="width: 20%; float: left" class="file">
								<div class="tab_txt01"><span class="td_01" style="margin-left: 50px"> <img src="" style="width: 100px; height: 100px;" id="productImg2">
								</span></div>
								<div class="tab_txt01" id="divPD"><span class="td_02" style="margin-left: 20px"> <label class="fc_red">*</label>Invoice<br /> <input type="file" name="siden2"
										id="iden2" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg2')" />&nbsp;
								</span></div>
							</li>
						</c:if>
						<li style="width: 20%; float: left" class="file">
							<div class="tab_txt01"><span class="td_01" style="margin-left: 50px"> <img src="" style="width: 100px; height: 100px;" id="productImg3">
							</span></div>
							<div class="tab_txt01" id="divPD"><span class="td_02" style="margin-left: 20px"> <label class="fc_red">*</label>汽车名牌照片PicturesOfCarBrands<br /> <input
									type="file" name="siden3" id="iden3" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg3')" />&nbsp;
							</span></div>
					</li>
						<li style="width: 20%; float: left" class="file">
							<div class="tab_txt01"><span class="td_01" style="margin-left: 50px"> <img src="" style="width: 100px; height: 100px;" id="productImg5">
							</span></div>
							<div class="tab_txt01" id="divPD"><span class="td_02" style="margin-left: 20px"> 证件4CredentialsFour<br /> <input type="file" name="siden4" id="iden4"
									style="margin-top: 6px" onchange="imagePreview(this.files,'productImg5')" />
							</span> &nbsp; </span></div>
					</li>
						<li style="width: 20%; float: left" class="file">
							<div class="tab_txt01"><span class="td_01" style="margin-left: 50px"> <img src="" style="width: 100px; height: 100px;" id="productImg4">
							</span></div>
							<div class="tab_txt01" id="divPD"><span class="td_02" style="margin-left: 20px"> 证件5CredentialsFive<br /> <input type="file" name="siden5" id="iden5"
									style="margin-top: 6px" onchange="imagePreview(this.files,'productImg4')" />
							</span> &nbsp; </span></div>
					</li>
				</div>
					<div id="hiddenDiv1">
						<li>
							<div class="tab_txt01" style="width: 100%; margin-left: -280px;"><span class="td_01" style="width: 430px;">备注remarks：</span> <span class="td_02"
								style="margin-top: 10px;"> <textarea id="canadaremarks1" name="canadaremarks"
									style="resize: none; width: 477px; height: 100px; overflow-y: auto; border: 1px solid #ccc;"></textarea>
							</span></div>
					</li>
						<li style="width: 20%; float: left;" class="file">
							<div class="tab_txt01"><span class="td_01" style="margin-left: 50px"> <img src="" style="width: 100px; height: 100px;" id="productImg6">
							</span></div>
							<div class="tab_txt01" id="divPL"><span class="td_02" style="margin-left: 20px"> <label class="fc_red">*</label>国际提货单InternationalBillOfLading<br /> <input
									type="file" name="siden1" id="iden11" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg6')" />&nbsp;
							</span></div>
					</li> <c:if test="${car.country!=2 }">
							<li style="width: 20%; float: left" class="file">
								<div class="tab_txt01"><span class="td_01" style="margin-left: 50px"> <img src="" style="width: 100px; height: 100px;" id="productImg7">
								</span></div>
								<div class="tab_txt01" id="divPD"><span class="td_02" style="margin-left: 20px"> <label class="fc_red">*</label>Invoice<br /> <input type="file" name="siden2"
										id="iden22" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg7')" />&nbsp;
								</span></div>
							</li>
						</c:if>
						<li style="width: 20%; float: left" class="file">
							<div class="tab_txt01"><span class="td_01" style="margin-left: 50px"> <img src="" style="width: 100px; height: 100px;" id="productImg8">
							</span></div>
							<div class="tab_txt01" id="divPD"><span class="td_02" style="margin-left: 20px"> <label class="fc_red">*</label>汽车名牌照片PicturesOfCarBrands<br /> <input
									type="file" name="siden3" id="iden33" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg8')" />&nbsp;
							</span></div>
					</li>
						<li style="width: 20%; float: left" class="file">
							<div class="tab_txt01"><span class="td_01" style="margin-left: 50px"> <img src="" style="width: 100px; height: 100px;" id="productImg9">
							</span></div>
							<div class="tab_txt01" id="divPD"><span class="td_02" style="margin-left: 20px"> <label class="fc_red">*</label>装货柜照片ContainerLoadingPhotograph<br /> <input
									type="file" name="siden4" id="iden44" style="margin-top: 6px" onchange="imagePreview(this.files,'productImg9')" />
							</span> &nbsp; </span></div>
					</li>
						<li style="width: 20%; float: left" class="file">
							<div class="tab_txt01"><span class="td_01" style="margin-left: 50px"> <img src="" style="width: 100px; height: 100px;" id="productImg10">
							</span></div>
							<div class="tab_txt01" id="divPD"><span class="td_02" style="margin-left: 20px"> <label class="fc_red">*</label>货柜信息TheContainerInformation<br />
									<input type="file" name="siden5" id="iden55" style="margin-top: 6px"
										onchange="imagePreview(this.files,'productImg10')" />
								</span> &nbsp; </span></div>
					</li>
				</div>
					<div class="btnlist" style="text-align: center;"><input type="button" value="submit" id="mysubmit" class="btn63_01 margin_let10"> <a href="javascript:void(0);"
						id="back" class="btn63_02 margin_let10">back</a></div>
	</form>
		</ul>
</div>
</div>
</div>
</div>
<script type="text/javascript">
function selectCheckBoxes(domId,value) {
    var inputs = document.getElementById(domId).getElementsByTagName("input");
    for(var i = 0; i < inputs.length; i++) {
        if (inputs[i].type == 'checkbox') {
            inputs[i].checked=value;
        }
    }
}
function imagePreview(obj,imgObj){
	var f = obj[0];
	var src = window.URL.createObjectURL(f);
	$('#'+imgObj).attr('src',src) ;
}
seajs.use("${scriptBasePath}/jndAssetlibrarylist/jndIncomingCheckListEntry.js?r=<%=new Date()%>");
</script>