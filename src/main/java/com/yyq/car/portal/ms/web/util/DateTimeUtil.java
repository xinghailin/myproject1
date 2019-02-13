package com.yyq.car.portal.ms.web.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateTimeUtil {

	/**
	 * 返回给定日期+day天的 日期
	 */

	public static Date getDateBefore(Date d, int day) {
		Calendar now = Calendar.getInstance();
		Date formdate = null;
		now.setTime(d);
		now.set(Calendar.DATE, now.get(Calendar.DATE) + day);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		try {
			formdate = sdf.parse(sdf.format(now.getTime()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return formdate;
	}

	/**
	 * 返回给定日期+day天的 日期
	 */

	public static String getDateStringBefore(Date d, int day) {
		Calendar now = Calendar.getInstance();
		String formdate;
		now.setTime(d);
		now.set(Calendar.DATE, now.get(Calendar.DATE) + day);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		formdate = sdf.format(now.getTime());
		System.out.println(formdate);
		return formdate;
	}

	/**
	 * 获取指定日期  指定月的 的第一天
	 * @param dateStr
	 * @param format
	 * @return
	 */
	public static String getFirstDayOfNextMonth(Date date, String format, int month) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		try {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(Calendar.MONTH, month);
			calendar.set(Calendar.DAY_OF_MONTH, 1);
			return sdf.format(calendar.getTime());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 获取指定日期  指定月的  的最后一天
	 * @param dateStr
	 * @param format
	 * @return
	 */
	public static String getLastDayOfNextMonth(Date date, String format, int month) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		try {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(Calendar.MONTH, month);
			calendar.set(Calendar.DAY_OF_MONTH, 0);
			return sdf.format(calendar.getTime());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	/** 
	 * @descript:计算两个字符串日期相差的天数 
	 * @param date1  日期1 
	 * @param date2  日期2 
	 * @param format 日期格式化方式  format="yyyy-MM-dd" 
	 * @return 
	 */
	public static long dayDiff(Date start, Date end) {
		long diff = 0l;

		try {
			long d1 = start.getTime();
			long d2 = end.getTime();
			diff = (d2 - d1) / (1000 * 60 * 60 * 24);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return diff;
	}

	public static void main(String[] args) throws ParseException {
		Date date = new Date(); // 新建一个日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年MM月dd日"); // 格式化日期
		SimpleDateFormat sdf11 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 格式化日期
		 System.out.println(sdf.format(getDateBefore(date, -90))+"...");
	//	 getDateStringBefore(date, -3);
		 Date date1 = DateTimeUtil.getDateBefore(date, 3);
		 System.out.println(sdf.format(date1));
		// String beforeDate = sdf.format(getDateBefore(date, -3));
		// String beforeDate = sdf.format(getDateBefore(sdf.parse("2018-06-22"), -3));
		// System.out.println(beforeDate);
		 
		 
		 List<String> dates = new ArrayList<String>();
		 for (int i = 1; i < 11; i++) {
				int days = i * 365 -90;
				Date querydate = DateTimeUtil.getDateBefore(date,days);
               String datetime = sdf.format(querydate);
				dates.add(datetime);
			}
		 
		System.out.println(("日期...."+dates.toString()));
		// System.out.println(sdf1.format(date));

		// System.out.println(getFirstDayOfNextMonth(date,"yyyy-MM-dd",-1));
		//System.out.println(getLastDayOfNextMonth(date, "yyyy-MM-dd", 0));

		 System.out.println(".."+dayDiff(sdf.parse("2018-05-03"),sdf.parse("2018-05-02")));

		// System.out.println(sdf11.format(new Date()));
	
	}

}
