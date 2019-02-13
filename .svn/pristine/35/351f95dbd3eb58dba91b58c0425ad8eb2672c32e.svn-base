package com.yyq.car.portal.ms.app.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.yyq.car.portal.common.constant.FileTypeEnum;
import com.yyq.car.portal.common.dto.WholesaleCarDTO;
import com.yyq.car.portal.common.mapper.auth.UserMapper;
import com.yyq.car.portal.common.mapper.product.CarMapper;
import com.yyq.car.portal.common.mapper.wholesale.wholesaleCarMapper;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.product.Car;
import com.yyq.car.portal.common.model.wholesale.WholesaleCar;
import com.yyq.car.portal.ms.web.util.UUIDTool;


@Service
public class WholesalecarService {
	@Autowired
	private CarMapper carMapper;

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private wholesaleCarMapper wholesaleCarMapper;
	@Autowired
	private ClientService clientService;
	
	private static Integer car_sale_salestatus = 4;
	
	private static Integer wholesaleCar_status_sale = 2;
	private static Integer wholesaleCar_status_nopass = 3;

	public Map<String, Object> wholesalecarlibrarylist(Car car, String start, String pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		car.setStatus(100);// 临时数据用来查询可以批发销售的车
		List<Car> list = carMapper.selectByCriteria(car, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		if (list.size() > 0) {
			for (Car car2 : list) {
				if (car2.getSettlementprice() == null) {
					car2.setSettlementprice(car2.getTypeinsettleprice());
				}
			}
		}
		int num = carMapper.countByCriteria(car);
		map.put("result", list);
		map.put("num", num);
		return map;
	}

	public Car selectcar(Integer id) {
		// TODO Auto-generated method stub
		return carMapper.selectByPrimaryKey(id);
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void wholesaleCarsave(Integer id, String loginName, MultipartFile monads,WholesaleCar wholesaleCar) throws IOException {
		// TODO Auto-generated method stub
		User user = new User();
		user.setLoginName(loginName);
		List<User> user1 = userMapper.selectByCriteria(user);
		boolean hasdot = false;
		String name1 = monads.getOriginalFilename();

		if (StringUtils.isNotBlank(name1)) {
			int dot = name1.lastIndexOf(".");
			if (dot > 0) {
				hasdot = true;
				name1 = name1.substring(dot);
			}
		}
		String path1 = clientService.uploadFileTogether(monads, FileTypeEnum.wholesaleCarfile, hasdot, name1);
		wholesaleCar.setMonad(path1);
		wholesaleCar.setId(UUIDTool.getUUID());  
		wholesaleCar.setCarid(id);
		Car car=carMapper.selectByPrimaryKey(id);
		car.setSaleStatus(1);
		carMapper.updateByPrimaryKeySelective(car);
		wholesaleCar.setCreatetime(new Date());
		wholesaleCar.setLocation(car.getStoreType());//car.getStoreType()==1 是门店的车 car.getStoreType()==2 是仓库的车
		wholesaleCar.setStatus2(car.getStoreType());//car.getStoreType()==1 先门店部审核 car.getStoreType()==2 是财务部审核
		wholesaleCar.setCreateuser(user1.get(0).getId());

		wholesaleCarMapper.insertSelective(wholesaleCar);
	}

	// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	
	
	
	
	/**
	* 
	* 门店审核     分页结果集
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数   
	* @return  分页结果  
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> checkcarlistforstore(WholesaleCarDTO record,String start,String pageSize) throws ParseException {
		int ps = Integer.parseInt(pageSize);
		int st = (Integer.parseInt(start) - 1) * ps;
		record.setPageSize(ps);
		record.setStart(st);
		List<WholesaleCarDTO> lst = wholesaleCarMapper.selectListCarForStoreByParameter(record);
		int total = wholesaleCarMapper.countListCarForStoreByParameter(record);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", lst);
		returnMap.put("total", total);
		return returnMap;
	}
	
	/**
	* 
	* 门店审核未通过       分页结果集
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数   
	* @return  分页结果  
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> nopasslistforstore(WholesaleCarDTO record,String start,String pageSize) throws ParseException {
		int ps = Integer.parseInt(pageSize);
		int st = (Integer.parseInt(start) - 1) * ps;
		record.setPageSize(ps);
		record.setStart(st);
		record.setStatus2(3);// 门店审核未通过3
		List<WholesaleCarDTO> lst = wholesaleCarMapper.selectListCarForStoreByParameter(record);
		int total = wholesaleCarMapper.countListCarForStoreByParameter(record);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", lst);
		returnMap.put("total", total);
		return returnMap;
	}
	
	
	
	/**
	* 
	* 财务审核     分页结果集
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数   
	* @return  分页结果  
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> checkcarlistforfinance(WholesaleCarDTO record,String start,String pageSize) throws ParseException {
		int ps = Integer.parseInt(pageSize);
		int st = (Integer.parseInt(start) - 1) * ps;
		record.setPageSize(ps);
		record.setStart(st);
		List<WholesaleCarDTO> lst = wholesaleCarMapper.selectListCarForFinanceByParameter(record);
		int total = wholesaleCarMapper.countListCarForFinanceByParameter(record);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", lst);
		returnMap.put("total", total);
		return returnMap;
	}
	
	/**
	* 
	* 财务审核未通过       分页结果集
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数   
	* @return  分页结果  
	* @author liliang
	 * @throws ParseException 
	*/
	public Map<String, Object> nopasslistforfinance(WholesaleCarDTO record,String start,String pageSize) throws ParseException {
		int ps = Integer.parseInt(pageSize);
		int st = (Integer.parseInt(start) - 1) * ps;
		record.setPageSize(ps);
		record.setStart(st);
		record.setStatus2(4); // 4 财务审核不通过
		List<WholesaleCarDTO> lst = wholesaleCarMapper.selectListCarForFinanceByParameter(record);
		int total = wholesaleCarMapper.countListCarForFinanceByParameter(record);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", lst);
		returnMap.put("total", total);
		return returnMap;
	}
	
	
	
	/**
	* 通过id 查询  对象
	* @author liliang 
	*/
	public WholesaleCarDTO findById(String id) {
		WholesaleCarDTO wholesaleCar = wholesaleCarMapper.selectCarAllByPrimaryKey(id);
		return wholesaleCar;
	}
	
	
	/**
	* 门店审核方法
	* @param WholesaleCarDTO
	* @return
	* @author liliang
	*/
	@Transactional(propagation = Propagation.REQUIRED, timeout = 3)
	public Map<String, Object> storecheckcarMethod(WholesaleCarDTO dto) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "保存失败了。。");
		returnMap.put("rescode", "0");
		WholesaleCar wholesaleCar = new WholesaleCar();

		int status2 = Integer.valueOf(dto.getStatus2());
		if (2 == status2 || 3 == status2 || 6 == status2) {
			wholesaleCar.setId(dto.getId());
			wholesaleCar.setStatus2(status2);		
		    wholesaleCar.setModifyuser(dto.getModifyuser());
			wholesaleCar.setModifytime(new Date());
			if (3 == status2) {
				wholesaleCar.setReason1(dto.getReason1());
			}else if (6 == status2) {// 退回
				wholesaleCar.setReason1(dto.getReason1());
				WholesaleCar saleCar = wholesaleCarMapper.selectByPrimaryKey(dto.getId());
				carMapper.updateSaleStatus(saleCar.getCarid());// pro_car 表中更新车的状态为null
				wholesaleCar.setStatus(wholesaleCar_status_nopass);
			} 
			wholesaleCarMapper.updateByPrimaryKeySelective(wholesaleCar);
			returnMap.put("result", "保存成功了。");
			returnMap.put("rescode", "1");
		}

		return returnMap;
	}
	
	
	
