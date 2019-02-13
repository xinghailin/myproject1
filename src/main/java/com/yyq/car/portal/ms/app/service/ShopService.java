/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.ShopService
 * Created By: wangzh 
 * Created on: 2017年5月13日 下午10:08:47
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.yyq.car.portal.common.constant.Constants;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.exception.PortalAppCheckedException;
import com.yyq.car.portal.common.exception.PortalBizUnCheckedException;
import com.yyq.car.portal.common.mapper.auth.RoleAccountMapper;
import com.yyq.car.portal.common.mapper.auth.RoleMapper;
import com.yyq.car.portal.common.mapper.auth.UserMapper;
import com.yyq.car.portal.common.mapper.comm.LocationMapper;
import com.yyq.car.portal.common.mapper.product.CarMapper;
import com.yyq.car.portal.common.mapper.product.ShopMapper;
import com.yyq.car.portal.common.mapper.product.StoreMapper;
import com.yyq.car.portal.common.model.auth.Role;
import com.yyq.car.portal.common.model.auth.RoleAccount;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.comm.Location;
import com.yyq.car.portal.common.model.product.Car;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.common.model.product.Store;
import com.yyq.car.portal.common.util.CachFactory;
import com.yyq.car.portal.common.util.DateUtils;


/**
 * <P>TODO</P>
 * @author wangzh
 */
@Service
public class ShopService {

	@Autowired
	private ShopMapper shopMapper;

	@Autowired
	private StoreMapper storeMapper;

	@Autowired
	private CarMapper carMapper;

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private RoleAccountMapper roleAccountMapper;
	@Autowired
	private RoleMapper roleMapper;

	@Autowired
	private LocationMapper locationMapper;

	@Autowired
	private BizShopGroupService shopGroupService;

	/**
	 * 查询门店列表
	 * <p>TODO</p>
	 * @param shop
	 * @param pageStart
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public List<Shop> queryShopLst(Shop shop, String pageStart, String pageSize) {
		codeTrasferName(shop);
		int ps = Integer.parseInt(pageSize);
		List<Shop> lst = shopMapper.selectByCriteriaOrderByInvalid(shop, new RowBounds((Integer.parseInt(pageStart) - 1) * ps, ps));
		return lst;
	}

	/**
	 * 计算门店总数
	 * <p>TODO</p>
	 * @param shop
	 * @return
	 * @author wangzh
	 */
	public int countShop(Shop shop) {
		return shopMapper.countByCriteria(shop);
	}

	/**
	 * 保存门店
	 * <p>TODO</p>
	 * @param shop
	 * @author wangzh
	 * @param soldtime 
	 * @param snewtime 
	 * @throws ParseException 
	 */
	// @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED,
	// rollbackFor = Exception.class)
	public void shopEdit(Shop shop, String snewtime, String soldtime) throws ParseException {
		Integer id = shop.getId();

		// codeTrasferName(shop);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		if (StringUtils.isNotBlank(snewtime)) {
			shop.setNewtime(sdf.parse(snewtime));
		}
		if (StringUtils.isNotBlank(soldtime)) {
			shop.setOldtime(sdf.parse(soldtime));
		}

