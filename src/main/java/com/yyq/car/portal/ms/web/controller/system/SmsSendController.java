package com.yyq.car.portal.ms.web.controller.system;

import java.util.ArrayList;
import java.util.List;
//import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yyq.car.portal.common.service.async.sms.BatchSmsSendService;
import com.yyq.car.portal.common.util.ValidationUtils;
import com.yyq.car.portal.ms.web.constant.Url;
import com.yyq.car.portal.ms.web.constant.View;


/**
 * <P>短信发送</P>
 * @author nj
 */
@Controller
public class SmsSendController {
	@Autowired
	private BatchSmsSendService sendService;

	/**
	 * <p>跳转短信群发页面</p>
	 * @return
	 * @author nj
	 */
	@RequestMapping(value = Url.SMS_BATCH_SEND_PAGE, method = RequestMethod.GET)
	public String tobatchSendPage() {
		return View.SMS_BATCH_SEND;
	}

	/**
	 * <p>发送短信</p>
	 * @param mobileStr
	 * @param content
	 * @author nj
	 */
	@RequestMapping(value = Url.SMS_BATCH_SEND, method = RequestMethod.POST)
	public void sendSms(String mobileStr, String content, ModelMap model) {
		String[] mobileArray = mobileStr.split(";");
		if (mobileArray == null || mobileArray.length == 0) {
			model.addAttribute("status", 0);
			model.addAttribute("message", "请输入手机号");
			return;
		}
		List<String> mobileList = new ArrayList<String>();
		for (int i = 0; i < mobileArray.length; i++) {
			String mobile = mobileArray[i];
			// 手机号验证
			if (!ValidationUtils.isMobile(mobile)) {
				model.addAttribute("status", 0);
				model.addAttribute("message", "输入的手机号格式有误，无法发送短信！");
				return;
			}
			mobileList.add(mobile);
		}
		if (mobileList.size() > 0) {
			sendService.process(mobileList, content);
		}
		model.addAttribute("status", 1);
		model.addAttribute("message", "短信发送成功");
		return;
	}
}
