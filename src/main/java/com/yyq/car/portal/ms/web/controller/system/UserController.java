package com.yyq.car.portal.ms.web.controller.system;

import java.util.ArrayList;
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
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;
import org.ufa.security.model.UfaBaseRole;

import com.yyq.car.portal.common.constant.Constants;
import com.yyq.car.portal.common.dto.AuthUserDTO;
import com.yyq.car.portal.common.dto.ClientInfoDto;
import com.yyq.car.portal.common.dto.QueryResultDTO;
import com.yyq.car.portal.common.exception.PortalAppCheckedException;
import com.yyq.car.portal.common.exception.PortalBizCheckedException;
import com.yyq.car.portal.common.model.auth.RoleAccount;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.common.service.security.RoleService;
import com.yyq.car.portal.common.util.PasswordUtils;
import com.yyq.car.portal.ms.app.service.auth.AuthUserService;
import com.yyq.car.portal.ms.web.command.AuthUserCmd;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;


/**
  * 
  * <P> 用户管理</P>
  *  
  * @author lidongfu_2005@sina.com
  * @date 2014年10月9日 上午10:44:17
 */
@Controller
public class UserController {

	final private Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private AuthUserService authUserService;

	@Autowired
	private RoleService roleService;

	/**
	 * <P> 跳转到用户分页查询页面</P>
	 * 
	 * @author lidongfu_2005@sina.com
	 * @return
	 */
	@RequestMapping(value = Url.SYS_USER_TO_QUERY_URL, method = RequestMethod.GET)
	public String showQuery() {
		return View.SYS_USER_QUERY_VIEW;
	}

	/**
	 * <P> 用户分页查询</P>
	 *
	 * @author lidongfu_2005@sina.com
	 * @param userCmd
	 * @param modelMap
	 */
	@RequestMapping(value = Url.SYS_USER_QUERY_URL, method = RequestMethod.POST)
	public void userQueryPage(AuthUserCmd userCmd, ModelMap modelMap) {
		final int start = (userCmd.getStartPage() - 1) * userCmd.getPageSize() + 1;
		final int end = start + userCmd.getPageSize() - 1;
		AuthUserDTO user = new AuthUserDTO();
		user.setCode(userCmd.getCode());
		user.setName(userCmd.getName());
		user.setLoginName(userCmd.getUserName());
		QueryResultDTO<User> result = new QueryResultDTO<User>();
		List<User> userList = authUserService.queryUserPage(user, start, end);
		Integer total = authUserService.countQueryUser(user);
		result.getResult().addAll(userList);
		modelMap.put("result", result);
		modelMap.put("total", total);
	}

	/**
	 * <P> 跳转到新增页 </P>
	 * 
	 * @author lidongfu_2005@sina.com
	 * @return
	 */
	@RequestMapping(value = Url.SYS_USER_TO_ADD_URL, method = RequestMethod.GET)
	public String toAdd(ModelMap modelMap) {
		List<? extends UfaBaseRole> roleList = roleService.getAllRoles();
		modelMap.put("roleList", roleList);
		List<Shop> shopLst = roleService.queryAllShop();
		modelMap.put("shopLst", shopLst);
		return View.SYS_USER_ADD_VIEW;
	}

	/**
	 * <P> 跳转到编辑页 </P>
	 * 
	 * @author lidongfu_2005@sina.com
	 * @return
	 */
	@RequestMapping(value = Url.SYS_USER_TO_EDIT_URL, method = RequestMethod.GET)
	public String toEdit(AuthUserCmd userCmd, ModelMap modelMap) {
		List<? extends UfaBaseRole> roleList = roleService.getAllRoles();
		User u = authUserService.queryUserEdit(userCmd.getId());
		List<RoleAccount> raList = authUserService.queryRaByUserId(userCmd.getId());
		Map<String, Object> ruMap;
		List<Map<String, Object>> _roleList = new ArrayList<Map<String, Object>>();
		for (UfaBaseRole ur : roleList) {
			ruMap = new HashMap<String, Object>();
			ruMap.put("roleId", ur.getRoleId());
			ruMap.put("roleName", ur.getRoleName());
			for (RoleAccount ra : raList) {
				if ((ur.getRoleId() + "").equals(ra.getRoleId() + "")) {
					ruMap.put("checked", "checked");
				}
			}
			_roleList.add(ruMap);
		}
		List<Shop> shopLst = roleService.queryAllShop();
		modelMap.put("user", u);
		if (StringUtils.isNotBlank(u.getShop())) {
			modelMap.put("shop", Integer.parseInt(u.getShop()));
		}
		modelMap.put("shopLst", shopLst);
		modelMap.put("roleList", _roleList);
		return View.SYS_USER_EDIT_VIEW;
	}

