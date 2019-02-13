/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.NeedReportService
 * Created By: wangzh 
 * Created on: 2017年9月26日 下午7:57:13
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.mapper.cif.NeedBillMapper;
import com.yyq.car.portal.common.mapper.cif.OfferbillMapper;
import com.yyq.car.portal.common.mapper.cif.PurchasebillMapper;
import com.yyq.car.portal.common.mapper.comm.AreapriceMapper;
import com.yyq.car.portal.common.mapper.comm.WeblocationMapper;
import com.yyq.car.portal.common.model.cif.NeedBill;
import com.yyq.car.portal.common.model.cif.Offerbill;
import com.yyq.car.portal.common.model.cif.Purchasebill;
import com.yyq.car.portal.common.model.comm.Areaprice;
import com.yyq.car.portal.common.model.comm.Weblocation;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.ms.web.command.NeedbillSaveCmd;


/**
 * <P>需求采购报价Service</P>
 * @author wangzh
 */
@Service
public class NeedReportService {

	@Autowired
	private NeedBillMapper needBillMapper;

	@Autowired
	private PurchasebillMapper purchaseBillMapper;

	@Autowired
	private WeblocationMapper weblocationMapper;

	@Autowired
	private AreapriceMapper areapriceMapper;

	@Autowired
	private OfferbillMapper offerbillMapper;

	public List<Weblocation> weblocation(Weblocation weblocation) {
		return weblocationMapper.selectByCriteria(weblocation);
	}

	public List<Map<String, Object>> queryNeedbilllst(Map<String, Object> map) {
		return needBillMapper.selectByCriteriaForMs(map);
	}

	public List<Map<String, Object>> queryCity(int parent) {
		return weblocationMapper.queryCity(parent);
	}

	public void addneed(NeedBill needBill) {
		needBillMapper.insertSelective(needBill);
	}

	/**
	 * 查询报价单列表
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> queryOfferbill(Map<String, Object> map) {
		return needBillMapper.queryOfferbill(map);
	}

	public int countOfferbill(Map<String, Object> map) {
		return needBillMapper.countOfferbill(map);
	}

	/**
	 * 报价单详情查询
	 * @param map
	 * @return
	 */
	public Purchasebill queryOfferbilldetails(int id) {
		return needBillMapper.queryOfferbilldetails(id);
	}

	/**
	 * 
	 * @param map
	 * @return
	 */
	public int countNeedbill(Map<String, Object> map) {
		return needBillMapper.countByCriteriaForMs(map);
	}

	/**
	 * 需求单添加
	 * @param needBill
	 */
	public void addneedbllst(NeedBill needBill) {
		needBillMapper.insertSelective(needBill);
	}

