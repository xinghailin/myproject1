/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.NeedReportService
 * Created By: wangzh 
 * Created on: 2017年9月26日 下午7:57:13
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.alibaba.fastjson.JSON;
import com.yyq.car.portal.common.dto.InventoryQuotationDTO;
import com.yyq.car.portal.common.mapper.biz.InventoryQuotationMapper;
import com.yyq.car.portal.common.model.biz.InventoryQuotation;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.ms.web.util.UUIDTool;


/**
 * <P>每日库存报价</P>
 * @author liliang
 */
@Service
public class InventoryQuotationService {
	private static int handleType = 1;
	private static int taskType = 2;

	@Autowired
	private InventoryQuotationMapper inventoryQuotationMapper;

	/**
	 * <p>保存每天的库存报价</p>
	 * @param 
	 * @author liliang
	 * @throws Exception 
	 */
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	public void saveInventoryQuotationList(String dateList,String name,String date,Integer userid) throws Exception {
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		Date quoteDate = null;
		try {
			quoteDate = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	
		Date datenow = new Date();
		List<InventoryQuotation> listEntity=JSON.parseArray(dateList, InventoryQuotation.class);
		/*InventoryQuotation inventoryQuotation = new InventoryQuotation();
		for(InventoryQuotation entity:listEntity){
			entity.setId(UUIDTool.getUUID());
			entity.setQuoteDate(quoteDate);
			entity.setQuoteName(name);
			entity.setCreateTime(datenow);
			entity.setCreateType(handleType);
			entity.setCreateUserId(userid);
			
			inventoryQuotation.setBrand(entity.getBrand());
			inventoryQuotation.setCarModel(entity.getCarModel());
			inventoryQuotation.setVersion(entity.getVersion());
			inventoryQuotation.setConfigure(entity.getConfigure());
			inventoryQuotation.setColour(entity.getColour());
			inventoryQuotation.setQuoteDate(quoteDate);
			List<InventoryQuotation> findList = inventoryQuotationMapper.selectByCriteria(inventoryQuotation);
			if(findList.size()>0){//说明有重复的
				throw new Exception("...有重复数据...品牌-"+entity.getBrand()+"车型-"+entity.getCarModel()+"版本-"+entity.getVersion()+"配置-"+entity.getConfigure()+"颜色-"+entity.getColour()+"有重复");
			}else{
				inventoryQuotationMapper.insertSelective(entity);
			}
			
			
		}*/
		if (null != listEntity && listEntity.size() > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			Map<String, Integer> mapsum = new HashMap<String, Integer>();
			String msg = "";
			for (InventoryQuotation entity : listEntity) {
				String key = entity.getBrand() + entity.getCarModel() + entity.getVersion() + entity.getConfigure()
						+ entity.getColour();
				map.put(key, entity);
				if (mapsum.containsKey(key)) {
					int sum = mapsum.get(key);
					mapsum.put(key, sum + 1);
					if (sum == 1) {
						msg += ".品牌-" + entity.getBrand() + "-车型-" + entity.getCarModel() + "-版本-"
								+ entity.getVersion() + "-配置-" + entity.getConfigure() + "-颜色-" + entity.getColour();
					}
				} else {
					mapsum.put(key, 1);
				}

			}
			if ("".equals(msg)) {// 说明没有重复的 可以继续保存
				InventoryQuotation pojo = new InventoryQuotation();
				pojo.setQuoteDate(quoteDate);
				int count = inventoryQuotationMapper.countByCriteria(pojo);
				if (count != 0) {// 日期已经有了不能保存了。
					throw new Exception(date + "已经有报价了，如需修改，请修改明天的报价");
				}

				for (Entry<String, Object> mapentry : map.entrySet()) {
					InventoryQuotation entity = (InventoryQuotation) mapentry.getValue();
					entity.setId(UUIDTool.getUUID());
					entity.setQuoteDate(quoteDate);
					entity.setQuoteName(name);
					entity.setCreateTime(datenow);
					entity.setCreateType(handleType);
					entity.setCreateUserId(userid);
					inventoryQuotationMapper.insertSelective(entity);
				}
			} else {// 有重复 抛异常
				throw new Exception("重复：" + msg);
			}
		}else {// 为空
			throw new Exception("值为null dateList.." + dateList);
		}
		
	}
	
	
	
	
	/**
	 * <p>查询数据库中最新的  库存报价信息   填充到新增页面</p>
	 * @param 
	 * @author liliang
	 * @throws Exception 
	 */
	public List<InventoryQuotation> selectByMaxDate() throws Exception {
		return inventoryQuotationMapper.selectByMaxDate();
		
	}
	
	
	
	
	/**
	* 
	* <p>TODO</p>
	* @param SmsReport
	* @param start
	* @param pageSize
	* @return
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> lookByCurrentDate(InventoryQuotationDTO dto, String start, String pageSize) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		InventoryQuotation entity = new InventoryQuotation();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		entity.setQuoteDate(sdf.parse(sdf.format(new Date())));//当前日期 查询
		entity.setBrand(dto.getBrand());
		entity.setCarModel(dto.getCarModel());
		entity.setVersion(dto.getVersion());
		entity.setConfigure(dto.getConfigure());
		List<InventoryQuotation> lst = inventoryQuotationMapper.selectByCriteria(entity, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int cmeet = inventoryQuotationMapper.countByCriteria(entity);
		map.put("result", lst);
		map.put("total", cmeet);
		return map;
	}
	
	
	/**
	* 
	* <p>TODO</p>
	* @param SmsReport
	* @param start
	* @param pageSize
	* @return
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> lookByParameter(InventoryQuotationDTO dto, String start, String pageSize) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		InventoryQuotation entity = new InventoryQuotation(); 
		
		if (StringUtils.isNotBlank(dto.getQuoteDate())) {
			entity.setQuoteDate(DateUtils.parse(dto.getQuoteDate(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		}
		entity.setBrand(dto.getBrand());
		entity.setCarModel(dto.getCarModel());
		entity.setVersion(dto.getVersion());
		entity.setConfigure(dto.getConfigure());
		List<InventoryQuotation> lst = inventoryQuotationMapper.selectByCriteria(entity, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int cmeet = inventoryQuotationMapper.countByCriteria(entity);
		map.put("result", lst);
		map.put("total", cmeet);
		return map;
	}
	
	
	
	
	
	
	
	/**
	 * <p>每日库存报价   如果手工没有填写的话 则按照数据库中最新日期的数据填写</p>
	 * @param 
	 * @author liliang
	 * @throws Exception 
	 */
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	public void taskSaveInventoryQuotationList(List<InventoryQuotation> dateList) throws Exception {
	    Date nowdate = new Date();
		for(InventoryQuotation entity:dateList){
			InventoryQuotation inventoryQuotation = new InventoryQuotation();
			
			inventoryQuotation.setId(UUIDTool.getUUID());
			inventoryQuotation.setCreateType(taskType);
			inventoryQuotation.setCreateTime(nowdate);
			inventoryQuotation.setQuoteDate(nowdate);						
			inventoryQuotation.setBrand(entity.getBrand());
			inventoryQuotation.setCarModel(entity.getCarModel());
			inventoryQuotation.setVersion(entity.getVersion());
			inventoryQuotation.setConfigure(entity.getConfigure());
			inventoryQuotation.setColour(entity.getColour());		
			inventoryQuotation.setQuoteName(entity.getQuoteName());
			inventoryQuotation.setNumber(entity.getNumber());
			inventoryQuotation.setType(entity.getType());
			inventoryQuotation.setSettlementPrice(entity.getSettlementPrice());
			inventoryQuotation.setMarketPrice(entity.getMarketPrice());
			inventoryQuotationMapper.insertSelective(inventoryQuotation);
		}
		
		
	}

	
	
	/**
	* 
	* <p>TODO</p>
	* @param  <p> 查询一个车的  所有信息     在折线图上显示</p>
	* @param start
	* @param pageSize
	* @return
	* @author liliang
	 * @throws ParseException 
	*/
	public List<InventoryQuotation> finOneListByMonth(InventoryQuotation entity, String start, String pageSize) {
		// 根据传过来的id  查询出对象  然后根据     品牌	车型	版本	配置	颜色  来查询出list
		String id = entity.getId();
		List<InventoryQuotation> lst = null;
		if(StringUtils.isNotBlank(id)){
		    InventoryQuotation pojo = inventoryQuotationMapper.selectByPrimaryKey(id);
		    InventoryQuotation inventoryQuotation = new InventoryQuotation();
		    inventoryQuotation.setBrand(pojo.getBrand());
		    inventoryQuotation.setCarModel(pojo.getCarModel());
		    inventoryQuotation.setVersion(pojo.getVersion());
		    inventoryQuotation.setConfigure(pojo.getConfigure());
		    inventoryQuotation.setColour(pojo.getColour());
			int ps = Integer.parseInt(pageSize)*30;
			lst = inventoryQuotationMapper.selectByCriteria(inventoryQuotation, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
			
		}
		return lst;
	}
	
	

}
