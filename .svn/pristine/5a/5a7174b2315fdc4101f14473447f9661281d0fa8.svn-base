package com.yyq.car.portal.ms.web.constant;

public enum StoreStatusEnum {

	HAVESTORE(1, "已入库"), NOSTORE(2, "未入库"), AUDIT(3, "入库审核中"), SPECIAL(6, "特殊值用于查询状态为2、3的");

	private Integer value;
	private String name;

	private StoreStatusEnum(Integer value, String name) {
		this.value = value;
		this.name = name;
	}

	public static StoreStatusEnum getStoreStatusEnum(Integer value) {
		for (StoreStatusEnum e : StoreStatusEnum.values()) {
			if (e.value.equals(value)) {
				return e;
			}
		}
		return null;
	}

	public Integer getValue() {
		return value;
	}

	public String getName() {
		return name;
	}

}
