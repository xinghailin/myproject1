package com.yyq.car.portal.ms.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.constant.FileTypeEnum;
import com.yyq.car.portal.common.model.comm.BargainConfig;
import com.yyq.car.portal.common.model.comm.InterestTalk;
import com.yyq.car.portal.common.service.ResourcePersistenceService;
import com.yyq.car.portal.ms.app.service.InterestTalkService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;

@Controller
public class InterestTalkController {

	@Autowired
	private InterestTalkService interestTalkService;
	@Autowired
	private ResourcePersistenceService resourceService;
	/**
	 * 到趣话页面
	 * @return
	 */
	@RequestMapping(value = Url.INTEREST_TALK, method = RequestMethod.GET)
	public String InterestTalk(){
		return View.INTEREST_TALK_VIEW;
		
	}
	/**
	 * 趣话查询
	 * @param interestTalk
	 * @param start
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = Url.INTEREST_TALK_PAGE, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryInterestTalk(InterestTalk interestTalk, String start, String pageSize) {
		Map<String, Object> maplistMap = interestTalkService.queryInterestTalk(interestTalk, start, pageSize);
		return maplistMap;

	}
	/**
	 * 添加趣话页面
	 * @return
	 */
	@RequestMapping(value = Url.ADD_INTEREST_TALK_PAGE, method = RequestMethod.GET)
	public String addInterestTalkPage(){
		return View.ADD_INTEREST_TALK_PAGE_VIEW;
		
	}
	/**
	 * 添加趣话
	 * @param interestTalk
	 * @return
	 */
	@RequestMapping(value = Url.ADD_INTEREST_TALK, method = RequestMethod.POST)
	public String  addInterestTalk(InterestTalk interestTalk){
		if (interestTalk.getId()!=null) {
			interestTalkService.updateInterestTalk(interestTalk);
		}else{
			interestTalkService.addInterestTalk(interestTalk);
		}
		return View.INTEREST_TALK_VIEW;
		
	}
	/**
	 * 到趣话修改页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.UPDATE_INTEREST_TALK_PAGE, method = RequestMethod.GET)
	public String updateInterestTalkPage(Integer id, ModelMap map){
		InterestTalk talk=interestTalkService.findByIdInterestTalk(id);
		map.put("talk", talk);
		return View.ADD_INTEREST_TALK_PAGE_VIEW;
		
	}

	/**
	 * 砍价配置
	 * @param interestTalk
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping(value=Url.FIND_BARGAIN,method=RequestMethod.GET)
	public String updateBargainConfiguration(InterestTalk interestTalk,Integer id,ModelMap map){
		BargainConfig bar=interestTalkService.fingByBargainConfiguration(1);
		map.put("bar", bar);
		List<InterestTalk> talk=interestTalkService.queryAllInterestTalk(interestTalk);
		map.put("talk", talk);
		return View.FIND_BARGAIN_VIEW;
	}
	/**
	 * 修改砍价配置
	 * @param bargainConfig
	 * @param picture
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = Url.UPDATE_BARGAIN, method = RequestMethod.POST)
	public String updateBargainConfig(BargainConfig bargainConfig, MultipartFile picture) throws IOException{
		bargainConfig.setPic(resourceService.uploadFileProcessStr(picture, FileTypeEnum.CARIDENTIFY));
		Map<String, Map<String, Object>> map = new HashMap<String, Map<String, Object>>();
		if (StringUtils.isNotBlank(bargainConfig.getPic())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", picture.getInputStream());
			tMap.put("size", picture.getSize());
			map.put(bargainConfig.getPic(), tMap);
		}
		if (map.entrySet().size() > 0) {
			resourceService.asyncSaveFiles(map, true);
		}
		interestTalkService.updateBargainConfiguration(bargainConfig);
		return "redirect:/find/bargain";
	}
	/**
	 * 删除趣话
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.DELETE_INTEREST_TALK, method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> deleteInterestTalk(Integer id){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			interestTalkService.deleteInterestTalk(id);
			map.put("status", true);
		} catch (Exception e) {
			map.put("status", false);
			map.put("message", e.getMessage());
		}
		return map;
	}
}