	/**
	 * 根据id查询需求单
	 * @param id
	 * @return
	 */
	public Map<String, Object> queryPurchaseBill(Purchasebill purchaseBill, String start, String pageSize) {

		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<Purchasebill> pu = purchaseBillMapper.selectByCriteria(purchaseBill, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		// Calendar ca = Calendar.getInstance();
		// for (Iterator<Purchasebill> iterator = pu.iterator(); iterator.hasNext();) {
		// Purchasebill purchasebill2 = (Purchasebill) iterator.next();
		// if (purchasebill2.getValidtime() != null) {
		// ca.setTime(purchasebill2.getValidtime());
		// ca.add(Calendar.DATE, -2);// 有效期减去2天
		// purchasebill2.setValidtime(ca.getTime());
		// }
		// }
		int c = purchaseBillMapper.countByCriteria(purchaseBill);
		map.put("result", pu);
		map.put("total", c);
		return map;
	}

	public int countPurchaseBill(Purchasebill purchaseBill) {
		return purchaseBillMapper.countByCriteria(purchaseBill);

	}

	public void addPurchaseBill(Purchasebill purchaseBill) {
		purchaseBillMapper.insertSelective(purchaseBill);
	}

	/**
	 * 查询需求单详情
	 * @param id
	 * @return
	 */
	public NeedBill queryByIdNeesBill(int id) {
		return needBillMapper.selectByPrimaryKey(id);
	}

	public NeedBill queryNeedbillById(Integer id) {
		return needBillMapper.selectByPrimaryKey(id);
	}

	/**
	 * <p>查询采购单列表</p>
	 * @param pb
	 * @return
	 * @author wangzh
	 */
	public List<Purchasebill> queryPurchaseBillLstByCriteria(Purchasebill pb) {
		return purchaseBillMapper.selectByCriteriaBMV(pb);
	}

	/**
	 * <p>查询区域定价</p>
	 * @param ap
	 * @return
	 * @author wangzh
	 */
	public List<Areaprice> queryAreapriceByCriteria(Areaprice ap) {
		return areapriceMapper.selectByCriteria(ap);
	}

	/**
	 * <p>通过主键查询采购单</p>
	 * @param id
	 * @return
	 * @author wangzh
	 */
	public Purchasebill queryPurchaseBillById(Integer id) {
		return purchaseBillMapper.selectByPrimaryKey(id);
	}

	/**
	 * <p>条件查询报价单</p>
	 * @param ob
	 * @return
	 * @author wangzh
	 */
	public Offerbill queryOfferbillByCriteria(Offerbill ob) {
		List<Offerbill> lst = offerbillMapper.selectByCriteria(ob);
		if (lst.size() > 0) {
			return lst.get(0);
		}
		return null;
	}

	/**
	 * <p>保存需求单处理结果</p>
	 * @param cmd
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, timeout = 3)
	public void saveNeeddeal(NeedbillSaveCmd cmd, NeedBill nb, Offerbill ob) {
		UserDTO user = SecurityHelper.getAdminUserInfo();
		// 保存报价单
		if (StringUtils.isNotBlank(ob.getValidtime())) {
			try {
				Date date = DateUtils.parse(ob.getValidtime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT);
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(date);
				calendar.add(Calendar.DATE, -2);
				String string = DateUtils.formate(calendar.getTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT);
				ob.setValidtime(string);
			} catch (Exception e) {

			}
		}
		offerbillMapper.insertSelective(ob);
		// 更新需求单
		NeedBill nBill = new NeedBill();
		// nBill.setBuybillid(cmd.getBuybillid());
		nBill.setStatus("2");// 人工处理
		nBill.setIsdeal("1");
		nBill.setDealtime(ob.getCreatetime());
		// nBill.setDealman(user.getLoginName());
		if (user != null) {
			nBill.setDealman(user.getName());
			nBill.setDealid(user.getId());
		}

		nBill.setId(cmd.getNeedid());

		Purchasebill pb = new Purchasebill();
		if (cmd.getBuybillid() == null) {// 没有对应的采购单
			// 保存采购单
			pb.setBrand(nb.getBrand());
			pb.setModel(nb.getModel());
			pb.setVersion(nb.getVersion());
			pb.setNowhave(cmd.getNowhave());

			BigDecimal allprice = BigDecimal.ZERO;// 计算成本价
			if ("2".equals(cmd.getNowhave()) && StringUtils.isNotBlank((cmd.getFuturetime()))) {
				pb.setFuturetime(DateUtils.parse(cmd.getFuturetime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
			}
			if (StringUtils.isNotBlank(cmd.getBodyprice())) {
				pb.setBodyprice(new BigDecimal(cmd.getBodyprice()));
				allprice = allprice.add(pb.getBodyprice());// 裸车价
			}
			if (StringUtils.isNotBlank(cmd.getTpprice())) {
				pb.setTicketpoint("1");
				pb.setTpprice(new BigDecimal(cmd.getTpprice()));
				allprice = allprice.add(pb.getTpprice());// 服务费票点
			}
			if (StringUtils.isNotBlank(cmd.getCnsystem())) {
				pb.setCnsystem(new BigDecimal(cmd.getCnsystem()));
				allprice = allprice.add(pb.getCnsystem());// 中文系统
			}
			if (StringUtils.isNotBlank(cmd.getDecorateprice())) {
				pb.setDecorateprice(new BigDecimal(cmd.getDecorateprice()));
				// allprice=allprice.add(pb.getDecorateprice());//加装费 不算在标准采购成本里
			}
			if (StringUtils.isNotBlank(cmd.getValidtime())) {
				pb.setValidtime(DateUtils.parse(cmd.getValidtime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
				Calendar c = Calendar.getInstance();
				c.setTime(pb.getValidtime());
				c.add(Calendar.DATE, -2);
				pb.setOffertime(c.getTime());// 报价有效期=采购报价有效期-2天
			}
			pb.setMiddleman(cmd.getMiddleman());
			if ("2".equals(cmd.getMiddleman()) && StringUtils.isNotBlank(cmd.getChannelprice())) {
				pb.setChannelprice(new BigDecimal(cmd.getChannelprice()));
				allprice = allprice.add(pb.getChannelprice());// 渠道费
			}
			if (StringUtils.isNotBlank(cmd.getSupplyname())) {
				pb.setSupplyname(cmd.getSupplyname());
			}

			pb.setOfferprice(allprice);// 设置成本价
			pb.setCreatetime(ob.getCreatetime());
			if (user != null) {
				pb.setCreateid(user.getId());
				pb.setCreateman(user.getLoginName());
			}

			pb.setIsused("1");
			pb.setStatus("1");
			purchaseBillMapper.insertSelective(pb);
			nBill.setBuybillid(pb.getId());
		} else {
			pb.setId(cmd.getBuybillid());
			pb.setIsused("1");
			purchaseBillMapper.updateByPrimaryKeySelective(pb);
			nBill.setBuybillid(cmd.getBuybillid());
		}
		needBillMapper.updateByPrimaryKeySelective(nBill);
	}

}
