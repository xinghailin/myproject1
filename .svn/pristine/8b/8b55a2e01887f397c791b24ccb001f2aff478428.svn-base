package com.yyq.car.portal.ms.web.constant;

public enum CarSaleStatusEnum {
	// 新需求：
	// 销售状态：1、购车锁定（选完车后） 2、购车物流中（定金审核通过）3、已销未提（尾款审核通过）4、已销已提（出库材料备好）

	BUY_LOCK(1, "购车锁定（选完车后）"), BUY_LOGIS(2, "购车物流中（定金审核通过）"), SALE_NO_OUT(3, "已销未提（尾款审核通过）"), SELL_YES_OUT(4, "已销已提（出库材料备好）");

	private Integer value;
	private String name;

	private CarSaleStatusEnum(Integer value, String name) {
		this.value = value;
		this.name = name;
	}

	public static CarSaleStatusEnum getCarSaleStatusEnum(Integer value) {
		for (CarSaleStatusEnum e : CarSaleStatusEnum.values()) {
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
