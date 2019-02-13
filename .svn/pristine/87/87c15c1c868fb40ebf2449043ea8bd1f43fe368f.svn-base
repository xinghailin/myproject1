package com.yyq.car.portal.ms.web.util.paymoney;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import com.yyq.car.portal.common.dto.CarFinanceDto;
import com.yyq.car.portal.common.dto.PayCarTemp;
import com.yyq.car.portal.ms.web.util.BigDecimalTool;
import com.yyq.car.portal.ms.web.util.DateTimeUtil;


public class ModelcarfinanceUtil {

	// 利息计算方法一 之前没有结算过利息的 要 
	// （ 当前日期 - 入店日期 - 优惠天数）*（结算价*9.2%/365）         type 1   算到当前的
	//  （ 上个月最后一天 - 入店日期 - 优惠天数）*（结算价*9.2%/365）         type 2   算到上个月的开始和结束

	private static double INTEREST = 0.092;
	private static double YEARS_ALL_DAYS = 365;
	/*private static int FREE_MONTH = 1;
	private static int FREE_DATES = FREE_MONTH * 30 ;*/ // 免息期新店(开业时间到现在 < = 3个月  90 )90天 老店 (开业时间到现在  > 3个月  90 ) 30天

	private static int NOT_COUNT = 2; // 不符合计算利息的标记
	private static int IS_COUNT = 1; // 符合计算利息的标记

	private static int IS_PAYALL = 2;// 全部结清

	/*
	 * type 为 1 计算到当前 2 计算上个月 
	 * 一 之前没有结算过的 paymoney_date 为null
	 *  二 之前结算过paymoney_date 有值 调用计息方法开始
	 */
	public static PayCarTemp getSumMoney(CarFinanceDto pojo, int type) throws Exception{
		PayCarTemp temp = new PayCarTemp();
		if(null!=pojo && null!=pojo.getIssale() && 1 == pojo.getIssale()){ // 先判断是否需要计算利息 。排除到  是卖的车
			temp.setSumMoney(new BigDecimal("0"));
			temp.setIscount(NOT_COUNT);
			return temp;
		}
		if (null != pojo.getPaymoneyDate()) { // 这是之前结算过的 可以不考虑免息
			if (null != pojo.getPayEndDate()) {
				temp = getSumNoFreeAndHaveEndDate(pojo, type);
			} else {
				temp = getSumNoFreeAndNotEndDate(pojo, type);
			}

		} else {  // 考虑免息
			if (null != pojo.getPayEndDate()) {

				temp = getSumFreeAndHaveEndDate(pojo, type);

			} else {
				temp = getSumFreeAndNotEndDate(pojo, type);

			}
		}
		return temp;
	}