		if (id == null) {// 代表新增
			// 重名检测
			Shop temp = new Shop();
			shop.setCreateTime(new Date());
			temp.setName(shop.getName());
			int c = shopMapper.countByCriteria(temp);
			if (c > 0) {
				throw new PortalBizUnCheckedException("门店名称已存在！");
			}
			// 签约日期
			if (StringUtils.isNotBlank(shop.getSsigntime())) {
				shop.setSigntime(DateUtils.parse(shop.getSsigntime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
			}
			shopMapper.insertSelective(shop);
		} else if (id != null) {// 代表编辑
			// synchronized (this) {
			// 删除原有的
			// shopMapper.deleteByPrimaryKey(id);
			// 新增这个id的
			// shopMapper.insertSelective(shop);
			int c = shopMapper.countByNameForEdit(shop);
			if (c > 0) {
				throw new PortalBizUnCheckedException("门店名称已存在！");
			}
			if (StringUtils.isNotBlank(shop.getSsigntime())) {
				shop.setSigntime(DateUtils.parse(shop.getSsigntime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
			}
			shopMapper.updateSpecialByPrimaryKeySelective(shop);
			// }
		}
	}

	/**
	 * 删除门店
	 * <p>TODO</p>
	 * @param id
	 * @author wangzh
	 */
	public void shopDelete(String theId) {
		Car car = new Car();
		car.setShopId(Integer.parseInt(theId));
		int size = carMapper.countByCriteria(car);
		if (size > 0) {
			throw new PortalAppCheckedException("此门店里有车，不可删除！");
		}
		shopMapper.deleteByPrimaryKey(Integer.parseInt(theId));
	}

	/**
	 * location 地名主键转地名
	 * <p>TODO</p>
	 * @param shop
	 * @author wangzh
	 */
	@SuppressWarnings("unchecked")
	public void codeTrasferName(Shop shop) {
		String province = shop.getProvince();
		String city = shop.getCity();
		Object pObj = CachFactory.getInstance().get(Constants.DATA_PROVINCE);
		Object cObj = CachFactory.getInstance().get(Constants.DATA_CITY);

		if (StringUtils.isNotBlank(province) && pObj != null) {
			List<Location> locLst = (List<Location>) pObj;
			int proInt = Integer.parseInt(province);
			for (Location loc : locLst) {
				if (loc.getId().intValue() == proInt) {
					shop.setProvince(loc.getName());
					break;
				}
			}
		}
		if (StringUtils.isNotBlank(city) && cObj != null) {
			List<Location> locLst = (List<Location>) cObj;
			int cityInt = Integer.parseInt(city);
			for (Location loc : locLst) {
				if (loc.getId().intValue() == cityInt) {
					shop.setCity(loc.getName());
					break;
				}
			}
		}
	}

	@SuppressWarnings("unchecked")
	public void codeTrasferName(Store store) {
		String province = store.getProvince();
		String city = store.getCity();
		Object pObj = CachFactory.getInstance().get(Constants.DATA_PROVINCE);
		Object cObj = CachFactory.getInstance().get(Constants.DATA_CITY);

		if (StringUtils.isNotBlank(province) && pObj != null) {
			List<Location> locLst = (List<Location>) pObj;
			int proInt = Integer.parseInt(province);
			for (Location loc : locLst) {
				if (loc.getId().intValue() == proInt) {
					store.setProvince(loc.getName());
					break;
				}
			}
		}
		if (StringUtils.isNotBlank(city) && cObj != null) {
			List<Location> locLst = (List<Location>) cObj;
			int cityInt = Integer.parseInt(city);
			for (Location loc : locLst) {
				if (loc.getId().intValue() == cityInt) {
					store.setCity(loc.getName());
					break;
				}
			}
		}
	}

	/**
	 * 地名转code
	 * <p>TODO</p>
	 * @param province
	 * @param city
	 * @return
	 * @author wangzh
	 */
	@SuppressWarnings("unchecked")
	public Map<String, String> nameTrasferCode(String province, String city) {
		Object pObj = CachFactory.getInstance().get(Constants.DATA_PROVINCE);
		Object cObj = CachFactory.getInstance().get(Constants.DATA_CITY);
		Map<String, String> map = new HashMap<String, String>();
		if (StringUtils.isNotBlank(province)) {
			List<Location> locLst = (List<Location>) pObj;
			for (Location loc : locLst) {
				if (loc.getName().equals(province)) {
					province = String.valueOf(loc.getId());
					map.put("province", province);
					break;
				}
			}
		}
		if (StringUtils.isNotBlank(city)) {
			List<Location> locLst = (List<Location>) cObj;
			for (Location loc : locLst) {
				if (loc.getName().equals(city)) {
					city = String.valueOf(loc.getId());
					map.put("city", city);
					break;
				}
			}
		}
		return map;
	}

	/**
	 * 查询仓库列表
	 * <p>TODO</p>
	 * @param shop
	 * @param pageStart
	 * @param pageSize
	 * @return
	 * @author wangzh
	 */
	public List<Store> queryStoreLst(Store store, String pageStart, String pageSize) {
		codeTrasferName(store);

		int ps = Integer.parseInt(pageSize);
		List<Store> lst = storeMapper.selectByCriteria(store, new RowBounds((Integer.parseInt(pageStart) - 1) * ps, ps));
		return lst;
	}

	/**
	 * 计算仓库总数
	 * <p>TODO</p>
	 * @param shop
	 * @return
	 * @author wangzh
	 */
	public int countStore(Store store) {
		return storeMapper.countByCriteria(store);
	}

	/**
	 * 保存仓库
	 * <p>TODO</p>
	 * @param store
	 * @author wangzh
	 */
	// @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED,
	// rollbackFor = Exception.class)
	public void storeEdit(Store store) {
		Integer id = store.getId();

		codeTrasferName(store);
		if (id == null) {// 代表新增
			store.setCreateTime(new Date());
			storeMapper.insertSelective(store);
		} else if (id != null) {// 代表编辑
			// synchronized (this) {
			// 删除原有的
			// shopMapper.deleteByPrimaryKey(id);
			// 新增这个id的
			// shopMapper.insertSelective(shop);
			storeMapper.updateByPrimaryKeySelective(store);
			// }
		}
	}

	/**
	 * 删除仓库
	 * <p>TODO</p>
	 * @param id
	 * @author wangzh
	 */
	public void storeDelete(String theId) {
		Car car = new Car();
		car.setAddress(theId);
		int size = carMapper.countByCriteria(car);
		if (size > 0) {
			throw new PortalAppCheckedException("此仓库里有车，不可删除！");
		}
		storeMapper.deleteByPrimaryKey(Integer.parseInt(theId));
	}

	/**
	 * 导出excel
	 * <p>TODO</p>
	 * @param dto
	 * @return
	 * @author wangzh
	 */
	public Workbook exportExcel(Shop shop) {
		codeTrasferName(shop);
		List<Shop> lst = shopMapper.selectByCriteria(shop);
		// map.put("result", lst);

		// public static Workbook createWorkBook(List<Map<String, Object>> list, String[] keys,
		// String columnNames[]) {
		// 创建excel工作簿
		Workbook wb = new HSSFWorkbook();
		// 创建第一个sheet（页），并命名
		Sheet sheet = wb.createSheet("门店列表");
		// 设置列名
		String[] columnNames = { "门店名称", "门店地址", "门店电话", "省", "市", "负责人", "联系方式", "门店类型", "授信(万)", "押金", "采购金融(万)", "样车金融(万)", "签约日期", "公司" };
		// 手动设置列宽。第一个参数表示要为第几列设；，第二个参数表示列的宽度，n为列高的像素数。
		for (int i = 0; i < columnNames.length; i++) {
			sheet.setColumnWidth((short) i, (short) (256 * 18));
		}

		// 创建第一行
		Row row0 = sheet.createRow((short) 0);

		// 创建两种单元格格式
		CellStyle cs = wb.createCellStyle();
		CellStyle cs2 = wb.createCellStyle();

		// 创建两种字体
		Font f = wb.createFont();
		Font f2 = wb.createFont();

		// 创建第一种字体样式（用于列名）
		f.setFontHeightInPoints((short) 10);
		f.setColor(IndexedColors.BLACK.getIndex());
		f.setBoldweight(Font.BOLDWEIGHT_BOLD);

		// 创建第二种字体样式（用于值）
		f2.setFontHeightInPoints((short) 10);
		f2.setColor(IndexedColors.BLACK.getIndex());

		// Font f3=wb.createFont();
		// f3.setFontHeightInPoints((short) 10);
		// f3.setColor(IndexedColors.RED.getIndex());

		// 设置第一种单元格的样式（用于列名）
		cs.setFont(f);
		cs.setBorderLeft(CellStyle.BORDER_THIN);
		cs.setBorderRight(CellStyle.BORDER_THIN);
		cs.setBorderTop(CellStyle.BORDER_THIN);
		cs.setBorderBottom(CellStyle.BORDER_THIN);
		cs.setAlignment(CellStyle.ALIGN_CENTER);

		// 设置第二种单元格的样式（用于值）
		cs2.setFont(f2);
		cs2.setBorderLeft(CellStyle.BORDER_THIN);
		cs2.setBorderRight(CellStyle.BORDER_THIN);
		cs2.setBorderTop(CellStyle.BORDER_THIN);
		cs2.setBorderBottom(CellStyle.BORDER_THIN);
		cs2.setAlignment(CellStyle.ALIGN_CENTER);

		for (int i = 0; i < columnNames.length; i++) {
			Cell cell = row0.createCell(i);
			cell.setCellValue(columnNames[i]);
			cell.setCellStyle(cs);
		}
		// 设置每行每列的值
		for (short i = 0; i < lst.size(); i++) {
			// Row 行,Cell 方格 , Row 和 Cell 都是从0开始计数的
			// 创建一行，在页sheet上
			Row row = sheet.createRow(i + 1);
			// 在row行上创建一个方格
			// for (short j = 0; j < keys.length; j++) {
			// Cell cell = row1.createCell(j);
			// cell.setCellValue(list.get(i).get(keys[j]) == null ? " " :
			// list.get(i).get(keys[j]).toString());
			// cell.setCellStyle(cs2);
			// }
			Shop sp = lst.get(i);
			Cell cell0 = row.createCell(0);
			cell0.setCellStyle(cs2);
			cell0.setCellValue(sp.getName());// 门店名称

			Cell cell1 = row.createCell(1);
			cell1.setCellStyle(cs2);
			cell1.setCellValue(StringUtils.isBlank(sp.getAddress()) ? "" : sp.getAddress());// 门店地址

			Cell cell2 = row.createCell(2);
			cell2.setCellStyle(cs2);
			cell2.setCellValue(StringUtils.isBlank(sp.getTel()) ? "" : sp.getTel());// 门店电话

			Cell cell3 = row.createCell(3);
			cell3.setCellStyle(cs2);
			cell3.setCellValue(StringUtils.isBlank(sp.getProvince()) ? "" : sp.getProvince());// 省

			Cell cell4 = row.createCell(4);
			cell4.setCellStyle(cs2);
			cell4.setCellValue(StringUtils.isBlank(sp.getCity()) ? "" : sp.getCity());// 市

			Cell cell5 = row.createCell(5);
			cell5.setCellStyle(cs2);
			cell5.setCellValue(StringUtils.isBlank(sp.getPrincipal()) ? "" : sp.getPrincipal());// 负责人

			Cell cell6 = row.createCell(6);
			cell6.setCellStyle(cs2);
			cell6.setCellValue(StringUtils.isBlank(sp.getPriTel()) ? "" : sp.getPriTel());// 负责人电话

			Cell cell7 = row.createCell(7);
			cell7.setCellStyle(cs2);
			String tp = sp.getType();
			String _tp = "0".equals(tp) ? "虚拟" : "1".equals(tp) ? "自营" : "2".equals(tp) ? "城市合伙人" : "3".equals(tp) ? "寄售" : "";
			cell7.setCellValue(_tp);// 门店类型

			Cell cell8 = row.createCell(8);
			cell8.setCellStyle(cs2);
			cell8.setCellValue(sp.getCredit() == null ? "" : sp.getCredit().toString());// 授信（万）

			Cell cell9 = row.createCell(9);
			cell9.setCellStyle(cs2);
			cell9.setCellValue(StringUtils.isBlank(sp.getDeposit()) ? "" : sp.getDeposit());// 押金

			Cell cell10 = row.createCell(10);
			cell10.setCellStyle(cs2);
			cell10.setCellValue(sp.getFinancial() == null ? "" : sp.getFinancial().toString());// 采购金融（万）

			Cell cell11 = row.createCell(11);
			cell11.setCellStyle(cs2);
			cell11.setCellValue(sp.getSimplecarf() == null ? "" : sp.getSimplecarf().toString());// 样车金融（万）

			Cell cell12 = row.createCell(12);
			cell12.setCellStyle(cs2);
			cell12.setCellValue(sp.getSigntime() == null ? "" : DateUtils.formate(sp.getSigntime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));// 签约日期

			Cell cell13 = row.createCell(13);
			cell13.setCellStyle(cs2);
			cell13.setCellValue(StringUtils.isBlank(sp.getCompany()) ? "" : sp.getCompany());// 公司
		}
		// 自动设置列宽。第一个参数表示要为第几列设；第二个参数表示列的宽度，n为列高的像素数。
		// for (int i = 0; i < columnNames.length; i++) {
		// sheet.autoSizeColumn(i);
		// }
		// for (int i = 0; i < columnNames.length; i++) {
		// sheet.setColumnWidth(i, sheet.getColumnWidth(i) + 256 * 10);
		// }
		return wb;
		// }

	}

	/**
	 * 配车时查询所有合伙人门店
	 * @param shop
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public List<Shop> supplycarshoplst(Shop shop, String start, String pageSize) {
		// TODO Auto-generated method stub
		codeTrasferName(shop);
		int ps = Integer.parseInt(pageSize);
		List<Shop> lst = shopMapper.selectByCriteria(shop, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		return lst;
	}

	/**
	 * 配车时查询所有合伙人门店
	 * @param shop
	 * @return
	 */
	public int countsupplycarshoplst(Shop shop) {
		// TODO Auto-generated method stub
		return shopMapper.countByCriteria(shop);
	}

	public String addshop(String id, String currpage, ModelMap map, String userrole) {
		// TODO Auto-generated method stub
		map.put("currpage", currpage);
		map.put("userrole", userrole);
		map.put("id", id);
		Location location = new Location();
		location.setType("0");
		List<Location> lo = locationMapper.selectByCriteria(location);
		if (StringUtils.isNotBlank(id)) {
			Shop shop = shopMapper.selectByPrimaryKey(Integer.parseInt(id));

			List<Location> lo1 = getcity(shop.getProvince());
			map.put("lo1", lo1);
			map.put("shop", shop);
		}
		map.put("lo", lo);
		return "shop/updateshop";
	}

	public List<Location> getcity(String name) {
		Location location = new Location();
		location.setName(name);
		List<Location> lo = locationMapper.selectByCriteria(location);
		Location location1 = new Location();
		location1.setParent(lo.get(0).getId());
		return locationMapper.selectByCriteria(location1);

	}

	// 根据LoginName 查新角色
	public String queryuserrole(String username) {
		// TODO Auto-generated method stub
		User user = new User();
		user.setLoginName(username);
		List<User> user1 = userMapper.selectByCriteria(user);
		RoleAccount role = new RoleAccount();
		role.setAccountId(user1.get(0).getId());
		List<RoleAccount> userrole = roleAccountMapper.selectByCriteria(role);
		for (RoleAccount roleAccount : userrole) {
			Role role1 = roleMapper.selectByPrimaryKey(roleAccount.getRoleId());
			if (("ROLE_SHOP_VIEW_ALL").equals(role1.getName())) {
				return "1";
			}
		}
		return "2";
	}

	/**
	 * 门店信息
	 * @param shop
	 * @return
	 */
	public Shop shop(Integer id) {
		// TODO Auto-generated method stub
		return shopMapper.selectByPrimaryKey(id);
	}

	/**
	 * 查询门店列表
	 * <p>TODO</p>
	 * @param shop
	 * @param pageStart
	 * @param pageSize
	 * @return
	 * @author liliang
	 */
	public Map<String, Object> queryAllShopLst(UserDTO user, Shop shop, String pageStart, String pageSize) {
		codeTrasferName(shop);
		int ps = Integer.parseInt(pageSize);
		Map<String, Object> map = new HashMap<String, Object>();
		List<Integer> shopids = shopGroupService.queryShopGroupIdsByUseridandShopid(user.getId(), shop.getId());
		shop.setShopids(shopids);
		shop.setId(null);
		List<Shop> lst = shopMapper.selectAllByCriteria(shop, new RowBounds((Integer.parseInt(pageStart) - 1) * ps, ps));
		int count = shopMapper.countAllByCriteria(shop);
		map.put("result", lst);
		map.put("total", count);
		return map;
	}

}
