package com.yyq.car.portal.ms.app.service;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.codehaus.plexus.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.constant.FileTypeEnum;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.exception.PortalAppUnCheckedException;
import com.yyq.car.portal.common.mapper.jnd.jndSiteMapper;
import com.yyq.car.portal.common.mapper.mall.CarsourceMapper;
import com.yyq.car.portal.common.mapper.mall.mallAreaBrandMapper;
import com.yyq.car.portal.common.model.jnd.jndSite;
import com.yyq.car.portal.common.model.mall.Carsource;
import com.yyq.car.portal.common.model.mall.mallAreaBrand;
import com.yyq.car.portal.common.service.ResourcePersistenceService;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.ms.web.util.BeanStatus;
import com.yyq.car.portal.ms.web.util.CurrencyEnum;

/**
 * 
 * @author xhl
 *2018年10月19日上午11:24:37
 *
 */
@Service
public class MallAreaBrandService {

	@Autowired
	private jndSiteMapper jndSiteMapper;
	@Autowired
	private mallAreaBrandMapper mallAreaBrandMapper;
	@Autowired
	private ResourcePersistenceService resourceService;
	@Autowired
	private CarsourceMapper carsourceMapper;
	@Autowired
	private MallSealApplyService mallSealApplyService;
	/**
	 * 
	 * @author xhl
	 * @param map
	 * @return
	 *2018年10月22日下午2:36:46
	 *
	 */
	public Map<Object, Object> MallAreaBrandlist(Map<Object, Object> map) {
		Map<Object, Object> maps = new HashMap<Object, Object>();
		List<jndSite> list = jndSiteMapper.selectArea(map);
		int number = jndSiteMapper.countArea(map);
		maps.put("result", list);
		maps.put("num", number);
		return maps;
	}