	/*
	 * 一 ，之前没有结算过的 paymoney_date 为null 
	 * 一 ，车没有被运走 一直在 PayEndDate 为null 
	 * 需要判断免息期等 。 给一条记录 算出 到当前时间的 利息
	 */
	public static PayCarTemp getSumFreeAndNotEndDate(CarFinanceDto dto, int type) throws Exception {
	    int FREE_DATES  = getFreeDays(dto);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		PayCarTemp temp = new PayCarTemp();
		Date currentDate = new Date();  // 当前日期
		Date type2enddate = null;
		try {
			type2enddate = sdf.parse(DateTimeUtil.getLastDayOfNextMonth(currentDate, "yyyy-MM-dd", 0));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}

		/*Date shopCreateDate = null;
		try {
			// 先判断是否属于某个组的 如果是的话就查询组中 最早店的开业时间 计算 而不是这家店的开业时间 不属于组的话 就直接按店的时间    废弃了 2018-5-17 新需求 根据门店 不根据组了
		//	shopCreateDate = sdf.parse(sdf.format(dto.getShopTermFirstCreateDate()));
			shopCreateDate = sdf.parse(sdf.format(dto.getShopCreateTime()));
		} catch (ParseException e) {
			e.printStackTrace();
		}*/

	//	long days = DateTimeUtil.dayDiff(shopCreateDate, dto.getPayStartDate()) + 1;
		// 车 进店到店开业 的天数 

		long diffdays = 0;

		if (1 == type) {// 当前
			diffdays = DateTimeUtil.dayDiff(dto.getPayStartDate(), currentDate) + 1;
			// 车 从 现在到进店的 天数

		} else {// 上个月
			diffdays = DateTimeUtil.dayDiff(dto.getPayStartDate(), type2enddate) + 1;
			// 车 从 上个月最后一天到进店的 天数
			temp.setPayEndDate(type2enddate);
			temp.setPayStartDate(dto.getPayStartDate());
		}
		long sumdays = diffdays;

		if (diffdays < 0) {
			sumdays = 0;
			temp.setIscount(NOT_COUNT);
			temp.setFreeDays(0);
			temp.setNotFreeDays(0);
			temp.setSumMoney(new BigDecimal("0"));
			return temp;
		} else {
				if (diffdays - FREE_DATES >= 0) {
					sumdays = diffdays - FREE_DATES ;
					temp.setIscount(IS_COUNT);
					temp.setFreeDays(FREE_DATES);
					temp.setNotFreeDays((int) sumdays);
					temp.setSumMoney(new BigDecimal("0"));
				} else {
					sumdays = 0;
					temp.setIscount(NOT_COUNT);
					temp.setFreeDays((int)diffdays);
					temp.setNotFreeDays(0);
					temp.setSumMoney(new BigDecimal("0"));
					return temp;
				}
		}
		double INTEREST_YEARS_ALL_DAYS = BigDecimalTool.div(YEARS_ALL_DAYS, INTEREST);
		double sum1 = new BigDecimal(dto.getSettlementprice()).multiply(new BigDecimal(sumdays)).doubleValue();  // 结算价*天数
		double sum2 = BigDecimalTool.mul(sum1, INTEREST_YEARS_ALL_DAYS);
		BigDecimal sum = new BigDecimal(BigDecimalTool.round(sum2, 2));  // 小数点后保留2位小数 并且四舍五入
		temp.setSumMoney(sum);
		return temp;
	}

	/*
	 * 一 ，之前没有结算过的 paymoney_date 为null
	 *  一 ，车有被运走 PayEndDate 不为null
	 *   需要判断免息期等 。 给一条记录 算出 到当前时间的 利息
	 */
	public static PayCarTemp getSumFreeAndHaveEndDate(CarFinanceDto dto, int type)throws Exception {
		int FREE_DATES  = getFreeDays(dto);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		PayCarTemp temp = new PayCarTemp();
		Date currentDate = new Date();  // 当前日期
		Date payStartDate =  dto.getPayStartDate();// 进店店时间   算利息的第一天
		Date payEndDate= dto.getPayEndDate(); // 移出店时间   算利息的最后一天
		Date type2enddate = null;
		try {
			type2enddate = sdf.parse(DateTimeUtil.getLastDayOfNextMonth(currentDate, "yyyy-MM-dd", 0));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}

		/*Date shopCreateDate = null;
		try {
			// 先判断是否属于某个组的 如果是的话就查询组中 最早店的开业时间 计算 而不是这家店的开业时间 不属于组的话 就直接按店的时间
			//shopCreateDate = sdf.parse(sdf.format(dto.getShopTermFirstCreateDate()));
			shopCreateDate = sdf.parse(sdf.format(dto.getShopCreateTime()));
		} catch (ParseException e) {
			e.printStackTrace();
		}*/
		long diffdays;

		if (1 == type) {// 当前
			diffdays = DateTimeUtil.dayDiff(payStartDate, payEndDate) + 1;
			// 车 从 出店 到进店的 天数

		} else {// 上个月
				// 先比较 出店日期和 上个月最后一天
			long diffdaystemp = DateTimeUtil.dayDiff(payEndDate, type2enddate);
			if (diffdaystemp < 0) {  // 最后日期为 type2enddate 月底之后移走的
				temp.setPayEndDate(type2enddate);// 进店的日期 为开始计算利息的日期
				// 计算利息的天数 最后一天 - 入店
				diffdays = DateTimeUtil.dayDiff(payStartDate, type2enddate) + 1;
				
				temp.setPayStartDate(payStartDate);
			} else { // 月底之前移 走的 算利息的最后一天是 移走之日了
						// 移入店的日期和上个月一号比较 大于0 开始日期为 移入店的时间
				temp.setPayEndDate(payEndDate);
				diffdays = DateTimeUtil.dayDiff(payStartDate, payEndDate) + 1; 	// 进店时间 到最后一天
			
				temp.setPayStartDate(payStartDate);
				temp.setIspayall(IS_PAYALL);
			}

		}
		long sumdays = diffdays;

		if (diffdays < 0) {
			sumdays = 0;
			temp.setIscount(NOT_COUNT);
			temp.setFreeDays(0);
			temp.setNotFreeDays(0);
			temp.setSumMoney(new BigDecimal("0"));
			return temp;
		} else {
				if (diffdays - FREE_DATES  >= 0) {
					sumdays = diffdays - FREE_DATES ;
					temp.setIscount(IS_COUNT);
					temp.setFreeDays((int) (FREE_DATES));
					temp.setNotFreeDays((int) sumdays);
				} else {
					sumdays = 0;
					temp.setIscount(NOT_COUNT);
					temp.setFreeDays((int)diffdays);
					temp.setNotFreeDays(0);
					temp.setSumMoney(new BigDecimal("0"));
					return temp;
				}
			
		}
		double INTEREST_YEARS_ALL_DAYS = BigDecimalTool.div(YEARS_ALL_DAYS, INTEREST);
		double sum1 = new BigDecimal(dto.getSettlementprice()).multiply(new BigDecimal(sumdays)).doubleValue();  // 结算价*天数
		double sum2 = BigDecimalTool.mul(sum1, INTEREST_YEARS_ALL_DAYS);
		BigDecimal sum = new BigDecimal(BigDecimalTool.round(sum2, 2));  // 小数点后保留2位小数 并且四舍五入
		temp.setSumMoney(sum);
		return temp;
	}

