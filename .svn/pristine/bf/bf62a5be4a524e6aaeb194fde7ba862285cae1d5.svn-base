package com.yyq.car.portal.ms.web.constant;

public enum CarOutStatusEnum {
	// 出库状态：1、已提交购车出库申请 2、审核合同 3、审核首付中 4、已购未提 5、已购已提

	APPLY(1, "出库合同已提交"), CONTRACT_PASS(2, "总部审核合同已通过"), FIRSTPAY_PASS(3, "总部财务审核首付已通过"), CLIENT_CHECKCAR_PASS(4, "客户验车通过"), HAVE_NOTICE_FINALPAY(5, "已通知客户支付尾款"), FINALPAY_PASS(
			6, "财务审核尾款已通过（已购未提）"), CLIENT_BUYCAR_HAVEGET(7, "已购已提");

	private Integer value;
	private String name;

	private CarOutStatusEnum(Integer value, String name) {
		this.value = value;
		this.name = name;
	}

	public static CarOutStatusEnum getCarOutStatusEnum(Integer value) {
		for (CarOutStatusEnum e : CarOutStatusEnum.values()) {
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
