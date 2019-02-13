package com.yyq.car.portal.ms.app.service.auth;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;

import com.yyq.car.portal.common.constant.AccountStatus;
import com.yyq.car.portal.common.dto.AuthUserDTO;
import com.yyq.car.portal.common.dto.RoleResourceDTO;
import com.yyq.car.portal.common.exception.PortalAppCheckedException;
import com.yyq.car.portal.common.exception.PortalBizCheckedException;
import com.yyq.car.portal.common.mapper.auth.ResourceMapper;
import com.yyq.car.portal.common.mapper.auth.RoleMapper;
import com.yyq.car.portal.common.mapper.auth.UserMapper;
import com.yyq.car.portal.common.model.auth.RoleAccount;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.util.PasswordUtils;
import com.yyq.car.portal.common.util.RowBoundsUtils;
import com.yyq.car.portal.ms.web.command.AuthUserCmd;


/**
  * 
  *  <P> 后台会员管理service</P>
  *
  * @author lidongfu_2005@sina.com
  *  @date 2014年10月9日 下午5:44:44
  */
@Service
public class AuthUserService {

	final private Logger logger = LoggerFactory.getLogger(AuthUserService.class);

	@Autowired
	private UserMapper authUserMapper;

	@Autowired
	private RoleMapper roleMapper;

	@Autowired
	private ResourceMapper resouceMapper;

	/**
	 * 
	 * <P> 查询用户分页</P>
	 *
	 * @author lidongfu_2005@sina.com
	 * @param user
	 * @return
	 */
	public List<User> queryUserPage(AuthUserDTO user, int start, int end) {

		return authUserMapper.selectByCriteria(user, RowBoundsUtils.getRowBounds(start, end));
	}

	/**
	 * 
	 * <P> 用户总记录数</P>
	 *
	 * @author lidongfu_2005@sina.com
	 * @param user
	 * @return
	 */
	public int countQueryUser(AuthUserDTO user) {

		return authUserMapper.countByCriteria(user);
	}

	/**
	 * <P> 添加用户到数据库</P>
	 * 
	 * @author lidongfu_2005@sina.com
	 * @param user
	 * @return
	 * @throws PortalBizCheckedException 
	* @throws PortalAppCheckedException 
	 */
	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void addUser(AuthUserCmd userCmd) throws PortalBizCheckedException, PortalAppCheckedException {
		AuthUserDTO user = new AuthUserDTO();
		String plainCode = userCmd.getLoginPassword();
		String passwordCode = PasswordUtils.encryptPassword(plainCode);
		user.setPassword(passwordCode);
		user.setName(userCmd.getName());
		user.setCode(userCmd.getCode());
		user.setLoginName(userCmd.getUserName());
		user.setCountry(userCmd.getCountry());
		user.setStatus(AccountStatus.ENABLE.getValue());
		if (StringUtils.isNotBlank(userCmd.getShop())) {
			user.setShop(userCmd.getShop());
		}
		user.setCreateTime(new Date());
		int ret = authUserMapper.insertSelective(user);
		if (ret == 0) {
			logger.error("新增用户失败{}", ret);
			// throw new PortalBizCheckedException("新增用户失败");
		}
		String[] roleIds = userCmd.getRoleId();
		if (roleIds.length > 0) {
			for (String roleId : roleIds) {
				// 新增角色账户关联
				roleMapper.insertRoleAccount(Integer.parseInt(roleId), user.getId());
			}
		}

	}

	/**
	 * <P> 编辑用户</P>
	 *
	 * @author lidongfu_2005@sina.com
	 * @param userCmd
	 * @throws PortalBizCheckedException
	 */
	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void editUser(AuthUserCmd userCmd) throws PortalBizCheckedException {
		AuthUserDTO user = new AuthUserDTO();
		user.setId(userCmd.getId());
		user.setName(userCmd.getName());
		user.setCode(userCmd.getCode());
		user.setLoginName(userCmd.getUserName());
		user.setShop(userCmd.getShop());
		user.setCountry(userCmd.getCountry());
		// user.setStatus(AccountStatus.ENABLE.getValue());
		// user.setCreateTime(new Date());
		int ret = authUserMapper.updateByPrimaryKeySelective(user);
		if (ret == 0) {
			logger.error("编辑用户失败{}", ret);
			// throw new PortalBizCheckedException("编辑用户失败");
		}
		int ret1 = roleMapper.deleteByRoleAccount(user.getId());
		if (ret1 == 0) {
			// logger.error("删除该用户的角色失败{}", ret1);
			logger.error("该用户目前对应的角色数量为{}，该用户是手动添加的", ret1);
			// throw new PortalBizCheckedException("删除该用户的角色失败");
		}
		String[] roleIds = userCmd.getRoleId();
		for (String roleId : roleIds) {
			// 新增角色账户关联
			int ret2 = roleMapper.insertRoleAccount(Integer.parseInt(roleId), user.getId());
			if (ret2 == 0) {
				// logger.error("新增角色账户关联失败{}", ret2);
				logger.error("新增角色账户关联失败，插入了{}条数据", ret2);
				// throw new PortalBizCheckedException("新增角色账户关联失败");
			}
		}
	}

