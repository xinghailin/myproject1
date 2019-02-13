package com.yyq.car.portal.ms.web.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.timevale.esign.sdk.tech.bean.result.Result;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.model.mallcontract.MallSealApply;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.app.service.MallSealApplyService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;
import com.yyq.car.portal.ms.web.util.tsign.exception.TSignException;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author liliang
 * @since 2018-10-23
 */
@Controller
public class MallSealApplyController {
	@Autowired
	private MallSealApplyService mallSealApplyService;

	/**
	 * 
	 * <p>新建盖章合同  save方法</p>
	 * @param 
	 * @return
	 * @author liangli
	 * Created on: 2018/10/24
	 */
	@RequestMapping(value = Url.MALL_SEALAPPLY_ADD, method = RequestMethod.POST)
	public String mallSealApplyUpdate(MallSealApply pojo, ModelMap map) {
		UserDTO userDTO = SecurityHelper.getAdminUserInfo();
		if (userDTO == null) {
			map.put("message", "登录信息 失效 ,请重新登录后操作。");
			return View.ERROR_MESSAGE;
		}
		try {
			mallSealApplyService.update(pojo, userDTO.getLoginName());
			return View.MALL_SEALAPPLY_LISTPAGE_VIEW;
		} catch (Exception e) {
			e.printStackTrace();
			map.put("message", e.getMessage());
			return View.ERROR_MESSAGE;
		}

	}

