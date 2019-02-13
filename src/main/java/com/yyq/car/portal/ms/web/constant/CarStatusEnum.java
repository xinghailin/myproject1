package com.yyq.car.portal.ms.web.constant;

public enum CarStatusEnum {
	// 1库存中 2移库中 3门店锁定 4销售锁定 5已销售

	INSTORE(1, "库存中"), ONTHEWAY(2, "移库中"), SHOPLOCK(3, "已移库门店");// , SELLLOCK(4, "销售锁定"), SELLED(5,
																// "已销售");

	private Integer value;
	private String name;

	private CarStatusEnum(Integer value, String name) {
		this.value = value;
		this.name = name;
	}

	public static CarStatusEnum getCarStatusEnum(Integer value) {
		for (CarStatusEnum e : CarStatusEnum.values()) {
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
