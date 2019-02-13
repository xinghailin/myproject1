package com.yyq.car.portal.ms.web.controller;


import java.math.BigDecimal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.jnd.jndSite;
import com.yyq.car.portal.common.model.mall.Carsource;
import com.yyq.car.portal.common.model.mall.CarsourceFile;
import com.yyq.car.portal.common.model.mallcontract.MallOrderDetail;
import com.yyq.car.portal.common.model.mallcontract.MallSealApply;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.common.vo.MallOrderDetailVO;
import com.yyq.car.portal.ms.app.service.AssetRepositoryService;
import com.yyq.car.portal.ms.app.service.MallAreaBrandService;
import com.yyq.car.portal.ms.app.service.MallOrderDetailService;
import com.yyq.car.portal.ms.app.service.MallSealApplyService;
import com.yyq.car.portal.ms.app.service.MallSourceService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author liliang
 * @since 2018-10-16
 */
@Controller
public class MallOrderDetailController {

    @Autowired
    private MallOrderDetailService orderDetailService;
	@Autowired
	private AssetRepositoryService assetRepositoryService;
	
	@Autowired
	private MallAreaBrandService mallAreaBrandService;
	
	@Autowired
	private MallSealApplyService mallSealApplyService;
	
	@Autowired
	private MallSourceService sourceService;
	

	/**
	 * 
	 * <p>into  订单详情 列表页面</p>
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.MALL_ORDERDETAIL_LISTPAGE, method = RequestMethod.GET)
	public String orderDetailPage(ModelMap map) {
		List<jndSite> jndSiteList = mallAreaBrandService.queryAll();
		map.put("jndSiteList", jndSiteList);
		return View.MALL_ORDERDETAIL_LISTPAGE_VIEW;
	}
  
	
	
	/**
	 * 
	 * <p>订单详情 list    分页查询方法   </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.MALL_ORDERDETAIL_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> lookMethod(MallOrderDetail pojo, String start, String pageSize) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = orderDetailService.list(pojo, start, pageSize);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return returnMap;
	}
	
	
	
	
	/**
	 * 
	 * <p>订单 审核page   页面 </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.MALL_ORDERDETAILCHECK_PAGE, method = RequestMethod.GET)
	public String orderDetailCheckPage(ModelMap map, String id) {
		 MallOrderDetail orderDetail = orderDetailService.loadById(id);
		 map.put("orderDetail", orderDetail);
		 Carsource record = new Carsource();
		 record.setId(orderDetail.getSourceid());
		 List<Carsource> carsourceList = sourceService.getListByParam(record);
		 String pic = carsourceList.get(0).getCoverpic();
		 map.put("pic", pic);
		 //车源加装包列表
		 List<CarsourceFile> ds= orderDetailService.getSourceFileListByParam(orderDetail);
		 map.put("ds", ds);
		 // 订单的加装包列表
		 if(StringUtils.isNotBlank(orderDetail.getDecoratepackage())){
			String[] package_s = orderDetail.getDecoratepackage().split(",");
			List<String> packageList = Arrays.asList(package_s);
			 map.put("packageList", packageList);
			 for(CarsourceFile carsourcef :ds ){
				 for(String pack :packageList ){
					 if(pack.equals(carsourcef.getId().toString())){
						 carsourcef.setIscheck(1);// 1为选中的
					 }
				 }
			 }
		 } 
		 
		 //车源加装包 (颜色)列表
		 List<CarsourceFile> ds_colour= orderDetailService.getSourceFileList_colourByParam(orderDetail);
		 map.put("ds_colour", ds_colour);
		 // 订单的加装包列表
		 if(StringUtils.isNotBlank(orderDetail.getDecoratepackage())){
			String[] package_s = orderDetail.getDecoratepackage().split(",");
			List<String> packageList = Arrays.asList(package_s);
			 map.put("packageList", packageList);
			 for(CarsourceFile carsourcef :ds_colour ){
				 for(String pack :packageList ){
					 if(pack.equals(carsourcef.getId().toString())){
						 carsourcef.setIscheck(1);// 1为选中的
					 }
				 }
			 }
		 }
		 // 展示汇率作用
		 jndSite site = orderDetailService.getSiteById(orderDetail.getAreaid());
		 map.put("site", site);
		return View.MALL_ORDERDETAILCECHECK_VIEW;
	}
    
	/**
	 * 
	 * <p>订单 查看page   页面 </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.MALL_ORDERDETAILLOOK_PAGE, method = RequestMethod.GET)
	public String orderDetailLookPage(ModelMap map, String id) {
		 MallOrderDetail orderDetail = orderDetailService.loadById(id);
		 map.put("orderDetail", orderDetail);
		 // 展示汇率作用
		 jndSite site = orderDetailService.getSiteById(orderDetail.getAreaid());
		 map.put("site", site);
		return View.MALL_ORDERDETAILLOOK_VIEW;
	}
	
	/**
	 * 
	 * <p>订单审核</p>
	 * @param id
	 * @return
	 * @author liangli
	 * Created on: 2018年9月18日 上午11:30:58
	 */
	@RequestMapping(value=Url.MALL_ORDERDETAILUPDATE_STATUS,method=RequestMethod.POST)
	@ResponseBody
	public Object orderDetailUpdateStatus(MallOrderDetail pojo){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rescode", "0");
		map.put("result", "保存失败");
		UserDTO userDTO = SecurityHelper.getAdminUserInfo();
		if (userDTO == null) {
			map.put("result", "登录信息 失效 ,请重新登录后操作");
			return map;
		}
		
		try {
			orderDetailService.updateState(pojo,userDTO.getLoginName());
			map.put("rescode", "1");
			map.put("result", "保存成功");
		} catch (Exception e) {
			map.put("result", e.getMessage());
		}
		return map;
	}
	  
	
	