	/**
	 * 
	 * <p>into  合同盖章   列表页面</p>
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.MALL_SEALAPPLY_LISTPAGE, method = RequestMethod.GET)
	public String orderDetailPage(ModelMap map) {
		return View.MALL_SEALAPPLY_LISTPAGE_VIEW;
	}

	/**
	 * 
	 * <p>合同盖章  list    分页查询方法   </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.MALL_SEALAPPLY_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> lookMethod(MallSealApply pojo, String start, String pageSize) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = mallSealApplyService.list(pojo, start, pageSize);
		} catch (ParseException e) {
			e.printStackTrace();
			return returnMap;
		}
		return returnMap;
	}

	/**
	 * 
	 * <p>合同  审核 page   页面 </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.MALL_SEALAPPLYCHECK_PAGE, method = RequestMethod.GET)
	public String sealApplyCheckPage(ModelMap map, String id) {
		MallSealApply sealApply = mallSealApplyService.loadById(id);
		map.put("sealApply", sealApply);
		return View.MALL_SEALAPPLYCHECK_VIEW;
	}

	/**
	 * 
	 * <p>合同  查看page   页面 </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.MALL_SEALAPPLYLOOK_PAGE, method = RequestMethod.GET)
	public String sealApplyLookPage(ModelMap map, String id) {
		MallSealApply sealApply = mallSealApplyService.loadById(id);
		map.put("sealApply", sealApply);
		return View.MALL_SEALAPPLYLOOK_VIEW;
	}

	/**
	 * 合同 盖章状态   保存
	 * 
	 * @param map
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.MALL_SEALAPPLY_UPDATESTATUS_SUBMIT, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> sealApplyUpdateStatus(MallSealApply pojo, ModelMap map) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "失败了。。");
		returnMap.put("rescode", "0");
		UserDTO userDTO = SecurityHelper.getAdminUserInfo();
		if (userDTO == null) {
			returnMap.put("result", "登录信息 失效 ,请重新登录后操作。");
			return returnMap;
		}
		
		try {
			if (2 == pojo.getSealstatus().intValue()) { // 不通过
				mallSealApplyService.updateStatus(pojo,userDTO.getLoginName());
			} else if (3 == pojo.getSealstatus().intValue()) { // 通过 可以盖章
				mallSealApplyService.updateSeal(pojo,userDTO.getLoginName()); // 通过并盖章 ,且修改状态保存盖章路径
				MallSealApply pojo_sealapply =  mallSealApplyService.loadSealApply(pojo);
				mallSealApplyService.smsReminderSealApply(pojo_sealapply);// 发送短信
			}
			returnMap.put("rescode", "1");
			returnMap.put("result", "成功了。。");
		} catch (Exception e) {
			e.printStackTrace();
			returnMap.put("result", "盖章失败了，");
			return returnMap;
		}
		return returnMap;

	}
	
	
	
	
	
	/**
	 * 
	 * <p>into  合同生效   列表页面</p>
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.MALL_SEALAPPLY_EFFECTIVE_LISTPAGE, method = RequestMethod.GET)
	public String effective_orderDetailPage(ModelMap map) {
		return View.MALL_SEALAPPLY_EFFECTIVE_LISTPAGE_VIEW;
	}

	/**
	 * 
	 * <p>合同生效 list    分页查询方法   </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.MALL_SEALAPPLY_EFFECTIVE_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> look_effectiveMethod(MallSealApply pojo, String start, String pageSize) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = mallSealApplyService.effective_list(pojo, start, pageSize);
		} catch (ParseException e) {
			e.printStackTrace();
			return returnMap;
		}
		return returnMap;
	}
	
	
	
	
	/**
	 * 合同失效方法
	 * 
	 * @param map
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.MALL_SEALAPPLY_DEL_SUBMIT, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> sealApplyDel(String id, ModelMap map) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "失败了。。");
		returnMap.put("rescode", "0");
		UserDTO userDTO = SecurityHelper.getAdminUserInfo();
		if (userDTO == null) {
			returnMap.put("result", "登录信息 失效 ,请重新登录后操作。");
			return returnMap;
		}
	
		try {
			mallSealApplyService.delSeal(id,userDTO.getLoginName()); // 合同失效
			returnMap.put("rescode", "1");
			returnMap.put("result", "成功了。。");
		} catch (Exception e) {
			e.printStackTrace();
			returnMap.put("result", e.getMessage());
		}
		return returnMap;

	}
	
	
	/**
	 * 
	 * <p>into  合同盖章回传审核   列表页面</p>
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.MALL_SEALAPPLY_BACKCHECK_LISTPAGE, method = RequestMethod.GET)
	public String orderDetailBackCheckPage(ModelMap map) {
		return View.MALL_SEALAPPLY_BACKCHECK_LISTPAGE_VIEW;
	}

	/**
	 * 
	 * <p>合同盖章回传审核  list    分页查询方法   </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.MALL_SEALAPPLY_BACKCHECK_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> look_backcheckMethod(MallSealApply pojo, String start, String pageSize) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = mallSealApplyService.backcheck_list(pojo, start, pageSize);
		} catch (ParseException e) {
			e.printStackTrace();
			return returnMap;
		}
		return returnMap;
	}
	
	/**
	 * 
	 * <p>合同盖章回传审核  审核 page   页面 </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.MALL_SEALAPPLY_BACKCHECK_PAGE, method = RequestMethod.GET)
	public String sealApply_backCheckPage(ModelMap map, String id) {
		MallSealApply sealApply = mallSealApplyService.loadById(id);
		map.put("sealApply", sealApply);
		return View.MALL_SEALAPPLY_BACKCHECK_VIEW;
	}
	
	
	
	/**
	 * 
	 * <p>盖章合同回传  审核通过方法   save方法</p>
	 * @param 
	 * @return
	 * @author liangli
	 * Created on: 2018/10/24
	 */
	@RequestMapping(value = Url.MALL_SEALAPPLY_BACKCHECK_UPDAT, method = RequestMethod.POST)
	public String sealApplyBackCheckUpdate(MallSealApply pojo, ModelMap map) {
		UserDTO userDTO = SecurityHelper.getAdminUserInfo();
		if (userDTO == null) {
			map.put("message", "登录信息 失效 ,请重新登录后操作。");
			return View.ERROR_MESSAGE;
		}
		try {
			mallSealApplyService.backcheck_update(pojo, userDTO.getLoginName());
			return View.MALL_SEALAPPLY_BACKCHECK_LISTPAGE_VIEW;
		} catch (Exception e) {
			e.printStackTrace();
			map.put("message", e.getMessage());
			return View.ERROR_MESSAGE;
		}

	}
	
	
	/**
	 * 合同 盖章前 获取短信验证码
	 * 
	 * @param map
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.MALL_SEALAPPLY_GETPHONECODE, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> sealApplygetPhoneCode(MallSealApply pojo, ModelMap map) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "获取短信验证码失败了。。");
		returnMap.put("rescode", "0");
		UserDTO userDTO = SecurityHelper.getAdminUserInfo();
		if (userDTO == null) {
			returnMap.put("result", "登录信息 失效 ,请重新登录后操作。");
			return returnMap;
		}else {
			if(mallSealApplyService.isMobileNO(userDTO.getLoginName())){
				try {
					Result rs = mallSealApplyService.getPhoneCode(userDTO.getLoginName());
					if( 0 == rs.getErrCode()){// 此次代表成功了
						returnMap.put("result", "获取短信验证码成功了，请填写短信验证码后提交。");
						returnMap.put("rescode", "1");
					}else{
						returnMap.put("result", rs.getMsg());
						
					}
				} catch (TSignException e) {
					e.printStackTrace();
					returnMap.put("result",  e.getMessage());
					return returnMap;
				}
			}else{
				returnMap.put("result", "获取短信验证码失败了。。登录用户非手机号码,无法发送验证码。");
			}
			
		}
		return returnMap;

	}
	
}
