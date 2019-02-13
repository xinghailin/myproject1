/*******************************************************************************
 * Project   : portal-ms
 * Class Name: com.yyq.portal.ms.web.controller.PermissionController
 * Created By: Jonathan 
 * Created on: 2014-5-30 下午4:14:49
 * Copyright © 2008-2014 NATIE All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.controller.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.beans.BeanCopier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;

import com.yyq.car.portal.common.constant.Constants;
import com.yyq.car.portal.common.dto.QueryResultDTO;
import com.yyq.car.portal.common.exception.PortalBizCheckedException;
import com.yyq.car.portal.common.exception.PortalBizUnCheckedException;
import com.yyq.car.portal.common.model.auth.Menu;
import com.yyq.car.portal.common.model.auth.Resource;
import com.yyq.car.portal.common.model.auth.Role;
import com.yyq.car.portal.common.service.security.ResourceService;
import com.yyq.car.portal.common.service.security.RoleService;
import com.yyq.car.portal.ms.web.command.RoleCmd;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;


/**
 * <P>权限管理控制器</P>
 * @author Jonathan
 */
@Controller
public class RoleController {

	final private Logger logger = LoggerFactory.getLogger(RoleController.class);

	@Autowired
	private RoleService roleService;

	@Autowired
	private ResourceService resourceService;

	/**
	 * <p>显示角色查询页面</p>
	 * @return
	 * @author Jonathan
	 */
	@RequestMapping(value = Url.PERMISSION_ROLE_QUERY_URL, method = RequestMethod.GET)
	public String showQueryForm() {
		return View.PERMISSION_ROLE_QUERY_VIEW;
	}

	/**
	 * <p>显示新增角色页面</p>
	 * @return
	 * @author Jonathan
	 */
	@RequestMapping(value = Url.PERMISSION_ROLE_ADD_URL, method = RequestMethod.GET)
	public String showAddForm() {
		return View.PERMISSION_ROLE_ADD_VIEW;
	}

	/**
	 * <p>显示编辑角色页面</p>
	 * @param id
	 * @param modelMap
	 * @return
	 * @author Jonathan
	 */
	@RequestMapping(value = Url.PERMISSION_ROLE_EDIT_URL, method = RequestMethod.GET)
	public String showEditForm(Integer id, ModelMap modelMap) {
		Role role = roleService.queryByRoleId(id);
		modelMap.put("role", role);
		return View.PERMISSION_ROLE_EDIT_VIEW;
	}

	/**
	 * <p>新增角色</p>
	 * @param roleName
	 * @param description
	 * @param model
	 * @author Jonathan
	 */
	@RequestMapping(value = Url.PERMISSION_ROLE_ADD_URL, method = RequestMethod.POST)
	public void add(RoleCmd roleCommand, Model model) {
		logger.debug("新增角色，角色名：{}，角色描述：{},类型：{}", roleCommand.getName(), roleCommand.getAppId());
		Role role = new Role();
		role.setDescription(roleCommand.getDescription());
		role.setName(roleCommand.getName());
		role.setCreateTime(new Date());
		if (StringUtils.isNotBlank(roleCommand.getAppId())) {
			role.setAppId(Integer.parseInt(roleCommand.getAppId()));
		}
		try {
			roleService.add(role);
			model.addAttribute("status", true);
		} catch (PortalBizUnCheckedException e) {
			model.addAttribute("status", false);
			model.addAttribute("msg", e.getMessage());
		}
	}

	/**
	 * <p>查询角色</p>
	 * @param roleCommand
	 * @param modelMap
	 * @author Jonathan
	 */
	@RequestMapping(value = Url.PERMISSION_ROLE_QUERY_URL, method = RequestMethod.POST)
	public void query(RoleCmd roleCommand, ModelMap modelMap) {
		final int start = (roleCommand.getStartPage() - 1) * roleCommand.getPageSize() + 1;
		final int end = start + roleCommand.getPageSize() - 1;
		QueryResultDTO<Role> result = new QueryResultDTO<Role>();
		Role role = new Role();
		if (StringUtils.isNotBlank(roleCommand.getAppId())) {
			role.setAppId(Integer.parseInt(roleCommand.getAppId()));
		}
		role.setName(roleCommand.getName());
		role.setDescription(roleCommand.getDescription());
		List<Role> roles = roleService.queryByCriteria(role, start, end);
		Integer total = roleService.countByCriteria(role);
		result.getResult().addAll(roles);
		modelMap.put("result", result);
		modelMap.put("total", total);
	}

	/**
	 * <p>编辑角色信息</p>
	 * @param roleCommand
	 * @param modelMap
	 * @author Jonathan
	 */
	@RequestMapping(value = Url.PERMISSION_ROLE_EDIT_URL, method = RequestMethod.POST)
	public void edit(RoleCmd roleCommand, ModelMap modelMap) {
		Role role = new Role();
		BeanCopier beanCopier = BeanCopier.create(RoleCmd.class, Role.class, false);
		beanCopier.copy(roleCommand, role, null);
		if (StringUtils.isNotBlank(roleCommand.getAppId())) {
			role.setAppId(Integer.parseInt(roleCommand.getAppId()));
		} else {
			role.setAppId(99);// 99特殊值 用来设置为null
		}
		try {
			int updateResult = roleService.update(role);
			if (updateResult == 1) {
				modelMap.put("status", true);
			} else {
				logger.error("更新失败，受影响的结果为：{}", updateResult);
				modelMap.put("status", false);
			}
		} catch (Exception e) {
			modelMap.put("status", false);
			modelMap.put("msg", e.getMessage());
		}
	}

