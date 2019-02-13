package com.yyq.car.portal.ms.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yyq.car.portal.common.model.cif.HelpFind;
import com.yyq.car.portal.common.model.cif.Initiator;
import com.yyq.car.portal.common.model.cif.Meet;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.ms.app.service.FindCarService;
import com.yyq.car.portal.ms.app.service.ReportService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;


@Controller
public class FindCarController {

	@Autowired
	private FindCarService findCarService;

	@Autowired
	private ReportService reportService;

	/**
	 *进入预约到店列表页
	 * <p>TODO</p>
	 * @param map
	 * @param shopId
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.MEET_SHOP, method = RequestMethod.GET)
	public String FindMeetPage(ModelMap map, String shopId,String currpage) {
		List<Shop> shoplist = reportService.queryshop();
		map.put("shoplist", shoplist);
		map.put("currpage", currpage);
		return View.MEET_SHOP_VIEW;
	}
	/**
	 * 核销
	 * @return
	 */
	@RequestMapping(value = Url.CONFIRM_SELL, method = RequestMethod.GET)
	public String confirmSell() {
		return View.CONFIRM_SELL_VIEW;
	}
	
	/**
	 * 进入预约到店列表页查看
	 * <p>TODO</p>
	 * @param meet
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return MANAGE_MEET
	 * @author mjy
	 */
	@RequestMapping(value = Url.MEET_IN_SHOP, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> findMeet(Meet meet, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = findCarService.findAllMeet(meet, start, pageSize);
		return returnMap;
	}

	/**
	 * 详情查看
	 * <p>TODO</p>
	 * @param map
	 * @param id
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.MEET_DETAILS, method = RequestMethod.GET)
	public String meetDetails(ModelMap map, Integer id,String currpage) {
		Meet meet = findCarService.meetDetails(id);
		map.put("me", meet);
		map.put("currpage", currpage);
		return View.MEET_DETAILS;//未处理
	}

	/**
	 * 详情处理
	 * <p>TODO</p>
	 * @param meet
	 * @return
	 * @author mjy
	 */

	@RequestMapping(value = Url.MANAGE_MEET, method = RequestMethod.POST)
	public String manageMeet(Meet meet,ModelMap map ,String currpage) {
		findCarService.manageMeet(meet);
		map.put("currpage", currpage);
		return View.MEET_SHOP_VIEW;
	}

	/**
	 * 进入帮我找车页面
	 * <p>TODO</p>
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.FIND_CAR, method = RequestMethod.GET)
	public String HelpfindCar(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		return View.FIND_CAR_VIEW;

	}

	/**
	 * 帮我找车查询
	 * <p>TODO</p>
	 * @param helpFind
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.FIND_CAR_INDEX, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> helpFindCarType(HelpFind helpFind, String start, String pageSize, ModelMap map) {
		Map<String, Object> maplistMap = findCarService.queryHelpFindCar(helpFind, start, pageSize);
		return maplistMap;

	}

	/**
	 * 帮我找车详情
	 * <p>TODO</p>
	 * @param map
	 * @param id
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.HELP_FIND_CAR_DETAILS, method = RequestMethod.GET)
	public String helpFindCarDetails(ModelMap map, Integer id,String currpage) {
		HelpFind findCar = findCarService.helpFindCarDetails(id);
		map.put("findcar", findCar);
		map.put("currpage", currpage);
		return View.HELP_FIND_CAR_DETAILS_VIEW;

	}

	/**
	 * 帮我找车处理结果保存
	 * <p>TODO</p>
	 * @param findcar
	 * @return
	 * @author mjy
	 */
	@RequestMapping(value = Url.HELP_FIND_CAR_MANAGE, method = RequestMethod.POST)
	public String helpFindCarManage(HelpFind findcar,ModelMap map,String currpage) {
		findCarService.helpFindCarManage(findcar);
		Initiator in=new Initiator();
		in.setId(findcar.getUserid());//发起者id
		in.setWeixinId(findcar.getWechatid());//发起者微信id
		findCarService.updateState(in);//后台处理完询底价后改变状态为 2 就可以再次发起砍价
		map.put("currpage", currpage);
		return View.FIND_CAR_VIEW;
	}

}
