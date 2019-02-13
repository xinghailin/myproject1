package com.yyq.car.portal.ms.web.util.kbcar;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import com.yyq.car.portal.common.model.kr.Krcar;
import com.yyq.car.portal.ms.web.util.DateTimeUtil;

public class KrcardaysUtil {
	/**
	* 计算超时天数
	*  入库时间  和 库融池借贷时间比较
	*  入库时间<库融池借贷时间    按库融池借贷时间 为入库时间     说明 提前入库
	*  入库时间>库融池借贷时间    按入库时间      说明 最近入库的
	*  超时天数  =  90-(当前时间 - 入库时间)
	* @author liliang
	 * @throws ParseException 
	*/
	public static int diffdays(Krcar car) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		Date intime = null;
		Date loantime = null ;
		try {
			intime = sdf.parse(sdf.format(car.getIntime()));
			loantime = sdf.parse(sdf.format(car.getLoantime()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date now = new Date();
		int days = 0;
		if (null != loantime) {
			long diff = DateTimeUtil.dayDiff(intime, loantime);
			if (diff >= 0) {
				days = 90 - (int) DateTimeUtil.dayDiff(loantime, now) - 1;
			} else {
				days = 90 - (int) DateTimeUtil.dayDiff(intime, now) - 1;
			}
		} 
		return days;
	}
	

}