	/**
	 * 
	 * @author xhl
	 * @param id
	 *2018年10月22日下午2:36:40
	 *
	 */
	public void deleteArea(Integer id) {
		// TODO Auto-generated method stub
		mallAreaBrand brand=new mallAreaBrand();
		brand.setAreaid(id);
		List<mallAreaBrand> list=mallAreaBrandMapper.selectByCriteria(brand);
		if (list.size()>0) {
			throw new PortalAppUnCheckedException("请先删除此区域下的车型！");
		}
		jndSiteMapper.deleteByPrimaryKey(id);
	}

	
	/**
	 * 
	 * @author xhl
	 * @param jndSite
	 * @param picurls
	 * @throws IOException
	 *2018年10月22日下午2:36:24
	 *
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void saveArea(jndSite jndSite, MultipartFile picurls) throws IOException {
		// TODO Auto-generated method stub
		
		jndSite site=new jndSite();
		site.setName(jndSite.getName());
		List<jndSite> list1=jndSiteMapper.selectByCriteria(site);
		if (jndSite.getId()!=null) {
			if(list1.size()>0){
			if (!(list1.get(0).getId().equals(jndSite.getId()))) {
				throw new PortalAppUnCheckedException("区域名称重复！");
			}
			}
		}else{
			if (list1.size()>0) {
				throw new PortalAppUnCheckedException("区域名称重复！");
			}
		}
		site.setName("");
		site.setEname(jndSite.getEname());
		List<jndSite> list2=jndSiteMapper.selectByCriteria(site);
		if (jndSite.getId()!=null) {
			if(list2.size()>0){
			if (!(list2.get(0).getId().equals(jndSite.getId()))) {
				throw new PortalAppUnCheckedException("区域英文名称重复！");
			}
			}
		}else{
			if (list2.size()>0) {
				throw new PortalAppUnCheckedException("区域英文名称重复！");
			}
		}
		site.setEname("");
		site.setCountry(jndSite.getCountry());
		List<jndSite> list3=jndSiteMapper.selectByCriteria(site);
		if (jndSite.getId()!=null) {
			if(list3.size()>0){
				if (!(list3.get(0).getId().equals(jndSite.getId()))) {
					throw new PortalAppUnCheckedException("区域编号重复！");
				}
			}
		}else{
			if (list3.size()>0) {
				throw new PortalAppUnCheckedException("区域编号重复！");
			}
		}
		
		if (!picurls.isEmpty()) {
			String name1 = picurls.getOriginalFilename();
			boolean hasdot = false;
			if (StringUtils.isNotBlank(name1)) {
				int dot = name1.lastIndexOf(".");
				if (dot > 0) {
					hasdot = true;
					name1 = name1.substring(dot);
				}
			}
			String path1 = mallSealApplyService.uploadFileFTP(picurls, FileTypeEnum.area_path, hasdot, name1);
			jndSite.setPicurl(path1);
		}
		/*
		 * Map<String, Map<String, Object>> maps = new HashMap<String, Map<String, Object>>();
		 * jndSite.setPicurl(resourceService.CustomsDeclarationOutboundSave(picurls, FileTypeEnum.area_path));
		if (StringUtils.isNotBlank(jndSite.getPicurl())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", picurls.getInputStream());
			tMap.put("size", picurls.getSize());
			maps.put(jndSite.getPicurl(), tMap);
		}
		if (maps.entrySet().size() > 0) {
			mallSealApplyService.uploadFileFTP(picurls, fte, hasdot, suffix);
		}*/
		UserDTO user = SecurityHelper.getAdminUserInfo();
		jndSite.setCurrency(CurrencyEnum.getIndex(jndSite.getCurrencyunit()));
		jndSite.setCurrencyname(CurrencyEnum.getCurrencyname(jndSite.getCurrencyunit()));
		if (jndSite.getId()!=null) {
			jndSite.setUpdatetime(new Date());
			jndSite.setUpdator(user.getName());
			jndSiteMapper.updateByPrimaryKeySelective(jndSite);
			if (jndSite.getStatus().equals(2)) {
				mallAreaBrand brand=new mallAreaBrand();
				brand.setAreaid(jndSite.getId());
				brand.setStatus(2);
				mallAreaBrandMapper.updateStatus(brand);
			}
		}else {
			jndSite.setCreatetime(new Date());
			jndSite.setCreator(user.getName());
			jndSiteMapper.insertSelective(jndSite);
		}
	}

	/**
	 * 
	 * @author xhl
	 * @param id
	 * @return
	 *2018年10月22日下午2:36:18
	 *
	 */
	public jndSite selectSite(Integer id) {
		// TODO Auto-generated method stub
		return jndSiteMapper.selectByPrimaryKey(id);
	}


	/**
	 * 
	 * @author xhl
	 * @param mallAreaBrand
	 * @param logourls
	 *2018年10月22日下午4:25:57
	 * @throws IOException 
	 *
	 */
	public void saveAreaBrand(mallAreaBrand mallAreaBrand, MultipartFile logourls) throws IOException {
		// TODO Auto-generated method stub
		/*Map<String, Map<String, Object>> maps = new HashMap<String, Map<String, Object>>();
		mallAreaBrand.setLogourl(resourceService.CustomsDeclarationOutboundSave(logourls, FileTypeEnum.areaBrand));
		if (StringUtils.isNotBlank(mallAreaBrand.getLogourl())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", logourls.getInputStream());
			tMap.put("size", logourls.getSize());
			maps.put(mallAreaBrand.getLogourl(), tMap);
		}
		if (maps.entrySet().size() > 0) {
			resourceService.carCustomsDeclarationOutboundSave(maps, true);
		}*/
		if (!logourls.isEmpty()) {
			String name1 = logourls.getOriginalFilename();
			boolean hasdot = false;
			if (StringUtils.isNotBlank(name1)) {
				int dot = name1.lastIndexOf(".");
				if (dot > 0) {
					hasdot = true;
					name1 = name1.substring(dot);
				}
			}
			String path1 = mallSealApplyService.uploadFileFTP(logourls,FileTypeEnum.areaBrand, hasdot, name1);
			mallAreaBrand.setLogourl(path1);
		}
		mallAreaBrand brand=new mallAreaBrand();
		brand.setBrand(mallAreaBrand.getBrand());
		brand.setAreaid(mallAreaBrand.getAreaid());
		List<mallAreaBrand> list=mallAreaBrandMapper.selectByCriteria(brand);
		if (mallAreaBrand.getId()!=null) {
			if (list.size()>0) {
				if (!(list.get(0).getId().equals(mallAreaBrand.getId()))) {
					throw new PortalAppUnCheckedException("区域品牌重复！");
				}
			}
		}else{
			if(list.size()>0){
				throw new PortalAppUnCheckedException("区域品牌重复！");
			}
		}
		UserDTO user = SecurityHelper.getAdminUserInfo();
		if (mallAreaBrand.getId()!=null) {
			mallAreaBrand.setUpdator(user.getName());
			mallAreaBrand.setUpdatetime(new Date());
			mallAreaBrandMapper.updateByPrimaryKeySelective(mallAreaBrand);
			
		}else {
			mallAreaBrand.setStatus(1);
			mallAreaBrand.setCreator(user.getName());
			mallAreaBrand.setCreatetime(new Date());
			mallAreaBrandMapper.insertSelective(mallAreaBrand);
		}
	}

	/**
	 * 
	 * @author xhl
	 * @param carsource
	 * @param start
	 * @param pageSize
	 * @return
	 *2018年10月22日下午8:46:22
	 *
	 */

	public Map<String, Object> carSourelist(Carsource carsource, Integer start, Integer pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object>map=new HashMap<String,Object>();
		List<Carsource> list = carsourceMapper.selectByCriteria(carsource, new RowBounds((start - 1) * pageSize, pageSize));
		int c = carsourceMapper.countByCriteria(carsource);
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	/**
	 * 
	 * @author xhl
	 * @param map
	 * @return
	 *2018年10月22日下午8:46:18
	 *
	 */
	public Map<String, Object> areaBrandlist(Map<Object, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> maps=new HashMap<String,Object>();
		List<Map<String, Object>> brand=mallAreaBrandMapper.selectBrand(map);
		int num=mallAreaBrandMapper.countBrand(map);
		maps.put("result", brand);
		maps.put("num", num);
		return maps;
	}


	/**
	 * 
	 * @author xhl
	 * @param id
	 *2018年10月23日上午10:31:42
	 *
	 */
	public void deleteAreaBrand(int id) {
		// TODO Auto-generated method stub
		mallAreaBrand brand=mallAreaBrandMapper.selectByPrimaryKey(id);
		Carsource source=new Carsource();
		source.setAreaid(brand.getAreaid());
		source.setBrand(brand.getBrand());
		List<Carsource> list=carsourceMapper.selectByCriteria(source);
		if (list.size()>0) {
			throw new PortalAppUnCheckedException("请删除品牌下的车源！");
		}
		mallAreaBrandMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 
	 * @author xhl
	 * @param id
	 * @return
	 *2018年10月23日上午10:58:13
	 *
	 */
	public mallAreaBrand selectBrand(Integer id){
		return mallAreaBrandMapper.selectByPrimaryKey(id);
	}
	
	
	/**查询所有记录地区
	 * 
	 * @return
	 */
	public List<jndSite> queryAll() {
		jndSite jndSite = new jndSite();
		jndSite.setStatus(BeanStatus.OK.getKey());
		return jndSiteMapper.selectByCriteria(jndSite);
	}
}
