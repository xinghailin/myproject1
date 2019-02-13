package com.yyq.car.portal.ms.web.constant;

public enum CaseStepEnum {

	/*
	 * 状态： 1、风控提交 2、法务接收材料（我司资产二抵、其他时没此状态） 3、立案 4、确定开庭时间 5、判决 6、是否二审 7、二审开庭时间 8、二审判决 9、申请执行 10、执行结果
	 */
	risksubmit(1, "风控提交"), lawreceivematerial(2, "法务接收材料"), savecase(3, "立案"), surecourttime(4, "确定开庭时间"), judge(5, "判决"), issecondaudit(6, "是否二审"), secondeaudittime(
			7, "确定二审开庭时间"), secondjudge(8, "二审判决"), applyexecute(9, "申请执行"), executeresult(10, "执行结果");

	private Integer value;
	private String name;

	private CaseStepEnum(Integer value, String name) {
		this.value = value;
		this.name = name;
	}

	public static CaseStepEnum getCarStatusEnum(Integer value) {
		for (CaseStepEnum e : CaseStepEnum.values()) {
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