	/**
	 * <P> 新增用户</P>
	 *
	 * @author lidongfu_2005@sina.com
	 * @param userCmd
	 * @param modelMap
	 */
	@RequestMapping(value = Url.SYS_USER_ADD_URL, method = RequestMethod.POST)
	public void add(AuthUserCmd userCmd, ModelMap modelMap) {
		logger.debug("新增用户：{}", userCmd.toString());
		try {
			authUserService.addUser(userCmd);
		} catch (PortalBizCheckedException | PortalAppCheckedException e) {
			e.printStackTrace();
			logger.error(e);
			modelMap.put("status", false);
			modelMap.put("message", "新增用户失败" + e.getMessage());
			return;
		}
		modelMap.put("status", true);
		modelMap.put("message", "新增用户成功");
	}

	/**
	 * <P>编辑用户 </P>
	 * 
	 * @author lidongfu_2005@sina.com
	 * @param userCmd
	 * @param modelMap
	 */
	@RequestMapping(value = Url.SYS_USER_EDIT_URL, method = RequestMethod.POST)
	public void edit(AuthUserCmd userCmd, ModelMap modelMap) {
		logger.debug("编辑用户：{}", userCmd.toString());
		try {
			authUserService.editUser(userCmd);
		} catch (PortalBizCheckedException e) {
			e.printStackTrace();
			logger.error(e);
			modelMap.put("status", false);
			modelMap.put("message", "编辑用户失败" + e.getMessage());
			return;
		}
		modelMap.put("status", true);
		modelMap.put("message", "编辑用户成功");
	}

	/**
	 * <p>启用、停用</p>
	 * @param id
	 * @param status
	 * @param modelMap
	 * @author wangzh
	 */
	@RequestMapping(value = Url.SYS_USER_ABLE_URL, method = RequestMethod.POST)
	public void able(Integer id, Integer status, ModelMap modelMap) {
		try {
			authUserService.ableUser(id, status);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			modelMap.put("status", false);
			modelMap.put("message", "操作失败" + e.getMessage());
			return;
		}
		modelMap.put("status", true);
	}

	/**
	 * <P> 删除用户</P>
	 *
	 * @author lidongfu_2005@sina.com
	 * @param userCmd
	 * @param modelMap
	 */
	@RequestMapping(value = Url.SYS_USER_DEL_URL, method = RequestMethod.GET)
	public void delete(AuthUserCmd userCmd, ModelMap modelMap) {
		logger.debug("删除用户：{}", userCmd.toString());
		try {
			authUserService.deleteUser(userCmd);
		} catch (PortalBizCheckedException e) {
			e.printStackTrace();
			logger.error(e);
			modelMap.put("status", false);
			modelMap.put("message", "删除用户失败" + e.getMessage());
			return;
		}
		modelMap.put("status", true);
		modelMap.put("message", "删除用户成功");
	}

	/**
	 * 跳转重置密码页面
	 */
	@RequestMapping(value = Url.SYS_USER_TO_RESET_PWD, method = RequestMethod.GET)
	public String toResetPwdPage(ModelMap modelMap, String idStr) {
		String[] temp = idStr.split(" ");
		List<Integer> ids = new ArrayList<Integer>();
		for (int i = 0; i < temp.length; i++) {
			ids.add(Integer.valueOf(temp[i]));
		}
		List<User> list = authUserService.queryUserByIds(ids);
		modelMap.addAttribute("users", list);

		return View.SYS_USER_RESETPWD_VIEW;
	}

	/**
	 * 重置密码
	 */
	@RequestMapping(value = Url.SYS_USER_RESET_PWD_URL, method = RequestMethod.POST)
	public void resetPwd(ModelMap modelMap, String userIds) {
		// 重置密码
		String[] temp = userIds.split(" ");
		List<Integer> list = new ArrayList<Integer>();
		Map<String, Object> paramMap = new HashMap<String, Object>();

		String newPwd = PasswordUtils.encryptPassword(Constants.ORG_DEFAULT_PASSWORD);

		for (int i = 0; i < temp.length; i++) {
			list.add(Integer.valueOf(temp[i]));
		}
		paramMap.put("userList", list);
		paramMap.put("loginPwd", newPwd);

		int result = authUserService.batchUpdatePwd(paramMap);
		if (result == 0) {
			modelMap.put("message", "重置密码失败，请联系管理员！");
			modelMap.put("status", false);
			return;
		}
		modelMap.put("message", "密码重置成功！");
		modelMap.put("status", true);
	}
	
	
	/**
	 * 
	 * <p>urs表数据查询</p>
	 * @param dto
	 * @param map
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.USER_SERACH_BY_NAME, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> selectListByName(String loginName,  ModelMap map) {
		List<User> userlis = authUserService.selectListByName(loginName);
		Map<String, Object> returnmap = new HashMap<String, Object>();
		returnmap.put("userlis", userlis);
		return returnmap;
	}

}
