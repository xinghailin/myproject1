/**
 * @author Administrator
 *
 */
package com.yyq.car.portal.ms.web.util.paybaofu.util;
import java.util.HashMap;
import java.util.Map;

import com.yyq.car.portal.ms.web.controller.BaofooAction;


public class PostParm{
	
	public static Map<String,String> GetParmStr(String txn_sub_type,String data_content){
		
		Map<String,String> HeadPostParam = new HashMap<String,String>();
		HeadPostParam.put("version", "4.0.0.2");
        HeadPostParam.put("member_id", BaofooAction.getConstants().get("member.id"));
        HeadPostParam.put("terminal_id", BaofooAction.getConstants().get("terminal.id"));
        HeadPostParam.put("txn_type", "0631");//交易子类
        HeadPostParam.put("txn_sub_type", txn_sub_type);
        HeadPostParam.put("data_type", BaofooAction.getConstants().get("data.type"));
        HeadPostParam.put("data_content", data_content);
		return HeadPostParam;
	}
}