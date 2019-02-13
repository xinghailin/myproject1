package com.yyq.car.portal.ms.web.controller.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yyq.car.portal.common.constant.Constants;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.model.auth.Menu;
import com.yyq.car.portal.common.service.security.RoleService;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.ms.app.service.common.TasklistService;
import com.yyq.car.portal.ms.web.constant.TasklistEnum;
import com.yyq.car.portal.ms.web.constant.Url;


@Controller
public class CommonController {

	// final private Logger logger = LoggerFactory.getLogger(CommonController.class);

	@Autowired
	private RoleService roleService;

	@Autowired
	TasklistService tasklistservice;

	@RequestMapping(value = Url.MENU_USER_ROLE_QUERY_URL, method = RequestMethod.GET)
	public void loadMenu(ModelMap modelMap, HttpSession session) {
		// session.setMaxInactiveInterval(60 * 60 * 8);// 8个小时
		// UserDTO dto = SecurityHelper.getAdminUserInfo();
		Object acc = session.getAttribute(Constants.ACCOUNT_INFO);
		if (acc != null) {
			UserDTO dto = (UserDTO) acc;
			JSONArray jsonmenu = dto.getJsonarray();
			if (jsonmenu == null) {
				List<Menu> menuList = dto.getMenuList();
				if (menuList == null) {
					menuList = roleService.userMenuQueryByUserId(dto.getId());
					dto.setMenuList(menuList);
				}
				JSONArray jsonArray = JSONArray.fromObject(menuList);
				jsonmenu = treeMenuList(jsonArray, 0, 0);
				dto.setJsonarray(jsonmenu);
			}
			modelMap.put("menuList", jsonmenu);
			modelMap.put("status", true);
		}
	}

	/**
	 * 
	 * <P> 将json数组转换成树 </P>
	 *
	 * @author lidongfu_2005@sina.com
	 * @param menuList
	 * @param parentId
	 * @return
	 */
	private JSONArray treeMenuList(JSONArray menuList, int parentId, int c) {
		JSONArray childMenu = new JSONArray();
		for (Object object : menuList) {
			JSONObject jsonMenu = JSONObject.fromObject(object);
			int menuId = jsonMenu.getInt("id");
			int pid = jsonMenu.getInt("parentId");
			if (parentId == pid) {
				if (c < 1) {
					JSONArray c_node = treeMenuList(menuList, menuId, ++c);
					c--;
					jsonMenu.put("childNode", c_node);
				} else {
					jsonMenu.put("childNode", new JSONArray());
				}
				childMenu.add(jsonMenu);
			}
		}
		return childMenu;
	}

	/**
	 * 到首页
	 * <p>TODO</p>
	 * @param request
	 * @param modelMap
	 * @return
	 * @author wangzh
	 */
	// @RequestMapping(value = "/", method = RequestMethod.GET)
	public String welcome(HttpServletRequest request, ModelMap modelMap) {
		String cp = request.getContextPath();
		Integer userId = SecurityHelper.getAdminUserInfo().getId();
		List<Menu> mList = roleService.userMenuQueryByUserId(userId);
		JSONArray jsonArray = JSONArray.fromObject(mList);
		JSONArray menuList = treeMenuList(jsonArray, 0, 0);
		int length = menuList.size();
		String menuHtml = "";
		for (int i = 0; i < length; i++) {
			JSONObject item = (JSONObject) menuList.get(i);
			// if (item.element("parentId").toString().equals("0")) {
			if (item.get("parentId").toString().equals("0")) {
				menuHtml = menuHtml + "<li>";
				menuHtml = menuHtml + "<div class=\"navs01 nav_link\"><span class=\"span_img05\"></span> <span id=\"menu_" + i
						+ "\" class=\"fz_14px fc_white\">" + item.get("menuName") + "</span></div>";
				JSONArray childNode = (JSONArray) item.get("childNode");
				if (childNode.size() > 0) {
					menuHtml = menuHtml + "<div class=\"navs02 hide\">";
					for (int j = 0; j < childNode.size(); j++) {
						JSONObject childItem = (JSONObject) childNode.get(j);
						String menuId = "menu_" + i + "_" + j;
						menuHtml = menuHtml + "<a id=\"" + menuId + "\" href=\"" + cp + childItem.get("menuUrl")
								+ "\" class=\"navs02_a2\" target=\"mainFrame\"><div class=\"ps_spanxx\"></div>" + childItem.get("menuName") + "</a>";
					}
					menuHtml = menuHtml + "</div>";
				}
				menuHtml = menuHtml + "</li>";
			}
		}
		modelMap.put("menuHtml", menuHtml);
		return "mainView";
	}

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/getLastAccessTime", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> aboutSession(HttpServletRequest request) {
		long l = request.getSession().getLastAccessedTime();
		Date date = new Date(l);
		Map<String, Object> rtMap = new HashMap<String, Object>();
		rtMap.put("key", DateUtils.formate(date, DateUtils.DEFAULT_DATETIME_FORMAT_SEC));
		rtMap.put("MaxInactiveInterval", request.getSession().getMaxInactiveInterval());
		rtMap.put("AttributeNames", request.getSession().getAttributeNames());
		rtMap.put("CreationTime", DateUtils.formate(new Date(request.getSession().getCreationTime()), DateUtils.DEFAULT_DATETIME_FORMAT_SEC));
		rtMap.put("Id", request.getSession().getId());
		rtMap.put("isNew", request.getSession().isNew());
		rtMap.put("getValueNames", request.getSession().getValueNames());
		return rtMap;
	}

	/**
	 * 
	 * <p>到待办任务页</p>
	 * @param modelMap
	 * @param session
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.tasklist, method = RequestMethod.GET)
	public String tasklist(ModelMap modelMap, HttpSession session) {
		Object acc = session.getAttribute(Constants.ACCOUNT_INFO);
		if (acc != null) {
			UserDTO dto = (UserDTO) acc;
			List<Menu> taskmenu = dto.getTaskmenu();
			if (taskmenu == null) {
				taskmenu = new ArrayList<Menu>();
				List<Menu> menuList = dto.getMenuList();
				if (menuList == null) {
					menuList = roleService.userMenuQueryByUserId(dto.getId());
					dto.setMenuList(menuList);
				}
				for (int i = 0, size = menuList.size(); i < size; i++) {
					if (StringUtils.isBlank(menuList.get(i).getMenuUrl())) {
						continue;
					}
					for (TasklistEnum e : TasklistEnum.values()) {
						if (e.getUrl().equals(menuList.get(i).getMenuUrl())) {
							taskmenu.add(menuList.get(i));
							break;
						}
					}
				}
				dto.setTaskmenu(taskmenu);
			}
			if (taskmenu.size() > 0) {
				tasklistservice.getTasks(modelMap, dto);
			}
		}
		return "_tasklist";
	}
}
