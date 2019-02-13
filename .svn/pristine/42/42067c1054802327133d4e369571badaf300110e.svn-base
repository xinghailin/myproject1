package com.yyq.car.portal.ms.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yyq.car.portal.common.model.comm.Abrand;
import com.yyq.car.portal.common.model.comm.Model;
import com.yyq.car.portal.ms.app.service.BrandAndModelService;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;
import com.yyq.car.portal.ms.web.util.HttpUtil;


@Controller
public class BrandAndModelController {

	public static final String APPKEY = "80a44ffef4107a0a";// 你的appkey
	public static final String URL = "http://api.jisuapi.com/car/brand";
	public static final String URLM = "http://api.jisuapi.com/car/carlist";
	@Autowired
	private BrandAndModelService brandAndModelService;

	// @Autowired
	// private AbrandMapper abrandMapper;
	@RequestMapping(value = Url.ADD_ABRAND, method = RequestMethod.GET)
	public String addAbrand() {
		brandAndModelService.deleteAllModel();
		brandAndModelService.deleteAll();
		String result = null;
		String url = URL + "?appkey=" + APPKEY;
		try {
			result = HttpUtil.sendGet(url, "utf-8");
			JSONObject json = JSONObject.fromObject(result);
			if (json.getInt("status") != 0) {
				System.out.println(json.getString("msg"));
			} else {
				JSONArray resultarr = json.optJSONArray("result");
				long starTime = System.currentTimeMillis();
				List<Abrand> bandlist = new ArrayList<Abrand>();
				List<Model> modellist = new ArrayList<Model>();
				for (int v = 0; v < resultarr.size(); v++) {
					JSONObject obj = (JSONObject) resultarr.opt(v);
					String parentid = obj.getString("id");// 品牌id
					String name = obj.getString("name");// 品牌名称
					String initial = obj.getString("initial");// 首字母
					// System.out.println(id + " " + name + " " + initial);
					String logo = obj.getString("logo");
					Abrand ab = new Abrand();
					int c = Integer.parseInt(parentid);
					ab.setBrandid(c);
					ab.setBrand(name);
					ab.setBrandinitial(initial);
					ab.setLogopic(logo);
					bandlist.add(ab);
					String resultM = null;
					String urlM = URLM + "?appkey=" + APPKEY + "&parentid=" + parentid;

					String parentidM = null;
					String nameM = null;
					String fullname = null;
					String name2 = null;
					String parentid2 = null;
					try {
						resultM = HttpUtil.sendGet(urlM, "utf-8");
						JSONObject jsonM = JSONObject.fromObject(resultM);
						if (jsonM.getInt("status") != 0) {
							System.out.println(jsonM.getString("msg"));
						} else {
							JSONArray resultarrM = jsonM.optJSONArray("result");
							for (int i = 0; i < resultarrM.size(); i++) {
								JSONObject objM = (JSONObject) resultarrM.opt(i);
								nameM = objM.getString("name");// 名称
								parentidM = objM.getString("parentid");// 品牌id
								if (objM.opt("carlist") != null) {
									JSONArray carlist = objM.optJSONArray("carlist");
									for (int j = 0; j < carlist.size(); j++) {
										JSONObject data = (JSONObject) carlist.opt(j);
										fullname = data.getString("fullname");
										if (data.opt("list") != null) {
											JSONArray list = data.optJSONArray("list");
											for (int x = 0; x < list.size(); x++) {
												JSONObject lists = (JSONObject) list.opt(x);

												String productionstate = lists.getString("productionstate");
												if (productionstate.equals("在产")) {
													name2 = lists.getString("name");// 哪一款
													parentid2 = lists.getString("parentid");
													String vi = name2 + parentid2;
													Model m = new Model();
													int bid = Integer.parseInt(parentidM);
													m.setBrandid(bid);
													m.setModel(fullname);
													m.setVersion(vi);
													m.setSource(nameM);
													Model model = new Model();
													int brandid = Integer.parseInt(parentidM);
													model.setSource(nameM);
													model.setModel(fullname);
													model.setVersion(vi);
													model.setBrandid(brandid);
													modellist.add(model);
													System.out
															.println("********************************************************************************************");
													// System.out.println(parentidM+"**"+nameM+"**"+fullname+"**"+vi);
												}
 
											}
										}
									}
								}
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				System.out.println("======================================");
				brandAndModelService.addAbrandlist(bandlist);
				brandAndModelService.addModellist(modellist);
				long endTime = System.currentTimeMillis();
				long Time = endTime - starTime;
				System.out.println(Time);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return View.QUERY_BRAND_VIEW;
	}

	/**
	 * 进入车型管理页面
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.QUERY_BRAND, method = RequestMethod.GET)
	public String queryAbrand(ModelMap map, String currpage) {
		map.put("currpage", currpage);
		return View.QUERY_BRAND_VIEW;
	}

	@RequestMapping(value = Url.QUERY_ALL_BRAND, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryAllAbrand(Abrand abrand, String start, String pageSize) {
		Map<String, Object> listMap = brandAndModelService.queryAbrand(abrand, start, pageSize);
		return listMap;
	}

	@RequestMapping(value = Url.QUERY_ALL_MODEL, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryAllModel(Model model, String start, String pageSize) {
		Map<String, Object> listMap = brandAndModelService.queryModel(model, start, pageSize);
		return listMap;
	}

	/**
	 * 到品牌型号详情页面
	 * @param brandid
	 * @param map
	 * @param currpage
	 * @return
	 */
	@RequestMapping(value = Url.QUERY_MODEL, method = RequestMethod.GET)
	public String queryModel(int brandid, ModelMap map, String currpage) {
		map.put("brandid", brandid);
		map.put("currpage", currpage);
		return View.QUERY_MODEL_VIEW;
	}

	@RequestMapping(value = Url.addmodelandversion, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> addmodelandversion(String brandid, String model, String version) {
		brandAndModelService.addmodelandversion(brandid, model, version);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", true);
		return map;

	}

	/**
	 * 询底价查询品牌首字母
	 * @param sessionId
	 * @param accountId
	 * @return
	 */
	@RequestMapping(value = Url.queryBrandinitia, method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> InquiryPricePage() {
		List<Map<String, Object>> result = brandAndModelService.queryBrandinitia();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return map;
	}

	/**
	 * 查询API所有品牌
	 * @param abrand
	 * @param map
	 * @return
	 */
	@RequestMapping(value = Url.QUERY_ABRAND, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryBrand(String brandinitial) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> abrand = brandAndModelService.queryBrand(brandinitial);
		map.put("abrand", abrand);
		return map;

	}

	/**
	 * 根据品牌名称查询型号
	 * @param brand
	 * @return
	 */
	@RequestMapping(value = Url.QUERY_BY_BRANDID_MODEL, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryByBrandidModel(String brand) {
		Map<String, Object> map = new HashMap<String, Object>();
	
		Abrand lst = brandAndModelService.queryId(brand);
		// int id = 0;
		// for (int i = 0; i < lst.size(); i++) {
		// id = lst.get(i).getBrandid();
		// }
		// List<Map<String, Object>> model = brandAndModelService.queryByBrandidModel(id);
		List<Map<String, Object>> model = brandAndModelService.queryByBrandidModel(lst.getBrandid());
		map.put("model", model);
		return map;

	}

	/**
	 * 根据车型添加版别
	 * @param model
	 * @return
	 */
	@RequestMapping(value = Url.QUERY_VERSION, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryVersion(String model) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> version = brandAndModelService.queryVersion(model);
		map.put("version", version);
		return map;
	}

	/**
	 * 删除型号和版别
	 * @param id
	 * @return
	 */
	@RequestMapping(value = Url.deletemodel, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deletemodel(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		brandAndModelService.deletemodel(id);
		map.put("status", true);
		return map;
	}

}
