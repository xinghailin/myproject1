/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.web.controller.AssetRepositoryController
 * Created By: wangzh 
 * Created on: 2017年5月16日12:44:15
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import pw.agiledev.e2e.exception.ExcelContentInvalidException;
import pw.agiledev.e2e.exception.ExcelParseException;
import pw.agiledev.e2e.exception.ExcelRegexpValidFailedException;

import com.yyq.car.portal.common.constant.Constants;
import com.yyq.car.portal.common.constant.MasterDataType;
import com.yyq.car.portal.common.dto.CarTypeinDto;
import com.yyq.car.portal.common.dto.ClientInfoDto;
import com.yyq.car.portal.common.dto.ContractDto;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.dto.carProfitDto;
import com.yyq.car.portal.common.exception.PortalBizCheckedException;
import com.yyq.car.portal.common.mapper.auth.UserMapper;
import com.yyq.car.portal.common.mapper.product.CarMapper;
import com.yyq.car.portal.common.mapper.product.StoreMapper;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.comm.Abrand;
import com.yyq.car.portal.common.model.comm.Areaprice;
import com.yyq.car.portal.common.model.comm.Brand;
import com.yyq.car.portal.common.model.comm.MasterData;
import com.yyq.car.portal.common.model.product.Car;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.common.model.product.Store;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.common.util.BeanCopierUtils;
import com.yyq.car.portal.common.util.CachFactory;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.ms.app.service.AssetRepositoryService;
import com.yyq.car.portal.ms.app.service.BrandAndModelService;
import com.yyq.car.portal.ms.app.service.CarMoveService;
import com.yyq.car.portal.ms.app.service.ReportService;
import com.yyq.car.portal.ms.common.CarsImportDTO;
import com.yyq.car.portal.ms.common.exception.PortalMsBizCheckedException;
import com.yyq.car.portal.ms.web.constant.CarStatusEnum;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;
import com.yyq.car.portal.ms.web.constant.WebConstants;
import com.yyq.car.portal.ms.web.util.AdjustExcelHelper;
import com.yyq.car.portal.ms.web.util.CustomExcelHelper;


/**
 * <P>资产库管理</P>
 * @author wangzh
 */
@Controller
public class AssetRepositoryController {

	// private Logger logger = LoggerFactory.getLogger(ExceptionController.class);

	@Autowired
	private AssetRepositoryService assetRepositoryService;

	@Autowired
	private CarMoveService carMoveService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private StoreMapper storeMapper;
	@Autowired
	private BrandAndModelService brandAndModelService;
	@Autowired
	private CarMapper carMapper;
	// private byte[] lockOutRep = new byte[0];// 购车出库锁
	private byte[] lockBatchTypein = new byte[0];// 批量导入车辆锁
	private byte[] lockAdjustPrice = new byte[0];// 批量调价锁
	private byte[] lockBatchEdit = new byte[0];// 批量修改真实可售车辆锁

	/**
	 * 区域价格的批量导入
	 * @param file
	 * @param areaprice
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = Url.addAreaPrice, method = RequestMethod.POST)
	public void addAreaPrices(MultipartFile file, Areaprice areaprice, HttpServletResponse response) throws IOException {
		Object hssWB = null;
		CommonsMultipartFile cf = (CommonsMultipartFile) file;
		DiskFileItem fi = (DiskFileItem) cf.getFileItem();
		try {
			// 2003
			hssWB = new HSSFWorkbook(new FileInputStream(fi.getStoreLocation()));
			HSSFSheet sheet = ((HSSFWorkbook) hssWB).getSheetAt(0);
			int rows = sheet.getLastRowNum();
			for (int i = 1; i < rows; i++) {
				HSSFRow row = sheet.getRow(i);
				areaprice.setProvince((row.getCell(0)).toString());
				areaprice.setCity((row.getCell(1)).toString());
				areaprice.setBrand((row.getCell(2)).toString());
				areaprice.setModel((row.getCell(3)).toString());
				areaprice.setVersion((row.getCell(4)).toString());
				areaprice.setPrice(new BigDecimal((row.getCell(5)).toString()));
				areaprice.setCreatetime(new Date());
				assetRepositoryService.addAreaPrices(areaprice);
			}
			printOut("导入成功", response);
		} catch (Exception e) {
			// 2007
			InputStream in = new FileInputStream(fi.getStoreLocation());
			hssWB = new XSSFWorkbook(in);
			// XSSFWorkbook wb=new XSSFWorkbook(hssWB);
			XSSFSheet sheet = ((XSSFWorkbook) hssWB).getSheetAt(0);
			int rows = sheet.getLastRowNum();
			for (int i = 1; i < rows; i++) {
				XSSFRow row = sheet.getRow(i);
				areaprice.setProvince((row.getCell(0)).toString());
				areaprice.setCity((row.getCell(1)).toString());
				areaprice.setBrand((row.getCell(2)).toString());
				areaprice.setModel((row.getCell(3)).toString());
				areaprice.setVersion((row.getCell(4)).toString());
				areaprice.setPrice(new BigDecimal((row.getCell(5)).toString()));
				areaprice.setCreatetime(new Date());
				assetRepositoryService.addAreaPrices(areaprice);
			}
			printOut("导入成功", response);
		}
	}

	/**
	 * 进入销售利润页面
	 * @param map
	 * @param shopId
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.COUNTCAR_PROFIT_CAR, method = RequestMethod.GET)
	public String countProfit(ModelMap map, String shopId) {
		List<Shop> shoplist = reportService.queryshop();
		map.put("shoplist", shoplist);
		return View.COUNTCAR_PROFIT_CAR;
	}

	/**
	 * 进入销售利润页面-并计算利润
	 * @param profit
	 * @param start
	 * @param pageSize
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.COUNT_PROFIT_CAR, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> countProfitCar(carProfitDto profit, ModelMap map) {
		int start = (profit.getPageStart() - 1) * profit.getPageSize();
		profit.setPageStart(start);
		List<carProfitDto> lst = assetRepositoryService.countProfit(profit);
		int count = carMapper.countProfit(profit);
		map.put("result", lst);
		map.put("total", count);
		return map;
	}

	/**
	 * 
	 * <p>到车辆录入页</p>
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_TYPEIN, method = RequestMethod.GET)
	public String CarTypein(ModelMap map) {
		// 获取仓库列表
		List<Store> storeLst = assetRepositoryService.queryAllStore();
		map.put("storeLst", storeLst);
		// 查询拥有门店管理权限的账户
		List<User> user = assetRepositoryService.queryName();
		map.put("user", user);
		List<Abrand> brand = brandAndModelService.queryBrandinitial();
		// List<Shop> shopLst = assetRepositoryService.queryAllShop();
		// List<Map<String, String>> shopStoreLst = new ArrayList<Map<String, String>>();
		// for (int i = 0; i < storeLst.size(); i++) {
		// Map<String, String> maps = new HashMap<String, String>();
		// maps.put("name", storeLst.get(i).getName());
		// maps.put("id", "s" + storeLst.get(i).getId());// 仓库
		// shopStoreLst.add(maps);
		// }
		// for (int i = 0; i < shopLst.size(); i++) {
		// Map<String, String> maps = new HashMap<String, String>();
		// maps.put("name", shopLst.get(i).getName());
		// maps.put("id", "h" + shopLst.get(i).getId());// 门店
		// shopStoreLst.add(maps);
		// }
		// map.put("shop", shopStoreLst);
		map.put("brand", brand);
		return View.CAR_TYPEIN_VIEW;
	}

	/**
	 * 车辆录入、修改
	 * 
	 * @param param
	 * @param type
	 * @param id
	 * @param map
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_PARAM_CHECK, method = RequestMethod.POST)
	public void CarParamCheck(String param, String type, String id, ModelMap map) {
		boolean bl = assetRepositoryService.carParamCheck(param, type, id);
		map.put("status", bl ? "1" : "0");
	}

	/**
	 * 提交车辆录入审核
	 * 
	 * @param dto
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_TYPEIN_SUBMIT, method = RequestMethod.POST)
	public String CarTypeinSubmit(CarTypeinDto dto, ModelMap map) {

		try {
			assetRepositoryService.saveCarTypein(dto);
			map.put("message", "保存成功！");
			return CarTypein(map);
			// "redirect:" + "/" + Url.CAR_TYPEIN;
		} catch (IOException e) {
			e.printStackTrace();
			map.put("message", e.getMessage());
			return View.ERROR_MESSAGE;
		}

	}

	/**
	 * 到车辆录入列表首页
	 * 
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_TYPEIN_LST, method = RequestMethod.GET)
	public String CarTypeinLst(ModelMap map) {
		List<Store> storeLst = assetRepositoryService.queryAllStore();
		map.put("storeLst", storeLst);
		List<Car> car = assetRepositoryService.queryCarAddress();
		map.put("car", car);
		return View.CAR_TYPEIN_LST_VIEW;
	}

	/**
	 * 录入列表查询
	 * 
	 * @param dto
	 * @param map
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_TYPEIN_LST_DO, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> CarTypeinLstDo(CarTypeinDto dto, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = assetRepositoryService.carTypeinLstDo(dto, start, pageSize);
		return returnMap;
	}

	/**
	 * 到财务审核入库列表
	 * 
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_AUDIT_LST, method = RequestMethod.GET)
	public String CarAuditLst(ModelMap map, String currpage) {
		// 获取仓库列表
		List<Store> storeLst = assetRepositoryService.queryAllStore();
		map.put("storeLst", storeLst);
		List<Car> car = assetRepositoryService.queryCarAddress();
		map.put("car", car);
		map.put("currpage", currpage);
		return View.CAR_AUDIT_LST_VIEW;
	}

	/**
	 * 查询财务审核列表
	 * 
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @param map			
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_AUDIT_LST_DO, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> CarAuditLstDo(CarTypeinDto dto, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = assetRepositoryService.carAuditLstDo(dto, start, pageSize);
		return returnMap;
	}

	/**
	 * 到单个车辆审核页
	 * 
	 * @param id车辆主键
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_AUDIT, method = RequestMethod.GET)
	public String CarAudit(String id, String currpage, ModelMap map) {
		// 根据id获取提交审核的car
		Car car = assetRepositoryService.getAuditCar(id);
		if (car != null)
			map.put("car", car);
		map.put("currpage", currpage);
		return View.CAR_AUDIT_VIEW;
	}

	/**
	 * 车辆审核通过与否
	 * 
	 * @param yesno通过与否
	 * @param reason理由
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_AUDIT_DO, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> CarAuditDo(String id, String pass, String reason, ModelMap map, String jndcar) {

		Map<String, Object> reMap = new HashMap<String, Object>();
		try {
			assetRepositoryService.carAuditDo(id, pass, reason, jndcar);
			reMap.put("message", "审核成功！");
			reMap.put("status", "1");
		} catch (PortalMsBizCheckedException e) {
			reMap.put("message", e.getMessage());
			reMap.put("status", "0");
		}
		return reMap;
	}

	/**
	 * 到总资产库列表首页
	 * 
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_ASSET_LST, method = RequestMethod.GET)
	public String CarAssetLst(ModelMap map) {
		// 获取仓库列表
		List<Store> storeLst = assetRepositoryService.queryAllStore();
		map.put("storeLst", storeLst);
		return View.CAR_ASSET_LST_VIEW;
	}

	/**
	 * 到可销售列表首页
	 * 
	 * @param map
	 * @return
	 * @author tu
	 */
	@RequestMapping(value = Url.CAR_ASSET_LST_REALSALE, method = RequestMethod.GET)
	public String CarAssetLstReal(ModelMap map) {
		// 获取仓库列表
		List<Store> storeLst = assetRepositoryService.queryAllStore();
		map.put("storeLst", storeLst);
		return View.CAR_ASSET_LST_REALSALE_VIEW;
	}

