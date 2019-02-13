package com.yyq.snakerflow.portal.ms.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;

import com.yyq.car.portal.ms.web.constant.View;


/**
 * <P>统一处理项目运行期间的运行时异常</P>
 * @author nj
 */
@ControllerAdvice
public class ExceptionController {
	private Logger logger = LoggerFactory.getLogger(ExceptionController.class);

	@ExceptionHandler(RuntimeException.class)
	// @ResponseBody
	public Object catchAllUncheckedException(HttpServletRequest request, HttpServletResponse response, RuntimeException e) {
		boolean isajax = isAjaxRequest(request);
		logger.error("捕获到运行期异常：{};ajax请求：{}", e.getMessage(), isajax);
		if (isajax) {
			JSONObject jsonObject = new JSONObject(); // 创建Json对象
			// jsonObject.put("msg", e.getMessage()); // 设置Json对象的属性
			jsonObject.put("message", e.getMessage());
			jsonObject.put("status", false);
			// return jsonObject;
			PrintWriter out = null;
			try {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json;charset=UTF-8");
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				out = response.getWriter();
				// out.write(e.getMessage());
				out.write(jsonObject.toString());
			} catch (IOException e1) {
				// // TODO Auto-generated catch block
				e1.printStackTrace();
			} finally {
				out.flush();
				out.close();
			}
			return null;
		}
		request.setAttribute("message", e.getMessage());
		return View.ERROR_MESSAGE;// return View.RUNTIME_ERROR_PAGE;
	}

	/**
	 * 
	 * <p>判断是否ajax请求</p>
	 * @param request
	 * @return
	 * @author wangzh
	 */
	public boolean isAjaxRequest(HttpServletRequest request) {
		String header = request.getHeader("X-Requested-With");
		boolean isAjax = "XMLHttpRequest".equals(header) ? true : false;
		return isAjax;
	}
}
