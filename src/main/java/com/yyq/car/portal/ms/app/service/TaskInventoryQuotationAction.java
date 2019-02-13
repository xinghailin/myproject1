
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
import com.yyq.car.portal.common.mapper.biz.InventoryQuotationMapper;
import com.yyq.car.portal.common.model.biz.InventoryQuotation;
import com.yyq.car.portal.ms.web.controller.InventoryQuotationController;
/**
 * <P>每日库存报价    人工没有添加时候 用定时任务 把上一天的数据拉过来</P>
 * @author liliang 
 * 2018-04-25
 * 定时任务 每日库存报价
 */
 @Service
 @Lazy(value = false)
public class TaskInventoryQuotationAction {
	@Autowired
	private InventoryQuotationService inventoryQuotationService;
	@Autowired
	private InventoryQuotationMapper inventoryQuotationMapper;

	
	private static final Logger log = LoggerFactory.getLogger(InventoryQuotationController.class);

	/**
	 * 定时任务 每日库存报价
	 * @param 
	 * @param 
	 * @param 
	 * @return
	 * @author liliang
	 */
	@Scheduled(cron = "0 0 1 * * ? ")
	public void taskInventoryQuotationAct() {
		log.info("定时任务...........  每日库存报价  开始........taskInventoryQuotationAct start...");
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		Date currentDate = null;
		try {
		   currentDate = sdf.parse(sdf.format(d));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		InventoryQuotation entity = new InventoryQuotation();
		entity.setQuoteDate(currentDate);
		List<InventoryQuotation> listByCurrentDate = inventoryQuotationMapper.selectByCriteria(entity);
		if(null != listByCurrentDate && listByCurrentDate.size()>0){//说明当天有值， 不用定时添加记录
			log.info("定时任务...........  每日库存报价  数据库中已存在 不用执行方法......");
		}else{
			List<InventoryQuotation> listOld = inventoryQuotationMapper.selectByMaxDate();
			if(null!=listOld && listOld.size()>0 ){
				try {
					inventoryQuotationService.taskSaveInventoryQuotationList(listOld);
				} catch (Exception e) {
					log.error("定时任务...........  每日库存报价  保存出错了。。。。");
					e.printStackTrace();
				}
			}
			
		}
		
		
		log.info("定时任务...........  每日库存报价   结束........taskInventoryQuotationAct end...");
		
	}

	
	
	

}