	/**
	* 财务审核方法
	* @param WholesaleCarDTO
	* @return
	* @author liliang
	*/
	@Transactional(propagation = Propagation.REQUIRED, timeout = 3)
	public Map<String, Object> financecheckcarMethod(WholesaleCarDTO dto) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "保存失败了。。");
		returnMap.put("rescode", "0");
		WholesaleCar wholesaleCar = new WholesaleCar();

		int status2 = Integer.valueOf(dto.getStatus2());
		if (4 == status2 || 5 == status2 || 6 == status2) {
			wholesaleCar.setId(dto.getId());
			wholesaleCar.setStatus2(status2);		
		    wholesaleCar.setModifyuser(dto.getModifyuser());
			wholesaleCar.setModifytime(new Date());
			if (4 == status2) {// 驳回修改
				wholesaleCar.setReason2(dto.getReason2());
			}else if(5 == status2){ //财务审核通过
				WholesaleCar saleCar = wholesaleCarMapper.selectByPrimaryKey(dto.getId());
				Car  procar = new Car();
				procar.setId(saleCar.getCarid()); 
				procar.setSaleStatus(car_sale_salestatus);
				carMapper.updateByPrimaryKeySelective(procar);// pro_car 表中更新车的状态为   4已销已提
				wholesaleCar.setStatus(wholesaleCar_status_sale);
			}else if(6 == status2){ // 退回
				wholesaleCar.setReason2(dto.getReason2());
				WholesaleCar saleCar = wholesaleCarMapper.selectByPrimaryKey(dto.getId());
				carMapper.updateSaleStatus(saleCar.getCarid());// pro_car 表中更新车的状态为null
				wholesaleCar.setStatus(wholesaleCar_status_nopass);
				
			}
			wholesaleCarMapper.updateByPrimaryKeySelective(wholesaleCar);
			returnMap.put("result", "保存成功了。");
			returnMap.put("rescode", "1");
		}

		return returnMap;
	}
	
	
	
	/**
	* update  方法
	* @return
	* @author liliang
	 * @throws IOException 
	*/
	public Map<String, Object> update(WholesaleCarDTO dto,MultipartFile monads) throws IOException {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "保存失败了。。");
		returnMap.put("rescode", "0");
		WholesaleCar wholesaleCar = new WholesaleCar();

		String type = dto.getType();
		if ("1".equals(type) || "2".equals(type) ) {
			wholesaleCar.setId(dto.getId());
		    wholesaleCar.setModifyuser(dto.getModifyuser());
			wholesaleCar.setModifytime(new Date());
			if ("1".equals(type)) { // 说明时门店审核未通过     重新设置状态为待审核
				wholesaleCar.setStatus2(1);	
			}else { // 说明时财务审核未通过  重新设置状态为待审核
				wholesaleCar.setStatus2(2);	
			}
			wholesaleCar.setPrice(dto.getPrice());
			if(!monads.isEmpty()){
				String name1 = monads.getOriginalFilename();
				boolean hasdot = false;
				if (StringUtils.isNotBlank(name1)) {
					int dot = name1.lastIndexOf(".");
					if (dot > 0) {
						hasdot = true;
						name1 = name1.substring(dot);
					}
				}
				String path1 = clientService.uploadFileTogether(monads, FileTypeEnum.wholesaleCarfile, hasdot, name1);
				wholesaleCar.setMonad(path1);
			}
			
			
			
			
			wholesaleCarMapper.updateByPrimaryKeySelective(wholesaleCar);
			returnMap.put("result", "保存成功了。");
			returnMap.put("rescode", "1");
		}

		return returnMap;
	}
	
	
	
	
	/**
	* 
	* 资产库页面       分页结果集
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数   
	* @return  分页结果  
	* @author liliang
	*/
	public Map<String, Object> carlooklist(WholesaleCarDTO record,String start,String pageSize) throws ParseException {
		int ps = Integer.parseInt(pageSize);
		int st = (Integer.parseInt(start) - 1) * ps;
		record.setPageSize(ps);
		record.setStart(st);
		record.setStatus2(5); //通过
		List<WholesaleCarDTO> lst = wholesaleCarMapper.selectListCarForFinanceByParameter(record);
		int total = wholesaleCarMapper.countListCarForFinanceByParameter(record);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", lst);
		returnMap.put("total", total);
		return returnMap;
	}
	
	
}