	/*
	 * 之前结算过的 paymoney_date(结算之后下一个开始计息日期) 不为null 一 ，车没有被运走 一直在 PayEndDate 为null 给一条记录 算出 到当前时间的 利息
	 */
	public static PayCarTemp getSumNoFreeAndNotEndDate(CarFinanceDto dto, int type) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		PayCarTemp temp = new PayCarTemp();
		Date currentDate = new Date();  // 当前日期
		Date paystartdate = dto.getPaymoneyDate();  // 付款后下一个计息开始日期
		// Date payenddate =dto.getPayEndDate(); // 车 移出店日期
		Date type2startdate = null;
		Date type2enddate = null;
		try {
			type2startdate = sdf.parse(DateTimeUtil.getFirstDayOfNextMonth(currentDate, "yyyy-MM-dd", -1));
			type2enddate = sdf.parse(DateTimeUtil.getLastDayOfNextMonth(currentDate, "yyyy-MM-dd", 0));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}

		long diffdays = 0;

		if (1 == type) {// 当前
			diffdays = DateTimeUtil.dayDiff(paystartdate, currentDate) + 1;// 车 从 出店 到进店的 天数
		} else {// 上个月
				// 先比较 出店日期和 上个月最后一天
				// 最后日期为 type2enddate 月底之后移走的
			int days1 = (int) DateTimeUtil.dayDiff(type2startdate, paystartdate);
			int days2 = (int) DateTimeUtil.dayDiff(type2enddate, paystartdate);
			if (days2 > 0) { // 说明已结算过
				diffdays = 0;
				temp.setIscount(NOT_COUNT);
				temp.setPayStartDate(paystartdate);
				temp.setPayEndDate(type2enddate);
				temp.setSumMoney(new BigDecimal("0"));
				return temp;
			} else if (days1 < 0) { // 说明 上上个月结算过。上个月没有结算 所以要一起结算
				// 计息开始日期 是 paystartdate 因为结算过
				temp.setPayEndDate(type2enddate);
				diffdays = DateTimeUtil.dayDiff(paystartdate, type2enddate) + 1;// 就算利息的天数 最后一天 - 入店
				temp.setPayStartDate(paystartdate);
			}
		}
		long sumdays = diffdays;
		double INTEREST_YEARS_ALL_DAYS = BigDecimalTool.div(YEARS_ALL_DAYS, INTEREST);
		double sum1 = new BigDecimal(dto.getSettlementprice()).multiply(new BigDecimal(sumdays)).doubleValue();  // 结算价*天数
		double sum2 = BigDecimalTool.mul(sum1, INTEREST_YEARS_ALL_DAYS);
		BigDecimal sum = new BigDecimal(BigDecimalTool.round(sum2, 2));  // 小数点后保留2位小数 并且四舍五入
		temp.setSumMoney(sum);
		temp.setFreeDays(0);
		temp.setNotFreeDays((int) sumdays);
		return temp;

	}

	/*
	 * 之前结算过的 paymoney_date(结算之后下一个开始计息日期) 不为null 一 ，车有被运走 PayEndDate 不为null 给一条记录 算出 到当前时间的 利息
	 */
	public static PayCarTemp getSumNoFreeAndHaveEndDate(CarFinanceDto dto, int type) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		PayCarTemp temp = new PayCarTemp();
		Date currentDate = new Date();  // 当前日期
		Date paystartdate = dto.getPaymoneyDate();  // 付款后下一个计息开始日期
		Date payenddate = dto.getPayEndDate();  // 车 移出店日期
		Date type2startdate = null;
		Date type2enddate = null;
		try {
			type2startdate = sdf.parse(DateTimeUtil.getFirstDayOfNextMonth(currentDate, "yyyy-MM-dd", -1));
			type2enddate = sdf.parse(DateTimeUtil.getLastDayOfNextMonth(currentDate, "yyyy-MM-dd", 0));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}

		long diffdays;

		if (1 == type) {// 当前
			diffdays = DateTimeUtil.dayDiff(paystartdate, payenddate) + 1;// 车 从 出店 到进店的 天数

		} else {// 上个月
				// 先比较 出店日期和 上个月最后一天
			long diffdaystemp = DateTimeUtil.dayDiff(payenddate, type2enddate);
			if (diffdaystemp < 0) {  // 最后日期为 type2enddate 月底之后移走的
				// 计息开始日期 都是 上个月一号 因为结算过
				temp.setPayEndDate(type2enddate);
				diffdays = DateTimeUtil.dayDiff(type2startdate, type2enddate) + 1;
				// 就算利息的天数 最后一天 -// 入店
				temp.setPayStartDate(type2startdate);
			} else { // 月底之前移 走的 算利息的最后一天是 移走之日了
						// 计息开始日期 都是 上个月一号 因为结算过
				temp.setPayEndDate(payenddate);
				diffdays = DateTimeUtil.dayDiff(type2startdate, payenddate) + 1; // 进店时间 到最后一天
				temp.setPayStartDate(type2startdate);
				temp.setIspayall(IS_PAYALL);
			}

		}
		long sumdays = diffdays;

		double INTEREST_YEARS_ALL_DAYS = BigDecimalTool.div(YEARS_ALL_DAYS, INTEREST);
		double sum1 = new BigDecimal(dto.getSettlementprice()).multiply(new BigDecimal(sumdays)).doubleValue();  // 结算价*天数
		double sum2 = BigDecimalTool.mul(sum1, INTEREST_YEARS_ALL_DAYS);
		BigDecimal sum = new BigDecimal(BigDecimalTool.round(sum2, 2));  // 小数点后保留2位小数 并且四舍五入
		temp.setSumMoney(sum);
		temp.setFreeDays(0);
		temp.setNotFreeDays((int) sumdays);
		return temp;
	}
	
	
	
	
	/*

	 * 返回免息期的天数   
	 *    免息期     新店(开业时间到车进店 < = 3个月  90 )  90天 老店 (开业时间到车进店 > 3个月  90 ) 30天   之前的逻辑  已废除
	 *    在  newtime 和  oldtime  直接进店的 免息期到 oldtime   。不在这个区间也就是进店时间> oldtime  免息期  为 30天
	 */
	public static int  getFreeDays(CarFinanceDto dto) {
		int shopfreedays = 0;
		Date shopOldtime = dto.getOldtime();
		if(null ==shopOldtime){
			throw new IllegalArgumentException(" 门店的免息结束时间不能为空 ");
	
		}else{
			int infreedays  = (int) DateTimeUtil.dayDiff(dto.getPayStartDate(),shopOldtime);
			if(infreedays >= 0){ // 在免息区间。
				shopfreedays = infreedays+1;
			}else{
				shopfreedays = 30;
			}
			
		}
		return shopfreedays ;
	
	}
		

}
