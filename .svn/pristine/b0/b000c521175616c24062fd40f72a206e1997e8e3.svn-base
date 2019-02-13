package com.yyq.car.portal.ms.app.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.exception.PortalAppUnCheckedException;
import com.yyq.car.portal.common.mapper.jnd.jndSiteMapper;
import com.yyq.car.portal.common.mapper.mall.CarsourceMapper;
import com.yyq.car.portal.common.mapper.mall.MallIssuingCompanyMapper;
import com.yyq.car.portal.common.model.jnd.jndSite;
import com.yyq.car.portal.common.model.mall.Carsource;
import com.yyq.car.portal.common.model.mall.MallIssuingCompany;
import com.yyq.car.portal.common.service.security.SecurityHelper;

@Service
public class MallIssuingCompanyService {

	@Autowired
	private MallIssuingCompanyMapper mallIssuingCompanyMapper;
	@Autowired
	private CarsourceMapper carsourceMapper;
	
	@Autowired
	private jndSiteMapper jndSiteMapper;
	public Map<String, Object> issuingCompanyList(MallIssuingCompany mallIssuingCompany, Integer start, Integer pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		List<MallIssuingCompany> list=mallIssuingCompanyMapper.selectByCriteria(mallIssuingCompany,new RowBounds((start - 1) * pageSize, pageSize));
		int num=mallIssuingCompanyMapper.countByCriteria(mallIssuingCompany);
		map.put("result", list);
		map.put("num", num);
		return map;
	}
	public MallIssuingCompany SelectIssuingCompany(String id) {
		// TODO Auto-generated method stub
		return mallIssuingCompanyMapper.selectByPrimaryKey(Integer.parseInt(id));
	}
	/**
	 * 
	 * @author xhl
	 * @param mallIssuingCompany
	 *2018年10月25日下午6:00:25
	 *
	 */
	public void saveIssuingCompany(MallIssuingCompany mallIssuingCompany) {
		// TODO Auto-generated method stub
		UserDTO user = SecurityHelper.getAdminUserInfo();
		MallIssuingCompany mallissuing=new MallIssuingCompany();
		mallissuing.setName(mallIssuingCompany.getName());
		List<MallIssuingCompany> mallissuin=mallIssuingCompanyMapper.selectByCriteria(mallissuing);
		if (mallIssuingCompany.getId()!=null) {
			if (mallissuin.size()>0) {
				if(!(mallissuin.get(0).getId().equals(mallIssuingCompany.getId()))){
					throw new PortalAppUnCheckedException("开证公司名称重复！");
				}
			}
		}else{
			if(mallissuin.size()>0){
				throw new PortalAppUnCheckedException("开证公司名称重复！");
			}
		}
		if (mallIssuingCompany.getId()!=null) {
			mallIssuingCompany.setUpdator(user.getName());
			mallIssuingCompany.setUpdatetime(new Date());
			mallIssuingCompanyMapper.updateByPrimaryKeySelective(mallIssuingCompany);
		}else{
			mallIssuingCompany.setCreator(user.getName());
			mallIssuingCompany.setCreatetime(new Date());
			mallIssuingCompanyMapper.insertSelective(mallIssuingCompany);
			
		}
	}
	public void deleteIssuingCompany(Integer id) {
		// TODO Auto-generated method stub
		Carsource car=new Carsource();
		car.setIssuingid(id);
		List<Carsource> list=carsourceMapper.selectIssuingcompanyCarSource(id);
		String brand="";
		if (list.size()>0) {
			for (Carsource carsource : list) {
				String a=carsource.getAreaname()+":"+carsource.getBrand();
				if (brand=="") {
					brand=a;
				}else{
					brand=brand+"||"+a;
				}
			}
			throw new PortalAppUnCheckedException("此开证公司有在使用的车源的区域品牌:{"+brand+"}");
		}
		mallIssuingCompanyMapper.deleteByPrimaryKey(id);
	}

}
