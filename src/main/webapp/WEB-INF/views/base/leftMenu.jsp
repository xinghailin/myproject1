<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<div class="main_left">
	<div class="nav_list">
		<ul>
			<!-- 内容查看 
			<sec:authorize access="(hasAnyRole('ROLE_MS_USER') and fullyAuthenticated) or (hasAnyRole('ROLE_SYS_ADMIN') and fullyAuthenticated) or (hasAnyRole('ROLE_SJS') and fullyAuthenticated) ">
			
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_1" class="fz_14px fc_white">会员管理 </span></div>
				<div class="navs02 hide">
					<a id="menu_1_1" href="<ufa:url namespace="decorate-portal-ms" fieldName="DEVELOPER_SUPPLIER_DESINER_DATA_TURNPAGE_URL"/>?type=1" class="navs02_a2">设计师查询</a>
					<a id="menu_1_2" href="<ufa:url namespace="decorate-portal-ms" fieldName="DEVELOPER_SUPPLIER_DESINER_DATA_TURNPAGE_URL"/>?type=2" class="navs02_a2">供应商查询</a>
					<a id="menu_1_3" href="<ufa:url namespace="decorate-portal-ms" fieldName="DEVELOPER_SUPPLIER_DESINER_DATA_TURNPAGE_URL"/>?type=3" class="navs02_a2">开发商查询</a>
					<sec:authorize access="(hasAnyRole('ROLE_MS_USER') and fullyAuthenticated) or (hasAnyRole('ROLE_SYS_ADMIN') and fullyAuthenticated) ">					
					<a id="menu_1_4" href="<ufa:url namespace="decorate-portal-ms" fieldName="CIF_INDEX"/>" class="navs02_a2">会员冻结</a>
					</sec:authorize>
				</div>
			</li>
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_11" class="fz_14px fc_white">销售顾问 </span></div>
				<div class="navs02 hide">
					<a id="menu_11_1" href="<ufa:url namespace="decorate-portal-ms" fieldName="COUNSELOR_AUTH_INDEX"/>" class="navs02_a2">实名认证</a>
					<a id="menu_11_2" href="<ufa:url namespace="decorate-portal-ms" fieldName="COUNSELOR_WITHDRAW_INDEX"/>" class="navs02_a2">提现申请审批</a>
					<a id="menu_11_3" href="<ufa:url namespace="decorate-portal-ms" fieldName="COUNSELOR_WITHDRAWHISTORY_INDEX"/>" class="navs02_a2">提现历史</a>
				</div>
			</li>
			<sec:authorize access="(hasAnyRole('ROLE_MS_USER') and fullyAuthenticated) or (hasAnyRole('ROLE_SYS_ADMIN') and fullyAuthenticated) ">					
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_2" class="fz_14px fc_white">产品管理 </span></div>
				<div class="navs02 hide">
                    <a id="menu_2_2" href="<ufa:url namespace="decorate-portal-ms" fieldName="PRODUCT_HOME_LIST_PAGE"/>" class="navs02_a2">样板房管理</a>
                    <a id="menu_2_3" href="<ufa:url namespace="decorate-portal-ms" fieldName="SCREEN_HOME_LIST_PAGE"/>" class="navs02_a2">产品陈列筛选</a> 
                    <a id="menu_2_4" href="<ufa:url namespace="decorate-portal-ms" fieldName="SHELF_HOMES_QUERY_PAGE"/>" class="navs02_a2">上架管理</a>
                    <a id="menu_2_5" href="<ufa:url namespace="decorate-portal-ms" fieldName="VIDEO_LIST_PAGE"/>" class="navs02_a2">视频管理</a>
                    <a id="menu_2_6" href="<ufa:url namespace="decorate-portal-ms" fieldName="PRODUCT_CATEGORY_LIST_PAGE"/>" class="navs02_a2">产品分类</a>
 					<a id="menu_2_7" href="<ufa:url namespace="decorate-portal-ms" fieldName="PRODCUT_FORMAL_LIBRARY"/>" class="navs02_a2">预入库产品管理</a>
 					<a id="menu_2_8" href="<ufa:url namespace="decorate-portal-ms" fieldName="PRODCUT_REAL_FORMAL_LIBRARY"/>" class="navs02_a2">正式库产品管理</a>
 				</div>
			</li>
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_3" class="fz_14px fc_white">蜡笔兔管家</span></div>
				<div class="navs02 hide">
					<a id="menu_3_1" href="<ufa:url namespace="decorate-portal-ms" fieldName="APPLYDISPLAY_HOME_LIST_PAGE"/>" class="navs02_a2">申请陈列</a>
					<a id="menu_3_2" href="<ufa:url namespace="decorate-portal-ms" fieldName="LAYOUT_HOME_LIST_PAGE"/>" class="navs02_a2">布置样板房</a>
				</div>
			</li>
 			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_4" class="fz_14px fc_white">蜡笔兔动态</span></div>
				<div class="navs02 hide">
					<a id="menu_4_1" href="<ufa:url namespace="decorate-portal-ms" fieldName="TRENDS_LIST_PAGE"/>" class="navs02_a2">动态列表</a>
				</div>
			</li>
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_10" class="fz_14px fc_white">banner管理 </span></div>
				<div class="navs02 hide">
					<a id="menu_10_1" href="<ufa:url namespace="decorate-portal-ms" fieldName="BANNER_MAIN"/>" class="navs02_a2">banner管理</a>
				</div>
			</li>
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_5" class="fz_14px fc_white">推荐管理 </span></div>
				<div class="navs02 hide">
					<a id="menu_5_1" href="<ufa:url namespace="decorate-portal-ms" fieldName="RECOMMEND_TO_MAIN"/>" class="navs02_a2">推荐</a>
					<a id="menu_5_2" href="<ufa:url namespace="decorate-portal-ms" fieldName="RECOMMENDTYPE_TO_MAIN"/>" class="navs02_a2">推荐分类</a>
				</div>
			</li>
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_9" class="fz_14px fc_white">订单管理 </span></div>
				<div class="navs02 hide">
					<a id="menu_9_1" href="<ufa:url namespace="decorate-portal-ms" fieldName="ORDER_INDEX"/>" class="navs02_a2">订单管理</a>
					<a id="menu_9_2" href="<ufa:url namespace="decorate-portal-ms" fieldName="ORDER_INDEX"/>?refund=1" class="navs02_a2">退款订单</a>
					<a id="menu_9_3" href="<ufa:url namespace="decorate-portal-ms" fieldName="ORDER_INDEX_RETURN"/>" class="navs02_a2">退货审批</a>
				</div>
			</li>
			</sec:authorize>-->
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_5" class="fz_14px fc_white">任务管理</span></div>
				<div class="navs02 hide">
					<a id="menu_5_1" href="<ufa:url namespace="car-ms" fieldName="SNAKER_TASK_LIST_PAGE"/>" class="navs02_a2">待办任务</a>
				</div>
			</li>
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_1" class="fz_14px fc_white">门店管理</span></div>
				<div class="navs02 hide">
					<a id="menu_1_1" href="<ufa:url namespace="car-ms" fieldName="SHOP_INDEX"/>" class="navs02_a2">门店管理</a>
				</div>
			</li>
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_2" class="fz_14px fc_white">车辆录入</span></div>
				<div class="navs02 hide">
					<a id="menu_2_1" href="<ufa:url namespace="car-ms" fieldName="CAR_TYPEIN"/>" class="navs02_a2">车辆录入</a>
					<a id="menu_2_2" href="<ufa:url namespace="car-ms" fieldName="CAR_TYPEIN_LST"/>" class="navs02_a2">车辆录入审核情况列表</a>
				</div>
			</li>
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_3" class="fz_14px fc_white">车辆入库审核</span></div>
				<div class="navs02 hide">
					<a id="menu_3_1" href="<ufa:url namespace="car-ms" fieldName="CAR_AUDIT_LST"/>" class="navs02_a2">车辆入库审核</a>
				</div>
			</li>
			<%-- <li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_4" class="fz_14px fc_white">购车出库</span></div>
				<div class="navs02 hide">
					<a id="menu_4_1" href="<ufa:url namespace="car-ms" fieldName="CLIENT_INFO_INDEX"/>" class="navs02_a2">提交信息表及合同</a>
				</div>
			</li> --%>
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_6" class="fz_14px fc_white">车辆总资产库列表</span></div>
				<div class="navs02 hide">
					<a id="menu_6_1" href="<ufa:url namespace="car-ms" fieldName="CAR_ASSET_LST"/>" class="navs02_a2">车辆总资产库列表</a>
					<a id="menu_6_2" href="<ufa:url namespace="car-ms" fieldName="CONTROL_REPOSITORY_LIST_PAGE"/>" class="navs02_a2">车辆移库或购车出库</a>
				</div>
			</li>
			<!-- <li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_11" class="fz_14px fc_white">工作流</span></div>
				<div class="navs02 hide">
					<a id="menu_11_1" href="snaker/leave/apply?processId=e62ff0507d024f44966728b8d67bf0f0" class="navs02_a2">请假申请</a>
					<a id="menu_11_2" href="snaker/task/active" class="navs02_a2">代办任务</a>
					
					<a id="menu_11_2" href="snaker/purshase/apply?processId=98031984512d4f55ac6a2e8cf480388e" class="navs02_a2">采购申请</a>
					<a id="menu_11_2" href="snaker/process/list" class="navs02_a2">流程定义</a>
				</div>
			</li> -->
			
			
			<sec:authorize access="(hasAnyRole('ROLE_SYS_ADMIN') and fullyAuthenticated) ">	
 			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_7" class="fz_14px fc_white">系统管理</span></div>
				<div class="navs02 hide">
					<a id="menu_7_1" href="<ufa:url namespace="car-ms" fieldName="SYS_USER_TO_QUERY_URL"/>" class="navs02_a2" target="mainFrame">用户管理</a>
					<a id="menu_7_2" href="<ufa:url namespace="car-ms" fieldName="PERMISSION_ROLE_QUERY_URL"/>" class="navs02_a2" target="mainFrame">角色管理</a>
					<a id="menu_7_3" href="<ufa:url namespace="car-ms" fieldName="PERMISSION_RESOURCE_QUERY_URL"/>" class="navs02_a2" target="mainFrame">资源管理</a>
					<a id="menu_7_4" href="<ufa:url namespace="car-ms" fieldName="SYS_BASIC_DATA_QUERY_URL"/>" class="navs02_a2" target="mainFrame">基础数据管理</a>
					<a id="menu_7_5" href="<ufa:url namespace="car-ms" fieldName="SMS_BATCH_SEND_PAGE"/>" class="navs02_a2">短信群发</a>
				</div>
			</li>
			</sec:authorize>
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_8" class="fz_14px fc_white">个人中心</span></div>
				<div class="navs02 hide">
					<a id="menu_8_1" href="<ufa:url namespace="car-ms" fieldName="PERSONAL_TO_UPDATE_PAGE_URL"/>" class="navs02_a2">修改密码</a>
					<a id="menu_8_2" href="<ufa:url namespace="car-ms" fieldName="PERSONAL_QUERY_USER_ROLE"/>" class="navs02_a2">查看权限</a>
				</div>
			</li>
			<!--</sec:authorize>-->
			
			<!--<sec:authorize access="(hasAnyRole('ROLE_DESINER') and fullyAuthenticated) ">
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_12" class="fz_14px fc_white">产品管理 </span></div>
				<div class="navs02 hide">
 					<a id="menu_12_8" href="<ufa:url namespace="decorate-portal-ms" fieldName="PRODCUT_REAL_FORMAL_LIBRARY"/>" class="navs02_a2">正式库产品管理</a>
 				</div>
			</li> 
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_13" class="fz_14px fc_white">蜡笔兔管家</span></div>
				<div class="navs02 hide">
					<a id="menu_13_1" href="<ufa:url namespace="decorate-portal-ms" fieldName="APPLYDISPLAY_HOME_LIST_PAGE"/>" class="navs02_a2">申请陈列</a>
				</div>
			</li>
			</sec:authorize>
			<sec:authorize access="(hasAnyRole('ROLE_MS_USER') and fullyAuthenticated) or (hasAnyRole('ROLE_SYS_ADMIN') and fullyAuthenticated) ">					
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_14" class="fz_14px fc_white">品牌管理 </span></div>
				<div class="navs02 hide">
 					<a id="menu_14_5" href="<ufa:url namespace="decorate-portal-ms" fieldName="SYS_BRAND_INDEX_URL"/>" class="navs02_a2">品牌管理</a>
 				</div>
			</li>
			</sec:authorize>-->
		</ul>
	</div>
</div>
<script type="text/javascript">
   	seajs.use("${scriptBasePath}/leftMenu.js");
</script>