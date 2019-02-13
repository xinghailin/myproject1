/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.common.TasklistService
 * Created By: wangzh 
 * Created on: 2018年8月21日 下午7:22:06
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service.common;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.mapper.biz.BizCarAccessoryMapper;
import com.yyq.car.portal.common.mapper.biz.BizInvoiceMapper;
import com.yyq.car.portal.common.mapper.biz.BizcontractMapper;
import com.yyq.car.portal.common.mapper.biz.BizsaleborrowMapper;
import com.yyq.car.portal.common.mapper.biz.BizzeropurchaseMapper;
import com.yyq.car.portal.common.mapper.biz.RiskcaseMapper;
import com.yyq.car.portal.common.mapper.biz.bizcarsourceMapper;
import com.yyq.car.portal.common.mapper.jnd.ContractapplypayMapper;
import com.yyq.car.portal.common.mapper.jnd.JndbuyMapper;
import com.yyq.car.portal.common.mapper.jnd.JndcarMapper;
import com.yyq.car.portal.common.mapper.jnd.JndcontractMapper;
import com.yyq.car.portal.common.mapper.jnd.JndneedMapper;
import com.yyq.car.portal.common.mapper.jnd.jndfreightMapper;
import com.yyq.car.portal.common.mapper.mall.CarsourceMapper;
import com.yyq.car.portal.common.mapper.mallcontract.MallOrderDetailMapper;
import com.yyq.car.portal.common.mapper.mallcontract.MallSealApplyMapper;
import com.yyq.car.portal.common.mapper.product.CarMapper;
import com.yyq.car.portal.common.mapper.product.prosupplycartableMapper;
import com.yyq.car.portal.common.mapper.wholesale.wholesaleCarMapper;
import com.yyq.car.portal.common.model.auth.Menu;
import com.yyq.car.portal.common.model.jnd.Jndneed;
import com.yyq.car.portal.common.model.mallcontract.MallOrderDetail;
import com.yyq.car.portal.common.model.mallcontract.MallSealApply;
import com.yyq.car.portal.ms.common.TasklistBean;
import com.yyq.car.portal.ms.web.constant.TasklistEnum;
import com.yyq.car.portal.ms.web.util.BeanStatus;


/**
 * <P>任务列表Service</P>
 * @author wangzh
 */
@Service
public class TasklistService {

	@Autowired
	JndbuyMapper buyMapper;
	@Autowired
	private JndcontractMapper contractMapper;
	@Autowired
	private ContractapplypayMapper contractapplypayMapper;
	@Autowired
	private JndcarMapper jndcarMapper;

	@Autowired
	private jndfreightMapper jndfreightMapper;

	@Autowired
	private BizcontractMapper bizcontractMapper;
	@Autowired
	private BizsaleborrowMapper bizsaleborrowMapper;
	@Autowired
	private prosupplycartableMapper prosupplycartableMapper;
	@Autowired
	private bizcarsourceMapper bizcarsourceMapper;
	@Autowired
	private CarMapper carMapper;
	@Autowired
	private BizCarAccessoryMapper bizCarAccessoryMapper;

	@Autowired
	BizzeropurchaseMapper zeropurchaseMapper;

	@Autowired
	wholesaleCarMapper wholesaleCarMapper;

	@Autowired
	BizInvoiceMapper invoiceMapper;

	@Autowired
	RiskcaseMapper riskcaseMapper;

	@Autowired
	CarsourceMapper carsourceMapper;


	@Autowired
    MallOrderDetailMapper orderDetailMapper;
	
