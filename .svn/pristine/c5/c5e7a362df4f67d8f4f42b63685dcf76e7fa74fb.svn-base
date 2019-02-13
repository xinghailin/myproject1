package com.yyq.car.portal.ms.web.constant;

public enum RoleEnum {

	ROLE_ADMIN(1, "ROLE_ADMIN", "管理员角色"), ROLE_HQ_FINANCE(2, "ROLE_HQ_FINANCE", "总部财务角色"), ROLE_HQ_CAR(3, "ROLE_HQ_CAR", "总部车辆部门角色"), ROLE_SHOP(4, "ROLE_SHOP",
			"门店角色"), ROLE_SHOP_SELLER(5, "ROLE_SHOP_SELLER", "门店销售角色"), ROLE_TRANSPORT(6, "ROLE_TRANSPORT", "物流运输角色");

	private Integer value;
	private String name;
	private String explain;// 角色备注

	private RoleEnum(Integer value, String name, String explain) {
		this.value = value;
		this.name = name;
		this.explain = explain;
	}

	public static RoleEnum getRoleEnum(Integer value) {
		for (RoleEnum e : RoleEnum.values()) {
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

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

}
