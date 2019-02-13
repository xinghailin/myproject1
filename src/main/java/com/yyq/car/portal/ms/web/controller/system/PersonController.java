package com.yyq.car.portal.ms.web.controller.system;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yyq.car.portal.ms.app.service.auth.AuthUserService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;
import com.yyq.car.portal.common.constant.Constants;
import com.yyq.car.portal.common.dto.RoleResourceDTO;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.util.PasswordUtils;


/**
 * 个人中心控制器
 * @author dell
 *
 */
@Controller
public class PersonController {

	@Autowired
	private AuthUserService userService;

	/**
	 * 进入修改密码页面
	 */
	@RequestMapping(value = Url.PERSONAL_TO_UPDATE_PAGE_URL, method = RequestMethod.GET)
	public String toUpdatePwdPage(ModelMap modelMap, HttpSession session) {
		return View.PERSONAL_UPDATE_PWD_VIEW;
	}

	/**
	 * 修改密码
	 */
	@RequestMapping(value = Url.PERSONAL_UDPATE_PWD_URL, method = RequestMethod.POST)
	public void updatePwd(ModelMap modelMap, User user, HttpSession session) {
		UserDTO nowUser = (UserDTO) session.getAttribute(Constants.ACCOUNT_INFO);
		user.setId(nowUser.getId());
		// 将用户输入的原密码加密:name中此时存储的是用户输入的原密码
		user.setName(PasswordUtils.encryptPassword(user.getName()));
		user.setPassword(PasswordUtils.encryptPassword(user.getPassword()));
		// 验证原始密码是否正确
		boolean flag = userService.verifyPwd(user);
		if (flag) {
			user.setName(null);
			// 修改密码
			int result = userService.updatePwd(user);
			if (result != 1) {
				modelMap.addAttribute("message", "密码修改失败，联系管理员！");
				modelMap.addAttribute("status", false);
				return;
			}
		} else {
			modelMap.addAttribute("message", "原始密码错误，请重新输入！");
			modelMap.addAttribute("status", false);
			return;
		}
		modelMap.addAttribute("message", "密码修改成功！");
		modelMap.addAttribute("status", true);
	}

	/**
	 * 进入查看当前用户权限的页面
	 */
	@RequestMapping(value = Url.PERSONAL_QUERY_USER_ROLE, method = RequestMethod.GET)
	public String toQueryRoleOfUser() {
		return View.PERSONAL_LOOK_PERMISSION_VIEW;
	}

	/**
	 * 查看当前用户权限ajax进入
	 */
	@RequestMapping(value = Url.PERSONAL_QUERY_USER_ROLE_AJAX, method = RequestMethod.GET)
	public void queryRoleOfUser(ModelMap modelMap, HttpSession session, RoleResourceDTO roleRDto) {
		final int start = (roleRDto.getStartPage() - 1) * roleRDto.getPageSize();
		roleRDto.setStartPage(start);
		List<RoleResourceDTO> resources = userService.queryResourceByUserId(roleRDto);
		int total = userService.queryCountResourcesById(roleRDto.getRoleId());
		modelMap.addAttribute("result", resources);
		modelMap.addAttribute("total", total);
	}
}
