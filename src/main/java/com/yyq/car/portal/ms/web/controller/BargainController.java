package com.yyq.car.portal.ms.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yyq.car.portal.common.dto.InitiatorDto;
import com.yyq.car.portal.common.mapper.cif.BargainMapper;
//import com.yyq.car.portal.common.mapper.cif.InitiatorMapper;
import com.yyq.car.portal.common.model.cif.Bargain;
//import com.yyq.car.portal.common.model.cif.Initiator;
//import com.yyq.car.portal.common.model.cif.Meet;
import com.yyq.car.portal.ms.app.service.BargainService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;


@Controller
public class BargainController {

	@Autowired
	private BargainService bargainService;

	@Autowired
	private BargainMapper bargainMapper;

	/**
	 * 进入发起人页面
	 * @return
	 */
	@RequestMapping(value = Url.INITATOR, method = RequestMethod.GET)
	public String Initiator(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		return View.INITATOR_VIEW;
	}

	/**
	 * 发起人查询
	 * @param initiator
	 * @param start
	 * @param pageSize
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.QUERY_ALL_INITATOR, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryAllInitiator(InitiatorDto initiator, ModelMap map) {
		Map<String, Object> returnMap = bargainService.queryAllInitiator(initiator);
		return returnMap;
	}

	/**
	 * 到帮忙砍价详情页面
	 * @return 
	 * @return
	 */
	@RequestMapping(value = Url.BARGAIN_DETAILS, method = RequestMethod.GET)
	public String bargainDetails(String id, ModelMap map, String currpage) {
		map.put("id", id);
		map.put("currpage", currpage);
		return View.BARGAIN_DETAILS;
	}

	@RequestMapping(value = Url.CONFIRM_SELL_STATE, method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> confirmSell(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			bargainService.confirmSell(id);
			map.put("status", true);
		} catch (Exception e) {
			map.put("status", false);
			map.put("message", e.getMessage());
		}
		return map;
	}

	/**
	 * 帮忙砍价详情
	 * @param id
	 * @param start
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = Url.BARGAIN_DETAILS_LST, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryBargainDetails(String id, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		Bargain b = new Bargain();
		b.setInitiatorId(id);
		int ps = Integer.parseInt(pageSize);
		List<Bargain> lst = bargainService.selectBargain(b, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));// 砍价列表
		int c = bargainMapper.countByCriteria(b);
		map.put("total", c);
		map.put("result", lst);
		return map;
	}
}
