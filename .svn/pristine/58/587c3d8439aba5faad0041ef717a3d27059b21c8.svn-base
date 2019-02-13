/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.NeedReportService
 * Created By: wangzh 
 * Created on: 2017年9月26日 下午7:57:13
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;

import com.yyq.car.portal.common.dto.CarFinanceDto;
import com.yyq.car.portal.common.dto.CarFinanceShopDto;
import com.yyq.car.portal.common.dto.PayCarTemp;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.mapper.biz.PayMoneyDetailsMapper;
import com.yyq.car.portal.common.mapper.biz.PayMoneyInterestMapper;
import com.yyq.car.portal.common.mapper.product.ShopMapper;
import com.yyq.car.portal.common.model.biz.PayMoneyDetails;
import com.yyq.car.portal.common.model.biz.PayMoneyInterest;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.ms.web.controller.CarFinanceController;
import com.yyq.car.portal.ms.web.util.BigDecimalTool;
import com.yyq.car.portal.ms.web.util.DateTimeUtil;
import com.yyq.car.portal.ms.web.util.UUIDTool;
import com.yyq.car.portal.ms.web.util.paymoney.ModelcarfinanceUtil;


/**
 * <P>样车金融</P>
 * @author liliang
 * 2018/04/26
 */
@Service
public class CarFinanceService {
	@Autowired
	private ShopMapper shopMapper;
	@Autowired
	private PayMoneyInterestMapper payMoneyInterestMapper;
	@Autowired
	private PayMoneyDetailsMapper payMoneyDetailsMapper;
	
	private static int IS_PAYALL =2 ;//全部结清
	private static int NOT_COUNT  =2; // 不符合计算利息的标记
	
	private static final Logger log = LoggerFactory.getLogger(CarFinanceController.class);
	
	/**
	*   封装对象方法  返回给页面   
	*   样车金融清单页面  求到当前的总的利息之和
	* @param CarFinanceShopDto
	* @return
	* @author liliang
	 * @throws ParseException 
	*/
	public  CarFinanceShopDto getShopDtoInCarFinance() {
		CarFinanceShopDto dto = new CarFinanceShopDto();
		BigDecimal sum = new BigDecimal("0");// 总利息
		CarFinanceShopDto record = new CarFinanceShopDto();
		                                             
		List<CarFinanceDto> lst = payMoneyInterestMapper.selectCarByCarFinanceShop(record);
		if(null !=lst && lst.size() > 0 ){
			for(CarFinanceDto entity :lst){
					// 如果settlementprice 有值 则 用settlementprice 来计算利息  否则用typeinsettleprice 来计算利息
					String settlementprice = entity.getSettlementprice();
					String typeinsettleprice = entity.getTypeinsettleprice();
					if(StringUtils.isBlank(settlementprice)){
						entity.setSettlementprice(typeinsettleprice);
					}
					
					if(null!= entity && null!= entity.getIssale() && 1 ==entity.getIssale()){
					  
					}else{
						try {
							sum = sum.add(ModelcarfinanceUtil.getSumMoney(entity,1).getSumMoney());
						} catch (Exception e) {
							e.printStackTrace();
							log.error("样车金融清单页面  求到当前的总的利息之和   set 利息时出错了.."+e);
							return dto;
						}
					}
					
			}
		}
		dto.setSumMoney(BigDecimalTool.roundBigDecimal(sum,2).toString());
		return dto;
	}
	
	
	/**
	* 
	* 样车金融清单
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数 
	* @return  分页结果  
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> findCarFinanceByParameter(CarFinanceShopDto record,String start,String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		int st = (Integer.parseInt(start) - 1) * ps;
		record.setPageSize(ps);
		record.setStart(st);
		List<CarFinanceDto> lst = payMoneyInterestMapper.selectCarByCarFinanceShop(record);
		if(null !=lst && lst.size() > 0 ){
			for(CarFinanceDto entity :lst){
				
				String settlementprice = entity.getSettlementprice();
				String typeinsettleprice = entity.getTypeinsettleprice();
				if(StringUtils.isBlank(settlementprice)){
					entity.setSettlementprice(typeinsettleprice);
				}				
				
				BigDecimal sum = new BigDecimal("0");
				try {
					sum = ModelcarfinanceUtil.getSumMoney(entity,1).getSumMoney();
					entity.setSumMoney(BigDecimalTool.roundBigDecimal(sum,2).toString());
				} catch (Exception e) {
						
					log.error(" 样车金融清单    分页查询方法    set 利息时出错了.."+e);
					e.printStackTrace();
				}
								
				
			}
		}
		
		
		int cmeet = payMoneyInterestMapper.countCarByCarFinanceShop(record);
		map.put("result", lst);
		map.put("total", cmeet);
		return map;
	}
	
	/**
	* 
	* 查找门店下  汽车的全部信息
	* @param  通过查询条件 返回全部结果集
	* @param 查询条件  ,页码,页数 
	* @return  全部分页 结果  
	* @author liliang
	 * @throws ParseException 
	*/
	public List<CarFinanceDto> findAllListCarByShopid(CarFinanceShopDto record) {
		List<CarFinanceDto> lst = payMoneyInterestMapper.findAllListCarByShopid(record);
		return lst;
	}
	
	
	

	
	
