package com.yyq.car.portal.ms.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yyq.car.portal.common.mapper.comm.AbrandMapper;
import com.yyq.car.portal.common.mapper.comm.ModelMapper;
import com.yyq.car.portal.common.model.comm.Abrand;
import com.yyq.car.portal.common.model.comm.Model;


@Service
public class BrandAndModelService {

	@Autowired
	private AbrandMapper abrandMapper;
	@Autowired
	private ModelMapper modelMapper;

	/**
	 *添加型号
	 * @param abrand
	 */
	public void addAbrand(Abrand abrand) {
		abrandMapper.insertSelective(abrand);
	}

	/**
	 * 清空表
	 */
	public void deleteAll() {
		abrandMapper.deleteAll();
	}

	/**
	 * 添加型号和版别
	 * @param model
	 */
	public void addModel(Model model) {
		modelMapper.insertSelective(model);
	}

	/**
	 * 清空表
	 */
	public void deleteAllModel() {
		modelMapper.deleteAll();
	}

	public List<Map<String, Object>> queryBrandinitia() {
		return abrandMapper.APPqueryBrandinitial();
	}

	/**
	 * 查询所有品牌
	 * @param abrand
	 * @return
	 */
	public List<Map<String, Object>> queryBrand(String brandinitial) {
		return abrandMapper.queryBrand(brandinitial);

	}

	public Abrand queryId(String brand) {
		Abrand a = new Abrand();
		a.setBrand(brand);
		List<Abrand> list = abrandMapper.selectByCriteria(a);
		return  list.get(0);

	}

	/**
	 * 根据品牌id查询车型
	 * @param brandid
	 * @return
	 */
	public List<Map<String, Object>> queryByBrandidModel(int brandid) {
		return modelMapper.queryModel(brandid);
	}

	public List<Map<String, Object>> queryVersion(String model) {
		return modelMapper.queryVersion(model);

	}

	/**
	 * 品牌首字母
	 * @return
	 */
	public List<Abrand> queryBrandinitial() {
		return abrandMapper.queryBrandinitial();

	}

	/**
	 * 查询所有品牌
	 * @param abrand
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> queryAbrand(Abrand abrand, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<Abrand> lst = abrandMapper.selectByCriteria(abrand, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int c = abrandMapper.countByCriteria(abrand);
		map.put("total", c);
		map.put("result", lst);
		return map;
	}

	/**
	 * 查询所有车型和版别
	 * @param model
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> queryModel(Model model, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		List<Model> lst = modelMapper.selectByCriteria(model, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int c = modelMapper.countByCriteria(model);
		map.put("total", c);
		map.put("result", lst);
		return map;

	}

	public void addmodelandversion(String brandid, String model, String version) {
		// TODO Auto-generated method stub
		Model m = new Model();
		m.setBrandid(Integer.parseInt(brandid));
		m.setModel(model);
		m.setVersion(version);
		modelMapper.insertSelective(m);
	}

	public void deletemodel(int id) {
		// TODO Auto-generated method stub
		modelMapper.deleteByPrimaryKey(id);
	}

	public void addAbrandlist(List<Abrand> bandlist) {
		// TODO Auto-generated method stub
		abrandMapper.addAbrandlist(bandlist);
	}

	public void addModellist(List<Model> modellist) {
		// TODO Auto-generated method stub
		modelMapper.addModellist(modellist);
	}
	
}
