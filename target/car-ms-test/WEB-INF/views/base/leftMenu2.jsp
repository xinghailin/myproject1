<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<div class="main_left">
	<div class="nav_list">
		<ul>
			<li>
				<div class="navs01 nav_link"><span class="span_img01"></span> <span id="menu_1" class="fz_14px fc_white">会员管理</span></div>
				<div class="navs02">
					<sec:authorize access="hasAnyRole('ROLE_MS_USER') and fullyAuthenticated">
						<a id="menu_1_1" href='<ufa:url namespace="portal-ms" fieldName="CIF_MEMBER_TO_QUERY_URL"/>' class="navs02_a1" target="mainFrame">会员查询</a>
					</sec:authorize>
					<sec:authorize access="hasAnyRole('ROLE_MS_ADMIN') and fullyAuthenticated">
						<a id="menu_1_2" href="<ufa:url namespace="portal-ms" fieldName="CIF_MEMBER_TO_IMPORT_URL"/>" class="navs02_a2">导入会员</a>
						<a id="menu_1_3" href="<ufa:url namespace="portal-ms" fieldName="CIF_MEMBER_TO_ADD_URL"/>" class="navs02_a2">添加会员</a>										
						<a id="menu_1_5" href="<ufa:url namespace="portal-ms" fieldName="CIF_MEMBER_TO_LOCK_QUERY_URL"/>" class="navs02_a2">黑名单</a>
					</sec:authorize>
				</div>
			</li>		
			<sec:authorize access="hasAnyRole('ROLE_MS_ADMIN') and fullyAuthenticated">	
			<li>
				<div class="navs01 nav_link"><span class="span_img04"></span> <span id="menu_4" class="fz_14px fc_white"> 消息管理</span></div>
				<div class="navs02 hide">
					<a id="menu_4_1" href="<ufa:url namespace="portal-ms" fieldName="MESSAGE_TEMPLATE_QUERY_URL"/>" class="navs02_a2">模板管理</a>
					<a id="menu_4_2" href="<ufa:url namespace="portal-ms" fieldName="MESSAGE_SMS_QUERY_URL"/>" class="navs02_a2">短信管理</a>
					<a id="menu_4_3" href="<ufa:url namespace="portal-ms" fieldName="MESSAGE_EMAIL_QUERY_URL"/>" class="navs02_a2">邮件管理</a>
					<a id="menu_4_4" href="<ufa:url namespace="portal-ms" fieldName="MESSAGE_SITEMESSAGE_QUERY_PAGE"/>" class="navs02_a2">站内信管理</a>
					<a id="menu_4_5" href="<ufa:url namespace="portal-ms" fieldName="MESSAGE_PHONEMESSAGE_QUERY_URL"/>" class="navs02_a2">手机推送管理</a>
					<a id="menu_4_6" href="<ufa:url namespace="portal-ms" fieldName="MESSAGE_SEND_MEMBER_QUERY_PAGE"/>" class="navs02_a2">发送信息管理</a>
					<a id="menu_4_7" href="<ufa:url namespace="portal-ms" fieldName="SYSTEM_SITEMESSAGE_LIST_URL"/>" class="navs02_a2">系统消息管理</a>
				</div>
			</li>
			</sec:authorize>
			
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_5" class="fz_14px fc_white"> 系统管理</span></div>
				<div class="navs02 hide">
					<sec:authorize access="hasAnyRole('ROLE_SYS_ADMIN') and fullyAuthenticated">
						<a id="menu_5_1" href="<ufa:url namespace="portal-ms" fieldName="SYS_USER_TO_QUERY_URL"/>" class="navs02_a2" target="mainFrame">用户管理</a>
						<a id="menu_5_3" href="<ufa:url namespace="portal-ms" fieldName="PERMISSION_ROLE_QUERY_URL"/>" class="navs02_a2" target="mainFrame">角色管理</a>
						<a id="menu_5_4" href="<ufa:url namespace="portal-ms" fieldName="PERMISSION_RESOURCE_QUERY_URL"/>" class="navs02_a2" target="mainFrame">资源管理</a>
						<a id="menu_5_5" href="<ufa:url namespace="portal-ms" fieldName="SYS_BASIC_DATA_QUERY_URL"/>" class="navs02_a2" target="mainFrame">基础数据管理</a>
						<a id="act_3" href="<ufa:url namespace="portal-ms"   fieldName="ACTIVITY_AREA_QUERY_URL"/>"   class="navs02_a2"  target="mainFrame">活动地区管理</a>
					</sec:authorize>
					<a id="menu_8_1" href="<ufa:url namespace="portal-ms" fieldName="PERSONAL_TO_UPDATE_PAGE_URL"/>" class="navs02_a2">修改密码</a>
					<a id="menu_8_2" href="<ufa:url namespace="portal-ms" fieldName="PERSONAL_QUERY_USER_ROLE"/>" class="navs02_a2">查看权限</a>
				</div>
			</li>
			<sec:authorize access="hasAnyRole('ROLE_MS_USER') and fullyAuthenticated">
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_6" class="fz_14px fc_white"> 团体/商户管理</span></div>
				<div class="navs02 hide">
					<a id="menu_6_1" href="<ufa:url namespace="portal-ms" fieldName="GROUP_LIST_QUERY_URL"/>" class="navs02_a2">团体单位列表</a>
					<a id="menu_6_2" href="<ufa:url namespace="portal-ms" fieldName="GROUP_TO_ADD_PAGE_URL"/>" class="navs02_a2">添加团体单位</a>
					<a id="menu_6_3" href="<ufa:url namespace="portal-ms" fieldName="GROUP_TO_IMPORT_URL"/>" class="navs02_a2">导入团体单位</a>
				</div>
			</li>
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_6" class="fz_14px fc_white"> 审核管理</span></div>
				<div class="navs02 hide">
				    <a id="menu_7_1" href="<ufa:url namespace="portal-ms" fieldName="CONTENT_MEMBER_ICON_TO_APPROVE_URL"/>" class="navs02_a2">会员头像审核</a>
				    <a id="menu_7_4" href="<ufa:url namespace="portal-ms" fieldName="CONTENT_MEMBER_PHOTO_APPROVE_URL"/>" class="navs02_a2">会员照片审核</a>	
				    <sec:authorize access="hasAnyRole('ROLE_MS_ADMIN') and fullyAuthenticated">					
					<a id="menu_6_4" href="<ufa:url namespace="portal-ms" fieldName="GROUP_CHECK_TO_PAGE_URL"/>" class="navs02_a2">团体单位审核</a>
					</sec:authorize>
					<a id="menu_1_4" href="<ufa:url namespace="portal-ms" fieldName="CIF_MEMBER_TO_APPROVE_URL"/>" class="navs02_a2">实名认证待审核</a>
					<%-- <a id="menu_7_3" href="<ufa:url namespace="portal-ms" fieldName="CONTENT_MEMBER_COMMENT_APPROVE_URL"/>" class="navs02_a2">会员评论审核</a> --%>
				</div>
			</li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_MS_USER') and fullyAuthenticated">
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_7" class="fz_14px fc_white"> 内容管理</span></div>
				<div class="navs02 hide">	
				    <ul>
				      <li>
				        <div name="contentTwo"  class="nav_link" style="margin-left:43px;margin-top:-10px;" ><span  class="fz_13px fc_white" > 推荐管理</span></div>
				        <div class="navs02 hide">
				          <a id="menu_7_5" href="<ufa:url namespace="portal-ms" fieldName="CONTENT_MEMBER_RECOMMEND_HOMEPAGE_URL"/>" class="navs02_a2">首页推荐用户</a>
					      <a id="menu_7_6" href="<ufa:url namespace="portal-ms" fieldName="CONTENT_MEMBER_RECOMMEND_VIP_URL"/>" class="navs02_a2">首页vip推荐</a>
					      <!--<a id="menu_7_7" href="<ufa:url namespace="portal-ms" fieldName=""/>" class="navs02_a2">推荐动态管理</a>-->
				        </div>
				      </li>
				    </ul>
				    <ul>
				      <li>
				        <div name="contentTwo" class="nav_link" style="margin-left:43px;margin-top:-10px;"><span name="contentTwo" class="fz_13px fc_white"> Banner管理</span></div>
				        <div class="navs02 hide">
				          <a id="menu_9_1" href="<ufa:url namespace="portal-ms" fieldName="BANNER_LIST_QUERY_URL" />" class="navs02_a2">banner图列表查询</a>
				          <sec:authorize access="hasAnyRole('ROLE_MS_ADMIN') and fullyAuthenticated">	
					      <a id="menu_9_2" href="<ufa:url namespace="portal-ms" fieldName="BANNER_ADD_URL" />" class="navs02_a2">banner图添加</a>
					      </sec:authorize>
				        </div>
				      </li>
				    </ul>
				    <sec:authorize access="hasAnyRole('ROLE_MS_ADMIN') and fullyAuthenticated">	
				    <ul>
				      <li>
				        <div name="contentTwo" class="nav_link" style="margin-left:43px;margin-top:-10px;"><span name="contentTwo" class="fz_13px fc_white"> 话题管理</span></div>
				        <div class="navs02 hide">
				          <a id="menu_8_5" href="<ufa:url namespace="portal-ms" fieldName="TOPIC_ADD_URL" />" class="navs02_a2">添加话题</a>
					      <a id="menu_8_6" href="<ufa:url namespace="portal-ms" fieldName="TOPIC_LIST_QUERY_URL" />" class="navs02_a2">话题列表</a>
				        </div>
				      </li>
				    </ul>
				    <ul>
				      <li>
				        <div name="contentTwo"  class="nav_link" style="margin-left:43px;margin-top:-10px;"><span name="contentTwo" class="fz_13px fc_white"> 活动管理</span></div>
				        <div class="navs02 hide">
				          <a id="act_4" href="<ufa:url namespace="portal-ms"   fieldName="ACTIVITY_ADD_URL"/>"   class="navs02_a2"  target="mainFrame">添加活动</a>
					      <a id="act_5" href="<ufa:url namespace="portal-ms" fieldName="ACTIVITY_QUERY_URL"/>"   class="navs02_a2"  target="mainFrame">活动列表</a>
					      <a id="act_7" href="<ufa:url namespace="portal-ms" fieldName="ACTIVITY_COMMENT_QUERY_URL"/>"   class="navs02_a2"  target="mainFrame">活动留言列表</a>
					      <!--  <a id="act_6" href="<ufa:url namespace="portal-ms" fieldName="ACTIVITY_APPLY_QUERY_URL"/>"   class="navs02_a2"  target="mainFrame">活动报名列表</a>-->
					      <!--   <a id="act_1" href="<ufa:url namespace="portal-ms"   fieldName="ACTIVITY_CLASSIFY_QUERY_URL"/>"   class="navs02_a2" target="mainFrame">活动分类</a>
					      <a id="act_2" href="<ufa:url namespace="portal-ms"  fieldName="ACTIVITY_TYPE_QUERY_URL"/>"  class="navs02_a2"   target="mainFrame">活动类型</a>-->					      
				        </div>
				      </li>
				    </ul>	
				    </sec:authorize>				
				</div>
			</li>	
			</sec:authorize>				
			<li>
				<div class="navs01 nav_link"><span class="span_img05"></span> <span id="menu_6" class="fz_14px fc_white"> 财务管理</span></div>
				<div class="navs02 hide">
				    <a id="menu_7_1" href="#" class="navs02_a2">收入对账</a>
				</div>
			</li>
		</ul>	
	</div>
</div>
<script type="text/javascript">
   	seajs.use("${scriptBasePath}/leftMenu.js");
</script>