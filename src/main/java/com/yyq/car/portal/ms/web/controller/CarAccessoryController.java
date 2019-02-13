package com.yyq.car.portal.ms.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.ufa.util.StringUtils;

import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.mapper.biz.BizCarAccessoryStatusMapper;
import com.yyq.car.portal.common.model.biz.BizCarAccessory;
import com.yyq.car.portal.common.model.biz.BizCarAccessoryStatus;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.app.service.CarAccessoryService;
import com.yyq.car.portal.ms.web.constant.Url;



@Controller
public class CarAccessoryController {

	@Autowired
	private CarAccessoryService carAccessoryService;

	/**
	 * 提交审核与领取总查看
	 * @param id
	 * @param currpage
	 * @param type
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.allCarAccessorydetails, method = RequestMethod.GET)
	public String allCarAccessorydetails(Integer id, String currpage, String type, ModelMap map) {
		BizCarAccessory carAccessory = carAccessoryService.selectByPrimaryKey(id);
		map.put("carAccessory", carAccessory);
		map.put("currpage", currpage);
		map.put("type", type);
		return "carAccessory/allCarAccessorydetails";
	}

	/**
	 * 领取记录保存
	 * @param bizCarAccessory
	 * @param carid
	 * @param bizCarAccessoryStatus
	 * @return
	 */
	@RequestMapping(value = Url.getCarAccessorySave, method = RequestMethod.POST)
	public @ResponseBody Object getCarAccessorySave(BizCarAccessory bizCarAccessory,
			BizCarAccessoryStatus bizCarAccessoryStatus) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			carAccessoryService.getCarAccessorySave(bizCarAccessory, bizCarAccessoryStatus);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 不接收
	 * @param bizCarAccessory
	 * @param carid
	 * @return
	 */
	@RequestMapping(value = Url.CarAccessoryAuditNoPass, method = RequestMethod.POST)
	public @ResponseBody Object CarAccessoryAuditNoPass(BizCarAccessory bizCarAccessory, Integer carid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {

			carAccessoryService.CarAccessoryAuditNoPass(bizCarAccessory, carid);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 确认接收
	 * @param bizCarAccessory
	 * @param carid
	 * @return
	 */
	@RequestMapping(value = Url.CarAccessoryAuditPass, method = RequestMethod.POST)
	public @ResponseBody Object CarAccessoryAuditPass(BizCarAccessory bizCarAccessory,String remarks1, Integer carid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			carAccessoryService.CarAccessoryAuditPass(bizCarAccessory,remarks1, carid);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 材料接收审核页面
	 * @param id
	 * @param currpage
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.auditCarAccessoryDetails, method = RequestMethod.GET)
	public String auditCarAccessoryDetails(Integer id, String currpage, ModelMap map) {
		BizCarAccessoryStatus CarAccessory = carAccessoryService.selectByPrimaryKeyStatus(id);
		BizCarAccessory car = carAccessoryService.selectByPrimaryKey(CarAccessory.getCarid());
		map.put("carAccessory", CarAccessory);
		map.put("currpage", currpage);
		map.put("car", car);
		BizCarAccessoryStatus carstatus1=new BizCarAccessoryStatus();
		carstatus1.setCarid(car.getId());
		carstatus1.setStatus(2);
		String remarks1="";
		int num=0;
		List<BizCarAccessoryStatus> carstatus=carAccessoryService.getBizCarAccessoryStatusRemarks1(carstatus1);
		for (int i = 0; i < carstatus.size(); i++) {
			if (StringUtils.isNotBlank(carstatus.get(i).getRemarks1())) {
				remarks1 =remarks1+(num+1)+"."+carstatus.get(i).getRemarks1()+"\n";
				map.put("remarks1", remarks1);
				num++;
			}
		
		}
		return "carAccessory/auditCarAccessoryDetails";
	}

	/**
	 * 材料详情页面
	 * @param id
	 * @param currpage
	 * @param map
	 * @param type
	 * @return
	 */
	@RequestMapping(value = Url.CarAccessoryDetails, method = RequestMethod.GET)
	public String CarAccessoryDetails(Integer id, String currpage, ModelMap map, Integer type) {
		BizCarAccessoryStatus carAccessory = carAccessoryService.selectByPrimaryKeyStatus(id);
		BizCarAccessory car = carAccessoryService.selectByPrimaryKey(carAccessory.getCarid());
		map.put("car", car);
		map.put("currpage", currpage);
		map.put("carAccessory", carAccessory);
		map.put("type", type);
		return "carAccessory/CarAccessorydetails";

	}

	/**
	 * 新增此车附件保存
	 * @param bizCarAccessoryStatus
	 * @return
	 */
	@RequestMapping(value = Url.newAddCarAccessorySave, method = RequestMethod.POST)
	public @ResponseBody Object newAddCarAccessorySave(BizCarAccessoryStatus bizCarAccessoryStatus,
			BizCarAccessory bizCarAccessory) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {

			bizCarAccessoryStatus.setCreatime(new Date());
			carAccessoryService.newAddCarAccessorySave(bizCarAccessoryStatus, bizCarAccessory);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 同车新附件添加
	 * @param carid
	 * @param map
	 * @param currpage
	 * @param type 1 新建此车附件 2此车记录类别页面的详情车看 3财务接收页面  4财务查看页面
	 * @return
	 */
	@RequestMapping(value = Url.newAddCarAccessory, method = RequestMethod.GET)
	public String newAddCarAccessory(Integer carid, ModelMap map, String currpage, Integer type) {
		BizCarAccessory car = carAccessoryService.selectByPrimaryKey(carid);
		map.put("car", car);
		map.put("currpage", currpage);
		return "carAccessory/newAddCarAccessory";
	}

	/**
	 * 附件详情查询
	 * @param carid
	 * @return
	 */
	@RequestMapping(value = Url.CarAccessorydetailsList, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> CarAccessorydetailsList(Integer carid, Integer type) {
		return carAccessoryService.CarAccessorydetailsList(carid, type);
	}

	/**
	 * 附件详情列表页面
	 * @param id
	 * @param currpage
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.CarAccessoryDetailsListPage, method = RequestMethod.GET)
	public String CarAccessorydetails(Integer id, String currpage, ModelMap map, Integer type) {
		map.put("currpage", currpage);
		if (type == 1 || type == 2) {
			map.put("id", id);
			map.put("type", type);
			return "carAccessory/CarAccessorydetailsList";
		} else if (type == 3) {
			BizCarAccessory car = carAccessoryService.selectByPrimaryKey(id);
			map.put("car", car);
			BizCarAccessoryStatus carstatus1=new BizCarAccessoryStatus();
			carstatus1.setCarid(id);
			carstatus1.setStatus(2);
			String remarks1="";
			int num=0;
			List<BizCarAccessoryStatus> carstatus=carAccessoryService.getBizCarAccessoryStatusRemarks1(carstatus1);
			for (int i = 0; i < carstatus.size(); i++) {
				if (StringUtils.isNotBlank(carstatus.get(i).getRemarks1())) {
					remarks1 =remarks1+(num+1)+"."+carstatus.get(i).getRemarks1()+"\n";
					map.put("remarks1", remarks1);
					num++;
				}
			
			}
			return "carAccessory/getCarAccessory";
		} else {
			map.put("id", id);
			map.put("type", type);
			return "carAccessory/getCarAccessorydetailsList";
		}

	}

	/**
	 * 随车附件添加保存
	 * @param bizCarAccessory
	 * @param bizCarAccessoryStatus
	 * @return
	 */
	@RequestMapping(value = Url.addCarAccessorySave, method = RequestMethod.POST)
	public @ResponseBody Object addCarAccessorySave(BizCarAccessory bizCarAccessory,
			BizCarAccessoryStatus bizCarAccessoryStatus) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			carAccessoryService.addCarAccessorySave(bizCarAccessory, bizCarAccessoryStatus);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}

	/**
	 * 随车附件添加页面
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.addCarAccessory, method = RequestMethod.GET)
	public String addCarAccessory(ModelMap map) {
		UserDTO user = SecurityHelper.getAdminUserInfo();
		map.put("username", user.getName());
		return "carAccessory/addCarAccessory";

	}

	/***
	 * 随车附件流转列表页面
	 * @param currpage
	 * @param map
	 * @return type=1新增随车附件列表 type=2 财务接收列表 3门店领取列表 4门店领取记录列表
	 */
	@RequestMapping(value = Url.carAccessorypage, method = RequestMethod.GET)
	public String carAccessorypage(String currpage, ModelMap map, Integer type) {
		map.put("currpage", currpage);
		map.put("type", type);
		if (type == 3) {
			return "carAccessory/StoresToReceivepagelist";
		} else {
			return "carAccessory/carAccessorypagelist";
		}
	}

	/**
	 * 随车附件流转列表查询
	 * @param bizCarAccessory
	 * @param start
	 * @param pageSize
	 * @return type=1新增随车附件列表 type=2 财务接收列表 
	 */
	@RequestMapping(value = Url.carAccessorylist, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> carAccessorylist(BizCarAccessory bizCarAccessory, Integer start, Integer pageSize,
			Integer type) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("start", (start - 1) * pageSize);
		paraMap.put("pageSize", pageSize);
		paraMap.put("type", type);
		if (StringUtils.isNotBlank(bizCarAccessory.getVin())) {
			paraMap.put("vin", bizCarAccessory.getVin());
		}
		if (StringUtils.isNotBlank(bizCarAccessory.getBrand())) {
			paraMap.put("brand", bizCarAccessory.getBrand());
		}
		if (StringUtils.isNotBlank(bizCarAccessory.getModel())) {
			paraMap.put("model", bizCarAccessory.getModel());
		}
		if (StringUtils.isNotBlank(bizCarAccessory.getVersion())) {
			paraMap.put("version", bizCarAccessory.getVersion());
		}
		return carAccessoryService.carAccessorylist(paraMap);

	}
}