	/**
	 * <p>启用、停用</p>
	 * @param id
	 * @param status
	 * @author wangzh
	 */
	public void ableUser(Integer id, Integer status) {
		if (status != null && id != null) {
			User user = new User();
			user.setId(id);
			user.setStatus(status.intValue() == 1 ? 0 : 1);
			authUserMapper.updateByPrimaryKeySelective(user);
		}
	}

	/**
	 * <P> 查询编辑信息</P>
	 *
	 * @author lidongfu_2005@sina.com
	 * @param id
	 * @return
	 */
	public User queryUserEdit(Integer id) {

		return authUserMapper.selectByPrimaryKey(id);
	}

	/**
	 * <P> 根据用户ID获得该用户的角色信息</P>
	 * 
	 * @author lidongfu_2005@sina.com
	 * @param id
	 * @return
	 */
	public List<RoleAccount> queryRaByUserId(Integer id) {
		return authUserMapper.selectByUserId(id);
	}

	/**
	 * <P> 删除用户</P>
	 *
	 * @author lidongfu_2005@sina.com
	 * @param userCmd
	 * @throws PortalBizCheckedException
	 */
	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void deleteUser(AuthUserCmd userCmd) throws PortalBizCheckedException {
		// 删除该用户角色
		roleMapper.deleteByRoleAccount(userCmd.getId());
		// 删除该用户
		authUserMapper.deleteByPrimaryKey(userCmd.getId());
	}

	/**
	 * 判断用户输入的密码是否正确
	 * 
	 * @return true：正确 false:错误
	 */
	public boolean verifyPwd(User user) {
		User userOld = authUserMapper.selectByPrimaryKey(user.getId());
		if (!userOld.getPassword().equals(user.getName()))
			return false;
		return true;
	}

	/**
	 * 修改用户密码
	 */
	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public int updatePwd(User user) {
		return authUserMapper.updateByPrimaryKeySelective(user);
	}

	/**
	 * 查询用户拥有的权限
	 * @param id 当前用户ID
	 * @return List<Resource> 用户拥有的权限
	 */
	public List<RoleResourceDTO> queryResourceByUserId(RoleResourceDTO roleRDto) {
		// 获取该用户对应的角色集合
		List<RoleAccount> roles = authUserMapper.selectByUserId(roleRDto.getRoleId());
		// 获取资源集合
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("roles", roles);
		paramMap.put("startPage", roleRDto.getStartPage());
		paramMap.put("pageSize", roleRDto.getPageSize());
		List<RoleResourceDTO> resources = resouceMapper.batchSelectResourceById(paramMap);
		return resources;
	}

	/**
	 * 查询用户拥有的权限总的记录数
	 */
	public int queryCountResourcesById(Integer id) {
		// 获取该用户对应的角色集合
		List<RoleAccount> roles = authUserMapper.selectByUserId(id);
		return resouceMapper.batchCountResourceById(roles);
	}

	/**
	 * 根据ID集合获取用户信息
	 */
	public List<User> queryUserByIds(List<Integer> users) {
		return authUserMapper.selectByIds(users);
	}

	/**
	 * 重置用户密码
	 */
	public int batchUpdatePwd(Map<String, Object> maps) {
		return authUserMapper.batchUpdatePwdByIds(maps);
	}

	/**
	 * <p>根据ID获取用户</p>
	 * @return
	 * @author dell
	 */
	public User queryUserById(Integer id) {
		return authUserMapper.selectByPrimaryKey(id);
	}
	
	/**
	 * <p>根据登录名获取用户</p>
	 * @return
	 * @author liliang
	 */
	public User queryUserByLoginname(String loginname) {
		return authUserMapper.selectByLoginInfo(loginname);
	}
	
	
	
	/**
	 * 根据login_name   模糊查询匹配user  
	 */
	public List<User> selectListByName(String loginName) {
		return authUserMapper.selectListByName(loginName);
	}
	
}
