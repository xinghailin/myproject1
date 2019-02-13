package com.yyq.car.portal.ms.web.util;

/**
 * <p>
 * 生成状态类型枚举类
 * </p>
 *
 * @author liliang
 * @Date 2018-10-17 
 */
public enum BeanStatus {
    OK(1,"正常 "), LOSE(2,"失效"), DEL(3,"删除");

	private Integer key;
	private String value;

	

	private BeanStatus(Integer key, String value) {
		this.key = key;
		this.value = value;
	}



	public Integer getKey() {
		return key;
	}



	public String getValue() {
		return value;
	}



	public static BeanStatus getStoreStatusEnum(Integer key) {
		for (BeanStatus e : BeanStatus.values()) {
			if (e.key.equals(key)) {
				return e;
			}
		}
		return null;
	}

	

}
