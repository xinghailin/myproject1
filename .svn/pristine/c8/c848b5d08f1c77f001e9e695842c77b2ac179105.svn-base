package com.yyq.car.portal.ms.web.controller.system;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;

import com.yyq.car.portal.common.constant.MasterDataType;
import com.yyq.car.portal.common.dto.QueryResultDTO;
import com.yyq.car.portal.common.model.comm.MasterData;
import com.yyq.car.portal.common.util.BeanCopierUtils;
import com.yyq.car.portal.ms.app.service.common.MasterDataService;
import com.yyq.car.portal.ms.common.constant.ProjectInfo;
import com.yyq.car.portal.ms.web.command.BasicDataCommand;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;


/**
 * <P> TODO 基础数据管理</P>
 * 
 * @author lidongfu_2005@sina.com
 * @date 2014年8月5日 下午4:22:58
 * 
 */
@Controller
public class MasterDataController {

	final private Logger logger = LoggerFactory.getLogger(MasterDataController.class);

	@Autowired
	@Qualifier(ProjectInfo.NAMESPACE + "masterDataService")
	private MasterDataService masterDataService;

	/**
	 * <p>TODO 跳到查询页面</p>
	 * @return
	 * @author lidongfu_2005@sina.com
	 */
	@RequestMapping(value = Url.SYS_BASIC_DATA_QUERY_URL, method = RequestMethod.GET)
	public String showQueryForm(ModelMap modelMap) {
		Map<String, String> basicDataTypeMap = MasterDataType.dmap;
		modelMap.put("basicDataType", basicDataTypeMap);
		return View.SYS_BASICDATA_VIEW;
	}

	/**
	 * <p>TODO 跳转到新增页面</p>
	 * @return
	 * @author lidongfu_2005@sina.com
	 */
	@RequestMapping(value = Url.SYS_BASIC_DATA_TO_ADD_URL, method = RequestMethod.GET)
	public String showAddForm(ModelMap modelMap) {
		Map<String, String> basicDataTypeMap = MasterDataType.dmap;
		modelMap.put("basicDataType", basicDataTypeMap);
		return View.SYS_BASICDATA_TO_ADD;
	}

	/**
	  * <p>TODO 新增基础数据</p>
	  * @param basicDataCommand
	  * @param model
	  * @author lidongfu_2005@sina.com
	 */
	@RequestMapping(value = Url.SYS_BASIC_DATA_ADD_URL, method = RequestMethod.POST)
	public void add(BasicDataCommand basicDataCommand, Model model) {
		logger.debug("新增基础数据，名：{}，角色描述：{}", basicDataCommand.getDvalue(), basicDataCommand.getDescription());
		MasterData masterData = new MasterData();
		masterData.setType(basicDataCommand.getType());
		int count = masterDataService.countByCriteria(masterData);
		masterData.setCode((count + 1) + "");
		masterData.setValue(basicDataCommand.getDvalue());
		masterData.setDescription(basicDataCommand.getDescription());
		masterDataService.insertSelective(masterData);
		model.addAttribute("status", true);
	}

	/**
	 * <p>TODO 基础数据查询页面</p>
	 * @return
	 * @author lidongfu_2005@sina.com
	 */
	@RequestMapping(value = Url.SYS_BASIC_DATA_QUERY_URL, method = RequestMethod.POST)
	public void dataBasicQuery(BasicDataCommand basicDataCommand, ModelMap modelMap) {
		final int start = (basicDataCommand.getStartPage() - 1) * basicDataCommand.getPageSize() + 1;
		final int end = start + basicDataCommand.getPageSize() - 1;
		QueryResultDTO<MasterData> result = new QueryResultDTO<MasterData>();
		MasterData masterData = new MasterData();
		BeanCopierUtils.copyProperties(basicDataCommand, masterData);
		masterData.setValue(basicDataCommand.getDvalue());
		List<MasterData> basicDataList = masterDataService.queryByCriteria(masterData, start, end);
		Integer total = masterDataService.countByCriteria(masterData);
		// Map basicDataTypeMap = MasterDataType.dmap;
		result.getResult().addAll(basicDataList);
		modelMap.put("result", result);
		modelMap.put("total", total);
		// modelMap.put("basicDataType", basicDataTypeMap);
	}

	/**
	  * <p>TODO  跳转到待编辑的页面</p>
	  * @param id
	  * @param modelMap
	  * @return
	  * @author lidongfu_2005@sina.com
	 */
	@RequestMapping(value = Url.SYS_BASIC_DATA_TO_EDIT_URL, method = RequestMethod.GET)
	public String showEditForm(Integer id, ModelMap modelMap) {
		Map<String, String> basicDataTypeMap = MasterDataType.dmap;
		MasterData masterData = masterDataService.selectByPrimaryKey(id);
		modelMap.put("basicData", masterData);
		modelMap.put("basicDataType", basicDataTypeMap);
		return View.SYS_BASICDATA_TO_EDIT;
	}

	/**
	  * <p>TODO 基础数据编辑</p>
	  * @param basicDataCommand
	  * @param modelMap
	  * @author lidongfu_2005@sina.com
	 */
	@RequestMapping(value = Url.SYS_BASIC_DATA_EDIT_URL, method = RequestMethod.POST)
	public void edit(BasicDataCommand basicDataCommand, ModelMap modelMap) {
		MasterData basicData = new MasterData();
		BeanCopierUtils.copyProperties(basicDataCommand, basicData);
		basicData.setValue(basicDataCommand.getDvalue());
		int updateResult = masterDataService.updateByPrimaryKeySelective(basicData);
		if (updateResult == 1) {
			modelMap.put("status", true);
		} else {
			logger.error("更新失败，受影响的结果为：{}", updateResult);
			modelMap.put("status", false);
		}
	}

	/**
	 * <p>TODO删除基础数据</p>
	 * @param id
	 * @param modelMap
	 * @author lidongfu_2005@sina.com
	 */
	@RequestMapping(value = Url.SYS_BASIC_DATA_DEL_URL, method = RequestMethod.GET)
	public void delete(Integer id, ModelMap modelMap) {
		Integer result = masterDataService.deleteByPrimaryKey(id);
		if (result == 1) {
			modelMap.put("status", true);
		} else {
			logger.error("删除基础数据失败，受影响的结果为：{}", result);
			modelMap.put("status", false);
		}
	}

	/**
	 * <p>刷新缓存</p>
	 * @param modelMap
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SYS_BASIC_DATA_REFRESH_URL, method = RequestMethod.GET)
	public void refreshcache(ModelMap modelMap) {
		masterDataService.refreshcache();
		modelMap.put("status", true);
	}
}
