/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.NeedReportService
 * Created By: wangzh 
 * Created on: 2017年9月26日 下午7:57:13
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yyq.car.portal.common.dto.BizShopTermDto;
import com.yyq.car.portal.common.mapper.biz.BizShopTermMapper;


/**
 * <P>样车金融</P>
 * @author liliang
 * 2018/04/26
 */
@Service
public class PurchasingFinanceService {

	@Autowired
	private BizShopTermMapper bizShopTermMapper;

	
	/**
	* 
	* 采购金融清单
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数 
	* @return  分页结果  
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> findPurchasingFinanceByParameter(BizShopTermDto record,String start,String pageSize) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		int st = (Integer.parseInt(start) - 1) * ps;
		record.setPageSize(ps);
		record.setStart(st);
		List<BizShopTermDto> lst = bizShopTermMapper.selectByShopTermDto(record);
		int cmeet = bizShopTermMapper.countByShopTermDto(record);
		map.put("result", lst);
		map.put("total", cmeet);
		return map;
	}
	
	

}
