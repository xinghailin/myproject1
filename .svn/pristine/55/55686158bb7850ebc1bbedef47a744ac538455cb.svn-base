
package com.yyq.car.portal.ms.app.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.mapper.biz.ProcurementWeeklyQuotationMapper;
import com.yyq.car.portal.common.model.biz.ProcurementWeeklyQuotation;
import com.yyq.car.portal.ms.web.controller.InventoryQuotationController;
/**
 * <P>每周采购报价    人工没有添加时候 用定时任务 把上周一的数据拉过来</P>
 * @author liliang 
 * 2018-04-25
 * 定时任务 每周一触发一次
 */
 @Service
 @Lazy(value = false)
public class TaskProcurementWeeklyAction {
	@Autowired
	private ProcurementWeeklyService procurementWeeklyService;
	@Autowired
	private ProcurementWeeklyQuotationMapper procurementWeeklyQuotationMapper;

	
	private static final Logger log = LoggerFactory.getLogger(InventoryQuotationController.class);

	/**
	 * 定时任务 每日库存报价
	 * @param 
	 * @param 
	 * @param 
	 * @return
	 * @author liliang
	 */
	@Scheduled(cron = "0 0 1 ? * MON")
	public void taskProcurementWeeklyAct() {
		log.info("定时任务...........  每周采购报价  开始........taskProcurementWeeklyAct start...");
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		Date currentDate = null;
		try {
		   currentDate = sdf.parse(sdf.format(d));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		ProcurementWeeklyQuotation entity = new ProcurementWeeklyQuotation();
		entity.setQuoteDate(currentDate);
		List<ProcurementWeeklyQuotation> listByCurrentDate = procurementWeeklyQuotationMapper.selectByCriteria(entity);
		if(null != listByCurrentDate && listByCurrentDate.size()>0){//说明当天有值， 不用定时添加记录
			log.info("定时任务...........  每周采购报价  数据库中已存在 不用执行方法......");
		}else{
			List<ProcurementWeeklyQuotation> listOld = procurementWeeklyQuotationMapper.selectByMaxDate();
			if(null!=listOld && listOld.size()>0 ){
				try {
					procurementWeeklyService.taskSaveProcurementWeeklyList(listOld);
				} catch (Exception e) {
					log.error("定时任务...........  每周采购报价  保存出错了。。。。");
					e.printStackTrace();
				}
			}
			
		}
		
		
		log.info("定时任务...........  每周采购报价   结束........taskProcurementWeeklyAct end...");
		
	}

	
	
	

}
