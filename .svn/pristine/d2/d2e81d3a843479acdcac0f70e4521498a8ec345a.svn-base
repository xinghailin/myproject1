package com.yyq.car.portal.ms.app.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.constant.FileTypeEnum;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.exception.PortalAppUnCheckedException;
import com.yyq.car.portal.common.exception.PortalBizCheckedException;
import com.yyq.car.portal.common.mapper.auth.UserMapper;
import com.yyq.car.portal.common.mapper.biz.BizBondsmanMapper;
import com.yyq.car.portal.common.mapper.biz.BizShopTermMapper;
import com.yyq.car.portal.common.mapper.biz.BizcontractMapper;
import com.yyq.car.portal.common.mapper.biz.BizpayplanMapper;
import com.yyq.car.portal.common.mapper.biz.BizriskMapper;
import com.yyq.car.portal.common.mapper.biz.BizsaleborrowMapper;
import com.yyq.car.portal.common.mapper.biz.InventoryQuotationMapper;
import com.yyq.car.portal.common.mapper.biz.PayMoneyInterestMapper;
import com.yyq.car.portal.common.mapper.biz.ProcurementWeeklyQuotationMapper;
import com.yyq.car.portal.common.mapper.product.CarMapper;
import com.yyq.car.portal.common.mapper.product.ShopMapper;
import com.yyq.car.portal.common.mapper.product.StoreMapper;
import com.yyq.car.portal.common.mapper.product.flowschemeMapper;
import com.yyq.car.portal.common.mapper.product.procarcaseMapper;
import com.yyq.car.portal.common.mapper.product.prosupplycarMapper;
import com.yyq.car.portal.common.mapper.product.prosupplycartableMapper;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.biz.BizBondsman;
import com.yyq.car.portal.common.model.biz.BizShopTerm;
import com.yyq.car.portal.common.model.biz.Bizcontract;
import com.yyq.car.portal.common.model.biz.Bizpayplan;
import com.yyq.car.portal.common.model.biz.Bizrisk;
import com.yyq.car.portal.common.model.biz.Bizsaleborrow;
import com.yyq.car.portal.common.model.biz.InventoryQuotation;
import com.yyq.car.portal.common.model.biz.PayMoneyInterest;
import com.yyq.car.portal.common.model.biz.ProcurementWeeklyQuotation;
import com.yyq.car.portal.common.model.product.Car;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.common.model.product.Store;
import com.yyq.car.portal.common.model.product.flowscheme;
import com.yyq.car.portal.common.model.product.procarcase;
import com.yyq.car.portal.common.model.product.prosupplycar;
import com.yyq.car.portal.common.model.product.prosupplycartable;
import com.yyq.car.portal.common.service.ResourcePersistenceService;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.common.util.StringUtil;
import com.yyq.car.portal.ms.web.util.UUIDTool;


@Service
public class SellContractService {

	@Autowired
	private BizcontractMapper bizcontractMapper;
	@Autowired
	private BizriskMapper bizriskMapper;
	@Autowired
	private BizsaleborrowMapper bizsaleborrowMapper;
	@Autowired
	private BizBondsmanMapper bizBondsmanMapper;
	@Autowired
	private BizpayplanMapper bizpayplanMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private CarMapper carMapper;
	@Autowired
	private ShopMapper shopMapper;
	@Autowired
	private procarcaseMapper procarcaseMapper;
	@Autowired
	private prosupplycarMapper prosupplycarMapper;
	@Autowired
	private ResourcePersistenceService resourceService;
	@Autowired
	private prosupplycartableMapper prosupplycartableMapper;
	@Autowired
	private InventoryQuotationMapper inventoryQuotationMapper;
	@Autowired
	private StoreMapper storeMapper;
	@Autowired
	private flowschemeMapper flowschemeMapper;
	@Autowired
	private BizShopTermMapper bizshoptermMapper;
	

	@Autowired
	private PayMoneyInterestMapper payMoneyInterestMapper;
	@Autowired
	private ProcurementWeeklyQuotationMapper procurementWeeklyQuotationMapper;

	@Autowired
	private BizShopGroupService shopGroupService;

	private String term[] = { "一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十", "二十一", "二十二",
			"二十三", "二十四", "二十五", "二十六", "二十七", "二十八", "二十九", "三十", "三十一", "三十二", "三十三", "三十四", "三十五", "三十六", "三十七", "三十八", "三十九", "四十", "四十一", "四十二", "四十三",
			"四十四", "四十五", "四十六", "四十七", "四十八" };

