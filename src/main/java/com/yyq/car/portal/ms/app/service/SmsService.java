package com.yyq.car.portal.ms.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yyq.car.portal.common.dto.SmsReportDTO;
import com.yyq.car.portal.common.mapper.biz.SmsReportMapper;
import com.yyq.car.portal.common.model.biz.SmsReport;
import com.yyq.car.portal.common.util.DateUtils;


/**
 * 短信  service
 * chuanglang 接口
 * <P>TODO</P>
 * @author liliang
 */
@Service
public class SmsService {
	@Autowired
	private SmsReportMapper SmsReportMapper;

	/**
	* 
	* <p>TODO</p>
	* @param SmsReport
	* @param start
	* @param pageSize
	* @return
	* @author liliang
	*/
	public Map<String, Object> findAllSmsReport(SmsReportDTO smsReportdto, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		SmsReport smsReport = new SmsReport();
		smsReport.setMobile(smsReportdto.getMobile());
		smsReport.setContenttype(smsReportdto.getContenttype());
		if (StringUtils.isNotBlank(smsReportdto.getPaydate())) {
			smsReport.setCreatetime(DateUtils.parse(smsReportdto.getPaydate(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		}
		smsReport.setSendstatus(smsReportdto.getSendstatus());
		List<SmsReport> lst = SmsReportMapper.selectByCriteria(smsReport, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int cmeet = SmsReportMapper.countByCriteria(smsReport);
		map.put("result", lst);
		map.put("total", cmeet);
		return map;
	}

}