	@Autowired
	MallSealApplyMapper SealApplyMapper;
	@Autowired
	JndneedMapper JndneedMapper;
	/**
	 * 
	 * <p>通过用户登录后获取的菜单来获取任务列表</p>
	 * @param map
	 * @param menus
	 * @author wangzh
	 * @param shop 
	 */
	public void getTasks(ModelMap modelMap, UserDTO user) {
		List<Menu> menus = user.getTaskmenu();
		List<TasklistBean> lst = new ArrayList<TasklistBean>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0, siz = menus.size(); i < siz; i++) {
			map.clear();
			String url = menus.get(i).getMenuUrl();
			TasklistBean b = new TasklistBean();
			int c = 0;
			if (TasklistEnum.njndPurchaseLstIndex.getUrl().equals(url)) {// 2.采购列表(purchaseList)
				Integer country = user.getCountry();
				if (country != null) {
					map.put("country", country);
				}
				c = buyMapper.countTaskPurchase(map);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.njndPurchaseLstIndex.getParentmenu());
					b.setMemu(TasklistEnum.njndPurchaseLstIndex.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.njndPurchaseLstIndex.getUrl());
				}
			} else if (TasklistEnum.jndcontractlist.getUrl().equals(url)) {// 3.合同列表(contractList)
				c = contractMapper.countTaskByNode(0);
				b.setParentmenu(TasklistEnum.jndcontractlist.getParentmenu());
				b.setMemu(TasklistEnum.jndcontractlist.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.jndcontractlist.getUrl());
				b.setNote("需要修改或没有申请付款的合同(Contracts that require modification or do not require payment)");
			} else if (TasklistEnum.jndcontractpurchase.getUrl().equals(url)) {// 4.采购审核合同(contractPurchase)
				c = contractMapper.countTaskByNode(1);
				b.setParentmenu(TasklistEnum.jndcontractpurchase.getParentmenu());
				b.setMemu(TasklistEnum.jndcontractpurchase.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.jndcontractpurchase.getUrl());
			} else if (TasklistEnum.jndcontractlaw.getUrl().equals(url)) {// 5.法务审核合同(contractLaw)
				c = contractMapper.countTaskByNode(2);
				b.setParentmenu(TasklistEnum.jndcontractlaw.getParentmenu());
				b.setMemu(TasklistEnum.jndcontractlaw.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.jndcontractlaw.getUrl());
			} else if (TasklistEnum.jndcontractfinance.getUrl().equals(url)) {// 6.财务审核合同(contractFinance)
				c = contractMapper.countTaskByNode(3);
				b.setParentmenu(TasklistEnum.jndcontractfinance.getParentmenu());
				b.setMemu(TasklistEnum.jndcontractfinance.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.jndcontractfinance.getUrl());
			} else if (TasklistEnum.njndApplyPayLstIndex.getUrl().equals(url)) {// 7.付款申请列表(payApplyList)
				map.put("country", user.getCountry());
				c = contractapplypayMapper.contractApplypayNoPassUpdateCount(map);
				b.setParentmenu(TasklistEnum.njndApplyPayLstIndex.getParentmenu());
				b.setMemu(TasklistEnum.njndApplyPayLstIndex.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.njndApplyPayLstIndex.getUrl());
			} else if (TasklistEnum.njndpayapplyauditindex.getUrl().equals(url)) {// 8.付款申请审核(payApplyAudit)
				c = contractapplypayMapper.contractApplypayAuditCount();
				b.setParentmenu(TasklistEnum.njndpayapplyauditindex.getParentmenu());
				b.setMemu(TasklistEnum.njndpayapplyauditindex.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.njndpayapplyauditindex.getUrl());
			} else if (TasklistEnum.PreEntryVehicleListPage.getUrl().equals(url)) {// 9.预入库列表(preEntryList)
				map.put("type", 1);
				map.put("country", user.getCountry());
				c = jndcarMapper.carNeedInStorageNum(map);
				b.setParentmenu(TasklistEnum.PreEntryVehicleListPage.getParentmenu());
				b.setMemu(TasklistEnum.PreEntryVehicleListPage.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.PreEntryVehicleListPage.getUrl());
			} else if (TasklistEnum.freightApplypage.getUrl().equals(url)) {// 10a.运费申请(freightApply)
				map.put("type", 2);
				map.put("country", user.getCountry());
				c = jndcarMapper.carNeedInStorageNum(map);
				b.setParentmenu(TasklistEnum.freightApplypage.getParentmenu());
				b.setMemu(TasklistEnum.freightApplypage.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.freightApplypage.getUrl());
			} else if (TasklistEnum.jndAssetlibrarylistpage.getUrl().equals(url)) {// 11.报关出库(customsClearance)
				map.put("type", 5);
				map.put("country", user.getCountry());
				c = jndcarMapper.carNeedInStorageNum(map);
				b.setParentmenu(TasklistEnum.jndAssetlibrarylistpage.getParentmenu());
				b.setMemu(TasklistEnum.jndAssetlibrarylistpage.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.jndAssetlibrarylistpage.getUrl());
			} else if (TasklistEnum.ClearanceOfGoodsCarListpage.getUrl().equals(url)) {// 12.报关车辆列表(clearanceCarList)
				map.put("type", 3);
				map.put("country", user.getCountry());
				c = jndcarMapper.carNeedInStorageNum(map);
				b.setParentmenu(TasklistEnum.ClearanceOfGoodsCarListpage.getParentmenu());
				b.setMemu(TasklistEnum.ClearanceOfGoodsCarListpage.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.ClearanceOfGoodsCarListpage.getUrl());
			} else if (TasklistEnum.freightPage.getUrl().equals(url)) {// 10c.运费申请审核(freightApplyList)
				c = jndfreightMapper.carFreightApplyAuditNum();
				b.setParentmenu(TasklistEnum.freightPage.getParentmenu());
				b.setMemu(TasklistEnum.freightPage.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.freightPage.getUrl());
			} else if (TasklistEnum.BondedWarehouseEntryListPage.getUrl().equals(url)) {// 13.保税库入库列表(bondedCarList)
				map.put("type", 4);
				c = jndcarMapper.carNeedInStorageNum(map);
				b.setParentmenu(TasklistEnum.BondedWarehouseEntryListPage.getParentmenu());
				b.setMemu(TasklistEnum.BondedWarehouseEntryListPage.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.BondedWarehouseEntryListPage.getUrl());
			}else if (TasklistEnum.mallNeedAudit.getUrl().equals(url)) {// 商城需求单审核
				Jndneed need=new Jndneed();
				need.setStatus(4);
				c = JndneedMapper.countByCriteria(need);
				b.setParentmenu(TasklistEnum.mallNeedAudit.getParentmenu());
				b.setMemu(TasklistEnum.mallNeedAudit.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.mallNeedAudit.getUrl());
			} else if (TasklistEnum.financialSelectCar.getUrl().equals(url)) {// 4.1金融合同选车
				map.put("status", 90);
				c = bizcontractMapper.countAllByMap(map);
				b.setParentmenu(TasklistEnum.financialSelectCar.getParentmenu());
				b.setMemu(TasklistEnum.financialSelectCar.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.financialSelectCar.getUrl());
			} else if (TasklistEnum.financialContracts.getUrl().equals(url)) {// 7.1售后回租合同添加列表
				map.put("status", 70);
				c = bizcontractMapper.countAllByMap(map);
				b.setParentmenu(TasklistEnum.financialContracts.getParentmenu());
				b.setMemu(TasklistEnum.financialContracts.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.financialContracts.getUrl());
			} else if (TasklistEnum.leasebackListPageUpadte.getUrl().equals(url)) {// 7.2售后回租合同撤销与编辑列表
				map.put("status", 10);
				c = bizsaleborrowMapper.updateCount(map);
				b.setParentmenu(TasklistEnum.leasebackListPageUpadte.getParentmenu());
				b.setMemu(TasklistEnum.leasebackListPageUpadte.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.leasebackListPageUpadte.getUrl());
			} else if (TasklistEnum.theQuoteOfInsurance.getUrl().equals(url)) {// 7.4保险报价列表
				map.put("status", 120);
				c = bizcontractMapper.countAllByMap(map);
				b.setParentmenu(TasklistEnum.theQuoteOfInsurance.getParentmenu());
				b.setMemu(TasklistEnum.theQuoteOfInsurance.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.theQuoteOfInsurance.getUrl());
			} else if (TasklistEnum.leasebackListpageAudit.getUrl().equals(url)) {// 7.3售后回租合同审核列表
				map.put("status", 20);
				c = bizsaleborrowMapper.updateCount(map);
				b.setParentmenu(TasklistEnum.leasebackListpageAudit.getParentmenu());
				b.setMemu(TasklistEnum.leasebackListpageAudit.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.leasebackListpageAudit.getUrl());
			} else if (TasklistEnum.moveLibraryAuditListPage.getUrl().equals(url)) {// 9.1配车单超额审核
				map.put("status", 10);
				c = prosupplycartableMapper.countSupplyCarTable(map);
				b.setParentmenu(TasklistEnum.moveLibraryAuditListPage.getParentmenu());
				b.setMemu(TasklistEnum.moveLibraryAuditListPage.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.moveLibraryAuditListPage.getUrl());
			} else if (TasklistEnum.moveLibraryList.getUrl().equals(url)) {// 9.0配车单移库列表
				map.put("status", 20);
				c = prosupplycartableMapper.countSupplyCarTable(map);
				b.setParentmenu(TasklistEnum.moveLibraryList.getParentmenu());
				b.setMemu(TasklistEnum.moveLibraryList.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.moveLibraryList.getUrl());
			} else if (TasklistEnum.shopConfirmedListPage.getUrl().equals(url)) {// 9.2门店确认到店
				map.put("status", 30);
				map.put("shopid", user.getShop());
				c = prosupplycartableMapper.countSupplyCarTable(map);
				b.setParentmenu(TasklistEnum.shopConfirmedListPage.getParentmenu());
				b.setMemu(TasklistEnum.shopConfirmedListPage.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.shopConfirmedListPage.getUrl());
			} else if (TasklistEnum.bizcontractfinancepage.getUrl().equals(url)) {// 10.0材料出库/全款回款/金融首付/结算
				map.put("status", 110);
				c = bizcontractMapper.countAllByMap(map);
				b.setParentmenu(TasklistEnum.bizcontractfinancepage.getParentmenu());
				b.setMemu(TasklistEnum.bizcontractfinancepage.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.bizcontractfinancepage.getUrl());
			} else if (TasklistEnum.carSourcelistpage.getUrl().equals(url)) {// 审核零采车源渠道
				c = bizcarsourceMapper.carSourceAuditCount();
				b.setParentmenu(TasklistEnum.carSourcelistpage.getParentmenu());
				b.setMemu(TasklistEnum.carSourcelistpage.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.carSourcelistpage.getUrl());
			} else if (TasklistEnum.carInStoreAudit.getUrl().equals(url)) {// 车辆入库审核
				c = carMapper.inStoreAudit();
				b.setParentmenu(TasklistEnum.carInStoreAudit.getParentmenu());
				b.setMemu(TasklistEnum.carInStoreAudit.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.carInStoreAudit.getUrl());// 车辆入库审核
			} else if (TasklistEnum.carAccessoryAudit.getUrl().equals(url)) {// 财务接收列表
				c = bizCarAccessoryMapper.carAccseeoryAuditCount();
				b.setParentmenu(TasklistEnum.carAccessoryAudit.getParentmenu());
				b.setMemu(TasklistEnum.carAccessoryAudit.getMemu());
				b.setNum(c);
				b.setUrl(TasklistEnum.carAccessoryAudit.getUrl());// 财务接收列表
			} else if (TasklistEnum.bizcontractindex.getUrl().equals(url)) {// 2.0销售合同-列表
				Collection<GrantedAuthority> as = user.getAuthorities();
				boolean ismanager = false;
				for (Iterator<GrantedAuthority> iterator = as.iterator(); iterator.hasNext();) {
					GrantedAuthority grantedAuthority = iterator.next();
					if ("ROLE_SHOP_MANAGER".equals(grantedAuthority.toString())) {// ROLE_SHOP_MANAGER：店长角色
																					// 可以查看所有该店的店员签署的信息表
						ismanager = true;
						break;
					}
				}
				if (ismanager) {
					if (StringUtils.isNotBlank(user.getShop()))
						map.put("shopid", user.getShop());
				} else {
					map.put("sellid", user.getId());
				}
				map.put("node", 0);
				c = bizcontractMapper.countTaskByMap(map);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.bizcontractindex.getParentmenu());
					b.setMemu(TasklistEnum.bizcontractindex.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.bizcontractindex.getUrl());
				}
			} else if (TasklistEnum.bizcontractindex1.getUrl().equals(url)) {// 3.0销售合同-门店部-审核
				map.put("node", 1);
				c = bizcontractMapper.countTaskByMap(map);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.bizcontractindex1.getParentmenu());
					b.setMemu(TasklistEnum.bizcontractindex1.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.bizcontractindex1.getUrl());
				}
			} else if (TasklistEnum.bizcontractindex2.getUrl().equals(url)) {// 4.0销售合同-定金到账-审核
				map.put("node", 2);
				c = bizcontractMapper.countTaskByMap(map);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.bizcontractindex2.getParentmenu());
					b.setMemu(TasklistEnum.bizcontractindex2.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.bizcontractindex2.getUrl());
				}
			} else if (TasklistEnum.bizcontractindex3.getUrl().equals(url)) {// 5.0销售合同-风控进件-初审
				map.put("node", 3);
				c = bizcontractMapper.countTaskByMap(map);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.bizcontractindex3.getParentmenu());
					b.setMemu(TasklistEnum.bizcontractindex3.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.bizcontractindex3.getUrl());
				}
			} else if (TasklistEnum.bizcontractindex4.getUrl().equals(url)) {// 5.1销售合同-风控进件-复审
				map.put("node", 4);
				c = bizcontractMapper.countTaskByMap(map);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.bizcontractindex4.getParentmenu());
					b.setMemu(TasklistEnum.bizcontractindex4.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.bizcontractindex4.getUrl());
				}
			} else if (TasklistEnum.bizcontractindex5.getUrl().equals(url)) {// 4.2全款合同选车
				map.put("node", 5);
				c = bizcontractMapper.countTaskByMap(map);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.bizcontractindex5.getParentmenu());
					b.setMemu(TasklistEnum.bizcontractindex5.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.bizcontractindex5.getUrl());
				}
			} else if (TasklistEnum.bizzeropurindex.getUrl().equals(url)) {// 6.0车辆零采列表
				c = zeropurchaseMapper.countTaskByNode(1);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.bizzeropurindex.getParentmenu());
					b.setMemu(TasklistEnum.bizzeropurindex.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.bizzeropurindex.getUrl());
				}
			} else if (TasklistEnum.bizzeropurstoreindex.getUrl().equals(url)) {// 6.1车辆零采入库
				c = zeropurchaseMapper.countTaskByNode(2);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.bizzeropurstoreindex.getParentmenu());
					b.setMemu(TasklistEnum.bizzeropurstoreindex.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.bizzeropurstoreindex.getUrl());
				}
			} else if (TasklistEnum.wholesalecclfs.getUrl().equals(url)) {// 门店审核
				map.put("status2", 1);
				c = wholesaleCarMapper.countTaskByMap(map);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.wholesalecclfs.getParentmenu());
					b.setMemu(TasklistEnum.wholesalecclfs.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.wholesalecclfs.getUrl());
				}
			} else if (TasklistEnum.wholesalecclff.getUrl().equals(url)) {// 财务审核

				map.put("status2", 2);
				c = wholesaleCarMapper.countTaskByMap(map);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.wholesalecclff.getParentmenu());
					b.setMemu(TasklistEnum.wholesalecclff.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.wholesalecclff.getUrl());
				}
			} else if (TasklistEnum.wholesalenplfs.getUrl().equals(url)) {// 门店审核未通过
				map.put("status2", 3);
				c = wholesaleCarMapper.countTaskByMap(map);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.wholesalenplfs.getParentmenu());
					b.setMemu(TasklistEnum.wholesalenplfs.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.wholesalenplfs.getUrl());
				}
			} else if (TasklistEnum.wholesalenplff.getUrl().equals(url)) {// 财务审核未通过
				map.put("status2", 4);
				c = wholesaleCarMapper.countTaskByMap(map);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.wholesalenplff.getParentmenu());
					b.setMemu(TasklistEnum.wholesalenplff.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.wholesalenplff.getUrl());
				}
			} else if (TasklistEnum.invoicelistprocess1.getUrl().equals(url)) {// 申请开票
				map.put("node", 1);
				c = invoiceMapper.countTaskByMap(map);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.invoicelistprocess1.getParentmenu());
					b.setMemu(TasklistEnum.invoicelistprocess1.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.invoicelistprocess1.getUrl());

					b.setNote("状态：门店部补填、门店部不通过");
				}
			} else if (TasklistEnum.invoiceshoplistprocess2.getUrl().equals(url)) {// 门店部填写销售结算表
				map.put("node", 2);
				c = invoiceMapper.countTaskByMap(map);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.invoiceshoplistprocess2.getParentmenu());
					b.setMemu(TasklistEnum.invoiceshoplistprocess2.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.invoiceshoplistprocess2.getUrl());
				}
			} else if (TasklistEnum.invoicefinancelistprocess3.getUrl().equals(url)) {// 财务部填写销售结算表并开票
				map.put("node", 3);
				c = invoiceMapper.countTaskByMap(map);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.invoicefinancelistprocess3.getParentmenu());
					b.setMemu(TasklistEnum.invoicefinancelistprocess3.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.invoicefinancelistprocess3.getUrl());
				}
			} else if (TasklistEnum.caselawlst.getUrl().equals(url)) {// 2.0法务-融资租赁逾期案件
				map.put("type", 1);
				c = riskcaseMapper.countTaskByMap(map);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.caselawlst.getParentmenu());
					b.setMemu(TasklistEnum.caselawlst.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.caselawlst.getUrl());
				}
			} else if (TasklistEnum.caseotherlawlst.getUrl().equals(url)) {// 2.1法务-二抵/其他案件
				map.put("type", 2);
				c = riskcaseMapper.countTaskByMap(map);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.caseotherlawlst.getParentmenu());
					b.setMemu(TasklistEnum.caseotherlawlst.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.caseotherlawlst.getUrl());
				}
			} else if (TasklistEnum.carsourceaudit.getUrl().equals(url)) {// 车源审核
				c = carsourceMapper.countTaskByAuditstatus();
				if (c > 0) {
					b.setParentmenu(TasklistEnum.carsourceaudit.getParentmenu());
					b.setMemu(TasklistEnum.carsourceaudit.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.carsourceaudit.getUrl());
					b.setNote("状态：未审核");
				}
			}else if (TasklistEnum.ordercheck.getUrl().equals(url)) {// 商城订单审核
				MallOrderDetail vo = new MallOrderDetail();
				vo.setStatus(BeanStatus.OK.getKey());
				vo.setOrderstatus(BeanStatus.OK.getKey());
				c = orderDetailMapper.countByCriteria(vo);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.ordercheck.getParentmenu());
					b.setMemu(TasklistEnum.ordercheck.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.ordercheck.getUrl());
					b.setNote("状态：未审核");
				}
			}else if (TasklistEnum.sealapply.getUrl().equals(url)) {// 合同盖章
				MallSealApply vo = new MallSealApply();
				vo.setStatus(BeanStatus.OK.getKey());
				vo.setSealstatus(BeanStatus.OK.getKey());
				c =  SealApplyMapper.countByCriteria(vo);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.sealapply.getParentmenu());
					b.setMemu(TasklistEnum.sealapply.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.sealapply.getUrl());
					b.setNote("状态：未盖章");
				}
			}else if (TasklistEnum.sealapply_backcheck.getUrl().equals(url)) {// 合同回传审核
				MallSealApply vo = new MallSealApply();
				vo.setStatus(BeanStatus.OK.getKey());
				vo.setSealstatus(5);
				vo.setUploadstatus(BeanStatus.OK.getKey());
				c =   SealApplyMapper.countByCriteria(vo);
				if (c > 0) {
					b.setParentmenu(TasklistEnum.sealapply_backcheck.getParentmenu());
					b.setMemu(TasklistEnum.sealapply_backcheck.getMemu());
					b.setNum(c);
					b.setUrl(TasklistEnum.sealapply_backcheck.getUrl());
					b.setNote("状态：合同回传未审核");
				}
			}	
			if (c > 0) {
				lst.add(b);
			}
		}
		modelMap.put("lst", lst);
	}
}