	/**
	 * 可售车辆
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.vendibilitypage, method = RequestMethod.GET)
	public String vendibilitypage(ModelMap map) {
		// 获取仓库列表
		List<Store> storeLst = assetRepositoryService.queryAllStore();
		map.put("storeLst", storeLst);
		return View.vendibilitypageView;
	}

	/**
	 * 供勾选车辆用
	 * 
	 * @param map
	 * @param stepflow 1信息表选车 2流程换车
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_ASSET_LST_REALSALE_FORCHOOSE, method = RequestMethod.GET)
	public String CarAssetLstRealForChoose(ModelMap map, String stepflow) {
		// 获取仓库列表
		List<Store> storeLst = assetRepositoryService.queryAllStore();
		map.put("storeLst", storeLst);
		map.put("stepflow", stepflow);
		return View.CAR_ASSET_LST_REALSALE_FORCHOOSE_VIEW;
	}

	/**
	 * 查询可售车辆列表
	 * 
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author tupeng
	 */
	@RequestMapping(value = Url.CAR_ASSET_LST_REAL, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> CarAssetLstRealDo(CarTypeinDto dto, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = assetRepositoryService.carAssetListRealSale(dto, start, pageSize);
		return returnMap;
	}

	/**
	 * 到总资产库列表首页 修改车辆
	 * 
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_ASSET_LST_EDIT, method = RequestMethod.GET)
	public String CarAssetLstEdit(ModelMap map, String currpage) {
		// 获取仓库列表
		List<Store> storeLst = assetRepositoryService.queryAllStore();
		map.put("storeLst", storeLst);
		List<User> user = assetRepositoryService.queryName();
		map.put("user", user);
		map.put("currpage", currpage);
		return View.CAR_ASSET_LST_EDIT_VIEW;
	}

	/**
	 * 到单个车辆修改页
	 * 
	 * @param id车辆主键
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_EDIT, method = RequestMethod.GET)
	public String CarEdit(String id, String currpage, ModelMap map) {
		// 根据id获取car
		Car car = assetRepositoryService.getEditCar(id);
		if (car != null)
			map.put("car", car);

		Abrand lst = brandAndModelService.queryId(car.getBrand());
		List<Map<String, Object>> model = brandAndModelService.queryByBrandidModel(lst.getBrandid());// 根据品牌id查询型号
		map.put("model", model);
		List<Map<String, Object>> version = brandAndModelService.queryVersion(car.getModel());// 根据型号查询版别
		map.put("version", version);
		// 获取仓库列表
		Store st = assetRepositoryService.queryStore(Integer.parseInt(car.getAddress()));
		map.put("st", st);
		List<Store> storeLst = assetRepositoryService.queryAllStore();
		map.put("storeLst", storeLst);
		List<User> user = assetRepositoryService.queryName();
		map.put("user", user);
		map.put("currpage", currpage);
		return View.CAR_EDIT_VIEW;
	}

	/**
	 * 保存修改车辆
	 * 
	 * @param dto
	 * @param currpage
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_EDIT_SAVE, method = RequestMethod.POST)
	public String CarEditSave(CarTypeinDto dto, String currpage, ModelMap map) {
		try {
			assetRepositoryService.saveCarEdit(dto);
			map.put("message", "保存成功！");
			// map.put("currpage", currpage);
			return CarAssetLstEdit(map, currpage);
			// "redirect:" + "/" + Url.CAR_TYPEIN;
		} catch (IOException e) {
			e.printStackTrace();
			map.put("message", e.getMessage());
			return View.ERROR_MESSAGE;
		}
	}

	/**
	 * 查询总资产库列表
	 * 
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_ASSET_LST_DO, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> CarAssetLstDo(CarTypeinDto dto, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = assetRepositoryService.carAssetLstDo(dto, start, pageSize);
		return returnMap;
	}

	/**
	 * 根据查询条件导出资产库车辆excel
	 * 
	 * @param dto
	 * @param map
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_EXPORTEXCEL, method = RequestMethod.POST)
	public void CarExcelExport(CarTypeinDto dto, HttpServletResponse response) {
		try {
			response.setContentType("application/x-excel");
			response.setCharacterEncoding("UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename=" + new String("超级座驾车辆表".getBytes("UTF-8"), "iso-8859-1") + ".xls");

			Workbook wb = assetRepositoryService.exportExcel(dto);
			wb.write(response.getOutputStream()); // 输出流控制workbook

			response.getOutputStream().flush();

			response.getOutputStream().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**（老需求：门店选择总资产库车辆 点击购车出库
	 * 到客户信息表填写页）新需求：此方法作废
	 * 
	 * @param map
	 * @param id 选择的车辆id
	 * @return
	 * @author wangzh
	 */
	@Deprecated
	// @RequestMapping(value = Url.CLIENT_INFO_INDEX, method = RequestMethod.GET)
	public String ClientInfoIndex(ModelMap map, String id) {
		// 获取登陆信息
		UserDTO userInfo = SecurityHelper.getAdminUserInfo();
		// logger.debug("userInfo={},id={}", userInfo, userInfo.getId());
		// System.out.println(userInfo.getId() + "-------" + userInfo.getShop());
		//
		// Shop shop111 = assetRepositoryService.queryShopById(Integer.parseInt("1"));
		//
		// map.put("shopIId", shop111.getId());

		// logger.debug("shop111={}", shop111);
		String shopId = userInfo.getShop();
		if (StringUtils.isNotBlank(shopId)) {
			// Car car = assetRepositoryService.getCarById(Integer.parseInt(id));
			Shop shop = assetRepositoryService.queryShopById(Integer.parseInt(shopId));
			// logger.debug("shop={}", shop);
			// logger.debug("shopid={}", shop.getId());
			if (shop != null) {
				map.put("shop", shop);
				map.put("shopId", shop.getId());
			}
		}
		// synchronized (lockOutRep) {
		if (StringUtils.isNotBlank(id)) {
			Car car = assetRepositoryService.getCarById(Integer.parseInt(id));
			Integer status = car.getStatus();
			if (status != null) {
				if (CarStatusEnum.INSTORE.getValue().intValue() != status.intValue() && CarStatusEnum.SHOPLOCK.getValue() != status.intValue()) {
					map.put("message", "此车辆目前不在库存中或门店中，无法购车出库；请返回车辆列表。");
					return View.ERROR_MESSAGE;
				}
			} else {
				map.put("message", "此车辆状态错误，请联系管理员。");
				return View.ERROR_MESSAGE;
			}
		}
		// }
		Integer key = assetRepositoryService.querySequenceValue(114);// 选择客户信息表的下一个主键
		map.put("id", key);
		String now = DateUtils.formate(DateUtils.getCurrentTime(), DateUtils.COMPACT_DATE_FORMAT);
		map.put("filenum", WebConstants.FILE_PREFIX + now.substring(2) + key);
		map.put("carId", id);
		return View.CLIENT_INFO_VIEW;
	}

	/**
	 * （老需求：客户信息表提交-成功转到合同页）
	 * 新需求：当选择客户级别是G，下一步选择车辆后时候调用此方法，此时信息表已保存
	 * 
	 * @param dto
	 * @param map
	 * @return
	 * @author wangzh
	 */
	// @RequestMapping(value = Url.CLIENT_INFO_SUBMIT, method = RequestMethod.POST)
	public String ClientInfoSubmit(ClientInfoDto dto, ModelMap map) {
		// synchronized (lockOutRep) {
		if (StringUtils.isNotBlank(dto.getCarId())) {
			Car car = assetRepositoryService.getCarById(Integer.parseInt(dto.getCarId()));
			Integer status = car.getSaleStatus();// 销售状态
			if (status != null) {
				// if (CarStatusEnum.INSTORE.getValue().intValue() != status.intValue() &&
				// CarStatusEnum.SHOPLOCK.getValue() != status.intValue()) {
				map.put("message", "该车辆已被销售锁定或已销售，无法购车出库。");
				return View.ERROR_MESSAGE;
				// }
			}
		} else {
			map.put("message", "请确认所选车辆。");// 车辆id没传过来
			return View.ERROR_MESSAGE;
		}
		if (StringUtils.isBlank(dto.getId())) {
			map.put("message", "请确认信息表。");// 信息表id没传过来
			return View.ERROR_MESSAGE;
		}
		// }
		try {
			Map<String, Object> map1 = assetRepositoryService.saveClientInfoNew(Integer.parseInt(dto.getId()), Integer.parseInt(dto.getCarId()));
			// Map<String, Object> map1 = assetRepositoryService.saveClientInfo(dto);
			if (map1 != null)
				map.addAllAttributes(map1);
			// map.put("shopName", dto.getShopName());
			// map.put("shopId", dto.getShopId());
			// map.put("carId", dto.getCarId());
			// UserDTO userInfo = SecurityHelper.getAdminUserInfo();
			// String name = userInfo.getName();
			// map.put("sellerName", name);
			// map.put("sellerId", userInfo.getId());
			// map.put("sellerCode", userInfo.getCode());
			// map.put("phone", dto.getPhone());
			// map.put("buyerName", dto.getName());
			// map.put("identify", dto.getIdentify());
			return View.CLIENT_CONTRACT_VIEW;
		} catch (Exception exception) {
			map.put("message", exception.getMessage());
			return View.ERROR_MESSAGE;
		}
	}

	/**
	 * 合同提交-发起流程
	 * 
	 * @param dto
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CONTRACT_SUBMIT, method = RequestMethod.POST)
	public void ContractSubmit(ContractDto dto, ModelMap map, HttpServletResponse response, String currpage) throws Exception {

		if (StringUtils.isNotBlank(dto.getCarId())) {
			Car car = assetRepositoryService.getCarById(Integer.parseInt(dto.getCarId()));
			Integer status = car.getSaleStatus();// 销售状态
			if (status != null) {
				// if (CarStatusEnum.INSTORE.getValue().intValue() != status.intValue() &&
				// CarStatusEnum.SHOPLOCK.getValue() != status.intValue()) {
				map.put("message", "该车辆已被销售锁定或已销售，无法购车出库。");

				printOut("该车辆已被销售锁定或已销售，无法购车出库。", response);
				return;
				// }
			}
		} else {
			map.put("message", "请确认所选车辆。");// 车辆id没传过来
			printOut("未关联车辆，请检查", response);
			return;
		}
		if (StringUtils.isBlank(dto.getShopId())) {
			map.put("message", "请确认门店。");// 门店id没传过来
			printOut("该账号未关联门店，请联系管理员", response);
			return;
		}
		try {

			assetRepositoryService.saveContract(dto);
			// map.addAttribute("status", "1");
			map.put("status", "1");
			printOut("审核成功!", response);

			return;
			/*
			 * FileOutputStream fos = new FileOutputStream(req.getSession().getServletContext() +
			 * "E:/" + newFileName); fos.write(file.getBytes()); fos.flush(); fos.close();
			 */
			// return View.CLIENT_INFO_VIEW;
		} catch (Exception exception) {
			// map.put("message", exception.getMessage());
			map.put("message", exception.getMessage());
			// return View.ERROR_MESSAGE;
			printOut(exception.getMessage(), response);
			return;
		}