	public Bizcontract selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return bizcontractMapper.selectByPrimaryKey(id);
	}

	public List<Bizrisk> selectByBizcontractid(Integer id) {
		// TODO Auto-generated method stub
		Bizrisk biz = new Bizrisk();
		biz.setContractid(id);
		return bizriskMapper.selectByCriteria(biz);
	}

	/**
	 * 计算金融合同还款日期
	 * @author xhl
	 * @param day
	 * @param now
	 * @param num
	 * @param format1
	 * @return
	 *2018年9月20日上午10:42:03
	 *
	 */
	public List<Map<String, Object>> getday(int day, Calendar now, int num, DateFormat format1) {
		List<Map<String, Object>> list = new ArrayList<>();
		if (day != 31) {
			for (int i = 0; i < num; i++) {
				int year1 = now.get(Calendar.YEAR);
				int month = now.get(Calendar.MONTH);
				if ((year1 % 4 == 0) && (year1 % 100 != 0) || (year1 % 400 == 0)) {
					if (day <= 29) {
						now.add(Calendar.MONTH, 1);
					} else if (day > 29) {
						if (month == 0) {
							now.add(Calendar.MONTH, 1);
						} else if (day == 30) {
							if (month == 1) {
								now.add(Calendar.DATE, 30);
							} else {
								now.add(Calendar.MONTH, 1);
							}
						}
					}
				} else {
					if (day <= 28) {
						now.add(Calendar.MONTH, 1);
					} else if (day > 28) {
						if (month == 0) {
							now.add(Calendar.MARCH, 1);
						} else if (day == 30) {// 不是闰年直接大于28小于31加一个月
							if (month == 1) {
								now.add(Calendar.DATE, 30);
							} else {
								now.add(Calendar.MONTH, 1);
							}
						} else if (day == 29) {// 不是闰年直接大于28小于31加一个月
							if (month == 1) {
								now.add(Calendar.DATE, 29);
							} else {
								now.add(Calendar.MONTH, 1);
							}
						}
					}
				}
				String s1 = format1.format(now.getTime());
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("time1", s1);
				list.add(map);
			}
		} else if (day == 31) {
			for (int i = 0; i < num; i++) {
				int year = now.get(Calendar.YEAR);
				int month = now.get(Calendar.MONTH);
				if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
					if (month == 0) {
						now.add(Calendar.DATE, 29);
					} else if (month == 1 || month == 3 || month == 5 || month == 6 || month == 8 || month == 10 || month == 11) {
						now.add(Calendar.DATE, 31);
					} else if (month == 2 || month == 4 || month == 7 || month == 9) {
						now.add(Calendar.DATE, 30);
					}
				} else {
					if (month == 0) {
						now.add(Calendar.DATE, 28);
					} else if (month == 1 || month == 3 || month == 5 || month == 6 || month == 8 || month == 10 || month == 11) {
						now.add(Calendar.DATE, 31);
					} else if (month == 2 || month == 4 || month == 7 || month == 9) {
						now.add(Calendar.DATE, 30);
					}
				}
				Map<String, Object> map = new HashMap<String, Object>();
				String s1 = format1.format(now.getTime());
				map.put("time1", s1);
				list.add(map);
			}
		}
		return list;
	}

	/**
	 *  租赁物合同保存
	 * @param saleborrowfile3
	 * @param saleborrowfile4
	 * @param sightime1
	 * @param cid
	 * @param bizsaleborrow
	 * @param bondsman
	 * @param bmaddress
	 * @param bmrunaddress
	 * @param bmfaxes
	 * @param bmphone
	 * @param bondsman2
	 * @param bmaddress2
	 * @param bmrunaddress2
	 * @param bmfaxes2
	 * @param bmphone2
	 * @throws ParseException
	 * @throws IOException
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void addleasebacksave(MultipartFile pledgefile11, MultipartFile pledgefile22, MultipartFile saleborrowfile3, MultipartFile saleborrowfile4,
			String sightime1, String cid, Bizsaleborrow bizsaleborrow, String[] bondsman, String[] bmaddress, String[] bmrunaddress, String[] bmfaxes,
			String[] bmphone, String[] bondsman2, String[] bmaddress2, String[] bmrunaddress2, String[] bmfaxes2, String[] bmphone2) throws ParseException,
			IOException {
		// TODO Auto-generated method stub
		Bizcontract bizc = bizcontractMapper.selectByPrimaryKey(Integer.parseInt(cid));
		Bizcontract bizcon = new Bizcontract();
		bizcon.setId(Integer.parseInt(cid));
		bizcon.setVin(bizsaleborrow.getVin());
		/*
		 * Car car = carMapper.selectStatus(bizsaleborrow.getVin()); if (car != null) {// 状态 1库存中
		 * 2移库中 3门店锁定 4销售锁定 5已销售 9.返回仓库中 if (car.getStatus() == null) { throw new
		 * PortalAppUnCheckedException("该车架号的车未在仓库和门店中！"); } else if (car.getSaleStatus() != null)
		 * {// 4销售绑定 5 已经销售 throw new PortalAppUnCheckedException("该车架号的车已经销售绑定或已经销售！"); } } else {
		 * throw new PortalAppUnCheckedException("该车架号的车不存在！"); }
		 */
		bizcon.setStatus("6");
		bizcontractMapper.updateByPrimaryKeySelective(bizcon);
		bizsaleborrow.setFilecode(bizc.getFilecode());
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		bizsaleborrow.setSightime(format1.parse(sightime1));
		bizsaleborrow.setContractid(Integer.parseInt(cid));
		bizsaleborrow.setDownpay("0");
		Calendar now = Calendar.getInstance();

		boolean hasdot = false;
		String name1 = pledgefile11.getOriginalFilename();

		if (StringUtils.isNotBlank(name1)) {
			int dot = name1.lastIndexOf(".");
			if (dot > 0) {
				hasdot = true;
				name1 = name1.substring(dot);
			}
		}
		String path1 = uploadFileTogetherx(pledgefile11, FileTypeEnum.leasebackcontract, hasdot, name1);
		bizsaleborrow.setPledgefile1(path1);

		String name2 = pledgefile22.getOriginalFilename();

		if (StringUtils.isNotBlank(name2)) {
			int dot = name2.lastIndexOf(".");
			if (dot > 0) {
				hasdot = true;
				name2 = name2.substring(dot);
			}
		}
		String path2 = uploadFileTogetherx(pledgefile22, FileTypeEnum.leasebackcontract, hasdot, name2);
		bizsaleborrow.setPledgefile2(path2);

		String name3 = saleborrowfile3.getOriginalFilename();

		if (StringUtils.isNotBlank(name3)) {
			int dot = name3.lastIndexOf(".");
			if (dot > 0) {
				hasdot = true;
				name3 = name3.substring(dot);
			}
		}
		String path3 = uploadFileTogetherx(saleborrowfile3, FileTypeEnum.leasebackcontract, hasdot, name3);
		bizsaleborrow.setSaleborrowfile1(path3);

		String name4 = saleborrowfile4.getOriginalFilename();

		if (StringUtils.isNotBlank(name4)) {
			int dot = name4.lastIndexOf(".");
			if (dot > 0) {
				hasdot = true;
				name4 = name4.substring(dot);
			}
		}
		String path4 = uploadFileTogetherx(saleborrowfile4, FileTypeEnum.leasebackcontract, hasdot, name4);
		bizsaleborrow.setSaleborrowfile2(path4);
		bizsaleborrow.setShopid(bizc.getShopid());
		bizsaleborrow.setCreatetime(new Date());
		bizsaleborrowMapper.insertSelective(bizsaleborrow);
		Integer id = bizsaleborrow.getId();
		double leaseprice1 = bizsaleborrow.getLeaseprice().doubleValue();
		BigDecimal additionalmoney = BigDecimal.ZERO;// 额外利率金额
		if (StringUtils.isNotBlank(bizsaleborrow.getAdditionalinterestrate())) {
			additionalmoney = (new BigDecimal(leaseprice1 * Double.parseDouble(bizsaleborrow.getAdditionalinterestrate()) / 100)).setScale(2,
					BigDecimal.ROUND_HALF_UP);
		}

		Double leaseprice2 = leaseprice1 / 48 + leaseprice1 * 0.04 * 4 / 48 + leaseprice1 * 0.018 * 4 + additionalmoney.doubleValue();// 第一个月的租金
		Double leaseprice3 = leaseprice1 / 48 + leaseprice1 * 0.04 * 4 / 48;// 第二到十二个每月
		Double leaseprice4 = leaseprice1 * 3 / 4 / 36 + leaseprice1 * 3 / 4 * 0.02 * 3 / 36 + leaseprice1 * 3 / 4 * 0.02 * 3;// 第十三月个月的租金
		Double leaseprice5 = leaseprice1 * 3 / 4 / 36 + leaseprice1 * 3 / 4 * 0.02 * 3 / 36;// 第十四到四十八个每月
		if (bondsman != null) {
			if (bondsman.length > 0) {
				for (int i = 0; i < bmphone.length; i++) {// 第一年担保人信息
					BizBondsman bizb = new BizBondsman();
					bizb.setBmaddress(bmaddress[i]);
					if (StringUtils.isNotBlank(bmfaxes[i])) {
						bizb.setBmfaxes(bmfaxes[i]);
					}
					bizb.setSaleborrowid(id);
					bizb.setBondsman(bondsman[i]);
					if (StringUtils.isNotBlank(bmrunaddress[i])) {
						bizb.setBmrunaddress(bmrunaddress[i]);
					}
					bizb.setBmphone(bmphone[i]);
					bizb.setType("1");
					bizBondsmanMapper.insertSelective(bizb);
				}
			}
		}
		if (bondsman2 != null) {
			if (bondsman2.length > 0) {
				for (int i = 0; i < bmphone2.length; i++) {// 第二到四年年担保人信息
					BizBondsman bizb = new BizBondsman();
					bizb.setBmaddress(bmfaxes2[i]);
					if (StringUtils.isNotBlank(bmrunaddress[i])) {
						bizb.setBmfaxes(bmfaxes2[i]);
					}
					bizb.setSaleborrowid(id);
					bizb.setBondsman(bondsman2[i]);
					if (StringUtils.isNotBlank(bmrunaddress2[i])) {
						bizb.setBmrunaddress(bmrunaddress2[i]);
					}
					bizb.setBmphone(bmphone2[i]);
					bizb.setType("2");
					bizBondsmanMapper.insertSelective(bizb);
				}
			}
		}

		Bizpayplan biz = new Bizpayplan();
		now.setTime(format1.parse(sightime1));
		now.add(Calendar.DATE, -1);
		int day = now.get(Calendar.DAY_OF_MONTH);
		List<Map<String, Object>> dayList = getday(day, now, 48, format1);
		for (int i = 0; i < dayList.size(); i++) {
			if (i == 0) {// 第一期
				biz.setPrice(BigDecimal.valueOf(new BigDecimal(leaseprice2).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue()));
				biz.setOpenbank(bizsaleborrow.getOpenbank());
				biz.setAccountcode(bizsaleborrow.getAccountcode());
				biz.setAccountname(bizsaleborrow.getAccountname());
			} else if (i > 0 && i < 12) {// 二到十一二期
				biz.setPrice(BigDecimal.valueOf(new BigDecimal(leaseprice3).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue()));
				biz.setOpenbank(bizsaleborrow.getOpenbank());
				biz.setAccountcode(bizsaleborrow.getAccountcode());
				biz.setAccountname(bizsaleborrow.getAccountname());
			} else if (i == 12) {// 第十三期
				biz.setPrice(BigDecimal.valueOf(new BigDecimal(leaseprice4).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue()));
				biz.setOpenbank(bizsaleborrow.getSopenbank());
				biz.setAccountcode(bizsaleborrow.getSaccountcode());
				biz.setAccountname(bizsaleborrow.getSaccountname());
			} else if (i > 12) {// 第十四到四十八期
				biz.setPrice(BigDecimal.valueOf(new BigDecimal(leaseprice5).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue()));
				biz.setOpenbank(bizsaleborrow.getSopenbank());
				biz.setAccountcode(bizsaleborrow.getSaccountcode());
				biz.setAccountname(bizsaleborrow.getSaccountname());
			}
			Map<String, Object> map = dayList.get(i);
			Iterator<String> it = map.keySet().iterator();
			while (it.hasNext()) {
				String str = (String) it.next();
				biz.setPaytime(format1.parse((String) map.get(str)));
			}
			biz.setId(UUIDTool.getUUID());
			biz.setTerm("第" + term[i] + "期");
			biz.setLeasebackid(id);
			biz.setContractid(Integer.parseInt(cid));
			biz.setName(bizsaleborrow.getBname());
			biz.setIdentify(bizsaleborrow.getIdentify());
			biz.setPhone(bizsaleborrow.getBphone());
			biz.setPayday(Integer.toString(day));
			//
			biz.setCreatetime(new Date());
			bizpayplanMapper.insertSelective(biz);
		}
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		flow.setTaskname("融资租赁合同保存");
		flow.setTasktype1(3);// 金融合同
		insertSelective(flow);
	}

	/**
	 * 
	 * @param bizsaleborrow
	 * @param start
	 * @param pageSize
	 * @return
	 *  
	 */
	public Map<String, Object> leasebacklist(Bizsaleborrow bizsaleborrow, String start, String pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<Bizsaleborrow> list = bizsaleborrowMapper.selectByCriteria(bizsaleborrow, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int c = bizsaleborrowMapper.countByCriteria(bizsaleborrow);
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	/**
	 * 
	 * @param bizsaleborrow
	 * @param start
	 * @param pageSize
	 * @return
	 *  如果为主账号则可以看到同一组的所有门店信息    by  liliang  2018-8-9
	 */
	public Map<String, Object> leasebackshopgrouplist(UserDTO user, Bizsaleborrow bizsaleborrow, String start, String pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<Integer> shopids = shopGroupService.queryShopGroupIdsByUseridandShopid(user.getId(), bizsaleborrow.getShopid());
		bizsaleborrow.setShopids(shopids);
		bizsaleborrow.setShopid(null);
		List<Bizsaleborrow> list = bizsaleborrowMapper.selectAllByCriteria(bizsaleborrow, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int c = bizsaleborrowMapper.countAllByCriteria(bizsaleborrow);
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	/**
	 * 金融合同审核通过
	 * @param id
	 * @param loginId
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void saleborrowpass(Integer id, Integer loginId) {
		// TODO Auto-generated method stub
		Bizsaleborrow bizs = new Bizsaleborrow();
		Bizsaleborrow biz = bizsaleborrowMapper.selectByPrimaryKey(id);
		Bizcontract bizc = bizcontractMapper.selectByPrimaryKey(biz.getContractid());
		Car car = carMapper.selectByPrimaryKey(bizc.getCarid());
		if (car != null) {// 状态 1库存中 2移库中 3门店锁定 4销售锁定 5已销售 9.返回仓库中
			/*
			 * car.setSaleStatus(1); carMapper.updateByPrimaryKeySelective(car);// 金融合同审核通过修改库表为销售绑定
			 *//*
				 * carMapper.updateByVinStatus(biz.getVin());// 更改车辆表状态 为4 销售绑定
				 */Bizcontract con = new Bizcontract();
			con.setVin(car.getVin());
			con.setCarid(car.getId());
			con.setId(biz.getContractid());
			con.setStatus("7");// 金融合同
			bizcontractMapper.updateByPrimaryKeySelective(con);// 给合同添加车架号和id
			bizs.setId(id);
			bizs.setStatus("1");
			User u = userMapper.selectByPrimaryKey(loginId);
			bizs.setOperater(u.getName());
			bizsaleborrowMapper.updateByPrimaryKeySelective(bizs);
		} else {
			throw new PortalAppUnCheckedException("该车不存在！");
		}
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		flow.setTaskname("融资租赁合同审核通过");
		flow.setTasktype1(3);
		insertSelective(flow);
	}

	/**
	 * 金融合同审核不通过
	 * @param id
	 * @param loginId
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void saleborrownopass(Integer id, Integer loginId, String nopass) {
		// TODO Auto-generated method stub
		Bizsaleborrow bizs = new Bizsaleborrow();
		bizs.setId(id);
		bizs.setStatus("2");
		User u = userMapper.selectByPrimaryKey(loginId);
		bizs.setOperater(u.getName());
		bizs.setNopass(nopass);
		bizsaleborrowMapper.updateByPrimaryKeySelective(bizs);
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		flow.setTaskname("融资租赁合同审核不通过");
		flow.setTasktype1(3);
		insertSelective(flow);
	}

	/**
	 * 金融合同审核门店撤销
	 * @param id
	 */
	public void repealleaseback(Integer id) {
		// TODO Auto-generated method stub
		Bizsaleborrow biz = new Bizsaleborrow();
		biz.setId(id);
		biz.setStatus("3");
		bizsaleborrowMapper.updateByPrimaryKeySelective(biz);
	}

	/**
	 * 融资租赁合同修改保存
	 * @param saleborrowfile3
	 * @param saleborrowfile4
	 * @param sightime1
	 * @param id
	 * @param bizsaleborrow
	 * @param bondsman
	 * @param bmaddress
	 * @param bmrunaddress
	 * @param bmfaxes
	 * @param bmphone
	 * @param bondsman2
	 * @param bmaddress2
	 * @param bmrunaddress2
	 * @param bmfaxes2
	 * @param bmphone2
	 * @throws IOException 
	 * @throws ParseException 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void updateleasebacksave(MultipartFile pledgefile3, MultipartFile pledgefile4, MultipartFile saleborrowfile3, MultipartFile saleborrowfile4,
			String sightime1, Integer id, Bizsaleborrow bizsaleborrow, String[] bondsman, String[] bmaddress, String[] bmrunaddress, String[] bmfaxes,
			String[] bmphone, String[] bondsman2, String[] bmaddress2, String[] bmrunaddress2, String[] bmfaxes2, String[] bmphone2) throws IOException,
			ParseException {
		// TODO Auto-generated method stub
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Bizsaleborrow Bizsale = bizsaleborrowMapper.selectByPrimaryKey(id);
		bizsaleborrow.setSightime(format1.parse(sightime1));
		bizsaleborrow.setDownpay("0");
		bizsaleborrow.setStatus("5");// 临时状态 修改保存时 把融资租赁合同状态改为未审核状态

		boolean hasdot = false;
		String name1 = pledgefile3.getOriginalFilename();

		if (StringUtils.isNotBlank(name1)) {
			int dot = name1.lastIndexOf(".");
			if (dot > 0) {
				hasdot = true;
				name1 = name1.substring(dot);
			}
		}
		String path1 = uploadFileTogetherx(pledgefile3, FileTypeEnum.leasebackcontract, hasdot, name1);
		bizsaleborrow.setPledgefile1(path1);

		String name2 = pledgefile4.getOriginalFilename();

		if (StringUtils.isNotBlank(name2)) {
			int dot = name2.lastIndexOf(".");
			if (dot > 0) {
				hasdot = true;
				name2 = name2.substring(dot);
			}
		}
		String path2 = uploadFileTogetherx(pledgefile4, FileTypeEnum.leasebackcontract, hasdot, name2);
		bizsaleborrow.setPledgefile2(path2);

		String name3 = saleborrowfile3.getOriginalFilename();

		if (StringUtils.isNotBlank(name3)) {
			int dot = name3.lastIndexOf(".");
			if (dot > 0) {
				hasdot = true;
				name3 = name3.substring(dot);
			}
		}
		String path3 = uploadFileTogetherx(saleborrowfile3, FileTypeEnum.leasebackcontract, hasdot, name3);
		bizsaleborrow.setSaleborrowfile1(path3);

		String name4 = saleborrowfile4.getOriginalFilename();

		if (StringUtils.isNotBlank(name4)) {
			int dot = name4.lastIndexOf(".");
			if (dot > 0) {
				hasdot = true;
				name4 = name4.substring(dot);
			}
		}
		String path4 = uploadFileTogetherx(saleborrowfile4, FileTypeEnum.leasebackcontract, hasdot, name4);
		bizsaleborrow.setSaleborrowfile2(path4);

		bizsaleborrow.setId(id);
		bizsaleborrowMapper.updateByPrimaryKeySelective(bizsaleborrow);// 修改融资租赁合同

		bizpayplanMapper.deleteByleasebackid(id);// 删除融资租赁合同还款期数 再添加

		bizBondsmanMapper.deleteByleasebackid(id);// 删除融资租赁合同 担保人信息再添加
		double leaseprice1 = bizsaleborrow.getLeaseprice().doubleValue();
		BigDecimal additionalmoney = BigDecimal.ZERO;// 额外利率金额
		if (StringUtils.isNotBlank(bizsaleborrow.getAdditionalinterestrate())) {
			additionalmoney = (new BigDecimal(leaseprice1 * Double.parseDouble(bizsaleborrow.getAdditionalinterestrate()) / 100)).setScale(2,
					BigDecimal.ROUND_HALF_UP);
		}
		Double leaseprice2 = leaseprice1 / 48 + leaseprice1 * 0.04 * 4 / 48 + leaseprice1 * 0.018 * 4 + additionalmoney.doubleValue();// 第一个月的租金
		Double leaseprice3 = leaseprice1 / 48 + leaseprice1 * 0.04 * 4 / 48;// 第二到十二个每月
		Double leaseprice4 = leaseprice1 * 3 / 4 / 36 + leaseprice1 * 3 / 4 * 0.02 * 3 / 36 + leaseprice1 * 3 / 4 * 0.02 * 3;// 第十三月个月的租金
		Double leaseprice5 = leaseprice1 * 3 / 4 / 36 + leaseprice1 * 3 / 4 * 0.02 * 3 / 36;// 第十四到四十八个每月

		if (bondsman != null) {
			if (bondsman.length > 0) {
				for (int i = 0; i < bmphone.length; i++) {// 第一年担保人信息
					if (StringUtils.isNotBlank(bmphone[i].toString())) {
						System.out.println(bmphone[i]);
						BizBondsman bizb = new BizBondsman();
						bizb.setBmaddress(bmaddress[i]);
						bizb.setBmfaxes(bmfaxes[i]);
						bizb.setSaleborrowid(id);
						bizb.setBondsman(bondsman[i]);
						bizb.setBmrunaddress(bmrunaddress[i]);
						bizb.setBmphone(bmphone[i]);
						bizb.setType("1");
						bizBondsmanMapper.insertSelective(bizb);
					}

				}
			}
		}

		if (bondsman2 != null) {
			if (bondsman2.length > 0) {
				for (int i = 0; i < bmphone2.length; i++) {// 第二到四年年担保人信息
					if (StringUtils.isNotBlank(bmphone2[i].toString())) {
						System.out.println(bmphone2[i]);
						BizBondsman bizb = new BizBondsman();
						bizb.setBmaddress(bmaddress2[i]);
						bizb.setBmfaxes(bmfaxes2[i]);
						bizb.setSaleborrowid(id);
						bizb.setBondsman(bondsman2[i]);
						bizb.setBmrunaddress(bmrunaddress2[i]);
						bizb.setBmphone(bmphone2[i]);
						bizb.setType("2");
						bizBondsmanMapper.insertSelective(bizb);
					}
				}
			}

		}
		Bizpayplan biz = new Bizpayplan();
		Calendar now = Calendar.getInstance();
		now.setTime(format1.parse(sightime1));
		now.add(Calendar.DATE, -1);
		int day = now.get(Calendar.DAY_OF_MONTH);
		List<Map<String, Object>> dayList = getday(day, now, 48, format1);
		for (int i = 0; i < dayList.size(); i++) {
			if (i == 0) {// 第一期
				biz.setPrice(BigDecimal.valueOf(new BigDecimal(leaseprice2).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue()));
				biz.setOpenbank(bizsaleborrow.getOpenbank());
				biz.setAccountcode(bizsaleborrow.getAccountcode());
				biz.setAccountname(bizsaleborrow.getAccountname());
			} else if (i > 0 && i < 12) {// 二到十一二期
				biz.setPrice(BigDecimal.valueOf(new BigDecimal(leaseprice3).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue()));
				biz.setOpenbank(bizsaleborrow.getOpenbank());
				biz.setAccountcode(bizsaleborrow.getAccountcode());
				biz.setAccountname(bizsaleborrow.getAccountname());
			} else if (i == 12) {// 第十三期
				biz.setPrice(BigDecimal.valueOf(new BigDecimal(leaseprice4).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue()));
				biz.setOpenbank(bizsaleborrow.getSopenbank());
				biz.setAccountcode(bizsaleborrow.getSaccountcode());
				biz.setAccountname(bizsaleborrow.getSaccountname());
			} else if (i > 12) {// 第十四到四十八期
				biz.setPrice(BigDecimal.valueOf(new BigDecimal(leaseprice5).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue()));
				biz.setOpenbank(bizsaleborrow.getSopenbank());
				biz.setAccountcode(bizsaleborrow.getSaccountcode());
				biz.setAccountname(bizsaleborrow.getSaccountname());
			}
			Map<String, Object> map = dayList.get(i);
			Iterator<String> it = map.keySet().iterator();
			while (it.hasNext()) {
				String str = (String) it.next();
				biz.setPaytime(format1.parse((String) map.get(str)));
			}
			biz.setId(UUIDTool.getUUID());
			biz.setTerm("第" + term[i] + "期");
			biz.setLeasebackid(id);
			biz.setContractid(Bizsale.getContractid());
			biz.setName(bizsaleborrow.getBname());
			biz.setIdentify(bizsaleborrow.getIdentify());
			biz.setPhone(bizsaleborrow.getBphone());
			biz.setPayday(Integer.toString(day));
			biz.setCreatetime(new Date());
			bizpayplanMapper.insertSelective(biz);
		}
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		flow.setTaskname("融资租赁合同修改保存");
		flow.setTasktype1(3);
		insertSelective(flow);
	}

	/**
	 * 保险添加保存
	 * @param bizcontract
	 * @throws ParseException 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void addinsurancesave(Bizcontract bizcontract, String insurancetime) throws ParseException {
		// TODO Auto-generated method stub
		bizcontract.setStatus("8");
		BigDecimal amount = BigDecimal.ZERO;// 门店额度
		if (bizcontract.getInsurance1() != null) {// 报价交强险
			amount = amount.add(bizcontract.getInsurance1());
		}
		if (bizcontract.getCinsurance1() != null) {// 报价商业险总和(不加车船税)
			amount = amount.add(bizcontract.getCinsurance1());
		}
		if (StringUtils.isNotBlank(insurancetime)) {// 交强险交保时间
			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			bizcontract.setInsurance1time(format1.parse(insurancetime));
		}
		bizcontract.setInsurancesure(amount);
		bizcontractMapper.updateByPrimaryKeySelective(bizcontract);
		flowscheme flow = new flowscheme();
		flow.setTaskid(bizcontract.getId());
		flow.setTaskname("保险报价添加保存");
		flow.setTasktype1(2);
		insertSelective(flow);
	}

	public Map<String, Object> carlibrarylist(Map<String, Object> paraMap) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> result = carMapper.selectcarlibrary(paraMap);
		int num = carMapper.countselectcarlibrary(paraMap);
		map.put("result", result);
		map.put("num", num);
		return map;
	}

	/**
	 * 车况添加保存
	 * @param carcase
	 * @param id
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void carcasesave(String carcase, Integer id) {
		// TODO Auto-generated method stub
		Car car = carMapper.selectByPrimaryKey(id);
		Shop shop = shopMapper.selectByPrimaryKey(car.getShopId());
		procarcase pro = new procarcase();
		pro.setCarid(id);
		pro.setCreatetime(new Date());
		pro.setShopid(car.getShopId());
		pro.setShopname(shop.getName());
		pro.setCarcase(carcase);
		procarcaseMapper.insertSelective(pro);
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		flow.setTaskname("库表车况添加保存");
		flow.setTasktype1(1);
		insertSelective(flow);
	}

	public List<procarcase> carcasedetails(Integer id) {
		procarcase pro = new procarcase();
		pro.setCarid(id);
		return procarcaseMapper.selectByCriteria(pro);
		// TODO Auto-generated method stub

	}

	/**
	 * 配车时查看是否超额
	 * @param checkval 
	 * @param id 
	 * @return 门店配车表中还没有到店的车算门店的额度 配到别的门店的车还没移库算本门店的额度
	 */
	public void comparisonTotaMoney(String[] checkval, Integer id) {
		// TODO Auto-generated method stub
		Shop shop = shopMapper.selectByPrimaryKey(id);
		BigDecimal amount = BigDecimal.ZERO;// 门店额度
		BigDecimal nowamount = BigDecimal.ZERO;// 门店现有额度
		BigDecimal a = BigDecimal.ZERO;
		String c = "";
		String b = "";
		if (("2").equals(shop.getType()) && shop.getFinanceType() == 1) {// 样车金融门店
			if (shop.getNewtime() == null) {
				throw new PortalAppUnCheckedException("请去门店管理填写起息日！");
			}
		}
		for (int i = 0; i < checkval.length; i++) {// 要配的车
			Car shopcar = carMapper.selectByPrimaryKey(Integer.parseInt(checkval[i]));
			if (shopcar.getSupplycarstatus() != null) {
				if (shopcar.getSupplycarstatus() == 1 || shopcar.getSupplycarstatus() == 2) {
					throw new PortalAppUnCheckedException("车架号" + shopcar.getVin() + "已经在配车中！");
				}
			}
			if (shopcar.getSaleStatus() == null) {// 用于验证未销售绑定的车一家门店配两次
				prosupplycar procar = new prosupplycar();
				procar.setCarid(Integer.parseInt(checkval[i]));
				procar.setMoveshopid(id);
				List<prosupplycar> procar1 = prosupplycarMapper.selectByCriteria(procar);
				if (procar1.size() > 0) {
					for (prosupplycar prosupplycar : procar1) {
						if (prosupplycar.getSupplystatus() != 2) {
							b += procar1.get(0).getVin() + ",";
						}
					}
				}
			}
			if (id.equals(shopcar.getShopId())) {
				c += shopcar.getVin() + ",";
			}
			/*
			 * if (shopcar.getSettlementprice() == null) { throw new
			 * PortalAppUnCheckedException("该车价号" + shopcar.getVin() + "的车没有每日报价！"); }
			 */
			if (("2").equals(shop.getType())) {
				if (shop.getFinanceType() == 1) {// 样车金融
					if (shopcar.getSaleStatus() == null) {// 未销售绑定的车才计算入现有额度
						if (shopcar.getSettlementprice() != null) {
							nowamount = nowamount.add(shopcar.getSettlementprice());
						} else {
							if (shopcar.getTypeinsettleprice() == null) {
								throw new PortalAppUnCheckedException("该车价号" + shopcar.getVin() + "的车没有结算价和每日报价！");
							}
							nowamount = nowamount.add(shopcar.getTypeinsettleprice());
						}
					}
				} else {// 采购金融
					if (shopcar.getPurchasesettlementprice() == null) {
						throw new PortalAppUnCheckedException("该车价号" + shopcar.getVin() + "的车没有采购金融结算价！");
					}
					nowamount = nowamount.add(shopcar.getPurchasesettlementprice());// /采购金融结算价
				}
			}
		}
		if (b.length() > 0) {
			throw new PortalAppUnCheckedException("车架号" + b + "的车已经在本门店配过！");
		}
		if (c.length() > 0) {
			throw new PortalAppUnCheckedException("车架号" + c + "的车已经在本门店！");
		}
		if (("2").equals(shop.getType())) {// 城市合伙人
			if (shop.getFinanceType() == null) {
				throw new PortalAppUnCheckedException("该城市合伙人没有设置合伙类型！");
			}
			if (shop.getFinanceType() == 1) {// 样车金融额度
				if (shop.getCredit() == null) {
					throw new PortalAppUnCheckedException("样车金融额度未填写！");
				}
				amount = shop.getCredit().multiply(new BigDecimal("10000"));// 样车金融额度
				List<prosupplycar> pro = prosupplycarMapper.selectsupplycar(id);// 根据门店查询配车表中还没有到店的车
				if (pro.size() > 0) {
					for (prosupplycar prosupplycar : pro) {
						nowamount = nowamount.add(prosupplycar.getSettlementprice());
					}
				}
				List<Car> car = carMapper.shopcar(id);// 根据门店查询门店可售未销售绑定的车还有已经配到别的门店还没移库的车
				if (car.size() > 0) {
					for (Car car2 : car) {
						if (car2.getContractprice() == null) {
							c += car2.getVin() + ",";
						} else if (car2.getSaleStatus() == null) {// 配车中的车销售绑定不计算额度中
							nowamount = nowamount.add(car2.getContractprice());// 加入门店的展销协议价格
						}
					}
				}
				if (c.length() > 0) {
					throw new PortalAppUnCheckedException("该门店中" + c + "的车没有协议签订价格无法计算实际额度");
				}
				a = nowamount.subtract(amount);
				if (a.doubleValue() > 100000) {
					throw new PortalAppUnCheckedException("样车金融配车超额" + a + "元！");
				}
			} else {// 采购金融额度
				if (shop.getTermid() == null) {
					throw new PortalAppUnCheckedException("采购金融合伙人门店还未建组！");
				}
				BizShopTerm shopterm = bizshoptermMapper.selectByPrimaryKey(shop.getTermid());
				if (shopterm == null) {
					throw new PortalAppUnCheckedException("采购金融合伙人门店还未建组！");
				}
				Shop shop1 = new Shop();
				shop1.setTermid(shopterm.getId());
				List<Shop> shoplist = shopMapper.selectByCriteria(shop1);
				amount = (shopterm.getTotalmoney()).multiply(new BigDecimal("10000"));// 采购金融额度
				for (Shop shoplist1 : shoplist) {
					List<prosupplycar> pro = prosupplycarMapper.selectsupplycar(shoplist1.getId());// 根据门店查询配车表中还没有到店的车
					if (pro.size() > 0) {
						for (prosupplycar prosupplycar : pro) {
							nowamount = nowamount.add(prosupplycar.getSettlementprice());
						}
					}
					List<Car> car = carMapper.shopcar(shoplist1.getId());// 根据门店查询门店可售未销售绑定的车还有已经配到别的门店还没移库的车
					if (car.size() > 0) {
						for (Car car2 : car) {
							if (car2.getContractprice() == null) {
								throw new PortalAppUnCheckedException("该门店中" + car2.getVin() + "的车没有协议签订价格无法计算实际额度");
							} else if (car2.getSaleStatus() == null) {
								nowamount = nowamount.add(car2.getContractprice());// 加入门店的展销协议价格
							}
						}
					}
				}
				a = nowamount.subtract(amount);
				if (a.doubleValue() > 0) {
					throw new PortalAppUnCheckedException("采购金融配车超额");
				}
			}
		}
	}

	/**
	 * 配车单保存
	 * @param money 
	 * @param protocolurlfiles
	 * @param signingdate
	 * @param duedate
	 * @param checkval
	 * @param id
	 * @throws IOException 门店没有确认到店 pro_car表中的签约时间和结束时间还有签约价都是原门店的
	 * @throws ParseException 门店配车表中还没有到店的车算门店的额度 配到别的门店的车还没移库算本门店的额度
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void supplycarsave(BigDecimal money, MultipartFile protocolurlfiles, String name, String signingdate, String duedate, String[] checkval, Integer id)
			throws IOException, ParseException {
		// TODO Auto-generated method stub
		PayMoneyInterest paymoney = new PayMoneyInterest();
		PayMoneyInterest paymoney1 = new PayMoneyInterest();
		PayMoneyInterest paymoney4 = new PayMoneyInterest();
		prosupplycartable table = new prosupplycartable();
		prosupplycar supplycar = new prosupplycar();
		Shop shop = shopMapper.selectByPrimaryKey(id);
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		Car car = new Car();
		table.setProtocolurl(resourceService.CustomsDeclarationOutboundSave(protocolurlfiles, FileTypeEnum.supplycar));
		Map<String, Map<String, Object>> maps = new HashMap<String, Map<String, Object>>();
		Map<String, Object> tMap = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(table.getProtocolurl())) {
			tMap.put("is", protocolurlfiles.getInputStream());
			tMap.put("size", protocolurlfiles.getSize());
			maps.put(table.getProtocolurl(), tMap);
		}
		if (maps.entrySet().size() > 0) {
			resourceService.carCustomsDeclarationOutboundSave(maps, true);
		}
		table.setCreatetime(date);
		table.setShopid(id);
		table.setShopname(shop.getName());
		if (StringUtils.isNotBlank(duedate)) {
			table.setDuedate(format1.parse(duedate));
		}
		if (StringUtils.isNotBlank(signingdate)) {
			table.setSigningdate(format1.parse(signingdate));
		}
		if (("2").equals(shop.getType())) {// 城市合伙人
			if (shop.getFinanceType() == 1) {// 样车金融额度

				if (money.doubleValue() > 0) {// 超额
					table.setExceedmoney(money);// 超额但没超过10万元存入超额的钱数
					table.setStatus(1);
					supplycar.setSupplystatus(1);
				} else {// 未超额
					table.setStatus(4);
					supplycar.setSupplystatus(4);
				}

			} else {
				/*
				 * if (money.doubleValue()>0) {//采购金融金融额度 table.setExceedmoney(money);
				 * table.setStatus(1); supplycar.setSupplystatus(1); }else{
				 */
				table.setStatus(4);
				supplycar.setSupplystatus(4);
			}
		} else {// 其他类型的门店
			table.setStatus(4);
			supplycar.setSupplystatus(4);
		}
		supplycar.setFinancialtype(shop.getFinanceType());
		table.setFinancialtype(shop.getFinanceType());
		table.setName(name);
		prosupplycartableMapper.insertSelective(table);

		for (int i = 0; i < checkval.length; i++) {
			if (Integer.parseInt(checkval[i]) != 0) {
				car.setSupplycarstatus(1);
				if (StringUtils.isNotBlank(duedate)) {
					car.setDuedate(format1.parse(duedate));
				}
				if (StringUtils.isNotBlank(signingdate)) {
					car.setSigningdate(format1.parse(signingdate));
				}
				car.setId(Integer.parseInt(checkval[i]));
				car.setStatus(3);
				carMapper.updateByPrimaryKeySelective(car);
				Car car3 = carMapper.selectByPrimaryKey(Integer.parseInt(checkval[i]));

				if (car3.getSettlementprice() == null) {// 每日结算价为空时用录入时的结算价
					car3.setSettlementprice(car3.getTypeinsettleprice());
				}
				if (car3.getShopId() != null) {// 说明车现在在门店
					Shop sh = shopMapper.selectByPrimaryKey(car3.getShopId());
					supplycar.setShopid(sh.getId());
					supplycar.setShopname(sh.getName());
					supplycar.setNowaddress(sh.getAddress());
				} else {// 车在仓库
					Store store = storeMapper.selectByPrimaryKey(car3.getStoreId());
					supplycar.setStoreid(store.getId());
					supplycar.setShopname(store.getName());
					supplycar.setNowaddress(store.getAddress());
				}
				supplycar.setBrand(car3.getBrand());
				supplycar.setModel(car3.getModel());
				supplycar.setVersion(car3.getVersion());
				supplycar.setVin(car3.getVin());
				supplycar.setCarid(car3.getId());
				supplycar.setCreatetime(date);
				supplycar.setIncolor(car3.getInnerColor());
				supplycar.setOutcolor(car3.getOutlookColor());
				if (StringUtils.isNotBlank(duedate)) {
					supplycar.setDuedate(format1.parse(duedate));
				}
				if (StringUtils.isNotBlank(signingdate)) {
					supplycar.setSigningdate(format1.parse(signingdate));
				}
				supplycar.setMoveshopid(id);
				supplycar.setMoveshopname(shop.getName());
				supplycar.setMoveaddress(shop.getAddress());
				supplycar.setSupplycartableid(table.getId());
				InventoryQuotation inventory = new InventoryQuotation();// 每日报价表对应
				ProcurementWeeklyQuotation InventoryDaily = new ProcurementWeeklyQuotation();// 采购金融每周报价
				InventoryDaily.setBrand(car3.getBrand());
				InventoryDaily.setCarModel(car3.getModel());
				InventoryDaily.setVersion(car3.getVersion());
				InventoryDaily.setConfigure(car3.getConfig());
				InventoryDaily.setColour(car3.getInnerColor());
				inventory.setBrand(car3.getBrand());
				inventory.setCarModel(car3.getModel());
				inventory.setVersion(car3.getVersion());
				inventory.setConfigure(car3.getConfig());
				inventory.setColour(car3.getInnerColor());
				inventory.setQuoteDate(date);
				List<InventoryQuotation> listinventory = inventoryQuotationMapper.selectByCriteria(inventory);
				List<ProcurementWeeklyQuotation> listInventoryDaily = procurementWeeklyQuotationMapper.selectByCriteria(InventoryDaily);

				if (("2").equals(shop.getType())) {// 城市合伙人
					if (shop.getFinanceType() == 2) {// 采购金融门店
						if (listInventoryDaily.size() > 0) {
							supplycar.setSettlementprice(listInventoryDaily.get(0).getSettlementPrice());
						} else {
							supplycar.setSettlementprice(car3.getPurchasesettlementprice());
						}
					} else {
						if (listinventory.size() > 0) {// 有车型报价的就用车型报价的价格，不然就用车的每日报价价格
							supplycar.setSettlementprice(listinventory.get(0).getSettlementPrice());
						} else {
							if (car3.getSettlementprice() != null) {
								supplycar.setSettlementprice(car3.getSettlementprice());// /car3.getSettlementprice()车辆结算价
							} else {
								supplycar.setSettlementprice(car3.getTypeinsettleprice());// /car3.getTypeinsettleprice()录入时车辆结算价
							}
						}
					}

					paymoney1.setCarId(Integer.parseInt(checkval[i]));
					List<PayMoneyInterest> paymoney2 = payMoneyInterestMapper.selectByCriteria(paymoney1);// 根据id查询计息时间表
					if (paymoney2.size() > 0) {//
						for (PayMoneyInterest payMoneyInterest : paymoney2) {
							if (payMoneyInterest.getPayEndDate() == null) {// 为空时说明这条数据还没结束日期的计息数据，这时添加计息结束日期
								paymoney4.setPayEndDate(date);
								paymoney4.setId(payMoneyInterest.getId());
								paymoney4.setModifyTime(date);
								payMoneyInterestMapper.updateByPrimaryKeySelective(paymoney4);
							}
						}
					}
					if (("2").equals(shop.getType())) {
						if (shop.getFinanceType() == 1) {// 样车金融才有计息表
							paymoney.setPayStartDate(date);
							paymoney.setShopId(id);
							paymoney.setCarId(Integer.parseInt(checkval[i]));
							paymoney.setId(UUIDTool.getUUID());
							paymoney.setCreateTime(date);
							payMoneyInterestMapper.insertSelective(paymoney);
						}
					}
				}
				prosupplycarMapper.insertSelective(supplycar);
			}
		}
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		flow.setTaskname("配车单提交保存");
		flow.setTasktype1(1);
		insertSelective(flow);
	}

	/**
	 * 
	 * @param prosupplycartable
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> supplycartablelist(prosupplycartable prosupplycartable, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<prosupplycartable> list = prosupplycartableMapper.selectByCriteria(prosupplycartable, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int c = prosupplycartableMapper.countByCriteria(prosupplycartable);
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	/**
	 * 配车超额审核通过
	 * @param id
	 * @param loginid
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void movelibraryauditpass(Integer id, Integer loginid) {
		// TODO Auto-generated method stub
		prosupplycartable table = new prosupplycartable();
		table.setStatus(4);
		table.setId(id);
		prosupplycartableMapper.updateByPrimaryKeySelective(table);
		prosupplycarMapper.updatemovelibrarypass(id);
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		flow.setTaskname("超额配车单审核通过");
		flow.setTasktype1(1);
		insertSelective(flow);
	}

	/**
	 * 配车超额审核不通过
	 * @param id
	 * @param loginid
	 * @param nopasscause 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void movelibraryauditnopass(Integer id, Integer loginid, String nopasscause) {
		// TODO Auto-generated method stub
		prosupplycartable table = new prosupplycartable();
		table.setStatus(2);
		table.setId(id);
		table.setNopasscause(nopasscause);
		prosupplycartableMapper.updateByPrimaryKeySelective(table);
		prosupplycarMapper.updatemovelibrarynopass(id);
		prosupplycar car1 = new prosupplycar();
		car1.setSupplycartableid(id);
		List<prosupplycar> car2 = prosupplycarMapper.selectByCriteria(car1);
		for (prosupplycar prosupplycar : car2) {
			carMapper.untiesupplycar(prosupplycar.getCarid());
		}
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		flow.setTaskname("超额配车单审核不通过");
		flow.setTasktype1(1);
		flow.setNopasscause(nopasscause);
		insertSelective(flow);
	}

	/**
	 * 配车物流开始
	 * @param id
	 * @param loginid
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void movestart(Integer id) {
		// TODO Auto-generated method stub
		Date date = new Date();
		prosupplycar car1 = new prosupplycar();
		car1.setSupplycartableid(id);
		Car car2 = new Car();
		/*
		 * PayMoneyInterest paymoney = new PayMoneyInterest(); PayMoneyInterest paymoney1 = new
		 * PayMoneyInterest();
		 */
		List<prosupplycar> car = prosupplycarMapper.selectByCriteria(car1);
		for (prosupplycar prosupplycar : car) {
			car2.setId(prosupplycar.getCarid());
			car2.setSupplycarstatus(2);
			carMapper.updateByPrimaryKeySelective(car2);
			car1.setTimeofshipment(date);
			car1.setId(prosupplycar.getId());
			car1.setSupplystatus(5);
			prosupplycarMapper.updateByPrimaryKeySelective(car1);
			/*
			 * paymoney.setCarId(prosupplycar.getCarid());
			 * paymoney.setShopId(prosupplycar.getMoveshopid()); List<PayMoneyInterest> listpay =
			 * payMoneyInterestMapper.selectByCriteria(paymoney); if (listpay.size() > 0) {
			 * paymoney1.setPayEndDate(date); paymoney1.setId(listpay.get(0).getId());
			 * payMoneyInterestMapper.updateByPrimaryKeySelective(paymoney1); }
			 * paymoney.setCreateTime(date); paymoney.setPayStartDate(date);
			 * paymoney.setId(UUIDTool.getUUID()); payMoneyInterestMapper.insertSelective(paymoney);
			 */
		}
		prosupplycartable supplycartable = new prosupplycartable();
		supplycartable.setId(id);
		supplycartable.setStatus(5);
		prosupplycartableMapper.updateByPrimaryKeySelective(supplycartable);
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		flow.setTaskname("配车单物流开始");
		flow.setTasktype1(1);
		insertSelective(flow);

	}

	/**
	 * 物流确认到店
	 * @param id
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void moveaffirm(Integer id) {
		// TODO Auto-generated method stub
		prosupplycar car1 = new prosupplycar();
		car1.setSupplycartableid(id);
		List<prosupplycar> car = prosupplycarMapper.selectByCriteria(car1);
		for (prosupplycar prosupplycar : car) {
			car1.setId(prosupplycar.getId());
			car1.setSupplystatus(6);
			prosupplycarMapper.updateByPrimaryKeySelective(car1);
		}
		prosupplycartable supplycartable = new prosupplycartable();
		supplycartable.setId(id);
		supplycartable.setStatus(6);
		prosupplycartableMapper.updateByPrimaryKeySelective(supplycartable);
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		flow.setTaskname("配车单物流确认到店");
		flow.setTasktype1(1);
		insertSelective(flow);
	}

	/**
	 * 门店确认到店列表查询
	 * @param prosupplycartable
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> shopconfirmedlist(UserDTO user, prosupplycartable prosupplycartable, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<Integer> shopids = shopGroupService.queryShopGroupIdsByUseridandShopid(user.getId(), prosupplycartable.getShopid());
		prosupplycartable.setShopids(shopids);
		prosupplycartable.setShopid(null);
		List<prosupplycartable> list = prosupplycartableMapper.selectAllByCriteria(prosupplycartable, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int c = prosupplycartableMapper.countAllByCriteria(prosupplycartable);
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	/**
	 * 门店确认到店
	 * @param id
	 * @param loginid 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void shopconfirmed(Integer id, Integer loginid) {
		prosupplycar car1 = new prosupplycar();
		car1.setSupplycartableid(id);
		Date date = new Date();
		prosupplycartable pro = prosupplycartableMapper.selectByPrimaryKey(id);
		Shop shop = shopMapper.selectByPrimaryKey(pro.getShopid());
		List<prosupplycar> car = prosupplycarMapper.selectByCriteria(car1);
		Car car2 = new Car();
		for (prosupplycar prosupplycar : car) {
			Shop shop1 = shopMapper.selectByPrimaryKey(prosupplycar.getMoveshopid());
			car1.setId(prosupplycar.getId());
			car1.setSupplystatus(7);
			car1.setArrivaltime(date);
			prosupplycarMapper.updateByPrimaryKeySelective(car1);
			if (("0").equals(shop.getType()) || ("1").equals(shop.getType()) || ("3").equals(shop.getType())) {
				car2.setId(prosupplycar.getCarid());
				car2.setShopId(prosupplycar.getMoveshopid());
				car2.setCarAddress(shop1.getAddress());
				carMapper.otherCarMoveshop(car2);
			} else if (("2").equals(shop.getType())) {// /城市合伙人
				if (shop.getFinanceType() == 1) {// 样车金融
					car2.setId(prosupplycar.getCarid());
					car2.setShopId(prosupplycar.getMoveshopid());
					car2.setDuedate(prosupplycar.getDuedate());
					car2.setCarAddress(shop1.getAddress());
					car2.setSigningdate(prosupplycar.getSigningdate());
					car2.setContractprice(prosupplycar.getSettlementprice());
					car2.setContractpricetime(prosupplycar.getCreatetime());
					car2.setStoreType(1);
					carMapper.sampleCarMoveShop(car2);
				} else if (shop.getFinanceType() == 2) {// 采购金融
					car2.setId(prosupplycar.getCarid());
					car2.setShopId(prosupplycar.getMoveshopid());
					car2.setCarAddress(shop1.getAddress());
					car2.setFinancialtype(1);
					car2.setContractprice(prosupplycar.getSettlementprice());
					car2.setContractpricetime(prosupplycar.getCreatetime());// 配车创建时间
					car2.setStoreType(1);
					carMapper.otherCarMoveshop(car2);
				}
			}
		}
		prosupplycartable supplycartable = new prosupplycartable();
		supplycartable.setId(id);
		supplycartable.setStatus(7);
		prosupplycartableMapper.updateByPrimaryKeySelective(supplycartable);
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		flow.setTaskname("配车门店确认到店");
		flow.setTasktype1(1);
		insertSelective(flow);
	}

	/**
	 * 验车通过
	 * @param id
	 * @param loginid
	 * @param vin
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void paycarpass(Integer id, Integer loginid, String vin) {
		// TODO Auto-generated method stub
		flowscheme flow = new flowscheme();
		Date now = new Date();
		if (StringUtils.isNotBlank(vin)) {// 交车验车换车时
			Car car = carMapper.selectvendibility(vin);
			Bizcontract bizcont = bizcontractMapper.selectByPrimaryKey(id);
			if (car == null) {
				throw new PortalAppUnCheckedException("库表中车架号" + vin + "的车不存在或已经销售！");
			} else {
				flow.setTaskname("换车交车验车通过");
				// 操作利息======开始
				Shop shop = shopMapper.selectByPrimaryKey(bizcont.getShopid());
				String shoptype = shop.getType();// 类型 0虚拟1自营2城市合伙人3寄售
				Integer financetype = shop.getFinanceType();// 1 样车 金融 2采购 金融
				if ("2".equals(shoptype) && 1 == financetype.intValue()) {// 城市合伙人并且是样车金融 才可以操作计息表

					PayMoneyInterest interest = new PayMoneyInterest();
					interest.setId(UUIDTool.getUUID());
					interest.setShopId(shop.getId());// 卖车的门店
					interest.setCarId(car.getId());
					interest.setPayStartDate(now);
					interest.setPayEndDate(now);
					interest.setCreateTime(now);
					interest.setIsSale(1);// 1是卖车的。 如果是卖车的 则不计算利息了
					payMoneyInterestMapper.insertSelective(interest);// 插一条卖车不计息的记录

					PayMoneyInterest temp = new PayMoneyInterest(), resultInterest = null;
					temp.setCarId(car.getId());
					List<PayMoneyInterest> lst = payMoneyInterestMapper.selectByCriteria(temp);
					for (PayMoneyInterest payMoneyInterest : lst) {
						Date endDate = payMoneyInterest.getPayEndDate();
						if (endDate == null) {
							resultInterest = payMoneyInterest;
							break;
						}
					}
					if (resultInterest != null) {
						PayMoneyInterest temp1 = new PayMoneyInterest();
						temp1.setId(resultInterest.getId());
						temp1.setPayEndDate(now);
						payMoneyInterestMapper.updateByPrimaryKeySelective(temp1);// 如果此车有未结息的记录 更新之
					}
				}
				// 操作配车=========开始
				Integer carshopid = car.getShopId();
				if (carshopid != null) {// 在门店中
					if (shop.getId().equals(carshopid)) {// 车就在卖车的这个门店里
						// 无须配车
					} else {
						prosupplycartable table = new prosupplycartable();
						Shop from = shopMapper.selectByPrimaryKey(carshopid);
						if (bizcont.getFinance().equals("1")) {
							table.setName("系统自动配车（金融交车验车换车），从门店[id：" + carshopid + ",名称：" + from.getName() + "]->门店[id：" + shop.getId() + ",名称："
									+ shop.getName() + "]，配车时间[" + DateUtils.formate(now, DateUtils.DEFAULT_DATETIME_FORMAT_SEC) + "]");
						} else {
							table.setName("系统自动配车（全款交车验车换车），从门店[id：" + carshopid + ",名称：" + from.getName() + "]->门店[id：" + shop.getId() + ",名称："
									+ shop.getName() + "]，配车时间[" + DateUtils.formate(now, DateUtils.DEFAULT_DATETIME_FORMAT_SEC) + "]");
						}

						table.setCreatetime(now);
						table.setShopid(shop.getId());
						table.setShopname(shop.getName());
						table.setFinancialtype(shop.getFinanceType());
						table.setStatus(4);// 4超额的门店配车审核通过和没有超额门店的配车
						prosupplycartableMapper.insertSelective(table);

						prosupplycar detail = new prosupplycar();
						detail.setSupplycartableid(table.getId());
						detail.setCarid(car.getId());
						detail.setBrand(car.getBrand());
						detail.setModel(car.getModel());
						detail.setVersion(car.getVersion());
						detail.setVin(car.getVin());
						detail.setLeavefactorytime(car.getLeaveFactoryTime());
						detail.setOutcolor(car.getOutlookColor());
						detail.setIncolor(car.getInnerColor());
						detail.setShopid(carshopid);
						detail.setShopname(from.getName());
						detail.setNowaddress(from.getAddress());
						detail.setMoveshopid(shop.getId());
						detail.setMoveaddress(shop.getAddress());
						detail.setMoveshopname(shop.getName());
						detail.setCreatetime(now);
						if ("2".equals(shop.getType()) && shop.getFinanceType() == 2) {// 当是采购金融门店销售时取录入时的采购结算价
							// 其他类型门店 时
							// 每日报价没值时取录入时的结算价
							if (car.getPurchasesettlementprice() == null) {
								throw new PortalBizCheckedException("您选择的车辆没有采购金融结算价，请核实");
							}
							detail.setSettlementprice(car.getPurchasesettlementprice());
						} else {
							if (car.getSettlementprice() == null && car.getTypeinsettleprice() == null) {
								throw new PortalBizCheckedException("选择的车辆没有结算价不能选车！");
							} else {
								detail.setSettlementprice(car.getSettlementprice() != null ? car.getSettlementprice() : car.getTypeinsettleprice());
							}
						}
						detail.setSupplystatus(4);// 4超额的门店配车审核通过和没有超额门店的配车
						detail.setFinancialtype(shop.getFinanceType());
						prosupplycarMapper.insertSelective(detail);
					}
				} else {// 在仓库中
					Integer carstoreid = car.getStoreId();
					prosupplycartable table = new prosupplycartable();
					Store from = storeMapper.selectByPrimaryKey(carstoreid);
					if (bizcont.getFinance().equals("1")) {
						table.setName("系统自动配车（金融交车验车换车），从门店[id：" + carshopid + ",名称：" + from.getName() + "]->门店[id：" + shop.getId() + ",名称：" + shop.getName()
								+ "]，配车时间[" + DateUtils.formate(now, DateUtils.DEFAULT_DATETIME_FORMAT_SEC) + "]");
					} else {
						table.setName("系统自动配车（全款交车验车换车），从门店[id：" + carshopid + ",名称：" + from.getName() + "]->门店[id：" + shop.getId() + ",名称：" + shop.getName()
								+ "]，配车时间[" + DateUtils.formate(now, DateUtils.DEFAULT_DATETIME_FORMAT_SEC) + "]");
					}
					table.setCreatetime(now);
					table.setShopid(shop.getId());
					table.setShopname(shop.getName());
					table.setFinancialtype(shop.getFinanceType());
					table.setStatus(4);// 4超额的门店配车审核通过和没有超额门店的配车
					prosupplycartableMapper.insertSelective(table);

					prosupplycar detail = new prosupplycar();
					detail.setSupplycartableid(table.getId());
					detail.setCarid(car.getId());
					detail.setBrand(car.getBrand());
					detail.setModel(car.getModel());
					detail.setVersion(car.getVersion());
					detail.setVin(car.getVin());
					detail.setLeavefactorytime(car.getLeaveFactoryTime());
					detail.setOutcolor(car.getOutlookColor());
					detail.setIncolor(car.getInnerColor());
					detail.setStoreid(carstoreid);
					detail.setShopname(from.getName());
					detail.setNowaddress(from.getAddress());
					detail.setMoveshopid(shop.getId());
					detail.setMoveaddress(shop.getAddress());
					detail.setMoveshopname(shop.getName());
					detail.setCreatetime(now);
					if ("2".equals(shop.getType()) && shop.getFinanceType() == 2) {// 当是采购金融门店销售时取录入时的采购结算价
						// 其他类型门店 时
						// 每日报价没值时取录入时的结算价
						if (car.getPurchasesettlementprice() == null) {
							throw new PortalBizCheckedException("您选择的车辆没有采购金融结算价，请核实");
						}
						detail.setSettlementprice(car.getPurchasesettlementprice());
					} else {
						if (car.getSettlementprice() == null && car.getTypeinsettleprice() == null) {
							throw new PortalBizCheckedException("选择的车辆没有结算价不能选车！");
						} else {
							detail.setSettlementprice(car.getSettlementprice() != null ? car.getSettlementprice() : car.getTypeinsettleprice());
						}
					}
					detail.setSupplystatus(4);// 4超额的门店配车审核通过和没有超额门店的配车
					detail.setFinancialtype(shop.getFinanceType());
					prosupplycarMapper.insertSelective(detail);
				}
				Bizcontract bizcon = bizcontractMapper.selectByPrimaryKey(id);
				if (("1").equals(bizcon.getFinance())) {// 金融合同
					Bizcontract con = new Bizcontract();
					con.setStatus2(1);
					con.setId(id);
					con.setVin(vin);
					con.setChangevin(bizcont.getVin());
					con.setCarid(car.getId());
					con.setChangecarid(bizcon.getCarid());
					bizcontractMapper.updateByPrimaryKeySelective(con);
					Car car1 = new Car();
					car1.setSaleStatus(1);
					car1.setId(car.getId());

					carMapper.updateByPrimaryKeySelective(car1);
					carMapper.updateSaleStatus(bizcon.getCarid());
				} else {// 非金融合同
					Bizcontract con = new Bizcontract();
					con.setStatus2(1);
					con.setId(id);
					con.setVin(vin);
					con.setChangevin(bizcont.getVin());
					con.setCarid(car.getId());
					bizcontractMapper.updateByPrimaryKeySelective(con);
					carMapper.updateSaleStatus(bizcon.getCarid());
				}
			}
		} else {
			Bizcontract con = new Bizcontract();
			con.setStatus2(1);
			con.setId(id);
			bizcontractMapper.updateByPrimaryKeySelective(con);
		}
		flow.setTaskid(id);
		if (flow.getTaskname() == null) {// 交车验车时没有换车
			flow.setTaskname("交车验车通过");
		}
		flow.setTasktype1(2);
		insertSelective(flow);
	}

	/**
	 * 验车不通过解绑销售的车辆
	 * @param id
	 * @param loginid
	 * @param refundcause
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void paycarnopass(Integer id, Integer loginid, String refundcause) {
		// TODO Auto-generated method stub
		Bizcontract bizcon = bizcontractMapper.selectByPrimaryKey(id);
		carMapper.updateSaleStatus(bizcon.getCarid());
		Bizcontract con = new Bizcontract();
		con.setStatus2(2);
		con.setId(id);
		con.setRefundcause(refundcause);
		bizcontractMapper.updateByPrimaryKeySelective(con);
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		flow.setTaskname("交车验车不通过");
		flow.setTasktype1(2);
		insertSelective(flow);
	}

	/**
	 * 合同全款回款/金融首付/结算 查询
	 * @param filecode
	 * @param name
	 * @param bname
	 * @param workType
	 * @param identify
	 * @param start
	 * @param pageSize
	 * @param type
	 * @return
	 */

	public Map<String, Object> contractquery(String filecode, String name, String bname, String workType, String identify, String start, String pageSize,
			String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		pmap.put("start", (Integer.parseInt(start) - 1) * ps);
		pmap.put("size", ps);
		if (StringUtils.isNotBlank(filecode)) {
			pmap.put("filecode", filecode);
		}
		if (StringUtils.isNotBlank(name)) {
			pmap.put("name", name);
		}
		if (StringUtils.isNotBlank(bname)) {
			pmap.put("bname", bname);
		}
		if (StringUtils.isNotBlank(workType)) {
			pmap.put("clientype", workType);
		}
		if (StringUtils.isNotBlank(identify)) {
			pmap.put("identify", identify);
		}
		if (StringUtils.isNotBlank(type)) {// 门店审核通过 status 8 and status 1门店交车验车2验车不通过退款
											// 3全款回款确认或金融车首付款 4材料出库 5结算
			pmap.put("status", 60);
		}
		/*
		 * // 权限控制 if (StringUtils.isBlank(type)) {//门店审核通过 status 1,3,8 if
		 * (StringUtils.isBlank(all)) {// 不是总览 UserDTO userInfo = SecurityHelper.getAdminUserInfo();
		 * Collection<GrantedAuthority> as = userInfo.getAuthorities(); boolean ismanager = false;
		 * for (Iterator<GrantedAuthority> iterator = as.iterator(); iterator.hasNext();) {
		 * GrantedAuthority grantedAuthority = iterator.next(); if
		 * ("ROLE_SHOP_MANAGER".equals(grantedAuthority.toString())) {// ROLE_SHOP_MANAGER：店长角色 //
		 * 可以查看所有该店的店员签署的信息表 ismanager = true; break; } } if (ismanager) { if
		 * (StringUtils.isNotBlank(userInfo.getShop())) pmap.put("shopid", userInfo.getShop()); }
		 * else { pmap.put("sellid", userInfo.getId()); } } }
		 */
		List<Map<String, Object>> lst = bizcontractMapper.selectByMap(pmap);
		int size = bizcontractMapper.countByMap(pmap);
		map.put("result", lst);
		map.put("total", size);
		return map;
	}

	/**
	 * 全款回款确定通过
	 * @param id
	 * @param loginid
	 * @param realfinalpay
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void totalpaymentpass(Integer id, Integer loginid, BigDecimal realfinalpay, BigDecimal finalpay) {
		// TODO Auto-generated method stub

		Bizcontract con = new Bizcontract();
		con.setStatus2(3);
		con.setId(id);
		con.setFinalpay(finalpay);
		con.setRealfinalpay(realfinalpay);
		bizcontractMapper.updateByPrimaryKeySelective(con);
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		flow.setTaskname("全款回款确定通过");
		flow.setTasktype1(2);
		insertSelective(flow);
	}

	/**
	 * 金融定金审核通过
	 * @param id
	 * @param loginid
	 * @param financerealdownpay
	 * @param repairmoney 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void downpaypass(Integer id, Integer loginid, BigDecimal financerealdownpay, BigDecimal repairmoney) {
		// TODO Auto-generated method stub
		Bizcontract con = new Bizcontract();
		con.setStatus2(3);
		con.setId(id);
		con.setRepairmoney(repairmoney);
		con.setFinancerealdownpay(financerealdownpay);
		bizcontractMapper.updateByPrimaryKeySelective(con);
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		flow.setTaskname("金融定金确定通过");
		flow.setTasktype1(2);
		insertSelective(flow);
	}

	/**
	 * 材料出库通过
	 * @param bizcontract
	 * @param loginid
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void MaterialOutboundpass(Bizcontract bizcontract, Integer loginid) {
		// TODO Auto-generated method stub
		bizcontract.setStatus2(4);
		Bizcontract bizcontract2 = bizcontractMapper.selectByPrimaryKey(bizcontract.getId());
		Car car = new Car();
		car.setId(bizcontract2.getCarid());
		car.setOutStatus(7);// 客户已经提车
		car.setSaleStatus(4);// 已销已提
		carMapper.updateByPrimaryKeySelective(car);
		bizcontract.setMaterialoutboundtime(new Date());// 材料出库时间
		bizcontractMapper.updateByPrimaryKeySelective(bizcontract);
		flowscheme flow = new flowscheme();
		flow.setTaskid(bizcontract.getId());
		flow.setTaskname("材料出库");
		flow.setTasktype1(2);
		insertSelective(flow);
	}

	/**
	 * 结算保存通过
	 * @param balance
	 * @param loginid
	 * @param id
	 * @param totalreceiveprice
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void bizcontractbalance(BigDecimal balance, Integer loginid, Integer id, BigDecimal totalreceiveprice) {
		// TODO Auto-generated method stub
		Bizcontract biz = bizcontractMapper.selectByPrimaryKey(id);
		Bizcontract con = new Bizcontract();
		con.setStatus2(5);
		con.setId(id);
		con.setBalance(balance);
		con.setTotalreceiveprice(totalreceiveprice);
		bizcontractMapper.updateByPrimaryKeySelective(con);
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		if (("1").equals(biz.getFinance())) {
			flow.setTaskname("金融结算通过");
		}
		if (("2").equals(biz.getFinance())) {
			flow.setTaskname("全款结算通过");
		}
		flow.setTaskatatus("1");
		insertSelective(flow);
	}

	/**
	 * 
	 * @param filecode
	 * @param name
	 * @param bname
	 * @param workType
	 * @param identify
	 * @param start
	 * @param pageSize
	 * @param type
	 * @return
	 */
	public Map<String, Object> financialcontractslist(String filecode, String name, String bname, String workType, String identify, String start,
			String pageSize, Integer type) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		pmap.put("start", (Integer.parseInt(start) - 1) * ps);
		pmap.put("size", ps);
		if (type == 1) {
			pmap.put("status", 70);// 临时数据 用来查询复审通过要添加金融合同
		} else if (type == 2) {
			pmap.put("status", 80);// 临时数据 用来查全款车架号添加过后的信息，金融合同添加过后的信息 和保险报价后的信息
		} else if (type == 3) {
			pmap.put("status", 90);// 临时数据 金融定金审核通过后选车列表
		}
		if (StringUtils.isNotBlank(filecode)) {
			pmap.put("filecode", filecode);
		}
		if (StringUtils.isNotBlank(name)) {
			pmap.put("name", name);
		}
		if (StringUtils.isNotBlank(bname)) {
			pmap.put("bname", bname);
		}
		if (StringUtils.isNotBlank(workType)) {
			pmap.put("clientype", workType);
		}
		if (StringUtils.isNotBlank(identify)) {
			pmap.put("identify", identify);
		}
		List<Map<String, Object>> list = bizcontractMapper.selectByMap(pmap);
		int c = bizcontractMapper.countByMap(pmap);
		map.put("num", c);
		map.put("result", list);

		return map;
	}

	public List<Bizrisk> selsectmissmoney(Integer id) {
		// TODO Auto-generated method stub
		Bizrisk risk = new Bizrisk();
		risk.setContractid(id);
		return bizriskMapper.selectByCriteria(risk);
	}

	/**
	 * <p>同步保存文件</p>
	 * @param file
	 * @return
	 * @throws IOException
	 * @author wangzh
	 */
	public String uploadFileTogetherx(MultipartFile file, FileTypeEnum fte, boolean hasdot, String suffix) throws IOException {
		String picPath = null;
		if (file != null && file.getSize() > 0) {
			if (file.getSize() > 30000000) {
				throw new PortalBizCheckedException("文件不能超过30M");
			}
			String targetFileName = StringUtil.createFileName();
			if (hasdot) {
				targetFileName = targetFileName + suffix;
			}
			String path = resourceService.getFilePath(fte);
			picPath = path + "/" + DateUtils.formateCurrent(DateUtils.COMPACT_DATE_FORMAT) + "/" + targetFileName;
			resourceService.syncSaveFile(picPath, file.getInputStream(), true);
		}
		return picPath;
	}

	public void insertSelective(flowscheme flowscheme) {
		User user = SecurityHelper.getAdminUserInfo();
		flowscheme.setCreatetime(new Date());
		flowscheme.setUserid(user.getId());
		flowscheme.setUsername(user.getName());
		flowschemeMapper.insertSelective(flowscheme);
	}

	public Map<String, Object> moveLibraryListDetails(String brand, String model, String version, String vin, String name, String status, String start,
			String pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> pmap = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		pmap.put("start", (Integer.parseInt(start) - 1) * ps);
		pmap.put("size", ps);
		if (StringUtils.isNotBlank(brand)) {
			pmap.put("brand", brand);
		}
		if (StringUtils.isNotBlank(model)) {
			pmap.put("model", model);
		}
		if (StringUtils.isNotBlank(version)) {
			pmap.put("version", version);
		}
		if (StringUtils.isNotBlank(vin)) {
			pmap.put("vin", vin);
		}
		if (StringUtils.isNotBlank(name)) {
			pmap.put("name", name);
		}
		if (StringUtils.isNotBlank(status)) {
			pmap.put("status", status);
		}
		List<Map<String, Object>> list = prosupplycarMapper.moveLibraryListDetails(pmap);
		int listnum = prosupplycarMapper.countMoveLibraryListDetails(pmap);
		map.put("result", list);
		map.put("num", listnum);
		return map;
	}

}
