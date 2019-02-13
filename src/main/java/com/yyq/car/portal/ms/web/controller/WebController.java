
package com.yyq.car.portal.ms.web.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.dto.Bottom_BannerDto;
import com.yyq.car.portal.common.dto.IntroduceDto;
import com.yyq.car.portal.common.dto.PurchaseareaDto;
import com.yyq.car.portal.common.dto.PurchaseareapicDto;
import com.yyq.car.portal.common.dto.PurchasepicDto;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.dto.WebBannerDto;
import com.yyq.car.portal.common.dto.WebPurchaseAreaDto;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.web.Purchasearea;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.app.service.WebService;
import com.yyq.car.portal.ms.app.service.auth.AuthUserService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;


/**
 * 
 * <P>网站管理</P>
 * @author liangli
 *  2018/9/10
 */
@Controller
public class WebController {

	// private Logger logger = LoggerFactory.getLogger(WebController.class);

	@Autowired
	private WebService webService;
	@Autowired
	private AuthUserService authUserService;

	/**
	 * 
	 * <p>介绍页</p>
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.WEB_INTRODUCE, method = RequestMethod.GET)
	public String introduce_page(ModelMap map) {
		IntroduceDto introduceDto = webService.loadIntroduce();
		map.put("introduceDto", introduceDto);
		return View.WEB_INTRODUCE_VIEW;
	}

	/**
	 *  介绍 保存
	 * 
	 * @param dto
	 * @param map
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.WEB_INTRODUCE_SUBMIT, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> IntroduceSubmit(IntroduceDto dto, ModelMap map) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "失败了。。");
		returnMap.put("rescode", "0");
		try {
			UserDTO user = SecurityHelper.getAdminUserInfo();
			User loginuse = authUserService.queryUserByLoginname(user.getLoginName());
			returnMap = webService.updateIntroduce(dto, loginuse.getId());
		} catch (Exception e) {
			e.printStackTrace();
			returnMap.put("result", e.getMessage());
		}
		return returnMap;

	}

	/**
	 * 
	 * <p>top_banner 页</p>
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.WEB_TOP_BANNER, method = RequestMethod.GET)
	public String top_banner(ModelMap map) {

		WebBannerDto webBannerDto = webService.loadWebBanner();
		map.put("webBannerDto", webBannerDto);

		return View.WEB_TOP_BANNER_VIEW;
	}

	/**
	 *  top_banner 保存
	 * 
	 * @param dto
	 * @param map
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.WEB_TOP_BANNER_SUBMIT, method = RequestMethod.POST)
	public String TopbannerSubmit(WebBannerDto dto, ModelMap map) {
		try {
			UserDTO user = SecurityHelper.getAdminUserInfo();
			User loginuse = authUserService.queryUserByLoginname(user.getLoginName());
			webService.updateTopBanner(dto, loginuse.getId());

			WebBannerDto webBannerDto = webService.loadWebBanner();
			map.put("webBannerDto", webBannerDto);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return View.WEB_TOP_BANNER_VIEW;

	}

	/**
	 * 
	 * <p>bottom_banner 页</p>
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.WEB_BOTTOM_BANNER, method = RequestMethod.GET)
	public String bottom_banner(ModelMap map) {

		Bottom_BannerDto bottom_BannerDto = webService.loadBottom_WebBanner();
		map.put("bottom_BannerDto", bottom_BannerDto);
		return View.WEB_BOTTOM_BANNER_VIEW;
	}

	/**
	 *  bottom_banner 保存
	 * 
	 * @param dto
	 * @param map
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.WEB_BOTTOM_BANNER_SUBMIT, method = RequestMethod.POST)
	public String BottombannerSubmit(Bottom_BannerDto dto, ModelMap map) {
		try {
			UserDTO user = SecurityHelper.getAdminUserInfo();
			User loginuse = authUserService.queryUserByLoginname(user.getLoginName());
			webService.updateBottomBanner(dto, loginuse.getId());

			Bottom_BannerDto bottom_BannerDto = webService.loadBottom_WebBanner();
			map.put("bottom_BannerDto", bottom_BannerDto);
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return View.WEB_BOTTOM_BANNER_VIEW;

	}
	
	
	/**
	 * 
	 * <p>采购车源</p>
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.WEB_PURCHASE_AREA_LISTPAGE, method = RequestMethod.GET)
	public String purchase_area(ModelMap map) {
		/*IntroduceDto introduceDto = webService.loadIntroduce();
		map.put("introduceDto", introduceDto);*/
		return View.WEB_PURCHASE_AREA_LISTPAGE_VIEW;
	}
	
	/**
	 * 
	 * <p>车源区域  list    分页查询方法   </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.WEB_PURCHASE_AREA_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> lookMethod(Purchasearea dto, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = webService.purchase_arealist(dto, start, pageSize);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return returnMap;
	}
	
	/**
	 * 
	 * <p>采购车源  页面</p>
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.WEB_PURCHASE_AREA_ADD_PAGE, method = RequestMethod.GET)
	public String purchase_area_add_page(ModelMap map,String group_id) {
		PurchaseareaDto purchaseareaDto = new PurchaseareaDto();
		if(StringUtils.isNotBlank(group_id)){
			purchaseareaDto = webService.LoadPurchaseareaDtoById(group_id);
		}
		map.put("purchaseareaDto", purchaseareaDto);
		return View.WEB_PURCHASE_AREA_ADD_PAGE;
	}
	
	
	/**
	 *  purchase_area 保存
	 * 
	 * @param dto
	 * @param map
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.WEB_PURCHASE_AREA_SUBMIT, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object>  Purchase_areaSubmit(PurchaseareaDto dto, ModelMap map) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "失败了。。");
		returnMap.put("rescode", "0");
		try {
			UserDTO user = SecurityHelper.getAdminUserInfo();
			if(null == user){
				returnMap.put("result", "保存失败,登录信息失效，请重新登录。");
			}else{
				User loginuse = authUserService.queryUserByLoginname(user.getLoginName());
				webService.updatePurchase_area(dto, loginuse.getId());
				returnMap.put("result", "成功了。。");
				returnMap.put("rescode", "1");
			}

		} catch (Exception e) {
			e.printStackTrace();
			returnMap.put("result", "保存出错了."+e.getMessage());
		}
		return returnMap;

	}
	
	
	
	/**
	 * 
	 * <p>采购车源  页面</p>
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.WEB_PURCHASE_AREA_ADD_PIC_PAGE, method = RequestMethod.GET)
	public String purchase_area_add_pic_page(ModelMap map,String id) {
		WebPurchaseAreaDto webPurchaseAreaDto =webService.loadWebPurchaseArea(id);
		map.put("webPurchaseAreaDto", webPurchaseAreaDto);
		return "web/purchase_area_pic_update";
	}
	
	
	
	
	/**
	 *  车型  图片 名称 保存
	 * 
	 * @param dto
	 * @param map
	 * @author liangli
	 * @throws IOException 
	 */
	@RequestMapping(value = Url.WEB_PURCHASE_AREA_ADD_PIC_SUBMIT, method = RequestMethod.POST)
	
	public String purchase_are_pic_update(@RequestParam("files") MultipartFile[] files,PurchaseareapicDto dto, ModelMap map) throws IOException {
	
			try {
				UserDTO user = SecurityHelper.getAdminUserInfo();
				User loginuse = authUserService.queryUserByLoginname(user.getLoginName());
				webService.updatePurchase_are_pic(dto, loginuse.getId(),files);

				//map.put("title_id", dto.getId());
				map.put("title_id", dto.getId_title_chinese());
				return View.WEB_PURCHASE_PIC_URL_NAME_LISTPAGE_VIEW;
			} catch (Exception e) {
				e.printStackTrace();
				map.put("message", e.getMessage());
				return View.ERROR_MESSAGE;
			}
			
		
	}
	
	
	
	
	/**
	 * 
	 * <p>车型 图片 名字  列表 页面</p>
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.WEB_PURCHASE_PIC_URL_NAME_LISTPAGE, method = RequestMethod.GET)
	public String purchase_pic_url_name_listpage(ModelMap map,String title_id) {
		map.put("title_id", title_id);
		return View.WEB_PURCHASE_PIC_URL_NAME_LISTPAGE_VIEW;
	}
	
	
	
	/**
	 * 
	 * <p>车型 图片 名字    分页查询方法   </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.WEB_PURCHASE_PIC_URL_NAME_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> pic_url_namelookMethod(String title_id, String start, String pageSize, ModelMap map) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = webService.purchase_pic_url_namelist(title_id, start, pageSize);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return returnMap;
	}
	
	
	
	/**
	 * 
	 * <p>采购车源  页面</p>
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.WEB_PURCHASE_PIC_UPDATEONE_PAGE, method = RequestMethod.GET)
	public String purchase_pic_updateone_page(ModelMap map,String pic_id) {
		map.put("pic_id", pic_id);
		PurchasepicDto picdto = webService.loadPurchasepicDtoByPic_id(pic_id);
		map.put("picdto", picdto);
		return "web/purchase_area_onepic_update";
	}
	
	
	
	
	/**
	 *  车型  图片 名称 保存
	 * 
	 * @param dto
	 * @param map
	 * @author liangli
	 * @throws IOException 
	 */
	@RequestMapping(value = Url.WEB_PURCHASE_PIC_ONEUPDATE_SUBMIT, method = RequestMethod.POST)
	
	public  String purchase_are_pic_oneupdate(PurchasepicDto dto, ModelMap map) throws IOException {          
		try {
			UserDTO user = SecurityHelper.getAdminUserInfo();
			User loginuse = authUserService.queryUserByLoginname(user.getLoginName());
			webService.updatePurchase_onepic(dto, loginuse.getId());
			// 跳转页面
			map.put("title_id", dto.getParent_id());
			return View.WEB_PURCHASE_PIC_URL_NAME_LISTPAGE_VIEW;
		} catch (Exception e) {
			map.put("message", e.getMessage());
			return View.ERROR_MESSAGE;
		}
		
	
	
		
	}
	
	/**
	 * 
	 * <p>删除车型图片  和名字</p>
	 * @param title_id
	 * @return
	 * @author liangli
	 * Created on: 2018年9月18日 上午11:30:06
	 */
	
	@RequestMapping(value=Url.WEB_PURCHASE_PIC_DEL,method=RequestMethod.GET)
	@ResponseBody
	public Object pic_delete(String title_id){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			webService.pic_delete(title_id);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}
	
	/**
	 * 
	 * <p>删除区域和标题</p>
	 * @param area_id
	 * @return
	 * @author liangli
	 * Created on: 2018年9月18日 上午11:30:58
	 */
	@RequestMapping(value=Url.WEB_PURCHASE_AREA_DEL,method=RequestMethod.GET)
	@ResponseBody
	public Object areadelete(String group_id){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		try {
			webService.area_delete(group_id);
			map.put("status", true);
		} catch (Exception e) {
			map.put("msg", e.getMessage());
		}
		return map;
	}
	
	
}