		// }
		// return rMap;
	}

	/**
	 * 展示客户信息和合同页面供总部审核
	 * 
	 * @param modelMap
	 * @param processId
	 * @param orderId
	 * @param taskId
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SNAKER_HQCONTRACT, method = RequestMethod.GET)
	public String HqInfoContractAudit(ModelMap modelMap, String processId, String orderId, String taskId) {
		// String userName = SecurityHelper.getAdminUserInfo().getLoginName();
		// modelMap.addAttribute("taskId", taskId);
		// 查询信息表/合同/车
		assetRepositoryService.getInfoContract(modelMap, taskId);
		// 将请求参数继续传递给视图页面
		// modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);
		return View.CLIENT_AUDIT_VIEW;
	}

	/**
	 * 总部审核
	 * 
	 * @param modelMap
	 * @param processId
	 * @param orderId
	 * @param taskId
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SNAKER_HQCONTRACTDO, method = RequestMethod.POST)
	public void HqAudit(ModelMap modelMap, String orderId, String carId, String carOldStatus, String infoId, String contractId, String taskId,
			String startUserId, String pass) {
		// 将请求参数继续传递给视图页面
		// modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);
		// String userName = SecurityHelper.getAdminUserInfo().getLoginName();
		// modelMap.addAttribute("taskId", taskId);
		// 查询信息表/合同/车
		try {
			assetRepositoryService.hqAudit(modelMap, orderId, carId, carOldStatus, infoId, contractId, taskId, startUserId, pass);
			modelMap.addAttribute("status", "1");
		} catch (Exception exception) {
			modelMap.put("message", exception.getMessage());
			// return View.ERROR_MESSAGE;
		}
		// return modelMap;
		// return View.CLIENT_AUDIT_VIEW;
	}

	/**
	 * 总部财务查看首付情况
	 * 
	 * @param modelMap
	 * @param processId
	 * @param orderId
	 * @param taskId
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SNAKER_HQFINANCEFIRSTPAY, method = RequestMethod.GET)
	public String HqFinanceAudit(ModelMap modelMap, String processId, String orderId, String taskId) {
		// String userName = SecurityHelper.getAdminUserInfo().getLoginName();
		// modelMap.addAttribute("taskId", taskId);
		assetRepositoryService.getFirstPay(modelMap, taskId);
		// 将请求参数继续传递给视图页面
		// modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);
		return View.FINANCE_FIRSTPAY_VIEW;
	}

	/**
	 * 总部财务审核
	 * 
	 * @param modelMap
	 * @param orderId
	 * @param carId
	 * @param carOldStatus
	 * @param infoId
	 * @param contractId
	 * @param taskId
	 * @param startUserId
	 * @param pass
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SNAKER_HQFINANCEFIRSTPAYDO, method = RequestMethod.POST)
	public void HqFinanceAuditDo(ModelMap modelMap, String orderId, String carId, String carOldStatus, String infoId, String contractId, String taskId,
			String startUserId, String realdownpay, String pass) {
		// 将请求参数继续传递给视图页面
		// modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);
		// String userName = SecurityHelper.getAdminUserInfo().getLoginName();
		// modelMap.addAttribute("taskId", taskId);
		// 查询信息表/合同/车
		try {
			assetRepositoryService.hqFinanceAudit(modelMap, orderId, carId, carOldStatus, infoId, contractId, taskId, startUserId, realdownpay, pass);
			modelMap.addAttribute("status", "1");
		} catch (Exception exception) {
			modelMap.put("message", exception.getMessage());
			// return View.ERROR_MESSAGE;
		}
		// return modelMap;
		// return View.CLIENT_AUDIT_VIEW;
	}

	/**
	 * 新需求加节点：门店销售指引客户验车
	 * 
	 * @param modelMap
	 * @param processId
	 * @param orderId
	 * @param taskId
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SNAKER_CLIENTCHECKCAR, method = RequestMethod.GET)
	public String clientCheckCar(ModelMap modelMap, String processId, String orderId, String taskId) {
		// String userName = SecurityHelper.getAdminUserInfo().getLoginName();
		// modelMap.addAttribute("taskId", taskId);
		assetRepositoryService.getCheckCar(modelMap, taskId);
		// 将请求参数继续传递给视图页面
		// modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);
		return View.SHOP_CHECKCAR_VIEW;
	}

	/**
	 * 门店指引客户验车do
	 * 
	 * @param modelMap
	 * @param orderId
	 * @param carId
	 * @param infoId
	 * @param contractId
	 * @param taskId
	 * @param startUserId
	 * @param pass
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SNAKER_CLIENTCHECKCARDO, method = RequestMethod.POST)
	public void clientCheckCarDo(ModelMap modelMap, String orderId, String carId, String infoId, String contractId, String taskId, String startUserId,
			String pass, String nopasstype, String changeCarId, String changeCarVin, String refundReason) {
		// 将请求参数继续传递给视图页面
		// modelMap.addAttribute("processId", processId);realdownpay
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);
		// String userName = SecurityHelper.getAdminUserInfo().getLoginName();
		// modelMap.addAttribute("taskId", taskId);
		// 查询信息表/合同/车
		try {
			assetRepositoryService.checkCarDo(modelMap, orderId, carId, infoId, contractId, taskId, startUserId, pass, nopasstype, changeCarId, changeCarVin,
					refundReason);
			modelMap.addAttribute("status", "1");
		} catch (Exception exception) {
			modelMap.put("message", exception.getMessage());
			// return View.ERROR_MESSAGE;
		}
		// return modelMap;
		// return View.CLIENT_AUDIT_VIEW;
	}

	/**
	 * 门店查看通知客户支付尾款任务
	 * 
	 * @param modelMap
	 * @param processId
	 * @param orderId
	 * @param taskId
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SNAKER_NOTIFYFINALPAY, method = RequestMethod.GET)
	public String shopNotifyClient(ModelMap modelMap, String processId, String orderId, String taskId) {

		// String userName = SecurityHelper.getAdminUserInfo().getLoginName();
		// modelMap.addAttribute("taskId", taskId);
		assetRepositoryService.getNotify(modelMap, taskId);
		// 将请求参数继续传递给视图页面
		// modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);
		return View.SHOP_NOTIFY_VIEW;
	}

	/**
	 * 门店通知客户付尾款
	 * 
	 * @param modelMap
	 * @param orderId
	 * @param carId
	 * @param carOldStatus
	 * @param infoId
	 * @param contractId
	 * @param taskId
	 * @param startUserId
	 * @param pass
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SNAKER_NOTIFYFINALPAYDO, method = RequestMethod.POST)
	public void shopNotifyClientDo(ModelMap modelMap, String orderId, String carId, String carOldStatus, String infoId, String contractId, String taskId,
			String startUserId, String pass) {
		// 将请求参数继续传递给视图页面
		// modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);
		// String userName = SecurityHelper.getAdminUserInfo().getLoginName();
		// modelMap.addAttribute("taskId", taskId);
		// 查询信息表/合同/车
		try {
			assetRepositoryService.notifyDo(modelMap, orderId, carId, carOldStatus, infoId, contractId, taskId, startUserId, pass);
			modelMap.addAttribute("status", "1");
		} catch (Exception exception) {
			modelMap.put("message", exception.getMessage());
			// return View.ERROR_MESSAGE;
		}
		// return modelMap;
		// return View.CLIENT_AUDIT_VIEW;
	}

	/**
	 * 总部财务审核尾款页面-查看
	 * 
	 * @param modelMap
	 * @param processId
	 * @param orderId
	 * @param taskId
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SNAKER_HQFINFINALPAY, method = RequestMethod.GET)
	public String HqFinalPayAudit(ModelMap modelMap, String processId, String orderId, String taskId) {

		// String userName = SecurityHelper.getAdminUserInfo().getLoginName();
		// modelMap.addAttribute("taskId", taskId);
		assetRepositoryService.getNotify(modelMap, taskId);
		// 将请求参数继续传递给视图页面
		// modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);
		return View.FINANCE_FINALPAY_VIEW;
	}

	/**
	 * 总部财务审核尾款
	 * 
	 * @param modelMap
	 * @param orderId
	 * @param carId
	 * @param carOldStatus
	 * @param infoId
	 * @param contractId
	 * @param taskId
	 * @param startUserId
	 * @param pass
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SNAKER_HQFINFINALPAYDO, method = RequestMethod.POST)
	public void HqFinalPayAuditDo(ModelMap modelMap, String orderId, String carId, String carOldStatus, String infoId, String contractId, String taskId,
			String startUserId, String finalpay, String realfinalpay, String pass) {
		// 将请求参数继续传递给视图页面
		// modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);
		// String userName = SecurityHelper.getAdminUserInfo().getLoginName();
		// modelMap.addAttribute("taskId", taskId);
		// 查询信息表/合同/车
		try {
			assetRepositoryService.hqFinanceFinalpayDo(modelMap, orderId, carId, carOldStatus, infoId, contractId, taskId, startUserId, finalpay, realfinalpay,
					pass);
			modelMap.addAttribute("status", "1");
		} catch (Exception exception) {
			modelMap.put("message", exception.getMessage());
			// return View.ERROR_MESSAGE;
		}
		// return modelMap;
		// return View.CLIENT_AUDIT_VIEW;
	}

	/**
	 * 出库材料-查看
	 * 
	 * @param modelMap
	 * @param processId
	 * @param orderId
	 * @param taskId
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SNAKER_MATIERAL, method = RequestMethod.GET)
	public String matieralview(ModelMap modelMap, String processId, String orderId, String taskId) {

		// String userName = SecurityHelper.getAdminUserInfo().getLoginName();
		// modelMap.addAttribute("taskId", taskId);
		assetRepositoryService.getNotify(modelMap, taskId);
		// 将请求参数继续传递给视图页面
		// modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);
		return View.FINANCE_MATIERAL_VIEW;
	}

	/**
	 * 出库材料审核
	 * 
	 * @param modelMap
	 * @param orderId
	 * @param carId
	 * @param carOldStatus
	 * @param infoId
	 * @param contractId
	 * @param taskId
	 * @param startUserId
	 * @param pass
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SNAKER_MATIERALDO, method = RequestMethod.POST)
	public void matieraldo(ModelMap modelMap, String orderId, String carId, String carOldStatus, String infoId, String contractId, String taskId,
			String startUserId, String pass) {
		// 将请求参数继续传递给视图页面
		// modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);
		// String userName = SecurityHelper.getAdminUserInfo().getLoginName();
		// modelMap.addAttribute("taskId", taskId);
		// 查询信息表/合同/车
		try {
			assetRepositoryService.matieralDo(modelMap, orderId, carId, carOldStatus, infoId, contractId, taskId, startUserId, pass);
			modelMap.addAttribute("status", "1");
		} catch (Exception exception) {
			modelMap.put("message", exception.getMessage());
			// return View.ERROR_MESSAGE;
		}
		// return modelMap;
		// return View.CLIENT_AUDIT_VIEW;
	}

	/**
	 * 结算页面-查看
	 * 
	 * @param modelMap
	 * @param processId
	 * @param orderId
	 * @param taskId
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SNAKER_SETTLEMENT, method = RequestMethod.GET)
	public String settlementview(ModelMap modelMap, String processId, String orderId, String taskId) {

		// String userName = SecurityHelper.getAdminUserInfo().getLoginName();
		// modelMap.addAttribute("taskId", taskId);
		assetRepositoryService.getInfoContract(modelMap, taskId);
		// 将请求参数继续传递给视图页面
		// modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);
		return View.FINANCE_SETTLE_VIEW;
	}

	/**
	 * 结算
	 * 
	 * @param modelMap
	 * @param orderId
	 * @param carId
	 * @param carOldStatus
	 * @param infoId
	 * @param contractId
	 * @param taskId
	 * @param startUserId
	 * @param pass
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SNAKER_SETTLEMENTDO, method = RequestMethod.POST)
	public void settlementdo(ModelMap modelMap, String orderId, String carId, String settlement, String infoId, String contractId, String taskId,
			String startUserId, String insurePricer, String buyTaxr, String cardPricer, String qualityguarPricer, String delayguarPricer, String decoratePricer) {
		// 将请求参数继续传递给视图页面
		// modelMap.addAttribute("processId", processId);
		modelMap.addAttribute("orderId", orderId);
		modelMap.addAttribute("taskId", taskId);
		// String userName = SecurityHelper.getAdminUserInfo().getLoginName();
		// modelMap.addAttribute("taskId", taskId);
		// 查询信息表/合同/车
		try {
			assetRepositoryService.settlelDo(modelMap, orderId, carId, settlement, infoId, contractId, taskId, startUserId, insurePricer, buyTaxr, cardPricer,
					qualityguarPricer, delayguarPricer, decoratePricer);
			modelMap.addAttribute("status", "1");
		} catch (Exception exception) {
			modelMap.put("message", exception.getMessage());
			// return View.ERROR_MESSAGE;
		}
		// return modelMap;
		// return View.CLIENT_AUDIT_VIEW;
	}

	/**结算计算*/
	@RequestMapping(value = Url.CALCDO, method = RequestMethod.POST)
	public void calcdo(ModelMap modelMap, String infoId, String contractId, String insurePricer, String buyTaxr, String cardPricer, String qualityguarPricer,
			String delayguarPricer, String decoratePricer) {
		// 将请求参数继续传递给视图页面
		// modelMap.addAttribute("processId", processId);
		// String userName = SecurityHelper.getAdminUserInfo().getLoginName();
		// modelMap.addAttribute("taskId", taskId);
		// 查询信息表/合同/车
		try {
			assetRepositoryService.calcDo(modelMap, infoId, contractId, insurePricer, buyTaxr, cardPricer, qualityguarPricer, delayguarPricer, decoratePricer);
			modelMap.addAttribute("status", "1");
		} catch (Exception exception) {
			modelMap.put("message", exception.getMessage());
			// return View.ERROR_MESSAGE;
		}
		// return modelMap;
		// return View.CLIENT_AUDIT_VIEW;
	}

	/**
	 * 到查看仓库车辆首页
	 * 
	 * @param storeId
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.STORE_CARS, method = RequestMethod.GET)
	public String StoreCars(String storeId, ModelMap map) {
		map.put("storeId", storeId);
		// 获取仓库
		if (StringUtils.isNotBlank(storeId)) {
			Store store = assetRepositoryService.queryStoreById(Integer.parseInt(storeId));
			List<Store> storeLst = new ArrayList<Store>();
			storeLst.add(store);
			map.put("storeLst", storeLst);
		}
		return "storecars";
	}

	/**
	 * 查看仓库车辆
	 * 
	 * @param dto
	 * @param storeId
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.STORE_CARS_DO, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> StoreCarsDo(CarTypeinDto dto, String storeId, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = assetRepositoryService.storecarsLstDo(dto, storeId, start, pageSize);
		return returnMap;
	}

	/**
	 * 从门店到车库
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.UPDATE_STATUS, method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> updateStatus(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		Car car = new Car();
		car.setStatus(9);
		car.setId(id);
		carMoveService.updateStatuss(car);
		map.put("status", true);
		return map;
	}

	/**
	 * 车辆从门店到仓库审核
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.SELECT_BYIDCAR, method = RequestMethod.GET)
	public String selectByIdCar(int id, ModelMap map) {
		List<Store> storeLst = assetRepositoryService.queryAllStore();
		map.put("storeLst", storeLst);
		Car car = carMoveService.selectByIdCar(id);
		map.put("car", car);
		return View.SELECT_BYIDCAR_VIEW;
	}

	/**
	 * 从门店到仓库审核
	 * @param car
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.UPDATE_CAR_STATUS, method = RequestMethod.POST)
	public String updateCarStatus(Car car, ModelMap map) {
		Store st = carMoveService.selectByPrimaryKey(Integer.parseInt(car.getAddress()));
		car.setCarAddress(st.getAddress());// 车辆所在地
		car.setStatus(1);// 1 代表库存
		car.setStoreType(2);// 2 代表仓库
		car.setStoreId(st.getId());
		carMoveService.updateCarStatus(car);
		map.put("shopId", car.getShopId());
		return "shopcars";
	}

	/**
	 * 到查看门店车辆首页
	 * 
	 * @param storeId
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SHOP_CARS, method = RequestMethod.GET)
	public String ShopCars(String shopId, String type, ModelMap map) {
		map.put("shopId", shopId);
		// 获取仓库
		// if (StringUtils.isNotBlank(shopId)) {
		// Store store = assetRepositoryService.queryStoreById(Integer.parseInt(shopId));
		// List<Store> storeLst = new ArrayList<Store>();
		// storeLst.add(store);
		// map.put("storeLst", storeLst);
		// }
		if (StringUtils.isNotBlank(type))
			return "shopviewcars";
		return "shopcars";
	}

	/**
	 * 查看门店车辆
	 * 
	 * @param dto
	 * @param shopId
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SHOP_CARS_DO, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> ShopCarsDo(CarTypeinDto dto, String shopId, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = assetRepositoryService.shopcarsLstDo(dto, shopId, start, pageSize);
		return returnMap;
	}

	/**
	 * 到客户信息列表首页
	 * 
	 * @param map
	 * @param currpage
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CLIENT_INFO_LST, method = RequestMethod.GET)
	public String clientInfoLst(ModelMap map, String worktype, String all, String currpage) {
		if (StringUtils.isNotBlank(worktype))
			map.put("worktype", worktype);
		if (StringUtils.isNotBlank(all)) {
			List<Shop> shopLst = assetRepositoryService.queryAllShop();
			map.put("shopLst", shopLst);
			map.put("currpage", currpage);
			return View.CLIENT_INFO_LST_ALL_VIEW;
		}
		map.put("currpage", currpage);
		return View.CLIENT_INFO_LST_VIEW;
	}

	/**
	 * 查询总客户信息列表
	 * 
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author tup
	 */
	@RequestMapping(value = Url.CLIENT_INFO_LST_DO, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> clientInfoLstDo(ClientInfoDto dto, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = assetRepositoryService.clientFindListDo(dto, start, pageSize);
		return returnMap;
	}

	/**
	 * 查询总客户信息列表总览
	 * 
	 * @param dto
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author tup
	 */
	@RequestMapping(value = Url.CLIENT_INFO_LST_ALL_DO, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> clientInfoLstAllDo(ClientInfoDto dto, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = assetRepositoryService.clientFindListAllDo(dto, start, pageSize);
		return returnMap;
	}

	/**
	 * 到客户信息编辑页
	 * 
	 * @param id
	 * @param currpage
	 * @param worktype
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CLIENT_INFO_EDIT, method = RequestMethod.GET)
	public String ClientEdit(String id, String currpage, String worktype, ModelMap map) {
		// 根据id获取client
		assetRepositoryService.getEditClient(id, map);
		// map.put("currpage", currpage);
		map.put("worktype", worktype);
		if ("0".equals(map.get("editstatus"))) {
			map.put("currpage", currpage);
			return View.CLIENT_INFO_VIEW_VIEW;
		}

		map.put("currpage", currpage);
		return View.CLIENT_INFO_EDIT_VIEW;
	}

	/**
	 * 到客户信息总览查看
	 * 
	 * @param id
	 * @param currpage
	 * @param worktype
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CLIENT_INFO_VIEWALL, method = RequestMethod.GET)
	public String ClientViewAll(String id, String currpage, String worktype, ModelMap map) {
		// 根据id获取client
		assetRepositoryService.getViewAllClient(id, map);
		map.put("currpage", currpage);
		map.put("worktype", worktype);

		// if ("0".equals(map.get("editstatus"))) {
		return View.CLIENT_INFO_ALLVIEW_VIEW;
		// }
		// return View.CLIENT_INFO_EDIT_VIEW;
	}

	/**
	 * 保存修改客户信息以及新增
	 * 
	 * @param dto
	 * @param type 1新增 2修改
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CLIENT_INFO_EDIT_DO, method = RequestMethod.POST)
	public String ClientEditAndAddSave(ClientInfoDto dto, String worktype, String shopName, String type, ModelMap map, String currpage) {
		try {
			String flag = assetRepositoryService.UpdateSaveClients(dto, type, shopName, map);
			if ("1".equals(flag)) {// 立即购买
				// 到合同填写页
				// 获取登录人姓名
				UserDTO userInfo = SecurityHelper.getAdminUserInfo();
				String loginName = userInfo.getLoginName();
				User u = userMapper.selectByLoginInfo(loginName);
				map.put("name", u.getName());
				map.put("currpage", currpage);
				return View.CLIENT_CONTRACT_VIEW;
			} else if ("2".equals(flag)) {
				// map.put("worktype", worktype);
				return clientInfoLst(map, worktype, null, currpage);
			}
			// map.put("message", "保存成功！");
			// map.put("currpage", currpage);
			// return ClientInfoLst(map);
			// "redirect:" + "/" + Url.CAR_TYPEIN;
		} catch (Exception e) {
			e.printStackTrace();
			map.put("message", e.getMessage());
			return View.ERROR_MESSAGE_NOLOGIN;
		}
		return View.ERROR_MESSAGE_NOLOGIN;
	}

	/**
	 * 到客户信息新增页
	 * 
	 * @param map
	 * @param worktype
	 * @return
	 * @author wangzh
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = Url.CLIENT_INFO_ADD, method = RequestMethod.GET)
	public String clientInfoAdd(ModelMap map, String worktype) {
		Map<String, Object> pMap = (Map<String, Object>) CachFactory.getInstance().get(Constants.MASTER_DATA_LIST);
		Map<String, Object> priceLst = (Map<String, Object>) pMap.get(MasterDataType.PRICE.getValue());// 价格
		map.put("priceLst", priceLst);
		map.put("worktype", worktype);
		// 获取品牌
		List<Brand> brandLst = assetRepositoryService.getAllBrandLst();
		map.put("brandLst", brandLst);
		// 获取登陆信息
		UserDTO userInfo = SecurityHelper.getAdminUserInfo();
		String shopId = userInfo.getShop();
		if (StringUtils.isNotBlank(shopId)) {
			Shop shop = assetRepositoryService.queryShopById(Integer.parseInt(shopId));
			if (shop != null) {
				map.put("shop", shop);
			}
		}
		Integer key = assetRepositoryService.querySequenceValue(114);// 选择客户信息表的下一个主键
		map.put("infoId", key);
		String now = DateUtils.formate(DateUtils.getCurrentTime(), DateUtils.COMPACT_DATE_FORMAT);
		map.put("filenum", WebConstants.FILE_PREFIX + now.substring(2) + key);
		List<Abrand> brand = brandAndModelService.queryBrandinitial();
		map.put("brand", brand);
		return View.CLIENT_INFO_ADD_VIEW;
	}

	/**
	 * 新增一条交流信息
	 * 
	 * @param sellerId
	 * @param clientId
	 * @param content
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.COMMU_ADD_DO, method = RequestMethod.POST)
	public @ResponseBody Map<String, String> addCommu(String sellerId, String clientId, String content) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			assetRepositoryService.addCommu(sellerId, clientId, content);
			map.put("status", "1");
		} catch (Exception e) {
			map.put("status", "0");
		}
		return map;
	}

	/**
	 * 新增一条交流信息接着查询所有的
	 * 
	 * @param sellerId
	 * @param clientId
	 * @param content
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.COMMU_ADD_DO_LST, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> addCommuAndQueryAll(String sellerId, String clientId, String content) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			assetRepositoryService.addCommuAndQuery(sellerId, clientId, content, map);
			map.put("status", "1");
		} catch (Exception e) {
			map.put("status", "0");
		}
		return map;
	}

	/**
	 * 保存客户信息到数据库
	 * 
	 * @param dto
	 * @param currpage
	 * @param map
	 * @return
	 * @author tup
	 */
	@RequestMapping(value = Url.CLIENT_INFO_ADD_DO, method = RequestMethod.POST)
	public String ClientSaveDo(ClientInfoDto dto, String currpage, ModelMap map) {
		try {
			assetRepositoryService.saveClients(dto);
			map.put("message", "保存成功！");
			return null;
			// return ClientInfoLst(map);
		} catch (IOException e) {
			e.printStackTrace();
			map.put("message", e.getMessage());
			return View.ERROR_MESSAGE;
		}
	}

	/**
	 * 根据当前登录账号查询沟通列表
	 * 
	 * @param infoId 登录账号
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.COMMU_LISTDO, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> CommuLstDo(String infoId, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = assetRepositoryService.CommuLstDo(infoId, start, pageSize);
		return returnMap;
	}

	/**
	 * 到批量导入车辆页面
	 * 
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.CAR_BATCH, method = RequestMethod.GET)
	public String batchCarTypeIn() {
		return "batchtypein.view";
	}

	/**
	 * 下载模板
	 * 
	 * @param request
	 * @param response
	 * @param fileName
	 * @param importType
	 * @throws Exception
	 * @author wangzh
	 */
	@RequestMapping(value = Url.FILE_DOWNLOAD, method = RequestMethod.GET)
	public void download(HttpServletRequest request, HttpServletResponse response, int type) throws Exception {

		BufferedInputStream in = null;
		BufferedOutputStream out = null;
		// request.setCharacterEncoding("UTF-8");
		String rootpath = request.getServletContext().getRealPath("/");
		String fileName = "";
		switch (type) {
			case 0:
				fileName = "车辆录入模板.xlsx";
				break;
			case 1:
				fileName = "调价模板-按车型.xlsx";
				break;
			case 2:
				fileName = "调价模板-按车架号.xlsx";
				break;
			case 3:
				fileName = "北汽车辆录入模板.xlsx";
				break;
			default:
				break;
		}
		try {
			File f = new File(rootpath + "/file/" + fileName);
			response.setContentType("application/x-excel");
			response.setCharacterEncoding("UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename=" + new String(fileName.getBytes("UTF-8"), "iso-8859-1"));
			response.setHeader("Content-Length", String.valueOf(f.length()));
			in = new BufferedInputStream(new FileInputStream(f));
			out = new BufferedOutputStream(response.getOutputStream());
			byte[] data = new byte[1024 * 2];
			int len = 0;
			while (-1 != (len = in.read(data, 0, data.length))) {
				out.write(data, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				in.close();
			}
			if (out != null) {
				out.close();
			}
		}
	}

	/**
	 * 批量导入车辆
	 * @param file
	 * @param response
	 * @author wangzh
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = Url.CAR_BATCH_DO, method = RequestMethod.POST)
	public void importAllProducts(@RequestParam("excelFile") MultipartFile file, HttpServletResponse response) {
		synchronized (lockBatchTypein) {
			// Map<String, Object> modelMap = new HashMap<String, Object>();
			String fileName = file.getOriginalFilename();
			if (StringUtils.isBlank(fileName)) {
				// modelMap.put("message", "没有待上传的文件");
				// return modelMap;
				printOut("没有待上传的文件", response);
				return;
			}
			if (!fileName.endsWith("xls") && !fileName.endsWith("xlsx")) {
				// modelMap.put("message", "上传文件不是EXCEL文件");
				// return modelMap;
				printOut("上传文件不是EXCEL文件", response);
				return;
			}
			// ----------------------------------------------生成excelHelper对象-----------------------------------------------------
			CustomExcelHelper eh = null;
			// List<XSSFPictureData> pictures = null; // excel图片
			try {
				// XSSFWorkbook workbook = (XSSFWorkbook)
				// WorkbookFactory.create(file.getInputStream());
				// pictures = workbook.getAllPictures();
				eh = CustomExcelHelper.readExcel(file.getInputStream());
			} catch (InvalidFormatException | IOException | NullPointerException e1) {
				e1.printStackTrace();
				// logger.error("读取EXCEL文件出现异常{}", e1);
				// modelMap.put("message", "读取EXCEL文件出现异常");
				// printOut(modelMap, response);
				// return modelMap;
				printOut("读取EXCEL文件出现异常", response);
				return;
			}
			// -----------------------------------------------excel校验，生成javaBean----------------------------------------------------
			int line = 2; // excel 起始行
			String alert = "";
			List<Car> carLst = new ArrayList<Car>();
			try {
				List<CarsImportDTO> dtoLst = eh.toEntitys(CarsImportDTO.class);
				// 查询所有仓库
				List<Store> storeLst = assetRepositoryService.queryAllStore();
				Map<String, String> storeNameLst = new HashMap<String, String>();
				for (int i = 0; i < storeLst.size(); i++) {
					storeNameLst.put(storeLst.get(i).getName(), storeLst.get(i).getId().toString());
				}
				// 查询所有经销商
				Map<String, Object> pMap = (Map<String, Object>) CachFactory.getInstance().get(Constants.MASTER_DATA_LIST);
				Map<String, Object> dealers = (Map<String, Object>) pMap.get(MasterDataType.DEALER.getValue());// 价格
				List<String> dealerNameLst = new ArrayList<String>();
				for (Iterator iterator = dealers.entrySet().iterator(); iterator.hasNext();) {
					dealerNameLst.add(((MasterData) ((Map.Entry) iterator.next()).getValue()).getValue());
				}
				int size = dtoLst.size();
				Map<String, String> flex = new HashMap<String, String>();
				Map<String, String> flex1 = new HashMap<String, String>();
				int ms = 0, ms1 = 0;
				for (int i = 0; i < size;) {
					flex.put(dtoLst.get(i).getVin(), dtoLst.get(i).getVin());
					i++;
					ms = flex.size();
					if (i != ms) {
						printOut("第" + (i + 1) + "行，车架号[" + dtoLst.get(i - 1).getVin() + "]在excel中重复出现", response);
						return;
					}
				}
				for (int i = 0, re = 0; i < size; i++) {
					if (StringUtils.isNotBlank(dtoLst.get(i).getEngineNum())) {
						flex1.put(dtoLst.get(i).getEngineNum(), dtoLst.get(i).getEngineNum());
						re++;
						ms1 = flex1.size();
						if (re != ms1) {
							printOut("发动机号[" + dtoLst.get(i).getEngineNum() + "]在excel中重复出现", response);
							return;
						}
					}
				}
				for (CarsImportDTO p : dtoLst) {
					Car car = new Car();
					String add = "";
					// 检查vin、发动机号唯一性
					boolean vbl = assetRepositoryService.carParamCheck(p.getVin(), "2", null);
					if (!vbl) {
						// modelMap.put("message", "第" + line + "行，车架号[" + p.getVin() + "]已存在");
						// // printOut(modelMap, response);
						// return modelMap;
						printOut("第" + line + "行，车架号[" + p.getVin() + "]已存在", response);
						return;
					}
					boolean ebl = assetRepositoryService.carParamCheck(p.getEngineNum(), "1", null);
					if (!ebl) {
						// modelMap.put("message", "第" + line + "行，发动机号[" + p.getEngineNum() +
						// "]已存在");
						// // printOut(modelMap, response);
						// return modelMap;
						printOut("第" + line + "行，发动机号[" + p.getEngineNum() + "]已存在", response);
						return;
					}
					// 检查仓库正确性
					if (StringUtils.isNotBlank(p.getAddress())) {
						if (!storeNameLst.containsKey(p.getAddress())) {
							// modelMap.put("message", "第" + line + "行，仓库[" + p.getAddress() +
							// "]不存在");
							// return modelMap;
							printOut("第" + line + "行，仓库[" + p.getAddress() + "]不存在", response);
							return;
						}
						for (Iterator iterator = storeNameLst.keySet().iterator(); iterator.hasNext();) {
							String string = (String) iterator.next();
							if (string.equals(p.getAddress())) {
								add = storeNameLst.get(string);
							}
						}
					}
					// 检查经销商正确性
					if (StringUtils.isNotBlank(p.getBuyName())) {
						if (!dealerNameLst.contains(p.getBuyName())) {
							// modelMap.put("message", "第" + line + "行，经销商[" + p.getBuyName() +
							// "]不存在");
							// return modelMap;
							printOut("第" + line + "行，经销商[" + p.getBuyName() + "]不存在", response);
							return;
						}
					}
					BeanCopierUtils.copyProperties(p, car);
					Date now = new Date();
					car.setCreateTime(now);
					car.setAddress(add);
					if (StringUtils.isNotBlank(p.getEnergyType())) {
						String str = p.getEnergyType();
						if ("1".equals(str)) {
							car.setEnergyType("汽油");
						} else if ("2".equals(str)) {
							car.setEnergyType("纯电动");
						} else if ("3".equals(str)) {
							car.setEnergyType("油电混合");
						}
					}
					car.setStatus(1);
					if (StringUtils.isNotBlank(p.getLeaveFactoryTime())) {
						car.setLeaveFactoryTime(DateUtils.parse(p.getLeaveFactoryTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
					}
					car.setStoreType(2);
					if (StringUtils.isNotBlank(add)) {
						car.setStoreId(Integer.parseInt(add));
					}
					car.setCarAddress(p.getAddress());
					car.setIsStored(1);
					if (StringUtils.isNotBlank(p.getBuyPrice())) {
						car.setBuyPrice(new BigDecimal(p.getBuyPrice()));
					}
					if (StringUtils.isNotBlank(p.getLowPrice())) {
						car.setLowPrice(new BigDecimal(p.getLowPrice()));
					}
					carLst.add(car);
					line++;
				}
			} catch (ExcelParseException | ExcelContentInvalidException | ExcelRegexpValidFailedException e) {
				e.printStackTrace();
				if (e.getCause() != null) {
					// logger.error("解析EXCEL出现异常{}", e.getCause().getMessage());
					// modelMap.put("message", "EXCEL解析格式错误：[" + e.getCause().getMessage() + "]");
					alert = "EXCEL解析格式错误：[" + e.getCause().getMessage() + "]";
				} else {
					// logger.error("解析EXCEL出现异常{}", e.getMessage());
					// modelMap.put("message", "EXCEL解析格式错误：[" + e.getMessage() + "]");
					alert = "EXCEL解析格式错误：[" + e.getMessage() + "]";
				}
				// printOut(modelMap, response);
				// return modelMap;
				printOut(alert, response);
				return;
			} catch (PortalBizCheckedException e) {
				// logger.error("解析EXCEL出现异常{}", e.getMessage());
				// modelMap.put("message", "EXCEL解析格式错误：[第" + line + "行:" + e.getMessage() + "]");
				// // printOut(modelMap, response);
				// return modelMap;
				printOut("EXCEL解析格式错误：[第" + line + "行:" + e.getMessage() + "]", response);
				return;
			}
			// -----------------------------------------------导入产品----------------------------------------------------
			// StringBuilder message = new StringBuilder();

			// ExcelImportResult excelImportResult = new ExcelImportResult();
			try {
				assetRepositoryService.batchCarTypein(carLst);
				printOut("批量导入成功", response);
			} catch (Exception e) {
				e.printStackTrace();
				// logger.error("导入数据库出现异常{}", e.getMessage());
				// modelMap.put("message", e.getMessage());
				// // printOut(modelMap, response);
				// return modelMap;
				printOut(e.getMessage(), response);
				return;
			}
			// if (excelImportResult.getErrMap().size() == 0) {
			// modelMap.put("successFlag", true);
			// message.append("批量导入产品成功");
			// } else {
			// for (Map.Entry<Integer, Map<Integer, String>> line :
			// excelImportResult.getErrMap().entrySet()) {
			// message.append("");
			// for (Map.Entry<Integer, String> col : line.getValue().entrySet()) {
			// message.append("").append(col.getValue());
			// }
			// }
			// }
			// modelMap.put("status", true);
			// modelMap.put("message", "批量导入成功");
			// return modelMap;
		}
	}

	/**
	  * <p>输出到客户端</p>
	  * @param modelMap
	  * @param response
	  * @author lidongfu_2005@sina.com
	 */
	private void printOut(String str, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			response.setContentType("text/html;charset=UTF-8");
			out = response.getWriter();
			out.print(str);
		} catch (IOException e) {
			e.printStackTrace();
			// logger.error("输出到客户端出现异常：{}", modelMap);
			// modelMap.put("message", e.getCause().getMessage());
			return;
		} finally {
			out.flush();
			out.close();
		}
	}

	/**
	 * 到调价首页
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.ADJUSTPRICE, method = RequestMethod.GET)
	public String adjustIndex() {
		return "adjustprice.view";
	}

	/**
	 * 解析excel进行调价
	 * @param file
	 * @param response
	 * @author wangzh
	 */
	@RequestMapping(value = Url.ADJUSTPRICE_DO, method = RequestMethod.POST)
	public void adjustDo(MultipartFile file1, MultipartFile file2, int type, HttpServletResponse response) {
		synchronized (lockAdjustPrice) {
			MultipartFile file = type == 1 ? file1 : file2;
			String fileName = file.getOriginalFilename();
			if (StringUtils.isBlank(fileName)) {
				printOut("没有待上传的文件", response);
				return;
			}
			if (!fileName.endsWith("xls") && !fileName.endsWith("xlsx")) {
				printOut("上传文件不是EXCEL文件", response);
				return;
			}
			// ----------------------------------------------生成excelHelper对象-----------------------------------------------------
			AdjustExcelHelper eh = null;
			try {
				eh = AdjustExcelHelper.readExcel(file.getInputStream());
			} catch (InvalidFormatException | IOException | NullPointerException e1) {
				e1.printStackTrace();
				printOut("读取EXCEL文件出现异常", response);
				return;
			} catch (Exception e) {
				printOut(e.getMessage(), response);
				return;
			}
			// -----------------------------------------------excel校验，生成javaBean，导入数据----------------------------------------------------
			try {
				Map<String, Object> map = assetRepositoryService.checkAdjustPrice(eh.getDatas(), eh.getHeaders(), type);
				assetRepositoryService.AdjustPriceDo(map, type);
				printOut("调价成功！", response);
				return;
			} catch (Exception e) {
				printOut(e.getMessage(), response);
				return;
			}
		}
	}

	/**
	 * 根据查询条件导出可售车辆excel
	 * 
	 * @param dto
	 * @param map
	 * @author wangzh
	 */
	@RequestMapping(value = Url.EXCEL_REALSALE_EDIT, method = RequestMethod.POST)
	public void exportExcelRealsaleEdit(CarTypeinDto dto, HttpServletResponse response) {
		try {
			response.setContentType("application/x-excel");
			response.setCharacterEncoding("UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename=" + new String("真实可售修改".getBytes("UTF-8"), "iso-8859-1") + ".xls");

			Workbook wb = assetRepositoryService.exportExcelForRealsaleEdit(dto);
			wb.write(response.getOutputStream()); // 输出流控制workbook

			response.getOutputStream().flush();

			response.getOutputStream().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 批量修改真实可售车辆
	 * @param file
	 * @param response
	 * @author wangzh
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = Url.EXCEL_REALSALE_EDITDO, method = RequestMethod.POST)
	public void batchEditRealsale(@RequestParam("excelFile") MultipartFile file, HttpServletResponse response) {
		synchronized (lockBatchEdit) {
			// Map<String, Object> modelMap = new HashMap<String, Object>();
			String fileName = file.getOriginalFilename();
			if (StringUtils.isBlank(fileName)) {
				printOut("没有待上传的文件", response);
				return;
			}
			if (!fileName.endsWith("xls") && !fileName.endsWith("xlsx")) {
				printOut("上传文件不是EXCEL文件", response);
				return;
			}
			// ----------------------------------------------生成excelHelper对象-----------------------------------------------------
			CustomExcelHelper eh = null;
			// List<XSSFPictureData> pictures = null; // excel图片
			try {
				eh = CustomExcelHelper.readExcel(file.getInputStream());
			} catch (InvalidFormatException | IOException | NullPointerException e1) {
				e1.printStackTrace();
				printOut("读取EXCEL文件出现异常", response);
				return;
			}
			// -----------------------------------------------excel校验，生成javaBean----------------------------------------------------
			int line = 2; // excel 起始行
			String alert = "";
			List<Car> carLst = new ArrayList<Car>();
			try {
				List<CarsImportDTO> dtoLst = eh.toEntitys(CarsImportDTO.class);
				// 查询所有仓库
				List<Store> storeLst = assetRepositoryService.queryAllStore();
				Map<String, String> storeNameLst = new HashMap<String, String>();
				for (int i = 0; i < storeLst.size(); i++) {
					storeNameLst.put(storeLst.get(i).getName(), storeLst.get(i).getId().toString());
				}
				// 查询所有经销商
				Map<String, Object> pMap = (Map<String, Object>) CachFactory.getInstance().get(Constants.MASTER_DATA_LIST);
				Map<String, Object> dealers = (Map<String, Object>) pMap.get(MasterDataType.DEALER.getValue());// 经销商
				List<String> dealerNameLst = new ArrayList<String>();
				for (Iterator iterator = dealers.entrySet().iterator(); iterator.hasNext();) {
					dealerNameLst.add(((MasterData) ((Map.Entry) iterator.next()).getValue()).getValue());
				}
				int size = dtoLst.size();
				Map<String, String> flex = new HashMap<String, String>();
				Map<String, String> flex1 = new HashMap<String, String>();
				int ms = 0, ms1 = 0;
				for (int i = 0; i < size;) {
					flex.put(dtoLst.get(i).getVin(), dtoLst.get(i).getVin());
					i++;
					ms = flex.size();
					if (i != ms) {
						printOut("第" + (i + 1) + "行，车架号[" + dtoLst.get(i - 1).getVin() + "]在excel中重复出现", response);
						return;
					}
				}
				for (int i = 0, re = 0; i < size; i++) {
					if (StringUtils.isNotBlank(dtoLst.get(i).getEngineNum())) {
						flex1.put(dtoLst.get(i).getEngineNum(), dtoLst.get(i).getEngineNum());
						re++;
						ms1 = flex1.size();
						if (re != ms1) {
							printOut("发动机号[" + dtoLst.get(i).getEngineNum() + "]在excel中重复出现", response);
							return;
						}
					}
				}
				for (CarsImportDTO p : dtoLst) {
					Car car = new Car();
					String add = "";
					// 检查vin、发动机号唯一性
					// boolean vbl = assetRepositoryService.carParamCheck(p.getVin(), "2", null);
					// if (!vbl) {
					// printOut("第" + line + "行，车架号[" + p.getVin() + "]已存在", response);
					// return;
					// }
					// boolean ebl = assetRepositoryService.carParamCheck(p.getEngineNum(), "1",
					// null);
					// if (!ebl) {
					// printOut("第" + line + "行，发动机号[" + p.getEngineNum() + "]已存在", response);
					// return;
					// }
					// 检查发动机号唯一性 只检查excel中发动机号有值的情况
					if (StringUtils.isNotBlank(p.getEngineNum()) && StringUtils.isNotBlank(p.getVin())) {
						boolean bl = assetRepositoryService.carEngineNumCheck(p.getEngineNum(), p.getVin());
						if (!bl) {
							printOut("第" + line + "行，发动机号[" + p.getEngineNum() + "]已存在", response);
							return;
						}
					}

					// 检查仓库正确性
					if (StringUtils.isNotBlank(p.getAddress())) {
						if (!storeNameLst.containsKey(p.getAddress())) {
							printOut("第" + line + "行，仓库[" + p.getAddress() + "]不存在", response);
							return;
						}
						for (Iterator iterator = storeNameLst.keySet().iterator(); iterator.hasNext();) {
							String string = (String) iterator.next();
							if (string.equals(p.getAddress())) {
								add = storeNameLst.get(string);
							}
						}
					}
					// 检查经销商正确性
					if (StringUtils.isNotBlank(p.getBuyName())) {
						if (!dealerNameLst.contains(p.getBuyName())) {
							printOut("第" + line + "行，经销商[" + p.getBuyName() + "]不存在", response);
							return;
						}
					}
					BeanCopierUtils.copyProperties(p, car);
					// Date now = new Date();
					// car.setCreateTime(now);
					car.setAddress(add);
					if (StringUtils.isNotBlank(p.getEnergyType())) {
						String str = p.getEnergyType();
						if ("1".equals(str)) {
							car.setEnergyType("汽油");
						} else if ("2".equals(str)) {
							car.setEnergyType("纯电动");
						} else if ("3".equals(str)) {
							car.setEnergyType("油电混合");
						}
					}
					// car.setStatus(1);
					if (StringUtils.isNotBlank(p.getLeaveFactoryTime())) {
						car.setLeaveFactoryTime(DateUtils.parse(p.getLeaveFactoryTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
					}
					// car.setStoreType(2);
					if (StringUtils.isNotBlank(add)) {
						car.setStoreId(Integer.parseInt(add));
					}
					// car.setCarAddress(p.getAddress());
					// car.setIsStored(1);
					if (StringUtils.isNotBlank(p.getBuyPrice())) {
						car.setBuyPrice(new BigDecimal(p.getBuyPrice()));
					}
					if (StringUtils.isNotBlank(p.getLowPrice())) {
						car.setLowPrice(new BigDecimal(p.getLowPrice()));
					}
					carLst.add(car);
					line++;
				}
			} catch (ExcelParseException | ExcelContentInvalidException | ExcelRegexpValidFailedException e) {
				e.printStackTrace();
				if (e.getCause() != null) {
					alert = "EXCEL解析格式错误：[" + e.getCause().getMessage() + "]";
				} else {
					alert = "EXCEL解析格式错误：[" + e.getMessage() + "]";
				}
				printOut(alert, response);
				return;
			} catch (PortalBizCheckedException e) {
				printOut("EXCEL解析格式错误：[第" + line + "行:" + e.getMessage() + "]", response);
				return;
			}
			// -----------------------------------------------导入产品----------------------------------------------------
			try {
				assetRepositoryService.batchRealsaleEdit(carLst);
				printOut("修改成功", response);
			} catch (Exception e) {
				e.printStackTrace();
				printOut(e.getMessage(), response);
				return;
			}
		}
	}
}