	/**
	 * 
	 * <p>门店样车金融查看     分页查询方法</p>
	 * @param modelMap
	 * @return
	 * @author liliang
	 */
	
	public Map<String, Object> findSoreCarFinanceByParameter(CarFinanceShopDto dto, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();	
		int ps = Integer.parseInt(pageSize);
		int st = (Integer.parseInt(start) - 1) * ps;
		dto.setPageSize(ps);
		dto.setStart(st);
		List<CarFinanceDto> lst = payMoneyInterestMapper.selectCarByCarFinanceShop(dto);
		if(null !=lst && lst.size() > 0 ){
			for(CarFinanceDto entity :lst){
				// 通过门店 查找组   找到组 的开店时间
				/*Date create = null;
				if(null !=entity.getShopTermId()){
					Shop shop =this.selectListByShoptermid(entity);
					create = shop.getCreateTime();
				}else{
					create = entity.getShopCreateTime();
				}				
				entity.setShopTermFirstCreateDate(create);*/
				
				String settlementprice = entity.getSettlementprice();
				String typeinsettleprice = entity.getTypeinsettleprice();
				if(StringUtils.isBlank(settlementprice)){
					entity.setSettlementprice(typeinsettleprice);
				}
				
				BigDecimal sum = new BigDecimal("0");
				try {
					sum = ModelcarfinanceUtil.getSumMoney(entity,1).getSumMoney();
					entity.setSumMoney(BigDecimalTool.roundBigDecimal(sum,2).toString());
				} catch (Exception e) {
					
					log.error(" 门店样车金融查看    set 利息 时出错了.."+e);
					e.printStackTrace();
				}
					
				
			}
		}
		
		int cmeet = payMoneyInterestMapper.countCarByCarFinanceShop(dto);
	
		map.put("result", lst);
		map.put("total", cmeet);
		
		return map;
	}
	
	
	
	
	
	
	
	/**
	*   封装对象方法  返回给页面
	* @param CarFinanceShopDto
	* @return
	* @author liliang
	 * @throws ParseException 
	*/
	public  CarFinanceShopDto getShopDto(CarFinanceShopDto entity,List<CarFinanceDto> listCarFinance) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		String dateNextMonth = DateTimeUtil.getFirstDayOfNextMonth(new Date(),"yyyy-MM-dd",0); // 获得下一个月1号 
		String payDate = DateTimeUtil.getDateStringBefore(sdf.parse(dateNextMonth), 9); // 获得还款日   每个月10    + 10 
		entity.setPayDate(payDate);
	
		String financeType = entity.getFinanceType();
		if("1".equals(financeType)){
			financeType = "样车金融";
		}else{
			financeType = "采购金融";
		}
		entity.setFinanceType(financeType);
		
