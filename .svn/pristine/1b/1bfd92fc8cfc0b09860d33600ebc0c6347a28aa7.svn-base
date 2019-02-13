/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.web.constant.TasklistEnum
 * Created By: wangzh 
 * Created on: 2018年8月22日 下午4:28:39
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.constant;

import org.apache.commons.lang.StringUtils;


/**
 * <P>任务列表</P>
 * @author wangzh
 */
public enum TasklistEnum {

	// 海外业务(overseasBusiness)
	njndPurchaseLstIndex("2.采购列表(purchaseList)", "/njndPurchaseLstIndex", WebConstants.jnd), jndcontractlist("3.合同列表(contractList)",
			"/jndcontractindex?node=0", WebConstants.jnd), jndcontractpurchase("4.采购审核合同(contractPurchase)", "/jndcontractindex?node=1", WebConstants.jnd), jndcontractlaw(
			"5.法务审核合同(contractLaw)", "/jndcontractindex?node=2", WebConstants.jnd), jndcontractfinance("6.财务审核合同(contractFinance)", "/jndcontractindex?node=3",
			WebConstants.jnd), njndApplyPayLstIndex("7.付款申请列表(payApplyList)", "/njndApplyPayLstIndex", WebConstants.jnd), njndpayapplyauditindex(
			"8.付款申请审核(payApplyAudit)", "/njndpayapplyauditindex", WebConstants.jnd), PreEntryVehicleListPage("9.预入库列表(preEntryList)",
			"/PreEntryVehicleListPage", WebConstants.jnd), freightApplypage("10a.运费申请(freightApply)", "/freightApplypage", WebConstants.jnd), jndAssetlibrarylistpage(
			"11.报关出库(customsClearance)", "/jndAssetlibrarylistpage", WebConstants.jnd), ClearanceOfGoodsCarListpage("12.报关车辆列表(clearanceCarList)",
			"/ClearanceOfGoodsCarListpage", WebConstants.jnd), freightPage("10c.运费申请审核(freightApplyList)", "/freightpage", WebConstants.jnd), BondedWarehouseEntryListPage(
			"13.保税库入库列表(bondedCarList)", "/BondedWarehouseEntryListPage", WebConstants.jnd),

	// 销售业务(salesBusiness)
	bizcontractindex("2.0销售合同-列表", "/bizcontractindex", WebConstants.sell), bizcontractindex1("3.0销售合同-门店部-审核", "/bizcontractindex?node=1", WebConstants.sell), bizcontractindex2(
			"4.0销售合同-定金到账-审核", "/bizcontractindex?node=2", WebConstants.sell), bizcontractindex3("5.0销售合同-风控进件-初审", "/bizcontractindex?node=3",
			WebConstants.sell), bizcontractindex4("5.1销售合同-风控进件-复审", "/bizcontractindex?node=4", WebConstants.sell), bizcontractindex5("4.2全款合同选车",
			"/bizcontractindex?node=5", WebConstants.sell), bizzeropurindex("6.0车辆零采列表 ", "/bizzeropurindex", WebConstants.sell), bizzeropurstoreindex(
			"6.1车辆零采入库", "/bizzeropurstoreindex", WebConstants.sell), financialSelectCar("4.1金融合同选车", "/financialselectcar", WebConstants.sell), financialContracts(
			"7.1售后回租合同添加列表", "/financialcontracts?type=1", WebConstants.sell), leasebackListPageUpadte("7.2售后回租合同撤销与编辑列表", "/leasebackListpage?type=1",
			WebConstants.sell), theQuoteOfInsurance("7.4保险报价列表", "/financialcontracts?type=2", WebConstants.sell), leasebackListpageAudit("7.3售后回租合同审核列表",
			"/leasebackListpage?type=2", WebConstants.sell), moveLibraryAuditListPage("9.1配车单超额审核", "/movelibraryauditlistpage", WebConstants.sell), moveLibraryList(
			"9.0配车单移库列表", "/movelibrarylist", WebConstants.sell), shopConfirmedListPage("9.2门店确认到店", "/shopconfirmedlistpage", WebConstants.sell), bizcontractfinancepage(
			"10.0材料出库/全款回款/金融首付/结算", "/bizcontractfinancepage", WebConstants.sell),

	// 开票
	invoicelistprocess1("申请开票", "/invoicelist?process=1", "开票"), invoiceshoplistprocess2("门店部填写销售结算表", "/invoiceshoplist?process=2", "开票"), invoicefinancelistprocess3(
			"财务部填写销售结算表并开票", "/invoicefinancelist?process=3", "开票"),

	// 立案
	caselawlst("2.0法务-融资租赁逾期案件", "/caselawlst", "立案"), caseotherlawlst("2.1法务-二抵/其他案件", "/caseotherlawlst", "立案"),

	// 零采车源渠道
	carSourcelistpage("审核零采车源渠道", "/carSourcelistpage?type=2", WebConstants.carSource),

	// 车辆入库->车辆入库审核
	carInStoreAudit("车辆入库审核", "/car/audit/lst", WebConstants.carInStoreAudit),

	// 随车附件流转
	carAccessoryAudit("财务接收列表", "/carAccessory/page?type=2", WebConstants.carAccessory),
	//商城需求单审核
	mallNeedAudit("商城需求审核","/mallNeedAudit",WebConstants.jnd),
	// 车辆批发
	wholesalecclfs("门店审核", "/wholesale/checkcarlist/forstore", WebConstants.wholesale), wholesalecclff("财务审核", "/wholesale/checkcarlist/forfinance",
			WebConstants.wholesale), wholesalenplfs("门店审核未通过", "/wholesale/nopasslist/forstore", WebConstants.wholesale), wholesalenplff("财务审核未通过",
			"/wholesale/nopasslist/forfinance", WebConstants.wholesale),
			
   // 订单审核
	ordercheck("订单审核", "/mall/orderDetail_listpage", WebConstants.mall),
	// 合同盖章
	sealapply("未盖章", "/mall/sealapply_listpage", WebConstants.mall),
	// 合同盖章
	sealapply_backcheck("合同回传审核", "/mall/sealapply/backcheck_listpage", WebConstants.mall),
	// 车源审核
	carsourceaudit("车源审核", "/mallcarsourceauditindex", WebConstants.mall);
	private TasklistEnum(String m, String u, String p) {
		memu = m;
		url = u;
		parentmenu = p;
	}

	public static TasklistEnum getTasklistEnum(String url) {
		if (StringUtils.isBlank(url)) {
			return null;
		}
		for (TasklistEnum e : TasklistEnum.values()) {
			if (url.equals(e.url)) {
				return e;
			}
		}
		return null;
	}

	private String memu;
	private String url;
	private String parentmenu;

	public String getMemu() {
		return memu;
	}

	public void setMemu(String memu) {
		this.memu = memu;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getParentmenu() {
		return parentmenu;
	}

	public void setParentmenu(String parentmenu) {
		this.parentmenu = parentmenu;
	}

}
