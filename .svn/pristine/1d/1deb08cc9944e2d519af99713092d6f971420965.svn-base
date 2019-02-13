
package com.yyq.car.portal.ms.app.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.model.kr.Krpool;
/**
 * <P>北汽库融车  每天更新 倒计时时间</P>
 * @author liliang 
 * 2018-04-25
 * 定时任务 每日更新 北汽库融车 倒计时时间
 */
 @Service
 @Lazy(value = false)
public class TaskKbCarAction {
	@Autowired
	private TaskKbCarService taskKbCarService;

	
	private static final Logger log = LoggerFactory.getLogger(TaskKbCarAction.class);

	/**
	 * 定时任务 每日更新 北汽库融车 倒计时时间
	 * @param 
	 * @return
	 * @author liliang
	 */
	@Scheduled(cron = "0 5 0 * * ? ")
	public void taskKbCarAct() {
		log.info("定时任务........... 定时任务 每日更新 北汽库融车 倒计时时间  开始........taskKbCarAct start...");
		 List<Krpool> listkrpool = taskKbCarService.loodKrpoollist();
		 log.info("库融 数量为"+listkrpool.size());
		if (null != listkrpool && listkrpool.size() > 0) {// 库融池中有list
			for(Krpool pool:listkrpool){
				try {
					taskKbCarService.updateKrcarRemaindays(pool);
				} catch (Exception e) {
					log.error("定时任务...........  更新 北汽库融车 倒计时时间  保存出错了。。。。");
					e.printStackTrace();
				}
			}
			
		}else{
			log.info("定时任务...........  库融池中没有list 不用执行方法......");
		}
		
		
		log.info("定时任务...........  更新 北汽库融车 倒计时时间    结束........taskKbCarAct end...");
		
	}

	
	
	

}
