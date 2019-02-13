/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.web.controller.KrOutController
 * Created By: wangzh 
 * Created on: 2018年6月6日 下午6:13:29
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.dto.KrcarDTO;
import com.yyq.car.portal.common.exception.PortalBizCheckedException;
import com.yyq.car.portal.common.model.kr.Krpool;
import com.yyq.car.portal.ms.app.service.Kroutservice;
import com.yyq.car.portal.ms.common.bqcarimportDTO;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;
import com.yyq.car.portal.ms.web.util.CustomExcelHelper;


/**
 * <P>北汽库融车辆出库controller</P>
 * @author wangzh
 */
@Controller
public class KrOutController {

	@Autowired
	Kroutservice outservice;

	private byte[] lockBatchTypein = new byte[0];// 批量导入车辆锁

	/**
	 * 
	 * <p>到库融出库列表页</p>
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.OUT_KRCARENTER_OUTPAGE, method = RequestMethod.GET)
	public String out(ModelMap map) {
		List<Krpool> poolList = outservice.findAllPoolList();
		map.put("poolList", poolList);
		return View.KRCAR_TYPEIN_OUTVIEW;
	}

	/**
	 * 
	 * <p>库融出库查询</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	@RequestMapping(value = Url.OUT_KRCARENTER_URL, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outByParameter(KrcarDTO dto, Integer start, Integer pageSize, Integer batnum, ModelMap map) {
		Map<String, Object> returnMap = null;
		try {
			returnMap = outservice.outByParameter(dto, start, pageSize, batnum);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return returnMap;
	}

	/**
	 * 
	 * <p>跳转到出库选车结果列表</p>
	 * @param dto
	 * @param map
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.OUTMETHOD_KRCARENTER_URL, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outCar(String ids, String poolid, ModelMap map) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			outservice.gatheroutlst(ids, poolid, map);
			returnMap.put("status", true);
		} catch (Exception e) {
			returnMap.put("status", false);
			returnMap.put("msg", e.getMessage());
		}
		return returnMap;
	}

	/**
	 * 
	 * <p>到北汽车辆批量录入页</p>
	 * @param map
	 * @param id
	 * @return
	 * @author wangzh
	 */
	@RequestMapping(value = Url.krcarbatchtypein, method = RequestMethod.GET)
	public String krcarbatchtypein(ModelMap map, Integer id) {
		return "krcarbatchtypeinview";
	}

	/**
	 * 批量导入车辆
	 * @param file
	 * @param response
	 * @author wangzh
	 */
	@SuppressWarnings({ "all" })
	@RequestMapping(value = Url.krcarbatchtypeindo, method = RequestMethod.POST)
	public void krcarbatchtypeindo(@RequestParam("excelFile") MultipartFile file, HttpServletResponse response) {
		synchronized (lockBatchTypein) {
			// Map<String, Object> modelMap = new HashMap<String, Object>();
			try {
				String fileName = file.getOriginalFilename();
				if (StringUtils.isBlank(fileName)) {
					// modelMap.put("message", "没有待上传的文件");
					// return modelMap;
					throw new PortalBizCheckedException("文件为空");
					// return;
				}
				if (!fileName.endsWith("xls") && !fileName.endsWith("xlsx")) {
					// modelMap.put("message", "上传文件不是EXCEL文件");
					// return modelMap;
					throw new PortalBizCheckedException("文件格式错误");
					// return;
				}
				// ----------------------------------------------生成excelHelper对象-----------------------------------------------------
				CustomExcelHelper eh = null;
				// List<XSSFPictureData> pictures = null; // excel图片
				try {
					// XSSFWorkbook workbook = (XSSFWorkbook)
					// WorkbookFactory.create(file.getInputStream());
					// pictures = workbook.getAllPictures();
					eh = CustomExcelHelper.readExcel(file.getInputStream());
				} catch (InvalidFormatException | IOException | NullPointerException e1) {
					e1.printStackTrace();
					// logger.error("读取EXCEL文件出现异常{}", e1);
					// modelMap.put("message", "读取EXCEL文件出现异常");
					// printOut(modelMap, response);
					// return modelMap;
					// printOut("读取EXCEL文件出现异常", response);
					throw new PortalBizCheckedException(e1.getMessage());
					// return;
				}
				// -----------------------------------------------excel校验，生成javaBean----------------------------------------------------
				// int line = 5; // excel 起始行
				// String alert = "";
				// List<Krcar> carLst = new ArrayList<Krcar>();

				List<bqcarimportDTO> dtoLst = eh.toEntitys(bqcarimportDTO.class, 4);// 模板中从第五行开始
																					// 故索引是4
				// 查询所有库融池
				List<Krpool> poolLst = outservice.findAllPoolList();
				Map<String, String> poolNameMap = new HashMap<String, String>();
				for (int i = 0; i < poolLst.size(); i++) {
					poolNameMap.put(poolLst.get(i).getName(), poolLst.get(i).getId());
				}
				// HashSet<String> hs=new HashSet<String>();
				// for (Krpool p : poolLst) {
				// hs.add(p.get)
				// }

				int size = dtoLst.size();

				Map<String, String> flex = new HashMap<String, String>();
				// Map<String, String> flex1 = new HashMap<String, String>();
				for (int i = 0; i < size;) {
					flex.put(dtoLst.get(i).getVin(), dtoLst.get(i).getVin());
					i++;
					if (i != flex.size()) {
						// printOut("第" + (i + 1) + "行，车架号[" + dtoLst.get(i - 1).getVin() +
						// "]在excel中重复出现", response);
						throw new PortalBizCheckedException("第" + (i + 4) + "行，车架号[" + dtoLst.get(i - 1).getVin() + "]在excel中重复出现");
						// return;
					}
					if (!poolNameMap.containsKey(dtoLst.get(i - 1).getPoolid())) {
						throw new PortalBizCheckedException("第" + (i + 4) + "行，库融池[" + dtoLst.get(i - 1).getPoolid() + "]不存在");
					}
				}
				outservice.batchin(dtoLst, poolNameMap, file);
				// printOut("批量导入成功", response);
				// -----------------------------------------------导入产品----------------------------------------------------
				// StringBuilder message = new StringBuilder();

				// ExcelImportResult excelImportResult = new ExcelImportResult();

				// if (excelImportResult.getErrMap().size() == 0) {
				// modelMap.put("successFlag", true);
				// message.append("批量导入产品成功");
				// } else {
				// for (Map.Entry<Integer, Map<Integer, String>> line :
				// excelImportResult.getErrMap().entrySet()) {
				// message.append("");
				// for (Map.Entry<Integer, String> col : line.getValue().entrySet()) {
				// message.append("").append(col.getValue());
				// }
				// }
				// }
				// modelMap.put("status", true);
				// modelMap.put("message", "批量导入成功");
				// return modelMap;
				PrintWriter out = null;
				try {
					response.setContentType("text/html;charset=UTF-8");
					out = response.getWriter();
					out.write("<body><div style=\"color:red;\">成功导入" + size + "条！</div></body>");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					out.flush();
					out.close();
				}
			} catch (Exception exception) {
				PrintWriter out = null;
				try {
					response.setContentType("text/html;charset=UTF-8");
					out = response.getWriter();
					String errormsg = StringUtils.isNotBlank(exception.getMessage()) ? exception.getMessage() : exception.getCause().getMessage();
					out.write("<body><div style=\"color:red;\">" + errormsg + "</div></body>");
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					out.flush();
					out.close();
				}
			}
		}
	}
}
