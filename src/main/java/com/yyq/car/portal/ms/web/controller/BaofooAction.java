package com.yyq.car.portal.ms.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.yyq.car.portal.ms.web.util.paybaofu.util.FormatUtil;
import com.yyq.car.portal.ms.web.util.paybaofu.util.PathUtil;

 /*
  * 此 Filter 用于加载 支付接口中的密钥公钥
  * */
public class BaofooAction implements Filter {
	private Logger log = LoggerFactory.getLogger(BaofooAction.class);
	/** constants:系统常量 */
	private static final Map<String, String> constants = new HashMap<String, String>();
	/** charSet:默认编码 */
	public static String charSet = "GBK";
	public static String charSet_Def = "UTF-8";
	public static String contextPath;
	public static String WebRoot;

	private static int contextPathLength;



	public void init(FilterConfig filterConfig) throws ServletException {   
		this.loadPropertyFile(filterConfig.getInitParameter("propertyFile"), constants);
		log.info("====加载配置文件[" + constants.toString() + "]====");//加载配置文件时请隐藏敏感信息
		charSet = FormatUtil.isEmpty(constants.get("char.set")) ? charSet : constants.get("char.set");
		contextPath = filterConfig.getServletContext().getContextPath();
		WebRoot = filterConfig.getServletContext().getRealPath("/");
		log.info("====根目录："+WebRoot);
		contextPathLength = (contextPath == null || "/".equals(contextPath) ? 0 : contextPath.length());
		log.info("====初始化完成====");
	}

	

	public void destroy() {

	}

	public void loadPropertyFile(String file, Map<String, String> constants) {
		if (FormatUtil.isEmpty(file)) {
			log.error("[警告]未设置配置文件：propertyFile");
		}
		int index = file.indexOf(":");
		String propPath = "";
		if (index < 0){
			propPath = PathUtil.getWebRootPath() + "/" + ((file.charAt(0) == '/') || (file.charAt(0) == '\\') ? "WEB-INF" : "") + file;
                }else if (file.substring(0, index).equalsIgnoreCase("classpath")){
			propPath = PathUtil.getRootClassPath() + "/" + file.substring(index + 1, file.length());
                }else if (file.substring(0, index).equalsIgnoreCase("file")) {
			propPath = "/" + file.substring(index + 1, file.length());
		}
		propPath = propPath.replaceAll("\\\\", "/");
		propPath = propPath.replaceAll("/+", "/");
		try {
			InputStream is = new FileInputStream(new File(propPath));
			Properties prop = new Properties();
			prop.load(is);
			for (Entry<Object, Object> entry : prop.entrySet()) {
				constants.put(entry.getKey().toString(), entry.getValue().toString());
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}



	public static Map<String, String> getConstants() {
		return constants;
	}
	public static String getContextPath() {
		return contextPath;
	}
	public static String getWebRoot() {
		return WebRoot;
	}



	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2) throws IOException,
			ServletException {
		// TODO Auto-generated method stub
		
	}
}