	/**
	 * 
	 * <p>新建合同   页面 </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.MALL_ORDERDETAIL_ADDCONTRACT_PAGE, method = RequestMethod.GET)
	public String orderDetailAddContractPage(ModelMap map, String orderCodes) {
		if (StringUtils.isNotBlank(orderCodes)) {
			String siteename = "";
			JSONObject json = JSONObject.fromObject(orderCodes);
			List<String> idslst = new ArrayList(json.keySet());
			String orderis = "";
			for (String id : idslst) {
				orderis += id + ",";
			}
			orderis = orderis.substring(0, orderis.length() - 1);
			MallOrderDetail pojo = new MallOrderDetail();
			pojo.setCode(idslst.get(0).toString());
			List<MallOrderDetail> orderDetailList = orderDetailService.selectByCriteria(pojo);
			jndSite jndsite = mallAreaBrandService.selectSite(orderDetailList.get(0).getAreaid());
			siteename = jndsite.getEname();

			// 以下是合同编号生成规则
			Integer key = assetRepositoryService.querySequenceValue(706);// 选择客户信息表的下一个主键
			String now = DateUtils.formate(DateUtils.getCurrentTime(), DateUtils.COMPACT_DATETIME_FORMAT);
			String code = "mallContract"+siteename + "xqd"+now.substring(2) + key;// 需求单编号

			User user = SecurityHelper.getAdminUserInfo();
			MallSealApply sealApply = new MallSealApply();
			sealApply.setOrderids(orderis);
			sealApply.setCode(code);
			sealApply.setApplyer(user.getLoginName());
			map.put("sealApply", sealApply);

		}
		return View.MALL_ORDERDETAILADDCONTRACT_PAGE;
	}
	
	
	
	
	/**
	 * 
	 * <p>into  点击新建合同 进入     列表页面</p>
	 * @return
	 * @author liangli
	 */
	@RequestMapping(value = Url.MALL_ORDERDETAIL_ADD_LISTPAGE, method = RequestMethod.GET)
	public String orderDetail_add_listPage(ModelMap map,String id) {
		MallOrderDetail orderDetail = orderDetailService.loadById(id);
		map.put("orderDetail", orderDetail);
		return View.MALL_ORDERDETAIL_ADD_LISTPAGE_VIEW;
	}
  
	
	
	/**
	 * 
	 * <p>订单详情 list    分页查询方法   </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.MALL_ORDERDETAIL_ADD_lIST_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> look_checkbox_Method(MallOrderDetailVO pojo, String start, String pageSize) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			returnMap = orderDetailService.checkbox_list(pojo, start, pageSize);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return returnMap;
	}
	
	
	
	/**
	 * 
	 * <p>订单审核  计算 总价 和定金的   方法   </p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */

	@RequestMapping(value = Url.MALL_ORDERDETAIL_CHECK_SUMMONEY_METHOD, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> order_check_summoney_Method(String id, String packids,Integer num) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			returnMap.put("result", "失败了。。");
			returnMap.put("rescode", "0");
			Map<String, BigDecimal> returnmap = orderDetailService.order_check_summoney_Method(id, packids, num);
			returnMap.put("carprice", returnmap.get("carprice"));
			returnMap.put("money", returnmap.get("finaltotalPrice"));
			returnMap.put("downpay", returnmap.get("downpay_n"));
			returnMap.put("packagePrice", returnmap.get("packagePrice"));
			returnMap.put("result", "成功了。。");
			returnMap.put("rescode", "1");
			
		} catch (Exception e) {
			e.printStackTrace();
			returnMap.put("result", "失败了。。"+e.getMessage());
		}
		return returnMap;
	}
	
	
	
	
}