		String storetype = entity.getType();
		if("0".equals(storetype)){
			storetype ="虚拟" ;
		}else if("1".equals(storetype)){
			storetype ="自营" ;
		}else if("2".equals(storetype)){
			storetype ="城市合伙人" ;
		}else {
			storetype ="寄售" ;
		}
		entity.setType(storetype);
		String  sumMoney="";
		BigDecimal sum = new BigDecimal("0");
		BigDecimal sumsettlementprice = new BigDecimal("0");
		BigDecimal remainsumMoney_b = new BigDecimal("0");
		// 开始计算利息之和，
		if(null != listCarFinance && listCarFinance.size() >0 ){
			for(CarFinanceDto pojo :listCarFinance){
				
				
				String settlementprice = pojo.getSettlementprice();
				String typeinsettleprice = pojo.getTypeinsettleprice();
				if(StringUtils.isBlank(settlementprice)){
					pojo.setSettlementprice(typeinsettleprice);
				}				
				//  and pay.is_payall = 1
			    if(null!=pojo){
			    	if(null!= pojo.getIspayall() && 1 == pojo.getIspayall() ){// 未结清的  算利息
				    	if(null!= pojo.getIssale() && 1 == pojo.getIssale() ){
							
						}else{
							try {
								sum = sum.add(ModelcarfinanceUtil.getSumMoney(pojo,1).getSumMoney());
							} catch (Exception e) {
								
								log.error("getShopDto method 门店计算利息 总和出错......");
								e.printStackTrace();
								return entity;
							}
						}
			    	}
			    	sumsettlementprice = sumsettlementprice.add(new BigDecimal(pojo.getSettlementprice()));
			    	
			    }
				
			    
				
			}
			sumMoney =BigDecimalTool.roundBigDecimal(sum, 2).toString();
			
		}
		
		
		entity.setSumMoney(sumMoney);
		entity.setSumSettlementprice(BigDecimalTool.roundBigDecimal(sumsettlementprice, 2).toString());
		if(StringUtils.isNotEmpty(entity.getCredit())){
			 remainsumMoney_b = BigDecimal.valueOf(BigDecimalTool.sub(BigDecimalTool.mul(Double.parseDouble(entity.getCredit()),10000),sumsettlementprice.doubleValue()));
					 
		}
         entity.setRemainsumMoney(BigDecimalTool.roundBigDecimal(remainsumMoney_b, 2).toString());
		return entity;
	}
	
	/**
	* 
	*    返回  门店结果集    店里面没有要结算的车 也需要显示出来店
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数 
	* @return  分页结果  
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> findShopListByParameter(CarFinanceShopDto record,String start,String pageSize) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		int st = (Integer.parseInt(start) - 1) * ps;
		record.setPageSize(ps);
		record.setStart(st);
		List<CarFinanceDto> lst = payMoneyInterestMapper.findShopListByParameter(record);
		int cmeet = payMoneyInterestMapper.countShopByParameter(record);
		map.put("result", lst);
		map.put("total", cmeet);
		return map;
	}
	
	
	/**
	* 
	* 查找门店下  汽车的全部信息
	* @param  通过查询条件 返回全部结果集
	* @param 查询条件  ,页码,页数 
	* @return  全部分页 结果  
	* @author liliang
	 * @throws ParseException 
	*/
	/*public Shop selectListByShoptermid(CarFinanceDto record) {
		Shop shop = new Shop();
		Shop returnshop = new Shop();
		shop.setTermid(record.getShopTermId());
		List<Shop> lst = payMoneyInterestMapper.selectListByShoptermid(shop);
		if(lst !=null && lst.size()> 0){
			returnshop =lst.get(0);
			
		}
		return returnshop;
	}*/
	/**
	* 
	*    返回付款  汽车结果集    通过门店id
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数 
	* @return  分页结果  
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> findCarListByShopid(CarFinanceShopDto record,String start,String pageSize) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		int st = (Integer.parseInt(start) - 1) * ps;
		record.setPageSize(ps);
		record.setStart(st);
		List<CarFinanceDto> lst = payMoneyInterestMapper.findCarListByShopid(record);

		if (null != lst && lst.size() > 0) {
			for (CarFinanceDto entity : lst) {
				// 通过门店 查找组   找到组 的开店时间
				/*Date create = null;
				if (null != entity.getShopTermId()) {
					Shop shop = this.selectListByShoptermid(entity);
					create = shop.getCreateTime();
				} else {
					create = entity.getShopCreateTime();
				}
				entity.setShopTermFirstCreateDate(create);*/
				
				String settlementprice = entity.getSettlementprice();
				String typeinsettleprice = entity.getTypeinsettleprice();
				if(StringUtils.isBlank(settlementprice)){
					entity.setSettlementprice(typeinsettleprice);
				}
				
				
				BigDecimal sum = new BigDecimal("0");
				PayCarTemp temp = new PayCarTemp();
				
					 try {
						temp = ModelcarfinanceUtil.getSumMoney(entity, 2);
						 sum = temp.getSumMoney();
						 entity.setSumMoney(BigDecimalTool.roundBigDecimal(sum, 2).toString());
						 entity.setPayStartDate(temp.getPayStartDate());
						 entity.setPayEndDate(temp.getPayEndDate());
						 entity.setFreeDays(temp.getFreeDays());
						 entity.setNoFreeDays(temp.getNotFreeDays());
					} catch (Exception e) {						
						log.error("findCarListByShopid method .....返回付款  汽车结果集出错了.....");
						e.printStackTrace();
					}			 
										 
				
			}
		}
		
		int cmeet = payMoneyInterestMapper.countCarListByShopid(record);
		map.put("result", lst);
		map.put("total", cmeet);
		return map;
	}
	
	/**
	* 扣款
	*    返回付款  汽车结果集    通过门店id  不分页       结算方法 
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,shopId
	* @return    
	* @author liliang
	 * @throws Exception 
	*/
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public Map<String, Object> payAllShopMoneyByShopid(CarFinanceShopDto record) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "失败了。。");
		map.put("rescode", "0");
		List<CarFinanceDto> lst = payMoneyInterestMapper.findCarListByShopid(record);
		if (null != lst && lst.size() > 0) {
			for (CarFinanceDto entity : lst) {
				// 通过门店 查找组   找到组 的开店时间
				/*Date create = null;
				if (null != entity.getShopTermId()) {
					Shop shop = this.selectListByShoptermid(entity);
					create = shop.getCreateTime();
				} else {
					create = entity.getShopCreateTime();
				}

				entity.setShopTermFirstCreateDate(create);*/
				
				
				String settlementprice = entity.getSettlementprice();
				String typeinsettleprice = entity.getTypeinsettleprice();
				if(StringUtils.isBlank(settlementprice)){
					entity.setSettlementprice(typeinsettleprice);
				}
				
				BigDecimal sum = new BigDecimal("0");
				PayCarTemp temp = new PayCarTemp() ;
				
					 try {
						temp = ModelcarfinanceUtil.getSumMoney(entity, 2);
						 sum = temp.getSumMoney();
						 entity.setSumMoney(BigDecimalTool.roundBigDecimal(sum, 2).toString());
						 entity.setPayStartDate(temp.getPayStartDate());
						 entity.setPayEndDate(temp.getPayEndDate());
						 entity.setFreeDays(temp.getFreeDays());
						 entity.setNoFreeDays(temp.getNotFreeDays());
						 entity.setIspayall(temp.getIspayall());
						 entity.setIscount(temp.getIscount());
					} catch (Exception e) {	
						log.error("payAllShopMoneyByShopid method  出错了......");
						e.printStackTrace();
						throw new Exception(" 计算汽车利息出错了..... 车架号..."+entity.getVin());
						
					}
				
							 
					 
			}
		}
		
		
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
	//	Date paystartDate =sdf.parse(DateTimeUtil.getFirstDayOfNextMonth(now, "yyyy-MM-dd", -1));
	//	Date payendDate = (DateTimeUtil.getLastDayOfNextMonth(now,"yyyy-MM-dd",0));
		// 开始计算
		if (null != lst && lst.size() > 0) {
			for (CarFinanceDto entity : lst) {
				
				
				try {
					Date paymoneydate1 =sdf.parse(DateTimeUtil.getLastDayOfNextMonth(now,"yyyy-MM-dd",0)) ;  // 结算日为月底  +1 天为下次开始计息时间
					Date paymoneydate =DateTimeUtil.getDateBefore(paymoneydate1,1);
					String payId = entity.getPayId();
					int carId  =entity.getCarId();
					int shopId =Integer.valueOf(entity.getShopId());
					int isPayall = entity.getIspayall();
					Integer isCount =  entity.getIscount();
					if(null!= isCount && NOT_COUNT != isCount ){ //
						PayMoneyInterest payMoneyInterest = new PayMoneyInterest();
						payMoneyInterest.setId(payId); 
						payMoneyInterest.setPaymoneyDate(paymoneydate);
						if(IS_PAYALL == isPayall){ //全部结清  标记
							payMoneyInterest.setIsPayall(IS_PAYALL);
						}
						payMoneyInterest.setModifyTime(now);
						
						payMoneyInterestMapper.updateByPrimaryKeySelective(payMoneyInterest);
						
							
						PayMoneyDetails payMoneyDetails = new PayMoneyDetails();
						payMoneyDetails.setId(UUIDTool.getUUID());
						payMoneyDetails.setPayId(payId);
						payMoneyDetails.setCarId(carId);
						payMoneyDetails.setShopId(shopId);
						
						payMoneyDetails.setPayStartDate(entity.getPayStartDate());
						payMoneyDetails.setPayEndDate(entity.getPayEndDate());
						payMoneyDetails.setFreeDays(entity.getFreeDays());
						payMoneyDetails.setNotfreeDays(entity.getNoFreeDays());
						if(IS_PAYALL == isPayall){ //全部结清  标记
							payMoneyDetails.setIsPayall(IS_PAYALL);
						}
						payMoneyDetails.setPayMoney( new BigDecimal(entity.getSumMoney()));
						payMoneyDetails.setCreateTime(now);
						payMoneyDetailsMapper.insertSelective(payMoneyDetails);
                  }
				} catch (Exception e) {
					log.error("payAllShopMoneyByShopid method  结算时。保存   汽车利息出错了.....车架号..."+entity.getVin()+e);
					e.printStackTrace();
					throw new Exception(" 结算时。保存   汽车利息出错了..... "+"车架号..."+entity.getVin());
				}
				
				
				
				
			}
			
			
			
			
		}
		
		map.put("result", "成功了。。");
		map.put("rescode", "1");
		return map;
	}
	
	/**
	* 
	* @param   通过登录用户查找对应的门店信息
	* @param user  登录用户  
	* @return 门店信息  
	* @author liliang
	 * @throws ParseException 
	*/
	public  CarFinanceShopDto selectShopByUser(UserDTO user) throws ParseException {
		 String username = user.getLoginName();
		List<CarFinanceShopDto> list = payMoneyInterestMapper.selectListShopByUser(username);
		CarFinanceShopDto entity = null;
		if(list !=null && list.size()> 0){
			if(list.size() == 1){
				entity =list.get(0);
			}
		}
		
		return entity;
	}
	
	
	
	/**
	*   封装对象方法  返回给页面
	* @param List<CarFinanceDto>
	* @return
	* @author liliang
	 * @throws ParseException 
	*/
	public  CarFinanceShopDto getPayCarShopDto(CarFinanceShopDto entity,List<CarFinanceDto> listCarFinance)  {
		
		Date now = new Date();
		entity.setPayStartDate(DateTimeUtil.getFirstDayOfNextMonth(now, "yyyy-MM-dd", -1));
		entity.setPayEndDate(DateTimeUtil.getLastDayOfNextMonth(now,"yyyy-MM-dd",0));
		String  sumMoney="";
		BigDecimal sum = new BigDecimal("0");
		Integer showPayMoney = 1;
		// 开始计算利息之和，
		if(null != listCarFinance && listCarFinance.size() >0 ){
			for(CarFinanceDto pojo :listCarFinance){
				// 通过门店 查找组   找到组 的开店时间
				/*Date create = null;
				if(null !=pojo.getShopTermId()){
					Shop shop =this.selectListByShoptermid(pojo);
					create = shop.getCreateTime();
				}else{
					create = pojo.getShopCreateTime();
				}
				
				pojo.setShopTermFirstCreateDate(create);*/
				
				String settlementprice = pojo.getSettlementprice();
				String typeinsettleprice = pojo.getTypeinsettleprice();
				if(StringUtils.isBlank(settlementprice)){
					pojo.setSettlementprice(typeinsettleprice);
				}				
				
				if(null!=pojo && null!= pojo.getIssale() && 1 == pojo.getIssale()){
					
				}else{
					try {
						sum = sum.add(ModelcarfinanceUtil.getSumMoney(pojo,2).getSumMoney());
					} catch (Exception e) {
						log.error("getPayCarShopDto mehtod ...计算利息之和出错了。。。。");
						e.printStackTrace();
						return entity;
					}
				}
				
				
			}
			if(sum.compareTo(BigDecimal.ZERO)==0){
				showPayMoney = 2;
			}
			entity.setShowPayMoney(showPayMoney);
			sumMoney =BigDecimalTool.roundBigDecimal(sum, 2).toString();
			
		}
		
		
		entity.setSumMoney(sumMoney);
		return entity;
	}
	
	
	
	

	
	
	

	
	
	

}
