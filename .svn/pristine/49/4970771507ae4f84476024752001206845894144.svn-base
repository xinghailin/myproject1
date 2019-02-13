
package com.yyq.car.portal.ms.app.service;

import java.util.Date;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.yyq.car.portal.common.mapper.kr.KrcarMapper;
import com.yyq.car.portal.common.mapper.kr.KrpoolMapper;
import com.yyq.car.portal.common.model.kr.Krcar;
import com.yyq.car.portal.common.model.kr.Krpool;
import com.yyq.car.portal.ms.web.util.kbcar.KrcardaysUtil;
/**
 * <P>北汽库融车  每天更新 倒计时时间</P>
 * @author liliang 
 * 2018-04-25
 * 定时任务 每日更新 北汽库融车 倒计时时间
 */
@Service
public class TaskKbCarService {
	@Autowired
	private KrpoolMapper krpoolMapper;
	
	@Autowired
	private KrcarMapper krcarMapper;

	
	private static final Logger log = LoggerFactory.getLogger(TaskKbCarService.class);
	
	
	/**
	 * 查询所有库融池 list (正常未删除的)
	 * @param 
	 * @return
	 * @author liliang
	 */
	public List<Krpool> loodKrpoollist() {
		Krpool pool = new Krpool();
		List<Krpool> list = krpoolMapper.selectByCriteria(pool);
		return list;
	}


	/**
	 * 定时任务  更新某一个库融的所有车  的倒计时 
	 * @param 
	 * @return
	 * @author liliang
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void updateKrcarRemaindays(Krpool pool) {
		log.info("定时任务........... 定时任务 每日更新 库融车 倒计时时间  开始........updateKrcarRemaindays start...");
		Date now = new Date();
		Krcar car = new Krcar();
		car.setPoolid(pool.getId());
		Date loantime = pool.getLoantime();
		 List<Krcar> krcarlist = krcarMapper.selectByCriteria(car);
		if(null != krcarlist && krcarlist.size()>0){
			for(Krcar lookkrcar:krcarlist){
				if(1 == lookkrcar.getStatus()){
					continue;
				}
				Krcar entity = new Krcar();
				entity.setId(lookkrcar.getId());
				if (null == loantime) {
					entity.setRemainstatus(5);// 标记为为未放款
					entity.setTasktime(now);
					krcarMapper.updateByPrimaryKeySelective(entity);
				}else {
					entity.setRemainstatus(6);// 标记为为已放款
					lookkrcar.setLoantime(loantime);
					int days = KrcardaysUtil.diffdays(lookkrcar);
					entity.setRemaindays(days);
					entity.setTasktime(now);
					krcarMapper.updateByPrimaryKeySelective(entity);
				}
				
			}
			
		}else{
			log.info("定时任务...........  库融id为.."+pool.getId()+"..里面没有车 不用执行方法......");
			
		}
		
		
		log.info("定时任务...........   每日更新 库融车 倒计时时间 结束........updateKrcarRemaindays end...");
		
	}

	
	
	

}