	/**
	 * <p>删除角色</p>
	 * @param id
	 * @param modelMap
	 * @author Jonathan
	 */
	@RequestMapping(value = Url.PERMISSION_ROLE_DELETE_URL, method = RequestMethod.POST)
	public void delete(Integer id, ModelMap modelMap) {
		Integer result = roleService.delete(id);
		if (result == 1) {
			modelMap.put("status", true);
		} else {
			logger.error("新增资源失败，受影响的结果为：{}", result);
			modelMap.put("status", false);
		}
	}

	/**
	 * <p>显示角色资源配置页面</p>
	 * @param Id
	 * @author Jonathan
	 */
	@RequestMapping(value = Url.PERMISSION_ROLE_CONFIG_RESOURCE_URL, method = RequestMethod.GET)
	public String qeuryRoleResource(Integer id, ModelMap modelMap) {
		List<Resource> usedResources = resourceService.queryByRoleId(id);
		Role role = roleService.queryByRoleId(id);
		Resource resource = new Resource();
		resource.setAppId(role.getAppId());
		resource.setStatus(Integer.valueOf(Constants.RESOURCE_STATUS_Y));// 左侧所有资源只查询状态为有效的
		List<Resource> remainResources = resourceService.queryByCriteria(resource);
		List<Resource> remainList = new ArrayList<Resource>();
		for (Resource e : remainResources) {
			boolean isRemain = true;
			for (Resource item : usedResources) {
				if (item.getId() == e.getId()) {
					isRemain = false;
				}
			}
			if (isRemain)
				remainList.add(e);
		}
		modelMap.put("usedResources", usedResources);
		modelMap.put("allResources", remainList);
		modelMap.put("role", id);
		return View.PERMISSION_ROLE_CONFIG_RESOURCE_VIEW;
	}

	@RequestMapping(value = Url.PERMISSION_ROLE_CONFIG_RESOURCE_URL, method = RequestMethod.POST)
	public void configRoleResource(Integer role, Integer[] target, ModelMap modelMap) {
		roleService.configResource(role, target);
		modelMap.put("status", true);
	}

	/**
	 * 
	 * <P> 显示角色菜单配置页面  </P>
	 *
	 * @author lidongfu_2005@sina.com
	 * @param id
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = Url.MENU_ROLE_CONFIG_RESOURCE_URL, method = RequestMethod.GET)
	public String qeuryRoleMenu(Integer id, ModelMap modelMap) {
		List<Menu> usedMenu = roleService.menuQueryByRole(id);
		List<Menu> menuAll = roleService.selectAllMenu();
		List<Menu> tl = new ArrayList<Menu>();
		sortMenu(menuAll, tl, 0, 0);
		List<Map<String, Object>> remainList = new ArrayList<Map<String, Object>>();
		// String jsCode = "";
		for (Menu e : tl) {
			Map<String, Object> menuMap = new HashMap<String, Object>();
			menuMap.put("id", e.getId());
			menuMap.put("menuName", e.getMenuName());
			menuMap.put("menuUrl", e.getMenuUrl());
			menuMap.put("parentId", e.getParentId());
			for (Menu item : usedMenu) {
				if (item.getId().equals(e.getId())) {
					menuMap.put("isUsed", "checked");
				}
			}
			remainList.add(menuMap);
		}
		modelMap.put("usedResources", usedMenu);
		modelMap.put("remainList", remainList);
		modelMap.put("role", id);
		return View.SYS_MENU_ROLE_CONFIG;
	}

	/**
	 * 菜单排序
	 * <p>TODO</p>
	 * @param lst
	 * @param tl
	 * @param pi
	 * @param c
	 * @author wangzh
	 */
	public void sortMenu(List<Menu> lst, List<Menu> tl, int pi, int c) {
		for (int i = 0, size = lst.size(); i < size; i++) {
			Menu menu = lst.get(i);
			if (menu.getParentId() != null) {
				if (menu.getParentId() == pi) {
					tl.add(menu);
					if (c < 1) {
						sortMenu(lst, tl, menu.getId(), ++c);
						c--;
					}
				}
			} else {
				throw new PortalBizCheckedException("菜单[" + menu.getId() + "]配置有误！");
			}
		}
	}

	/**
	 * 
	 * <P> 配置角色菜单权限  </P>
	 *
	 * @author lidongfu_2005@sina.com
	 * @param roleId
	 * @param menuItems
	 * @param modelMap
	 */
	@RequestMapping(value = Url.PERMISSION_ROLE_CONFIG_MENU_URL, method = RequestMethod.POST)
	public void configRoleMenu(Integer roleId, Integer[] menuItems, ModelMap modelMap) {
		roleService.configMenu(roleId, menuItems);
		modelMap.put("status", true);
	}

}
