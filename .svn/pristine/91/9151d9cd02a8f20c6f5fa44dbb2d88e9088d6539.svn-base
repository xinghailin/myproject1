/*******************************************************************************
 * Project   : portal-ms
 * Class Name: com.yyq.portal.ms.web.controller.ResourceController
 * Created By: Jonathan 
 * Created on: 2014-6-17 下午1:05:52
 * Copyright © 2008-2014 NATIE All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.controller.system;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.beans.BeanCopier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;

import com.yyq.car.portal.ms.web.command.ResourceCmd;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;
import com.yyq.car.portal.common.dto.QueryResultDTO;
import com.yyq.car.portal.common.model.auth.Resource;
import com.yyq.car.portal.common.service.security.ResourceService;



/**
 * <P>TODO</P>
 * @author Jonathan
 */
@Controller
public class ResourceController {

	final private Logger logger = LoggerFactory.getLogger(ResourceController.class);

	@Autowired
	private ResourceService resourceService;

	/**
	 * <p>显示角色查询页面</p>
	 * @return
	 * @author Jonathan
	 */
	@RequestMapping(value = Url.PERMISSION_RESOURCE_QUERY_URL, method = RequestMethod.GET)
	public String showQueryForm() {
		return View.PERMISSION_RESOURCE_QUERY_VIEW;
	}

	/**
	 * <p>显示新增资源页面</p>
	 * @return
	 * @author Jonathan
	 */
	@RequestMapping(value = Url.PERMISSION_RESOURCE_ADD_URL, method = RequestMethod.GET)
	public String showAddForm() {
		return View.PERMISSION_RESOURCE_ADD_VIEW;
	}

	/**
	 * <p>显示编辑页面</p>
	 * @return
	 * @author Jonathan
	 */
	@RequestMapping(value = Url.PERMISSION_RESOURCE_EDIT_URL, method = RequestMethod.GET)
	public String showEditForm(Integer id, ModelMap modelMap) {
		Resource resource = resourceService.query(id);
		modelMap.put("resource", resource);
		return View.PERMISSION_RESOURCE_EDIT_VIEW;
	}

	/**
	 * <p>新增资源</p>
	 * @return
	 * @author Jonathan
	 */
	@RequestMapping(value = Url.PERMISSION_RESOURCE_ADD_URL, method = RequestMethod.POST)
	public void add(ResourceCmd resourceCommand, ModelMap modelMap) {
		// 验证资源名称是否重复
		Resource rCheckName = new Resource();
		rCheckName.setName(resourceCommand.getName());
		int resultCheckName = resourceService.checkResourceNameOrUriIFExists(rCheckName);
		if (resultCheckName > 0) {
			modelMap.put("message", "资源名称重复");
			modelMap.put("status", false);
			return;
		}
		// 验证URI是否重复
		Resource rCheckUri = new Resource();
		rCheckUri.setUri(resourceCommand.getUri());
		rCheckUri.setMethod(resourceCommand.getMethod());
		int resultCheckUri = resourceService.checkResourceNameOrUriIFExists(rCheckUri);
		if (resultCheckUri > 0) {
			modelMap.put("message", "资源URI重复");
			modelMap.put("status", false);
			return;
		}
		// 开始新增
		Resource resource = new Resource();
		resource.setCreateTime(new Date());
		BeanCopier beanCopier = BeanCopier.create(ResourceCmd.class, Resource.class, false);
		beanCopier.copy(resourceCommand, resource, null);
		int result = resourceService.add(resource);
		if (result == 1) {
			modelMap.put("status", true);
		} else {
			logger.error("新增资源失败，受影响的结果为：{}", result);
			modelMap.put("status", false);
		}
	}

	/**
	 * <p>查询资源</p>
	 * @param roleCommand
	 * @param modelMap
	 * @author Jonathan
	 */
	@RequestMapping(value = Url.PERMISSION_RESOURCE_QUERY_URL, method = RequestMethod.POST)
	public void query(ResourceCmd resourceCommand, ModelMap modelMap) {
		final int start = (resourceCommand.getStartPage() - 1) * resourceCommand.getPageSize() + 1;
		final int end = start + resourceCommand.getPageSize() - 1;
		QueryResultDTO<Resource> result = new QueryResultDTO<Resource>();
		Resource resource = new Resource();
		resource.setName(resourceCommand.getName());
		resource.setUri(resourceCommand.getUri());
		resource.setMethod(resourceCommand.getMethod());

		if (resourceCommand.getAppId() != null && resourceCommand.getAppId() != -1)
			resource.setAppId(resourceCommand.getAppId());
		else
			resource.setAppId(null);

		if (resourceCommand.getStatus() != null && resourceCommand.getStatus() != -1)
			resource.setStatus(resourceCommand.getStatus());
		else
			resource.setStatus(null);

		List<Resource> resources = resourceService.queryByCriteria(resource, start, end);
		Integer total = resourceService.countByCriteria(resource);
		result.getResult().addAll(resources);
		modelMap.put("result", result);
		modelMap.put("total", total);
	}

	@RequestMapping(value = Url.PERMISSION_RESOURCE_DELETE_URL, method = RequestMethod.POST)
	public void delete(Integer id, ModelMap modelMap) {
		Integer result = resourceService.delete(id);
		if (result == 1) {
			modelMap.put("status", true);
		} else {
			logger.error("删除资源失败，受影响的结果为：{}", result);
			modelMap.put("status", false);
		}
	}

	@RequestMapping(value = Url.PERMISSION_RESOURCE_EDIT_URL, method = RequestMethod.POST)
	public void edit(ResourceCmd resourceCommand, ModelMap modelMap) {
		Resource rOld = resourceService.query(resourceCommand.getId());// 修改以前的资源
		if (!rOld.getName().equals(resourceCommand.getName())) {
			// 验证资源名称是否重复
			Resource rCheckName = new Resource();
			rCheckName.setName(resourceCommand.getName());
			int resultCheckName = resourceService.checkResourceNameOrUriIFExists(rCheckName);
			if (resultCheckName > 0) {
				modelMap.put("message", "资源名称重复");
				modelMap.put("status", false);
				return;
			}
		}
		if (!rOld.getUri().equals(resourceCommand.getUri()) || !rOld.getMethod().equals(resourceCommand.getMethod())) {
			// 验证URI是否重复
			Resource rCheckUri = new Resource();
			rCheckUri.setUri(resourceCommand.getUri());
			rCheckUri.setMethod(resourceCommand.getMethod());
			int resultCheckUri = resourceService.checkResourceNameOrUriIFExists(rCheckUri);
			if (resultCheckUri > 0) {
				modelMap.put("message", "资源URI重复");
				modelMap.put("status", false);
				return;
			}
		}
		// 开始修改
		Resource resource = new Resource();
		BeanCopier beanCopier = BeanCopier.create(ResourceCmd.class, Resource.class, false);
		beanCopier.copy(resourceCommand, resource, null);
		int result = resourceService.update(resource);
		if (result == 1) {
			modelMap.put("status", true);
		} else {
			logger.error("更新失败，受影响的结果为：{}", result);
			modelMap.put("status", false);
		}

	}

}
