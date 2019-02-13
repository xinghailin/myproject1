package com.yyq.car.portal.ms.app.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.constant.FileTypeEnum;
import com.yyq.car.portal.common.dto.CarTypeinDto;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.exception.PortalAppUnCheckedException;
import com.yyq.car.portal.common.mapper.auth.RoleAccountMapper;
import com.yyq.car.portal.common.mapper.auth.UserMapper;
import com.yyq.car.portal.common.mapper.jnd.ContractapplypayMapper;
import com.yyq.car.portal.common.mapper.jnd.JndapplypayMapper;
import com.yyq.car.portal.common.mapper.jnd.JndbuyMapper;
import com.yyq.car.portal.common.mapper.jnd.JndcarMapper;
import com.yyq.car.portal.common.mapper.jnd.JndcarcheckMapper;
import com.yyq.car.portal.common.mapper.jnd.JndcontractMapper;
import com.yyq.car.portal.common.mapper.jnd.JndfileMapper;
import com.yyq.car.portal.common.mapper.jnd.JndfreightcarMapper;
import com.yyq.car.portal.common.mapper.jnd.JndneedMapper;
import com.yyq.car.portal.common.mapper.jnd.JndsubbuyMapper;
import com.yyq.car.portal.common.mapper.jnd.JndsubneedMapper;
import com.yyq.car.portal.common.mapper.jnd.jndSiteMapper;
import com.yyq.car.portal.common.mapper.jnd.jndSupplierMapper;
import com.yyq.car.portal.common.mapper.jnd.jndfreightMapper;
import com.yyq.car.portal.common.mapper.mallcontract.JndCarorderDetailMapper;
import com.yyq.car.portal.common.mapper.product.CarMapper;
import com.yyq.car.portal.common.mapper.product.ShopMapper;
import com.yyq.car.portal.common.mapper.product.StoreMapper;
import com.yyq.car.portal.common.model.auth.RoleAccount;
import com.yyq.car.portal.common.model.auth.User;
import com.yyq.car.portal.common.model.jnd.Contractapplypay;
import com.yyq.car.portal.common.model.jnd.Jndapplypay;
import com.yyq.car.portal.common.model.jnd.Jndbuy;
import com.yyq.car.portal.common.model.jnd.Jndcar;
import com.yyq.car.portal.common.model.jnd.Jndcarcheck;
import com.yyq.car.portal.common.model.jnd.Jndcontract;
import com.yyq.car.portal.common.model.jnd.Jndfile;
import com.yyq.car.portal.common.model.jnd.JndfreightcarKey;
import com.yyq.car.portal.common.model.jnd.Jndneed;
import com.yyq.car.portal.common.model.jnd.Jndsubbuy;
import com.yyq.car.portal.common.model.jnd.Jndsubneed;
import com.yyq.car.portal.common.model.jnd.jndSite;
import com.yyq.car.portal.common.model.jnd.jndSupplier;
import com.yyq.car.portal.common.model.jnd.jndfreight;
import com.yyq.car.portal.common.model.mallcontract.JndCarorderDetail;
import com.yyq.car.portal.common.model.product.Car;
import com.yyq.car.portal.common.model.product.Shop;
import com.yyq.car.portal.common.model.product.Store;
import com.yyq.car.portal.common.model.product.flowscheme;
import com.yyq.car.portal.common.service.ResourcePersistenceService;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.ms.web.constant.StoreStatusEnum;


@Service
public class CanadaNeedService {

	@Autowired
	private JndneedMapper jndneedMapper;
	@Autowired
	private JndsubneedMapper jndsubneedMapper;
	@Autowired
	private JndcarMapper jndcarMapper;
	@Autowired
	private JndbuyMapper jndbuyMapper;
	@Autowired
	private RoleAccountMapper roleAccountMapper;
	@Autowired
	private JndsubbuyMapper jndsubbuyMapper;
	@Autowired
	private JndapplypayMapper jndapplypayMapper;
	@Autowired
	private StoreMapper storeMapper;
	@Autowired
	private JndfileMapper jndfileMapper;
	@Autowired
	private ResourcePersistenceService resourceService;
	@Autowired
	private JndcarcheckMapper jndcarcheckMapper;

	@Autowired
	private jndfreightMapper jndfreightMapper;
	@Autowired
	private RoleAccountMapper roAccountMapper;
	@Autowired
	private JndfreightcarMapper jndfreightcarMapper;

	@Autowired
	private ShopMapper shopMapper;
	@Autowired
	private CarMapper carMapper;

	@Autowired
	private jndSiteMapper jndSiteMapper;
	@Autowired
	private ContractapplypayMapper contractapplypayMapper;
	@Autowired
	private JndcontractMapper jndcontractMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private jndSupplierMapper jndSupplierMapper;

	@Autowired
	private JndCarorderDetailMapper jndCarorderDetailMapper;

	@Autowired
	private SellContractService sellContractService;

	/**查询车辆索要采购的地区
	 * 
	 * @return
	 */
	public List<jndSite> querysite() {
		return jndSiteMapper.selectByCriteria(new jndSite());
	}

	/**
	 * 需求单添加
	 * @param jndneed
	 */
	public void jndneedadd(Jndneed jndneed) {
		jndneedMapper.insertSelectivejndneed(jndneed);
	}

	/**
	 * 付款申请单列表
	 * @param contractapplypay
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> njndApplyPayLstIndex(Map<String, Object> paraMap) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> lstMap = contractapplypayMapper.selectApayLst(paraMap);
		int c = contractapplypayMapper.countApay(paraMap);
		resultMap.put("result", lstMap);
		resultMap.put("total", c);
		return resultMap;
	}

	/**
	 * 查询合同
	 * @param paraMap
	 * @return
	 */
	public Map<String, Object> selectContract(Map<String, Object> paraMap) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> lstMap = jndcontractMapper.selectContract(paraMap);
		int c = jndcontractMapper.countContract(paraMap);
		resultMap.put("result", lstMap);
		resultMap.put("total", c);
		return resultMap;
	}

	/**
	 * 需求单列表查看
	 * @param jndneed
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> queryjndneedlist(Jndneed jndneed, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);

		List<Jndneed> list = jndneedMapper.selectByCriteria(jndneed, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int c = jndneedMapper.countByCriteria(jndneed);
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	/**
	 * 查询需求是否已经绑定采购
	 * @param id
	 * @return 
	 */
	public int countjndbuy(int id) {
		// TODO Auto-generated method stub
		Jndbuy jnd = new Jndbuy();
		jnd.setNeedid(id);
		return jndbuyMapper.countByCriteria(jnd);
	}

	/**
	 * 根据需求id查询子需求
	 * @param id
	 * @return
	 */
	public List<Map<String, Object>> jndsubneedlst(int id) {
		// TODO Auto-generated method stub

		return jndsubneedMapper.jndsubneedlst(id);
	}

	/**
	 * 查询需求单
	 * @param id
	 * @return
	 */
	public Jndneed jndneed(int id) {
		// TODO Auto-generated method stub
		return jndneedMapper.selectByPrimaryKey(id);
	}

	/**
	 * 加拿大仓库查询
	 * @param integer 
	 * @return
	 */
	public List<Store> jndstore() {
		return storeMapper.jndstore();

	}

	/**
	 * 加拿大资产库查询
	 * @param jndcar
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> queryjndAssetlibrarylist(String userCountry, Jndcar jndcar, String start, String pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		jndcar.setStatus("60");// 海外车辆入海外仓库查询
		if (StringUtils.isNotBlank(userCountry)) {
			jndcar.setCountry(Integer.parseInt(userCountry));
		}
		List<Jndcar> list = jndcarMapper.selectByCriteria(jndcar, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));

		int c = jndcarMapper.countByCriteria(jndcar);
		if (jndcar.getCountry() != null) {
			Jndcar carprice = jndcarMapper.selectcarPrice(jndcar);
			map.put("carp1", carprice.getPrice());
			map.put("carp2", carprice.getCostprice());
			map.put("carp3", carprice.getCurrency());
		}
		for (Jndcar jndcar2 : list) {
			Store stor = storeMapper.selectByPrimaryKey(jndcar2.getInstoreid());
			if (stor != null) {
				if (StringUtils.isNotBlank(stor.getName())) {
					jndcar2.setRoughweight(stor.getName());
				} else {
					jndcar2.setRoughweight(null);
				}
			} else {
				jndcar2.setRoughweight(null);
			}
			Jndfile jndfile = new Jndfile();
			jndfile.setCarid(jndcar2.getId());
			jndfile.setType("3");
			String location = jndfileMapper.querylocation(jndfile);
			if (StringUtils.isNotBlank(location)) {
				jndcar2.setNote(location);// 加拿大入库检验单照片
			} else {
				jndcar2.setNote(null);
			}
		}
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	/**
	 * 车辆详情
	 * @param id
	 * @return
	 */
	public Jndcar CustomsDeclarationOutbound(int id) {
		// TODO Auto-generated method stub
		return jndcarMapper.selectByPrimaryKey(id);
	}

	public Jndapplypay Jndapplypaydetails(Integer applypayid) {
		// TODO Auto-generated method stub
		return jndapplypayMapper.selectByPrimaryKey(applypayid);
	}

	/**
	 * 根据仓库id查询仓库名称
	 * @param instoreid
	 * @return
	 */
	public Store queryStoreNameById(Integer instoreid) {
		// TODO Auto-generated method stub
		return storeMapper.selectByPrimaryKey(instoreid);
	}

	/**
	 * 删除需求单 根据需求单id删除子需求
	 * @param id
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void deletejndneed(int id) {
		// TODO Auto-generated method stub
		jndsubneedMapper.dletejndsubneeds(id);
		jndneedMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 车辆文件保存
	 * @param fi
	 */
	public void saveCarFiles(Jndfile fi) {
		// TODO Auto-generated method stub
		jndfileMapper.insertSelective(fi);
	}

	/**
	 * 出库单保存
	 * @param jndcar
	 */
	public void updatejndcar(Jndcar jndcar) {
		// TODO Auto-generated method stub
		jndcarMapper.updateByPrimaryKeySelective(jndcar);
	}

	/**
	 * 已经报关车辆列表
	 * @param jndcar
	 * @param start
	 * @param pageSize
	 * @return
	 * @throws ParseException 
	 */
	public Map<String, Object> ClearanceOfGoodsCarList(String userCountry, Jndcar jndcar, String start, String pageSize, String sstarttime)
			throws ParseException {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		jndcar.setStatus("20");// 海外已经报关的车辆查询
		if (StringUtils.isNotBlank(sstarttime)) {
			SimpleDateFormat da = new SimpleDateFormat("yyyy-MM-dd");
			jndcar.setStarttime(da.parse(sstarttime));
		}
		if (StringUtils.isNotBlank(userCountry)) {
			jndcar.setCountry(Integer.parseInt(userCountry));
		}
		List<Jndcar> list = jndcarMapper.selectByCriteria(jndcar, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int c = jndcarMapper.countByCriteria(jndcar);
		if (jndcar.getCountry() != null) {
			Jndcar carprice = jndcarMapper.selectcarPrice(jndcar);
			map.put("carp1", carprice.getPrice());
			map.put("carp2", carprice.getCostprice());
			map.put("carp3", carprice.getCurrency());
		}
		for (Jndcar jndcar2 : list) {
			Store stor = storeMapper.selectByPrimaryKey(jndcar2.getInstoreid());
			if (stor != null) {
				jndcar2.setRoughweight(stor.getName());
			} else {
				jndcar2.setRoughweight(null);
			}
		}
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	/**
	 * 查询报关文件
	 * @param id
	 * @return
	 */
	public List<Jndfile> fileDownloadAndUpload(Jndfile jndfile) {
		// TODO Auto-generated method stub
		return jndfileMapper.selectByCriteria(jndfile);
	}

	/**
	 * 需求单保存
	 * @param result
	 * @param jndneed
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void jndneedadd(String result, Jndneed jndneed) {
		// TODO Auto-generated method stub
		Jndsubneed jndsu = new Jndsubneed();
		Date now = new Date();
		JSONArray json = JSONArray.fromObject(result); // 首先把字符串转成 JSONArray 对象
		if (json.size() > 0) {
			int c = 0;
			for (int i = 0; i < json.size(); i++) {
				JSONObject job = json.getJSONObject(i);
				// c = c + Integer.parseInt(job.get("num").toString());
				c = c + job.getInt("num");
			}
			jndneed.setCreatetime(now);
			jndneed.setNum(c);
			jndneedMapper.insertSelectivejndneed(jndneed);
			for (int i = 0; i < json.size(); i++) {
				JSONObject job = json.getJSONObject(i);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
				// System.out.println(job.get("brand") + "=" + job.get("model")); // 得到 每个对象中的属性值
				jndsu.setNeedid(jndneed.getId());
				jndsu.setBrand(job.get("brand").toString());
				jndsu.setModel(job.get("model").toString());
				jndsu.setInitials(job.get("initials").toString());
				jndsu.setIncolor(job.get("incolor").toString());
				jndsu.setOutcolor(job.get("outcolor").toString());
				jndsu.setNum(job.getInt("num"));
				jndsu.setCreatetime(now);
				jndsu.setVersion(job.get("version").toString());
				jndsu.setConfig(job.get("set").toString());
				jndsu.setCurrency(jndneed.getCurrency());
				jndsu.setCountry(jndneed.getCountry());
				jndsubneedMapper.insertSelective(jndsu);
			}
		}
	}

	/**
	 * 修改保存
	 * @param result
	 * @param id
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updatejndneed(String result, String needer, int id) {
		// TODO Auto-generated method stub
		Jndsubneed jndsu = new Jndsubneed();
		List list1 = new ArrayList<String>();
		List list2 = new ArrayList<String>();
		List<Map<String, Object>> jndsubneedid = jndsubneedMapper.judsubneedid(id);
		for (Map<String, Object> maps : jndsubneedid) {
			for (Entry<String, Object> entry : maps.entrySet()) {
				list2.add(entry.getValue().toString());
			}
		}
		JSONArray json = JSONArray.fromObject(result); // 首先把字符串转成 JSONArray 对象
		Date nowDate = new Date();
		if (json.size() > 0) {
			int c = 0;
			for (int i = 0; i < json.size(); i++) {
				JSONObject job = json.getJSONObject(i);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
				if (StringUtils.isNotBlank(job.get("subneedid").toString())) {
					jndsu.setNeedid(id);
					jndsu.setId(Integer.parseInt(job.get("subneedid").toString()));
					jndsu.setBrand(job.get("brand").toString());
					list1.add(job.get("subneedid").toString());
					jndsu.setModel(job.get("model").toString());
					jndsu.setInitials(job.get("initials").toString());
					jndsu.setIncolor(job.get("incolor").toString());
					jndsu.setOutcolor(job.get("outcolor").toString());
					jndsu.setNum(job.getInt("num"));
					jndsu.setCreatetime(nowDate);
					jndsu.setVersion(job.get("version").toString());
					jndsu.setConfig(job.get("set").toString());
					c = c + job.getInt("num");
					jndsubneedMapper.updateByPrimaryKeySelective(jndsu);
				} else {
					jndsu.setNeedid(id);
					jndsu.setBrand(job.get("brand").toString());
					jndsu.setModel(job.get("model").toString());
					jndsu.setInitials(job.get("initials").toString());
					jndsu.setIncolor(job.get("incolor").toString());
					jndsu.setOutcolor(job.get("outcolor").toString());
					jndsu.setNum(job.getInt("num"));
					jndsu.setCreatetime(nowDate);
					jndsu.setVersion(job.get("version").toString());
					jndsu.setConfig(job.get("set").toString());
					c = c + job.getInt("num");
					jndsubneedMapper.insertSelective(jndsu);// 需求车辆添加
				}
				Jndneed jndneed = new Jndneed();
				jndneed.setNum(c);
				jndneed.setId(id);
				jndneed.setNeeder(needer);
				jndneedMapper.updateByPrimaryKeySelective(jndneed);// 修改需求单
			}
			list2.removeAll(list1);
			Iterator<String> it = list2.iterator();
			while (it.hasNext()) {
				int subneedid = Integer.parseInt(it.next());
				jndsubneedMapper.deleteByPrimaryKey(subneedid);// 删除子需求
			}
		}
	}

	/**
	 * 报关文件保存
	 * @param files
	 * @param jndcar
	 * @param starttimes
	 * @param arrivetimes
	 * @throws ParseException 
	 * @throws IOException 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void CustomsDeclarationOutboundsave(MultipartFile[] files, Jndcar jndcar, String starttimes, String arrivetimes) throws Exception {
		// TODO Auto-generated method stub
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		Date da = new Date();
		Jndfile fi = new Jndfile();
		Map<String, Map<String, Object>> maps = new HashMap<String, Map<String, Object>>();
		if (files != null && files.length > 0) {
			for (int i = 0; i < files.length; i++) {
				MultipartFile file = files[i];
				fi.setLocation(resourceService.CustomsDeclarationOutboundSave(file, FileTypeEnum.carClearanceOfGoodsFiles));
				Map<String, Object> tMap = new HashMap<String, Object>();
				tMap.put("is", file.getInputStream());
				tMap.put("size", file.getSize());
				maps.put(fi.getLocation(), tMap);
				fi.setCarid(jndcar.getId());
				fi.setType("1");// 文件表报关文件状态
				fi.setCreatetime(da);
				jndfileMapper.insertSelective(fi);
			}
		}
		if (maps.entrySet().size() > 0) {
			resourceService.carCustomsDeclarationOutboundSave(maps, true);
		}
		if (StringUtils.isNotBlank(starttimes)) {
			jndcar.setStarttime(date.parse(starttimes));
		}
		if (StringUtils.isNotBlank(arrivetimes)) {
			jndcar.setArrivetime(date.parse(arrivetimes));
		}
		jndcar.setStatus("2");// car表报关文件上传状态
		jndcarMapper.updateByPrimaryKeySelective(jndcar);
	}

	/**
	 * 退税文件上传保存
	 * @param files
	 * @param jndfile
	 * @throws IOException 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void taxRefundFileUpload(MultipartFile[] files, Jndfile jndfile) throws IOException {
		// TODO Auto-generated method stub
		Jndcar jnd = new Jndcar();
		Date date = new Date();
		Map<String, Map<String, Object>> maps = new HashMap<String, Map<String, Object>>();
		if (files != null && files.length > 0) {
			for (int i = 0; i < files.length; i++) {
				MultipartFile file = files[i];
				jndfile.setLocation(resourceService.CustomsDeclarationOutboundSave(file, FileTypeEnum.taxRefund));
				Map<String, Object> tMap = new HashMap<String, Object>();
				if (StringUtils.isNotBlank(jndfile.getLocation())) {
					tMap.put("is", file.getInputStream());
					tMap.put("size", file.getSize());
					maps.put(jndfile.getLocation(), tMap);
				}
				jndfile.setCreatetime(date);
				jndfile.setType("2");// 文件表退税文件状态
				jndfileMapper.insertSelective(jndfile);
			}
		}
		if (maps.entrySet().size() > 0) {
			resourceService.carCustomsDeclarationOutboundSave(maps, true);
		}
		jnd.setId(jndfile.getCarid());
		jnd.setFstatus("1");// car表退税文件上传状态
		jndcarMapper.updateByPrimaryKeySelective(jnd);
	}

	/**
	 * 保税库入库列表查询
	 * @param jndcar
	 * @param start
	 * @param pageSize
	 * @return
	 * @throws ParseException 
	 */
	public Map<String, Object> BondedWarehouseEntryList(Jndcar jndcar, String start, String pageSize, String sarrivetime) throws ParseException {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		jndcar.setStatus("30");// 查询已经报关出口的车辆 临时数据
		if (StringUtils.isNotBlank(sarrivetime)) {
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			jndcar.setArrivetime(date.parse(sarrivetime));
		}
		List<Jndcar> list = jndcarMapper.selectByCriteria(jndcar, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		for (Jndcar jndcar2 : list) {
			Store stor = storeMapper.selectByPrimaryKey(jndcar2.getInstoreid());
			if (stor != null) {
				jndcar2.setRoughweight(stor.getName());
			} else {
				jndcar2.setRoughweight(null);
			}
			Jndfile jndfile = new Jndfile();
			jndfile.setCarid(jndcar2.getId());
			jndfile.setType("3");// 加拿大入库检验单图片
			String location = jndfileMapper.querylocation(jndfile);
			jndfile.setType("4");// 中国入库检验单图片
			String location2 = jndfileMapper.querylocation(jndfile);
			if (location != null && location != "") {
				jndcar2.setNote(location);
			} else {
				jndcar2.setNote(null);
			}
			if (location2 != null && location2 != "") {
				jndcar2.setConfig(location2);
			} else {
				jndcar2.setConfig(null);
			}
		}
		if (jndcar.getCountry() != null) {
			Jndcar carprice = jndcarMapper.selectcarPrice(jndcar);
			map.put("carp1", carprice.getPrice());
			map.put("carp2", carprice.getCostprice());
			map.put("carp3", carprice.getCurrency());
		}
		int c = jndcarMapper.countByCriteria(jndcar);
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	/**
	 * 根据carID查询检验单id
	 * @param carid
	 * @return
	 */
	public int queryjndcarcheckBycarid(int carid) {
		// TODO Auto-generated method stub
		return jndcarcheckMapper.queryjndcarcheckBycarid(carid);
	}

	/**
	 * 保税区入库检验单保存
	 * @param jndcarcheck
	 * @param siden5 
	 * @param siden4 
	 * @param siden3 
	 * @param siden2 
	 * @param siden1 
	 * @param enginenum 
	 * @param sleavefactime 
	 * @param vin 
	 * @throws IOException 
	 * @throws ParseException 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void saveCheckTheBondedArea(Jndcarcheck jndcarcheck, int carid, MultipartFile location, String sinbondedtime) throws IOException, ParseException {
		// TODO Auto-generated method stub
		Jndfile jndfile = new Jndfile();
		SimpleDateFormat dat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		jndfile.setLocation(resourceService.CustomsDeclarationOutboundSave(location, FileTypeEnum.taxRefund));
		Map<String, Map<String, Object>> maps = new HashMap<String, Map<String, Object>>();
		Map<String, Object> tMap = new HashMap<String, Object>();
		tMap.put("is", location.getInputStream());
		tMap.put("size", location.getSize());
		maps.put(jndfile.getLocation(), tMap);
		if (maps.entrySet().size() > 0) {
			resourceService.carCustomsDeclarationOutboundSave(maps, true);
		}
		jndfile.setCarid(carid);
		jndfile.setType("4");// 中国入库检验单图片状态
		jndfile.setCreatetime(date);
		jndfileMapper.insertSelective(jndfile);
		jndcarcheckMapper.updateByPrimaryKeySelective(jndcarcheck);
		Jndcar car = new Jndcar();
		car.setStatus("4");//
		if (StringUtils.isNotBlank(sinbondedtime)) {
			car.setInbondedtime(dat.parse(sinbondedtime));
		}
		car.setId(carid);
		jndcarMapper.updateByPrimaryKeySelective(car);
	}

	/**
	 * 根据id查询车辆信息
	 * @param id
	 * @return
	 */
	public Jndcar queryjndcarByid(int id) {
		// TODO Auto-generated method stub
		return jndcarMapper.selectByPrimaryKey(id);
	}

	/**
	 * 
	 * <p>根据商城合同编号获取需求单</p>
	 * @param mallcontractcode
	 * @return
	 * @author wangzh
	 */
	public Jndneed getNeedByMallcontractcode(String mallcontractcode) {
		if (StringUtils.isBlank(mallcontractcode)) {
			return null;
		}
		Jndneed need = new Jndneed();
		need.setMallcontractcode(mallcontractcode);
		List<Jndneed> lst = jndneedMapper.selectByEqualField(need);
		if (lst.size() > 0) {
			return lst.get(0);
		}
		return null;
	}

	/**
	 * 加拿大预入库列表查询
	 * @param jndcar
	 * @param start
	 * @param pageSize
	 * @return
	 * @throws ParseException 
	 */
	public Map<String, Object> PreEntryVehicleList(String userCountry, Jndcar jndcar, String start, String pageSize, String appointtimes) throws ParseException {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		if (jndcar.getStatus() == null) {
			jndcar.setStatus("70");// 加拿大预入库查询
		}
		if (StringUtils.isNotBlank(appointtimes)) {
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			jndcar.setAppointtime(date.parse(appointtimes));
		}
		if (StringUtils.isNotBlank(userCountry)) {
			jndcar.setCountry(Integer.parseInt(userCountry));
		}
		List<Jndcar> list = jndcarMapper.selectByCriteria(jndcar, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int c = jndcarMapper.countByCriteria(jndcar);
		if (jndcar.getCountry() != null) {
			Jndcar carprice = jndcarMapper.selectcarPrice(jndcar);
			map.put("carp1", carprice.getPrice());
			map.put("carp2", carprice.getCostprice());
			map.put("carp3", carprice.getCurrency());
		}
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	/**
	 * 加拿大入库检验单保存
	 * @author xhl
	 * @param selectvalue
	 * @param incolor
	 * @param seatnum
	 * @param outcolor
	 * @param Tiretype
	 * @param instoreid
	 * @param jndcarcheck
	 * @param carid
	 * @param location
	 * @param vin
	 * @param sleavefactime
	 * @param enginenum
	 * @param siden1
	 * @param siden2
	 * @param siden3
	 * @param siden4
	 * @param siden5
	 * @throws Exception
	 *
	 *
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void jndsaveCheckTheBondedArea(String canadaremarks, String selectvalue, String incolor, String seatnum, String outcolor, String Tiretype,
			String instoreid, Jndcarcheck jndcarcheck, int carid, MultipartFile location, String vin, String sleavefactime, String enginenum,
			MultipartFile siden1, MultipartFile siden2, MultipartFile siden3, MultipartFile siden4, MultipartFile siden5) throws Exception {
		// TODO Auto-generated method stub
		Jndfile jndfile = new Jndfile();
		Jndcar car = new Jndcar();
		UserDTO user = SecurityHelper.getAdminUserInfo();
		Date dat = new Date();
		jndfile.setLocation(resourceService.CustomsDeclarationOutboundSave(location, FileTypeEnum.taxRefund));
		car.setIden1(resourceService.CustomsDeclarationOutboundSave(siden1, FileTypeEnum.taxRefund));
		car.setIden2(resourceService.CustomsDeclarationOutboundSave(siden2, FileTypeEnum.taxRefund));
		car.setIden3(resourceService.CustomsDeclarationOutboundSave(siden3, FileTypeEnum.taxRefund));
		car.setIden4(resourceService.CustomsDeclarationOutboundSave(siden4, FileTypeEnum.taxRefund));
		car.setIden5(resourceService.CustomsDeclarationOutboundSave(siden5, FileTypeEnum.taxRefund));
		Map<String, Map<String, Object>> maps = new HashMap<String, Map<String, Object>>();
		if (StringUtils.isNotBlank(car.getIden1())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", siden1.getInputStream());
			tMap.put("size", siden1.getSize());
			maps.put(car.getIden1(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden2())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", siden2.getInputStream());
			tMap.put("size", siden2.getSize());
			maps.put(car.getIden2(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden3())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", siden3.getInputStream());
			tMap.put("size", siden3.getSize());
			maps.put(car.getIden3(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden4())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", siden4.getInputStream());
			tMap.put("size", siden4.getSize());
			maps.put(car.getIden4(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden5())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", siden5.getInputStream());
			tMap.put("size", siden5.getSize());
			maps.put(car.getIden5(), tMap);
		}
		if (StringUtils.isNotBlank(jndfile.getLocation())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", location.getInputStream());
			tMap.put("size", location.getSize());
			maps.put(jndfile.getLocation(), tMap);
		}
		if (maps.entrySet().size() > 0) {
			resourceService.carCustomsDeclarationOutboundSave(maps, true);
		}
		jndfileMapper.insertSelective(jndfile);

		Jndcar jndcar = jndcarMapper.selectByPrimaryKey(carid);

		if (!selectvalue.equals("境外港口")) {
			jndfile.setCarid(carid);
			jndfile.setType("3");// 加拿大入库检验单状态
			jndfile.setCreatetime(dat);
			jndfileMapper.insertSelective(jndfile);
			jndcarcheck.setCarid(carid);

			jndcarcheck.setCreatetime(dat);
			jndcarcheck.setOperator(user.getName());
			if (jndcar.getCountry().equals(1)) {
				jndcarcheck.setArea("加拿大检验单");
			} else if (jndcar.getCountry().equals(2)) {
				jndcarcheck.setArea("中东检验单");
			}
			jndcarcheckMapper.insertSelective(jndcarcheck);
			car.setDatatype(1);// 入国外仓库（加拿大/中东）
		} else {
			car.setDatatype(2);// 境外港口
		}
		car.setStatus("1");// 1已入加拿大库
		car.setId(carid);
		car.setVin(vin);
		car.setInstoreid(Integer.parseInt(instoreid));
		car.setEnginenum(enginenum);
		car.setOutcolor(outcolor);
		car.setIncolor(incolor);
		car.setCheckstatus("1");
		car.setNote(canadaremarks);
		car.setSeatnum(Integer.parseInt(seatnum));
		car.setTiretype(Tiretype);
		if (StringUtils.isNotBlank(sleavefactime)) {
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			car.setLeavefactime(date.parse(sleavefactime));
		}
		car.setInstoretime(dat);// 海外车辆入库时间
		jndcarMapper.updateByPrimaryKeySelective(car);

		// 下面的代码应该在需求单匹配vin匹配不到的情况下不执行 因为这辆车之前的状态为0初始化 所以商城需求单匹配的时候匹配不到这辆还未添加vin的车
		if (StringUtils.isNotBlank(jndcar.getSkucode())) {// 存在skucode
			// 往jnd_carorder_detail添加车架号
			JndCarorderDetail detail = new JndCarorderDetail();
			detail.setSkucode(jndcar.getSkucode());
			List<JndCarorderDetail> lst = jndCarorderDetailMapper.selectByCriteria(detail);
			if (lst.size() > 0) {
				detail.setSkucode(null);
				detail.setId(lst.get(0).getId());
				detail.setVin(vin);
				jndCarorderDetailMapper.updateByPrimaryKeySelective(detail);
			}
		}
	}

	public String querysubbuyidBysubneedid(int suneedid) {
		// TODO Auto-generated method stub
		return jndsubbuyMapper.querysubbuyidBysubneedid(suneedid);
	}

	public String vinVerify(String vin) {
		// TODO Auto-generated method stub
		return jndcarMapper.vinVerify(vin);
	}

	/**
	 * 运输费用查询
	 * @param jndcar
	 * @param sstarttime
	 * @param start
	 * @param pageSize
	 * @return
	 * @throws ParseException
	 */
	public Map<String, Object> freightApplyFor(String userCountry, Jndcar jndcar, String sstarttime, String start, String pageSize) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		jndcar.setStatus("10");// 查询已经出库未申请运输费用的车辆 10 特殊值
		if (StringUtils.isNotBlank(sstarttime)) {
			SimpleDateFormat ds = new SimpleDateFormat("yyyy-MM-dd");
			jndcar.setStarttime(ds.parse(sstarttime));
		}
		if (StringUtils.isNotBlank(userCountry)) {
			jndcar.setCountry(Integer.parseInt(userCountry));
		}
		List<Jndcar> list = jndcarMapper.selectByCriteria(jndcar, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		for (Jndcar jndcar2 : list) {
			Store stor = storeMapper.selectByPrimaryKey(jndcar2.getInstoreid());
			if (StringUtils.isNotBlank(start)) {
				jndcar2.setRoughweight(stor.getName());
			} else {
				jndcar2.setRoughweight(null);
			}
		}
		int c = jndcarMapper.countByCriteria(jndcar);
		if (jndcar.getCountry() != null) {
			Jndcar carprice = jndcarMapper.selectcarPrice(jndcar);
			map.put("carp1", carprice.getPrice());
			map.put("carp2", carprice.getCostprice());
			map.put("carp3", carprice.getCurrency());
		}
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	/**
	 * 短驳费和海运费申请保存
	 * @param checkval
	 * @param username
	 * @param drayage
	 * @param oceanfreight
	 * @param elsecost1
	 * @param elsecost2
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void freightAdd(Integer checkval, jndfreight jndfreight) {
		// TODO Auto-generated method stub
		UserDTO username = SecurityHelper.getAdminUserInfo();
		Jndcar car = jndcarMapper.selectByPrimaryKey(checkval);
		jndfreight.setProposer(username.getName());
		jndfreight.setType(1);// 审核中
		jndfreight.setProposertime(new Date());
		jndfreight.setNum(1);// 审核数量.0
		jndfreight.setCountry(car.getCountry());
		jndfreight.setCurrency(car.getCurrency());
		jndfreightMapper.insertSelective(jndfreight);
		int fid = jndfreight.getId();
		JndfreightcarKey jndfa = new JndfreightcarKey();
		jndfa.setFreid(fid);
		jndfa.setCarid(checkval);
		jndfreightcarMapper.insertSelective(jndfa);
		Jndcar car1 = new Jndcar();
		car1.setId(checkval);
		car1.setStatus1("1");
		jndcarMapper.updateByPrimaryKeySelective(car1);
	}

	/**
	 * 运费申请单查询
	 * @param jndfreight
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> freightpage(jndfreight jndfreight, String start, String pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		jndfreight.setType(8);// 财务查询未撤销的申请 8是特殊值
		List<jndfreight> list = jndfreightMapper.selectByCriteria(jndfreight, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int c = jndfreightMapper.countByCriteria(jndfreight);
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	public List<RoleAccount> queryRoleidByUserId(Integer id) {
		// TODO Auto-generated method stub
		return roleAccountMapper.queryRoleIdByloginId(id);
	}

	public jndfreight queryjndfreight(int id) {
		// TODO Auto-generated method stub
		return jndfreightMapper.selectByPrimaryKey(id);
	}

	/**
	 * 查询申请的车辆
	 * @param id
	 * @return
	 */
	public Map<String, Object> freightCarList(int id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		JndfreightcarKey jndfa = new JndfreightcarKey();
		List<Jndcar> list = new ArrayList<Jndcar>();
		jndfa.setFreid(id);
		List<JndfreightcarKey> jndfa1 = jndfreightcarMapper.selectByCriteria(jndfa);
		for (int i = 0; i < jndfa1.size(); i++) {
			Jndcar jndc = jndcarMapper.selectByPrimaryKey(jndfa1.get(i).getCarid());
			Store stor = storeMapper.selectByPrimaryKey(jndc.getInstoreid());
			if (StringUtils.isNotBlank(stor.getName())) {
				jndc.setRoughweight(stor.getName());
			} else {
				jndc.setRoughweight(null);
			}
			list.add(jndc);
		}
		map.put("carnum", jndfa1.size());
		map.put("result", list);
		return map;
	}

	/**
	 * 审核通过保存
	 * @param id
	 * @return 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void freightCarUpdate(int id, String username) {
		// TODO Auto-generated method stub
		jndfreight jnd = new jndfreight();
		jnd.setId(id);
		jnd.setType(2);// 审核通过保存
		jnd.setVerifier(username);
		jnd.setVerifiertime(new Date());
		jndfreight jndf = jndfreightMapper.selectByPrimaryKey(id);// 查询各种运费
		if (jndf == null) {
			throw new PortalAppUnCheckedException("该申请已经被删除,请确认！");
		} else if (jndf.getType() == 3) {// 已经审核不通过
			throw new PortalAppUnCheckedException("已经被审核不通过,请确认！");
		} else if (jndf.getType() == 2) {
			throw new PortalAppUnCheckedException("已经被审核通过,请确认！");
		} else if (jndf.getType() == 4) {
			throw new PortalAppUnCheckedException("审核已经被撤销,请确认！");
		} else {
			jndfreightMapper.updateByPrimaryKeySelective(jnd);
			JndfreightcarKey jndfa = new JndfreightcarKey();
			BigDecimal ec1 = BigDecimal.ZERO;
			BigDecimal ec2 = BigDecimal.ZERO;

			BigDecimal surepreoilprice = BigDecimal.ZERO;// 实际燃油费
			BigDecimal Surepreinsuranceprice = BigDecimal.ZERO;// 确认保险价格
			BigDecimal fourstorep = BigDecimal.ZERO;// 4s店到仓库费
			BigDecimal brandp = BigDecimal.ZERO;// 牌照费
			jndfa.setFreid(id);
			List<JndfreightcarKey> jndfa1 = jndfreightcarMapper.selectByCriteria(jndfa);
			BigDecimal dr = (jndf.getDrayage()).divide((new BigDecimal(jndfa1.size())), 2, BigDecimal.ROUND_HALF_UP).abs();// 每辆车的短驳费
																															// 新需求：仓库到港口的费用
			BigDecimal oc = (jndf.getOceanfreight()).divide((new BigDecimal(jndfa1.size())), 2, BigDecimal.ROUND_HALF_UP).abs();// 每辆车的海运费

			if (jndf.getElsecost1() != null) {
				ec1 = (jndf.getElsecost1()).divide((new BigDecimal(jndfa1.size())), 2, BigDecimal.ROUND_HALF_UP).abs();// 每辆车的其他费1
			}
			if (jndf.getElsecost2() != null) {
				ec2 = (jndf.getElsecost2()).divide((new BigDecimal(jndfa1.size())), 2, BigDecimal.ROUND_HALF_UP).abs();// 每辆车的其他费2
			}

			if (jndf.getFourtorep() != null) {
				fourstorep = (jndf.getFourtorep()).divide(new BigDecimal(jndfa1.size()), 2, BigDecimal.ROUND_HALF_UP).abs();// 每辆车的4s店到仓库费
			}
			if (jndf.getBrandprice() != null) {
				brandp = (jndf.getBrandprice()).divide(new BigDecimal(jndfa1.size()), 2, BigDecimal.ROUND_HALF_UP).abs();// 每辆车的牌照费
			}
			if (jndf.getSurepreinsuranceprice() != null) {
				Surepreinsuranceprice = (jndf.getSurepreinsuranceprice()).divide(new BigDecimal(jndfa1.size()), 2, BigDecimal.ROUND_HALF_UP).abs();// 实际保险费
			}
			if (jndf.getSurepreoilprice() != null) {
				surepreoilprice = (jndf.getSurepreoilprice()).divide(new BigDecimal(jndfa1.size()), 2, BigDecimal.ROUND_HALF_UP).abs();// 实际燃油费
			}
			BigDecimal cc = new BigDecimal(dr.add(surepreoilprice).add(Surepreinsuranceprice).add(oc).add(ec1).add(ec2).add(fourstorep).add(brandp)
					.doubleValue()).setScale(2, BigDecimal.ROUND_UP);
			Jndcar car = new Jndcar();
			for (int i = 0; i < jndfa1.size(); i++) {
				Jndcar jndcar2 = jndcarMapper.selectByPrimaryKey(jndfa1.get(i).getCarid());
				Car carc = carMapper.selectByCriteriaByVin(jndcar2.getVin());// 根据车架号查询已经入中国库的车辆如果查到就修改其成本价
				if (carc != null) {
					carc.setBuyPrice(cc);
					carMapper.updateByPrimaryKeySelective(carc);
				}
				if (jndcar2.getCostprice() == null) {
					jndcar2.setCostprice(cc);
				} else {
					jndcar2.setCostprice(jndcar2.getCostprice().add(cc).setScale(2, BigDecimal.ROUND_UP));
				}
				car.setStatus1("2");
				if (fourstorep.compareTo(BigDecimal.ZERO) > 0) {
					car.setFourtorep(fourstorep);
				}
				if (brandp.compareTo(BigDecimal.ZERO) > 0) {
					car.setBrandprice(brandp);
				}
				car.setSurepreinsuranceprice(Surepreinsuranceprice);
				car.setSurepreoilprice(surepreoilprice);
				car.setDrayage(dr);
				car.setOceanfreight(oc);
				car.setElsecost1(ec1);
				car.setElsecost1(ec2);
				car.setId(jndfa1.get(i).getCarid());
				car.setCostprice(jndcar2.getCostprice());
				jndcarMapper.updateByPrimaryKeySelective(car);
			}
		}
	}

	/**
	 * 审核不通过保存
	 * @param id
	 * @param reason
	 * @param username
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void freightCarNoPass(int id, String reason, String username) {
		// TODO Auto-generated method stub
		jndfreight jnd = new jndfreight();
		jnd.setId(id);
		jnd.setType(3);
		jnd.setVerifier(username);
		jnd.setVerifiertime(new Date());
		if (StringUtils.isNotBlank(reason)) {
			jnd.setReason(reason);
		}
		jndfreight jndf = jndfreightMapper.selectByPrimaryKey(id);// 查询当前状态
		if (jndf == null) {
			throw new PortalAppUnCheckedException("该申请已经被删除,请确认！");
		} else if (jndf.getType() == 3) {// 已经审核不通过
			throw new PortalAppUnCheckedException("已经被审核不通过,请确认！");
		} else if (jndf.getType() == 2) {
			throw new PortalAppUnCheckedException("已经被审核通过,请确认！");
		} else if (jndf.getType() == 4) {
			throw new PortalAppUnCheckedException("审核已经被撤销,请确认！");
		} else {
			jndfreightMapper.updateByPrimaryKeySelective(jnd);
			JndfreightcarKey jndfa = new JndfreightcarKey();
			jndfa.setFreid(id);
			List<JndfreightcarKey> jndfa1 = jndfreightcarMapper.selectByCriteria(jndfa);
			for (int i = 0; i < jndfa1.size(); i++) {
				jndcarMapper.updateByPrimaryKeyStatus1(jndfa1.get(i).getCarid());// 解绑审核不通过可以重新提交审核

			}
		}
	}

	/**
	 * 加拿大运费申请查询
	 * @param jndfreight
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> freightApplyUpdatelist(String userCountry, jndfreight jndfreight, String start, String pageSize) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		if (StringUtils.isNotBlank(userCountry)) {
			jndfreight.setCountry(Integer.parseInt(userCountry));
		}
		List<jndfreight> list = jndfreightMapper.selectByCriteria(jndfreight, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int c = jndfreightMapper.countByCriteria(jndfreight);
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	/**
	 * 撤销运费申请
	 * @param id
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void repealfreight(int id) {
		// TODO Auto-generated method stub
		jndfreight jnd = jndfreightMapper.selectByPrimaryKey(id);
		if (jnd.getType() == 3) {// 已经审核不通过
			throw new PortalAppUnCheckedException("已经被审核不通过,请确认！");
		} else if (jnd.getType() == 2) {
			throw new PortalAppUnCheckedException("已经被审核通过,请确认！");
		} else if (jnd.getType() == 4) {
			throw new PortalAppUnCheckedException("审核已经被撤销,请确认！");
		} else {
			jndfreight jndfa = new jndfreight();
			jndfa.setType(4);
			jndfa.setId(id);
			jndfreightMapper.updateByPrimaryKeySelective(jndfa);
		}
	}

	/**
	 * 删除申请单
	 * @param id
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void deletefreight(int id) {
		// TODO Auto-generated method stub
		jndfreight jnd = jndfreightMapper.selectByPrimaryKey(id);
		if (jnd.getType() == 2) {// 已经审核通过
			throw new PortalAppUnCheckedException("已经被审核通过,请确认！");
		} else if (jnd.getType() == 3) {
			jndfreightcarMapper.deletefreight(id);
			jndfreightMapper.deleteByPrimaryKey(id);
		} else {
			JndfreightcarKey jndfa = new JndfreightcarKey();
			jndfa.setFreid(id);
			List<JndfreightcarKey> jndfa1 = jndfreightcarMapper.selectByCriteria(jndfa);
			for (int i = 0; i < jndfa1.size(); i++) {
				jndcarMapper.updateByPrimaryKeyStatus1(jndfa1.get(i).getCarid());// 解绑审核删除可以重新提交审核
			}
			jndfreightcarMapper.deletefreight(id);
			jndfreightMapper.deleteByPrimaryKey(id);
		}
	}

	public jndfreight Updatefreight(int id) {
		// TODO Auto-generated method stub
		return jndfreightMapper.selectByPrimaryKey(id);
	}

	/**
	 * 修改保存申请单
	 * @param jndfreight
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void updatefreightsave(jndfreight jndfreight) {
		// TODO Auto-generated method stub
		jndfreight jnd = jndfreightMapper.selectByPrimaryKey(jndfreight.getId());
		if (jnd.getType() == 3) {// 已经审核不通过
			throw new PortalAppUnCheckedException("已经被审核不通过,请确认！");
		} else if (jnd.getType() == 2) {
			throw new PortalAppUnCheckedException("已经被审核通过,请确认！");
		} else {
			jndfreight.setType(1);
			jndfreightMapper.updateByPrimaryKeySelective(jndfreight);
		}
	}

	public List<Shop> queryAllShop() {
		// TODO Auto-generated method stub
		return shopMapper.selectByCriteriaExceptMc();
	}

	/**
	 * 加拿大车辆入中国仓库
	 * @param dto
	 * @param carid
	 * @throws IOException 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void saveCarTypein(String iden11, String iden22, String iden33, String iden44, String iden55, CarTypeinDto dto, String carid) throws IOException {
		// TODO Auto-generated method stub
		Car car = new Car();
		// BeanCopierUtils.copyProperties(dto, car);
		car.setCreateTime(new Date());// 记录创建时间
		Jndcar jndcar = new Jndcar();
		if (dto.getIden1().getSize() > 0) {
			car.setIden1(resourceService.uploadFileProcessStr(dto.getIden1(), FileTypeEnum.CARIDENTIFY));
			jndcar.setNiden1(car.getIden1());
		} else {
			car.setIden1(iden11);
		}
		if (dto.getIden2().getSize() > 0) {
			car.setIden2(resourceService.uploadFileProcessStr(dto.getIden2(), FileTypeEnum.CARIDENTIFY));
			jndcar.setNiden2(car.getIden2());
		} else {
			car.setIden2(iden22);
		}
		if (dto.getIden3().getSize() > 0) {
			car.setIden3(resourceService.uploadFileProcessStr(dto.getIden3(), FileTypeEnum.CARIDENTIFY));
			jndcar.setNiden3(car.getIden3());
		} else {
			car.setIden3(iden33);
		}
		if (dto.getIden4().getSize() > 0) {
			car.setIden4(resourceService.uploadFileProcessStr(dto.getIden4(), FileTypeEnum.CARIDENTIFY));
			jndcar.setNiden4(car.getIden4());
		} else {
			car.setIden4(iden44);
		}
		if (dto.getIden5().getSize() > 0) {
			car.setIden5(resourceService.uploadFileProcessStr(dto.getIden5(), FileTypeEnum.CARIDENTIFY));
			jndcar.setNiden5(car.getIden5());
		} else {
			car.setIden5(iden55);
		}
		Map<String, Map<String, Object>> map = new HashMap<String, Map<String, Object>>();
		if (StringUtils.isNotBlank(car.getIden1())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", dto.getIden1().getInputStream());
			tMap.put("size", dto.getIden1().getSize());
			map.put(car.getIden1(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden2())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", dto.getIden2().getInputStream());
			tMap.put("size", dto.getIden2().getSize());
			map.put(car.getIden2(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden3())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", dto.getIden3().getInputStream());
			tMap.put("size", dto.getIden3().getSize());
			map.put(car.getIden3(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden4())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", dto.getIden4().getInputStream());
			tMap.put("size", dto.getIden4().getSize());
			map.put(car.getIden4(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden5())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", dto.getIden5().getInputStream());
			tMap.put("size", dto.getIden5().getSize());
			map.put(car.getIden5(), tMap);
		}

		if (map.entrySet().size() > 0) {
			resourceService.asyncSaveFiles(map, true);
		}

		car.setJndcar(Integer.parseInt(carid));// 加拿大过来的车
		car.setEngineNum(dto.getEngineNum());
		car.setVin(dto.getVin());
		car.setBrand(dto.getBrand());
		car.setModel(dto.getModel());
		car.setVersion(dto.getVersion());
		car.setLenWidHei(dto.getLenWidHei());
		car.setRealSale(dto.getRealSale());
		car.setBuyerName(dto.getBuyerName());
		car.setAddress(dto.getAddress());
		if (StringUtils.isNotBlank(dto.getLeaveFactoryTime())) {
			car.setLeaveFactoryTime(DateUtils.parse(dto.getLeaveFactoryTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		}
		if (StringUtils.isNotBlank(dto.getPurchaseTime())) {
			car.setPurchaseTime(DateUtils.parse(dto.getPurchaseTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
			jndcar.setPurchasetime(car.getPurchaseTime());// 待入中国库-采购时间
		}
		car.setDisplacement(dto.getDisplacement());
		car.setOilWear(dto.getOilWear());
		car.setDischarge(dto.getDischarge());
		car.setWeight(dto.getWeight());
		car.setLevel(dto.getLevel());
		car.setGearbox(dto.getGearbox());
		// car.setEnergyType(dto.getEnergyType());
		car.setOutlookColor(dto.getOutlookColor());
		car.setInnerColor(dto.getInnerColor());
		car.setBuyName(dto.getBuyName());
		car.setDecorate(dto.getDecorate());
		if (StringUtils.isNotBlank(dto.getBuyPrice())) {// 采购价
			car.setBuyPrice(new BigDecimal(dto.getBuyPrice()));
		}
		if (StringUtils.isNotBlank(dto.getSellerprice())) {// 采购价
			car.setSellerprice(new BigDecimal(dto.getSellerprice()));
			jndcar.setSellerprice(car.getSellerprice());// 待入中国库-销售价
		}
		if (StringUtils.isNotBlank(dto.getLowPrice())) {// 最低销售价
			car.setLowPrice(new BigDecimal(dto.getLowPrice()));
		}
		if (dto.getEnergyType().substring(0, 1).equals("s")) {// 现在地址是仓库
			Store store = storeMapper.selectByPrimaryKey(Integer.parseInt(dto.getEnergyType().substring(1)));
			car.setStoreId(Integer.parseInt(dto.getEnergyType().substring(1)));
			car.setCarAddress(store.getAddress());
			car.setStoreType(2);// 仓库存储
		}
		if (dto.getEnergyType().startsWith("h")) {// 现在门店所在地
			Shop shop = shopMapper.selectByPrimaryKey(Integer.parseInt(dto.getEnergyType().substring(1)));
			car.setShopId(Integer.parseInt(dto.getEnergyType().substring(1)));
			car.setCarAddress(shop.getAddress());
			car.setStoreType(1);// 门店存储
		}
		if (StringUtils.isNotBlank(carid)) {
			jndcar.setAddress(dto.getAddress());
			jndcar.setEnergytype(dto.getEnergyType());
			jndcar.setBuyeruser(dto.getBuyerName());
			jndcar.setDecorate(dto.getDecorate());
			jndcar.setRealsale(dto.getRealSale());
			jndcar.setId(Integer.parseInt(carid));
			jndcar.setStatus("5");// 出库至中国资产库待审核
			jndcarMapper.updateByPrimaryKeySelective(jndcar);
			// 查看是否是商城订购的车
			Jndcar thjc = jndcarMapper.selectByPrimaryKey(jndcar.getId());
			String sku = thjc.getSkucode();
			if (StringUtils.isNotBlank(sku)) {
				String concode = thjc.getMallcontractcode();
				if (StringUtils.isNotBlank(concode)) {
					Jndneed nd = getNeedByMallcontractcode(concode);
					if (nd != null) {
						if (nd.getStatus() == null) {// 正常 未失效时加入skucode和mallcarstatus
							JndCarorderDetail detail = new JndCarorderDetail();
							detail.setSkucode(sku);
							List<JndCarorderDetail> dlst = jndCarorderDetailMapper.selectByCriteria(detail);
							if (dlst.size() > 0) {
								car.setMallCarSkuCode(sku);
								JndCarorderDetail detail0 = dlst.get(0);
								Integer vs = detail0.getVerifystatus();
								if (vs == null || vs.intValue() < 5) {// 1(商城订购null-4) 2(商城已售5)
									car.setMallCarStatus(1);
								} else {
									car.setMallCarStatus(2);
								}
							}
						}
					}
				}
			}
		}
		car.setIsStored(StoreStatusEnum.AUDIT.getValue());
		carMapper.insertSelective(car);
	}

	/**
	 * 发动机号验证
	 * @param enginenum
	 * @return
	 */
	public String enginenumVerify(String enginenum) {
		// TODO Auto-generated method stub
		return jndcarMapper.enginenumVerify(enginenum);
	}

	public int cvinVerify(String vin) {
		// TODO Auto-generated method stub
		Car car = new Car();
		car.setVin(vin);
		return carMapper.countByParam(car);
	}

	public int cenginenumVerify(String enginenum) {
		// TODO Auto-generated method stub
		Car car = new Car();
		car.setEngineNum(enginenum);
		return carMapper.countByParam(car);
	}

	/**
	 * 根据英文地址查询货币符号
	 * @param site
	 * @return
	 */
	public jndSite querycurrency(String site) {
		// TODO Auto-generated method stub
		jndSite jnd = new jndSite();
		jnd.setEname(site);
		return jndSiteMapper.querycurrency(jnd);
	}

	public List<Store> sitestore(Store st) {
		// TODO Auto-generated method stub
		return storeMapper.selectByCountry(st);
	}

	public Contractapplypay njndApplyPayEdit(int id) {
		// TODO Auto-generated method stub
		return contractapplypayMapper.selectByPrimaryKey(id);
	}

	public Jndbuy querybuy(Integer id) {
		// TODO Auto-generated method stub
		return jndbuyMapper.selectByPrimaryKey(id);
	}

	/**
	 * 合同付款申请单审核通过
	 * @param id
	 * @param name
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void updatecontract(int cid, String id) {
		// TODO Auto-generated method stub
		Jndcontract contract = new Jndcontract();
		Contractapplypay cp = new Contractapplypay();
		User name = userMapper.selectByPrimaryKey(Integer.parseInt(id));// 根据id查询账户姓名
		contract.setApayid(cid);
		Contractapplypay conp = contractapplypayMapper.selectByPrimaryKey(cid);// 查询申请单状态
		List<Jndcontract> jndc = jndcontractMapper.selectByCriteria(contract);// 根据申请id查询合同
		if (conp == null) {
			throw new PortalAppUnCheckedException("该申请已经被删除,请确认！");
		} else if (conp.getCstatus() == 2) {
			throw new PortalAppUnCheckedException("已经被审核通过,请确认！");
		} else if (conp.getCstatus() == 3) {// 已经审核不通过
			throw new PortalAppUnCheckedException("已经被审核不通过,请确认！");
		} else if (conp.getCstatus() == 4) {
			throw new PortalAppUnCheckedException("审核已经被撤销,请确认！");
		} else {
			if (conp.getPaytype() == 1 || conp.getPaytype() == 2) {// 定金和全款
				contract.setApayid(cid);
				contract.setApaylock(2);// 定金和全款审核通过
			} else if (conp.getPaytype() == 3) {// 尾款
				contract.setApayid(cid);
				contract.setApaylock(3);// 尾款审核通过
			}
			cp.setId(cid);
			cp.setCstatus(2);// 审核通过
			cp.setAudit(name.getName());
			cp.setAudittime(new Date());
			jndcontractMapper.updateapaylock(contract);// 修改合同状态
			contractapplypayMapper.updateByPrimaryKeySelective(cp);// 修改申请单状态
		}
		if (conp.getPaytype() == 2) {// 全款审核通过后把车辆导入车辆表

			Jndbuy buy = jndbuyMapper.selectByPrimaryKey(conp.getBuyid());// 根据采购id查询采购信息
			Jndneed need = jndneedMapper.selectByPrimaryKey(buy.getNeedid());// 查询需求信息
			for (Jndcontract jndcontract : jndc) {
				String mallordercode = null;
				List<JndCarorderDetail> dlst = null;// 子订单下所有车
				if (StringUtils.isNotBlank(jndcontract.getMallcontractcode())) {// 该合同存在商城合同
					mallordercode = getMallOrdercodeByJndcontract(jndcontract);
					if (StringUtils.isNotBlank(mallordercode)) {
						JndCarorderDetail carorderDetail = new JndCarorderDetail();
						carorderDetail.setSubordercode(mallordercode);
						dlst = jndCarorderDetailMapper.selectByCriteria(carorderDetail);
						if (dlst.size() > 0) {
							// 排除掉有vin或有vinsource的车，即需求单审核时匹配过的车
							for (Iterator<JndCarorderDetail> iterator = dlst.iterator(); iterator.hasNext();) {
								JndCarorderDetail detail = (JndCarorderDetail) iterator.next();
								if (StringUtils.isNotBlank(detail.getVin()) || detail.getVinsource() != null) {
									iterator.remove();
								}
							}
						}
					}
				}
				Date now = new Date();
				Jndcar jndcar = new Jndcar();
				jndcar.setApplypayid(cid);
				jndcar.setNeedcode(need.getCode());
				jndcar.setNeedname(need.getName());
				jndcar.setBuycode(buy.getCode());
				jndcar.setBuyname(buy.getName());
				jndcar.setBrand(jndcontract.getBrand());
				jndcar.setModel(jndcontract.getModel());
				jndcar.setVersion(jndcontract.getVersion());
				jndcar.setDisplacement(jndcontract.getDisplacement());
				jndcar.setConfig(jndcontract.getConfig());
				jndcar.setOutcolor(jndcontract.getOutcolor());
				jndcar.setIncolor(jndcontract.getIncolor());
				jndcar.setAppointtime(jndcontract.getAppointtime());
				jndcar.setNeeder(jndcontract.getNeeder());
				jndcar.setCreatetime(now);
				jndcar.setPrice((jndcontract.getPrice()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());// 平均车辆价格
				jndcar.setCostprice((jndcontract.getTotalprice()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());// 平均车辆成本价格
				if (jndcontract.getInsurance() != null) {
					jndcar.setInsurance((jndcontract.getInsurance()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());// 平均保险
				}
				jndcar.setStatus("0");// 0初始化状态
				jndcar.setNeeder(jndcontract.getNeeder());
				jndcar.setBuyername(jndcontract.getSname());
				jndcar.setCurrency(jndcontract.getCurrency());
				jndcar.setCountry(jndcontract.getCountry());
				jndcar.setContractid(jndcontract.getId());
				jndcar.setContractname(jndcontract.getCode());// 合同编号
				jndcar.setNeeder(jndcontract.getNeeder());
				jndcar.setMallcontractcode(jndcontract.getMallcontractcode());
				if (mallordercode != null) {
					jndcar.setMallordercode(mallordercode);// 设置jnd_car的商城订单编号
				}
				for (int i = 0; i < jndcontract.getNum(); i++) {

					if (dlst != null && dlst.size() > 0) {
						try {
							String skucode = dlst.get(i).getSkucode();
							jndcar.setSkucode(skucode);
						} catch (Exception e) {
							throw new PortalAppUnCheckedException("全款审核通过后插入海外业务库表（jnd_car）时，获取商城子订单所属的车辆唯一编码skucode时，越界index[" + i + "]");
						}
					}
					jndcarMapper.insertSelective(jndcar);
				}
			}
		} else if (conp.getPaytype() == 1) {// 定金审核通过后把车辆导入车辆表

			Jndbuy buy = jndbuyMapper.selectByPrimaryKey(conp.getBuyid());// 根据采购id查询采购信息
			Jndneed need = jndneedMapper.selectByPrimaryKey(buy.getNeedid());// 查询需求信息
			for (Jndcontract jndcontract : jndc) {

				String mallordercode = null;
				List<JndCarorderDetail> dlst = null;// 子订单下所有车
				if (StringUtils.isNotBlank(jndcontract.getMallcontractcode())) {// 该合同存在商城合同
					mallordercode = getMallOrdercodeByJndcontract(jndcontract);
					if (StringUtils.isNotBlank(mallordercode)) {
						JndCarorderDetail carorderDetail = new JndCarorderDetail();
						carorderDetail.setSubordercode(mallordercode);
						dlst = jndCarorderDetailMapper.selectByCriteria(carorderDetail);
						if (dlst.size() > 0) {
							// 排除掉有vin或有vinsource的车，即需求单审核时匹配过的车
							for (Iterator<JndCarorderDetail> iterator = dlst.iterator(); iterator.hasNext();) {
								JndCarorderDetail detail = (JndCarorderDetail) iterator.next();
								if (StringUtils.isNotBlank(detail.getVin()) || detail.getVinsource() != null) {
									iterator.remove();
								}
							}
						}
					}
				}

				Jndcar jndcar = new Jndcar();
				if (jndcontract.getPreinsuranceprice() != null) {// 预估保险费
					jndcar.setPreinsuranceprice((jndcontract.getPreinsuranceprice())
							.divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());
				}
				if (jndcontract.getPredrayageprice() != null) {// 预估短驳费
					jndcar.setPredrayageprice((jndcontract.getPredrayageprice()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP)
							.abs());
				}
				if (jndcontract.getPrelicenseprice() != null) {// 预估执照费
					jndcar.setPrelicenseprice((jndcontract.getPrelicenseprice()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP)
							.abs());
				}
				if (jndcontract.getPreoilprice() != null) {// 预估燃油费
					jndcar.setPreoilprice((jndcontract.getPreoilprice()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());
				}
				jndcar.setApplypayid(cid);
				jndcar.setNeedcode(need.getCode());
				jndcar.setNeedname(need.getName());
				jndcar.setBuycode(buy.getCode());
				jndcar.setBuyname(buy.getName());
				jndcar.setBrand(jndcontract.getBrand());
				jndcar.setModel(jndcontract.getModel());
				jndcar.setVersion(jndcontract.getVersion());
				jndcar.setDisplacement(jndcontract.getDisplacement());
				jndcar.setConfig(jndcontract.getConfig());
				jndcar.setOutcolor(jndcontract.getOutcolor());
				jndcar.setIncolor(jndcontract.getIncolor());
				jndcar.setAppointtime(jndcontract.getAppointtime());
				jndcar.setCreatetime(new Date());
				jndcar.setStatus("0");// 初始化
				jndcar.setNeeder(jndcontract.getNeeder());
				jndcar.setNeeder(jndcontract.getNeeder());
				jndcar.setBuyername(jndcontract.getSname());
				jndcar.setCurrency(jndcontract.getCurrency());
				jndcar.setCountry(jndcontract.getCountry());
				jndcar.setContractid(jndcontract.getId());
				jndcar.setContractname(jndcontract.getCode());// 合同编号
				jndcar.setNeeder(jndcontract.getNeeder());
				jndcar.setMallcontractcode(jndcontract.getMallcontractcode());
				if (mallordercode != null) {
					jndcar.setMallordercode(mallordercode);// 设置jnd_car的商城订单编号
				}
				for (int i = 0; i < jndcontract.getNum(); i++) {

					if (dlst != null && dlst.size() > 0) {
						try {
							String skucode = dlst.get(i).getSkucode();
							jndcar.setSkucode(skucode);
						} catch (Exception e) {
							throw new PortalAppUnCheckedException("定金审核通过后插入海外业务库表（jnd_car）时，获取商城子订单所属的车辆唯一编码skucode时，越界index[" + i + "]");
						}
					}

					jndcarMapper.insertSelective(jndcar);
				}
			}
		} else if (conp.getPaytype() == 3 && conp.getSelfbuy().equals("2")) {// 代采尾款审核通过后更改车辆表里的成本价和车价

			for (Jndcontract jndcontract : jndc) {
				Jndcar jndcar = new Jndcar();
				jndcar.setPrice((jndcontract.getPrice()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());// 平均车辆价格
				jndcar.setCostprice((jndcontract.getTotalprice()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());// 平均车辆成本价格
				if (jndcontract.getInsurance() != null) {
					jndcar.setInsurance((jndcontract.getInsurance()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());// 平均保险
				}
				jndcar.setContractid(jndcontract.getId());
				jndcarMapper.updatecarprice(jndcar);
			}
		} else if (conp.getPaytype() == 3 && conp.getSelfbuy().equals("1")) {// 自采付款申请只能选择一个合同

			for (Jndcontract jndcontract : jndc) {
				Jndcar jndcar = new Jndcar();
				BigDecimal allCostprice = BigDecimal.ZERO;// 添加其他加装费用计算每辆车成本价

				if (conp.getInsurance() != null) {// 保险
					jndcar.setInsurance((conp.getInsurance()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());// 平均保险
				}
				if (conp.getOthercost() != null) {
					allCostprice = allCostprice.add((conp.getOthercost()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());
				}
				if (conp.getT1price() != null) {
					allCostprice = allCostprice.add((conp.getT1price()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());
				}
				if (conp.getT2price() != null) {
					allCostprice = allCostprice.add((conp.getT2price()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());
				}
				if (conp.getT3price() != null) {
					allCostprice = allCostprice.add((conp.getT3price()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());
				}
				if (conp.getT4price() != null) {
					allCostprice = allCostprice.add((conp.getT4price()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());
				}
				if (conp.getT5price() != null) {
					allCostprice = allCostprice.add((conp.getT5price()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());
				}
				if (conp.getT6price() != null) {
					allCostprice = allCostprice.add((conp.getT6price()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());
				}
				if (conp.getT7price() != null) {
					allCostprice = allCostprice.add((conp.getT7price()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());
				}
				if (conp.getT8price() != null) {
					allCostprice = allCostprice.add((conp.getT8price()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());
				}
				if (conp.getT9price() != null) {
					allCostprice = allCostprice.add((conp.getT9price()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());
				}
				if (conp.getT10price() != null) {
					allCostprice = allCostprice.add((conp.getT10price()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());
				}
				if (conp.getT11price() != null) {
					allCostprice = allCostprice.add((conp.getT11price()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());
				}
				if (conp.getT12price() != null) {
					allCostprice = allCostprice.add((conp.getT12price()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());
				}
				jndcar.setPrice((jndcontract.getPrice()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs());// 平均车辆价格
				jndcar.setCostprice((jndcontract.getTotalprice()).divide((new BigDecimal(jndcontract.getNum())), 2, BigDecimal.ROUND_HALF_UP).abs()
						.add(allCostprice));// 平均车辆成本价格

				jndcar.setContractid(jndcontract.getId());
				jndcarMapper.updatecarprice(jndcar);
			}
		}
	}

	/**
	 * 
	 * <p>通过所选择的合同获取子需求对应的商城订单编号</p>
	 * @param contract
	 * @author wangzh
	 */
	public String getMallOrdercodeByJndcontract(Jndcontract contract) {
		if (contract == null) {
			return null;
		}
		String mallcontractcode = contract.getMallcontractcode();
		if (StringUtils.isNotBlank(mallcontractcode)) {
			Integer subbuyid = contract.getSubbuyid();// 子采购id
			Jndsubbuy subbuy = jndsubbuyMapper.selectByPrimaryKey(subbuyid);
			if (subbuy == null) {
				return null;
			}
			Integer subneedid = subbuy.getSubneedid();
			Jndsubneed subneed = jndsubneedMapper.selectByPrimaryKey(subneedid);
			if (subneed == null) {
				return null;
			}
			return subneed.getMallordercode();
		}
		return null;
	}

	/**
	 * 合同付款审核不通过
	 * @param id
	 * @param username
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void updatecontractNoPass(int cid, String id, String cause) {
		// TODO Auto-generated method stub
		Contractapplypay cp = new Contractapplypay();
		User name = userMapper.selectByPrimaryKey(Integer.parseInt(id));// 根据id查询账户姓名
		Contractapplypay conp = contractapplypayMapper.selectByPrimaryKey(cid);// 查询申请单状态
		if (conp == null) {
			throw new PortalAppUnCheckedException("该申请已经被删除,请确认！");
		} else if (conp.getCstatus() == 2) {
			throw new PortalAppUnCheckedException("已经被审核通过,请确认！");
		} else if (conp.getCstatus() == 3) {// 已经审核不通过
			throw new PortalAppUnCheckedException("已经被审核不通过,请确认！");
		} else if (conp.getCstatus() == 4) {
			throw new PortalAppUnCheckedException("审核已经被撤销,请确认！");
		} else {
			cp.setCause(cause);
			cp.setId(cid);
			cp.setCstatus(3);// 审核通过
			cp.setAudit(name.getName());
			cp.setAudittime(new Date());
			contractapplypayMapper.updateByPrimaryKeySelective(cp);// 修改申请单状态
		}
	}

	/**
	 *  根据采购id查询合同
	 * @param paraMap
	 * @param cbuyid 
	 * @param buyid 
	 * @param selfbuy 
	 * @param cid 
	 * @return
	 */
	public Map<String, Object> selectcontracts(Map<String, Object> paraMap, Integer buyid, String cbuyid, String id) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> lstMap = new ArrayList<Map<String, Object>>();
		if (buyid != null && cbuyid != "") {//
			if (buyid == Integer.parseInt(cbuyid)) {
				resultMap.put("id", id);
				List<Map<String, Object>> jndc = jndcontractMapper.selectContract(resultMap);
				for (Map<String, Object> map : jndc) {
					lstMap.add(map);
				}
				List<Map<String, Object>> lstM = jndcontractMapper.selectContracts(paraMap);
				for (Map<String, Object> map : lstM) {
					lstMap.add(map);
				}
			}
		}
		if (buyid != null && cbuyid == "") {
			lstMap = jndcontractMapper.selectContracts(paraMap);
		}
		resultMap.put("result", lstMap);
		return resultMap;
	}

	/**
	 * 付款申请单添加保存
	 * @param multipartFile 
	 * @param othercosturl1 
	 * @param otherurl3 
	 * @param checkval
	 * @param name 
	 * @param trim4 
	 * @param trim3 
	 * @param trim2 
	 * @param trim1 
	 * @param t4price 
	 * @param t3price 
	 * @param t2price 
	 * @param t1price 
	 * @param insurance 
	 * @param othercost 
	 * @throws IOException 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void applyadd(String[] checkvalc, BigDecimal appliedamount, String id, Contractapplypay contractapplypay, MultipartFile othercosturl1,
			MultipartFile trimurl2, MultipartFile otherurl3) throws IOException {
		// TODO Auto-generated method stub
		Integer currency = null;// 状态：1为加币，2 为美元
		Integer country = null;
		Integer paytype = null;
		Integer buyid = null;
		String selfbuy = null;
		BigDecimal ctotalpay = BigDecimal.ZERO;
		BigDecimal cdownpay = BigDecimal.ZERO;
		BigDecimal cfinalpay = BigDecimal.ZERO;
		int num = 0;
		int st = 0;
		String needer = null;
		String Mallcontractcode = null;
		contractapplypay.setOthercosturl(resourceService.CustomsDeclarationOutboundSave(othercosturl1, FileTypeEnum.paymentRequest));
		contractapplypay.setTrimurl(resourceService.CustomsDeclarationOutboundSave(trimurl2, FileTypeEnum.paymentRequest));
		contractapplypay.setOtherurl(resourceService.CustomsDeclarationOutboundSave(otherurl3, FileTypeEnum.paymentRequest));
		Map<String, Map<String, Object>> maps = new HashMap<String, Map<String, Object>>();
		Map<String, Object> tMap = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(contractapplypay.getOthercosturl())) {
			tMap.put("is", othercosturl1.getInputStream());
			tMap.put("size", othercosturl1.getSize());
			maps.put(contractapplypay.getOthercosturl(), tMap);
		}
		if (StringUtils.isNotBlank(contractapplypay.getTrimurl())) {
			tMap.put("is", trimurl2.getInputStream());
			tMap.put("size", trimurl2.getSize());
			maps.put(contractapplypay.getTrimurl(), tMap);
		}
		if (StringUtils.isNotBlank(contractapplypay.getOtherurl())) {
			tMap.put("is", otherurl3.getInputStream());
			tMap.put("size", otherurl3.getSize());
			maps.put(contractapplypay.getOtherurl(), tMap);
		}
		if (maps.entrySet().size() > 0) {
			resourceService.carCustomsDeclarationOutboundSave(maps, true);
		}
		if (id != "" && checkvalc.length == 0) {// 修改时没有重新选择合同
			Contractapplypay conapp = contractapplypayMapper.selectByPrimaryKey(Integer.parseInt(id));

			if (conapp.getPaytype() == 1) {// 定金修改
				contractapplypay.setCstatus(1);
				contractapplypay.setId(Integer.parseInt(id));
				contractapplypay.setDownpay(appliedamount);
				contractapplypayMapper.updateByPrimaryKeySelective(contractapplypay);
			} else if (conapp.getPaytype() == 2) {// 全款修改
				contractapplypay.setCstatus(1);
				contractapplypay.setId(Integer.parseInt(id));
				contractapplypay.setTotalpay(appliedamount);
				contractapplypayMapper.updateByPrimaryKeySelective(contractapplypay);
			} else if (conapp.getPaytype() == 3) {// 尾款修改
				contractapplypay.setCstatus(1);
				contractapplypay.setId(Integer.parseInt(id));
				contractapplypay.setFinalpay(appliedamount);
				contractapplypayMapper.updateByPrimaryKeySelective(contractapplypay);
			}

		} else {// 添加申请和修改时重新选择了合同
			for (int i = 0; i < checkvalc.length; i++) {
				if (Integer.parseInt(checkvalc[i]) != 0) {
					Jndcontract jndc = jndcontractMapper.selectByPrimaryKey(Integer.parseInt(checkvalc[i]));
					needer = jndc.getNeeder();
					Mallcontractcode = jndc.getMallcontractcode();
					selfbuy = jndc.getSelfbuy();
					if (id == "" && checkvalc.length > 0) {
						if (jndc.getApaylock() != null) {
							throw new PortalAppUnCheckedException("该合同已经提交付款申请！");
						}
					}
					if (Integer.parseInt(jndc.getPaytype()) == 2) {// 定金
						currency = jndc.getCurrency();
						country = jndc.getCountry();
						cfinalpay = cfinalpay.add(jndc.getFinalpay());// 合同计算出的总尾款
						cdownpay = cdownpay.add(jndc.getDownpay());// 合同计算出的合同提交审核通过填写的总定金
						ctotalpay = ctotalpay.add(jndc.getTotalprice());// 合同计算出来的合同提交审核通过时填写的钱数
						paytype = 1;
						buyid = jndc.getBuyid();
						num = num + jndc.getNum();
						st = Integer.parseInt(jndc.getPaytype());
					} else if (Integer.parseInt(jndc.getPaytype()) == 1) {// 全款
						ctotalpay = ctotalpay.add(jndc.getTotalprice());// 合同计算出来的合同提交审核通过时填写的钱数
						currency = jndc.getCurrency();
						country = jndc.getCountry();
						paytype = 2;
						buyid = jndc.getBuyid();
						num = num + jndc.getNum();
						st = Integer.parseInt(jndc.getPaytype());
					}
				}
			}
			Contractapplypay con = new Contractapplypay();
			if (st == 1) {// /全款
				con.setCtotalpay(ctotalpay);
				con.setTotalpay(appliedamount);
				con.setCountry(country);
				con.setCurrency(currency);
				con.setPaytype(paytype);
				con.setCreatetime(new Date());
				con.setCstatus(1);
				con.setBuyid(buyid);
				con.setNum(num);
			} else if (st == 2) {// 定金
				con.setDownpay(appliedamount);// 定金
				con.setCdownpay(cdownpay);
				con.setCfinalpay(cfinalpay);
				con.setCtotalpay(ctotalpay);
				con.setCountry(country);
				con.setCurrency(currency);
				con.setPaytype(paytype);
				con.setCreatetime(new Date());
				con.setCstatus(1);
				con.setBuyid(buyid);
				con.setNum(num);
				con.setSelfbuy(selfbuy);
			}
			if (id != "" && checkvalc.length > 0) {// 修改时重新选择了合同
				jndcontractMapper.updatepaystatus(Integer.parseInt(id));// 清空原来绑定的合同
				con.setId(Integer.parseInt(id));
				contractapplypayMapper.updateByPrimaryKeySelective(con);// 修改申请
				for (int i = 0; i < checkvalc.length; i++) {
					if (Integer.parseInt(checkvalc[i]) != 0) {
						Jndcontract jndco = new Jndcontract();
						jndco.setId(Integer.parseInt(checkvalc[i]));
						jndco.setApaylock(1);
						jndco.setApayid(Integer.parseInt(id));
						jndcontractMapper.updateByPrimaryKeySelective(jndco);
					}
				}
			} else if (id == "" && checkvalc.length > 0) {// 添加申请
				// 新需求添加
				con.setNeeder(needer);
				con.setMallcontractcode(Mallcontractcode);
				contractapplypayMapper.insertSelective(con);
				for (int i = 0; i < checkvalc.length; i++) {
					if (Integer.parseInt(checkvalc[i]) != 0) {
						Jndcontract jndco = new Jndcontract();
						jndco.setId(Integer.parseInt(checkvalc[i]));
						jndco.setApaylock(1);
						jndco.setApayid(con.getId());
						jndcontractMapper.updateByPrimaryKeySelective(jndco);
					}

				}
			}
		}
	}

	/**
	 * 查询选择的合同并显示
	 * @param checkval
	 * @param paytype 
	 * @param paytype 
	 * @return
	 */
	public Map<String, Object> choosecontractshow(String[] checkval, Integer paytype) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();

		BigDecimal downpay = BigDecimal.ZERO;
		BigDecimal totalpay = BigDecimal.ZERO;
		Integer currency = null;
		List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < checkval.length; i++) {
			if (Integer.parseInt(checkval[i]) != 0) {
				Map<String, Object> jndc = jndcontractMapper.choosecontractshow(Integer.parseInt(checkval[i]));
				list2.add(jndc);
				for (String key : jndc.keySet()) {
					/* System.out.println("key= " + key + " and value= " + jndc.get(key)); */
					if (paytype == 1) {// 全款
						if (key.equals("autotprice")) {
							totalpay = totalpay.add((BigDecimal) jndc.get(key));
						}
					} else if (paytype == 2) {// 定金
						if (key.equals("downpay")) {
							downpay = downpay.add((BigDecimal) jndc.get(key));
						}
					}
					if (key.equals("currency")) {
						currency = (Integer) jndc.get(key);
					}
				}
			}
		}
		resultMap.put("result", list2);
		resultMap.put("downpay", downpay);
		resultMap.put("totalpay", totalpay);
		resultMap.put("currency", currency);
		return resultMap;
	}

	public Map<String, Object> addnewjndApplyPayLstIndex(Map<String, Object> paraMap) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> lstMap = contractapplypayMapper.addselectApayLst(paraMap);
		/* List list2 = new ArrayList<String>(); */
		for (int i = 0; i < lstMap.size(); i++) {
			Map<String, Object> map = lstMap.get(i);
			for (String key : map.keySet()) {
				if (key.equals("id")) {
					// System.out.println(map.get(key));
					List<Jndcontract> list = jndcontractMapper.selectcode(map.get(key));
					String codec = "";
					for (Jndcontract jndcontract : list) {
						jndcontract.getCode();
						codec += jndcontract.getCode() + ',';
						map.put("codec", codec);
					}
				}
			}
		}
		int c = contractapplypayMapper.addcountApay(paraMap);
		resultMap.put("result", lstMap);
		resultMap.put("total", c);
		return resultMap;
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void revocationapply(Integer id) {
		// TODO Auto-generated method stub
		Contractapplypay cona = contractapplypayMapper.selectByPrimaryKey(id);
		if (cona.getCstatus() == 2) {
			throw new PortalAppUnCheckedException("该申请已经审核通过！");
		}
		Contractapplypay con = new Contractapplypay();
		con.setCstatus(4);
		con.setId(id);
		contractapplypayMapper.updateByPrimaryKeySelective(con);

	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void finalsubmit(Integer id, Contractapplypay contractapplypay, MultipartFile othercosturl, MultipartFile trimurl, MultipartFile otherurl)
			throws IOException {
		// TODO Auto-generated method stub
		Contractapplypay cona = contractapplypayMapper.selectByPrimaryKey(id);
		if (cona.getPaytype() == 3) {
			throw new PortalAppUnCheckedException("该申请已经提交！");
		}
		contractapplypay.setOthercosturl(resourceService.CustomsDeclarationOutboundSave(othercosturl, FileTypeEnum.paymentRequest));
		contractapplypay.setTrimurl(resourceService.CustomsDeclarationOutboundSave(trimurl, FileTypeEnum.paymentRequest));
		contractapplypay.setOtherurl(resourceService.CustomsDeclarationOutboundSave(otherurl, FileTypeEnum.paymentRequest));
		Map<String, Map<String, Object>> maps = new HashMap<String, Map<String, Object>>();
		Map<String, Object> tMap = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(contractapplypay.getOthercosturl())) {
			tMap.put("is", othercosturl.getInputStream());
			tMap.put("size", othercosturl.getSize());
			maps.put(contractapplypay.getOthercosturl(), tMap);
		}
		if (StringUtils.isNotBlank(contractapplypay.getTrimurl())) {
			tMap.put("is", trimurl.getInputStream());
			tMap.put("size", trimurl.getSize());
			maps.put(contractapplypay.getTrimurl(), tMap);
		}
		if (StringUtils.isNotBlank(contractapplypay.getOtherurl())) {
			tMap.put("is", otherurl.getInputStream());
			tMap.put("size", otherurl.getSize());
			maps.put(contractapplypay.getOtherurl(), tMap);
		}
		if (maps.entrySet().size() > 0) {
			resourceService.carCustomsDeclarationOutboundSave(maps, true);
		}
		contractapplypay.setId(id);
		contractapplypay.setPaytype(3);
		contractapplypay.setCstatus(1);
		/*
		 * contractapplypay.setFinalpay(finalpay); contractapplypay.setOthercost(othercost);
		 * contractapplypay.setInsurance(insurance); con.setT1price(t1price);
		 * con.setT2price(t2price); con.setT3price(t3price); con.setT4price(t4price);
		 * con.setTrim1(trim1); con.setTrim2(trim2); con.setTrim3(trim3); con.setTrim4(trim4);
		 */
		contractapplypayMapper.updateByPrimaryKeySelective(contractapplypay);
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void njndApplyPayDel(Integer id) {
		// TODO Auto-generated method stub
		Contractapplypay cona = contractapplypayMapper.selectByPrimaryKey(id);
		if (cona == null) {
			throw new PortalAppUnCheckedException("该申请已经删除！");
		}
		contractapplypayMapper.deleteByPrimaryKey(id);
		jndcontractMapper.updatepaystatus(id);
	}

	public Contractapplypay selectcontractapplipaybyid(String id) {
		// TODO Auto-generated method stub
		return contractapplypayMapper.selectByPrimaryKey(Integer.parseInt(id));
	}

	public Map<String, Object> updatequery(Map<String, Object> paraMap, Integer id) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> jndcontract = jndcontractMapper.selectContract(paraMap);
		Contractapplypay contractapplypay = contractapplypayMapper.selectByPrimaryKey(id);
		resultMap.put("result", jndcontract);
		resultMap.put("contract", contractapplypay);
		return resultMap;
	}

	public Jndcontract jndcontractdetails(Integer id) {
		return jndcontractMapper.selectByPrimaryKey(id);
	}

	public Jndbuy selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return jndbuyMapper.selectByPrimaryKey(id);
	}

	public Map<String, Object> supplierlist(jndSupplier jndSupplier, String start, String pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		UserDTO user = SecurityHelper.getAdminUserInfo();
		if (user.getCountry()!=null) {
			jndSupplier.setType(user.getCountry().toString());
		}
		List<jndSupplier> list = jndSupplierMapper.selectByCriteria(jndSupplier, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int c = jndSupplierMapper.countByCriteria(jndSupplier);
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	public Jndcar Customsupdatejndcar(Integer id) {
		// TODO Auto-generated method stub
		return jndcarMapper.selectByPrimaryKey(id);
	}

	public void updatesavecar(Jndcar car, MultipartFile siden1, MultipartFile siden2, MultipartFile siden3, MultipartFile siden4, MultipartFile siden5)
			throws IOException {
		// TODO Auto-generated method stub
		car.setIden1(resourceService.CustomsDeclarationOutboundSave(siden1, FileTypeEnum.taxRefund));
		car.setIden2(resourceService.CustomsDeclarationOutboundSave(siden2, FileTypeEnum.taxRefund));
		car.setIden3(resourceService.CustomsDeclarationOutboundSave(siden3, FileTypeEnum.taxRefund));
		car.setIden4(resourceService.CustomsDeclarationOutboundSave(siden4, FileTypeEnum.taxRefund));
		car.setIden5(resourceService.CustomsDeclarationOutboundSave(siden5, FileTypeEnum.taxRefund));
		Map<String, Map<String, Object>> maps = new HashMap<String, Map<String, Object>>();
		if (StringUtils.isNotBlank(car.getIden1())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", siden1.getInputStream());
			tMap.put("size", siden1.getSize());
			maps.put(car.getIden1(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden2())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", siden2.getInputStream());
			tMap.put("size", siden2.getSize());
			maps.put(car.getIden2(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden3())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", siden3.getInputStream());
			tMap.put("size", siden3.getSize());
			maps.put(car.getIden3(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden4())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", siden4.getInputStream());
			tMap.put("size", siden4.getSize());
			maps.put(car.getIden4(), tMap);
		}
		if (StringUtils.isNotBlank(car.getIden5())) {
			Map<String, Object> tMap = new HashMap<String, Object>();
			tMap.put("is", siden5.getInputStream());
			tMap.put("size", siden5.getSize());
			maps.put(car.getIden5(), tMap);
		}
		if (maps.entrySet().size() > 0) {
			resourceService.carCustomsDeclarationOutboundSave(maps, true);
		}
		jndcarMapper.updateByPrimaryKeySelective(car);
	}

	public List<Store> userjndstore(Integer country) {
		// TODO Auto-generated method stub
		return storeMapper.userjndstore(country);
	}

	/**
	 * 
	 * <p>供应方保存</p>
	 * @param sp
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void supplierSave(jndSupplier sp) {
		Integer id = sp.getId();
		if (id == null) {
			jndSupplierMapper.insertSelective(sp);
		} else {
			jndSupplierMapper.updateByPrimaryKeySelective(sp);
		}
	}

	/**
	 * 
	 * <p>供应方删除</p>
	 * @param id
	 * @author wangzh
	 */
	public void supplierdelete(Integer id) {
		jndSupplierMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 
	 * <p>通过id获取供应方</p>
	 * @param modelMap
	 * @param id
	 * @author wangzh
	 */
	public void getSupplierById(ModelMap modelMap, Integer id) {
		modelMap.put("sp", jndSupplierMapper.selectByPrimaryKey(id));
	}

	/**
	 * 待入中国库列表查询
	 * @param jndcar
	 * @param start
	 * @param pageSize
	 * @return
	 * @throws ParseException 
	 */
	public Map<String, Object> tempsavecarList(Jndcar jndcar, String start, String pageSize, String leavefactime) throws ParseException {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		jndcar.setStatus("8");
		if (StringUtils.isNotBlank(leavefactime)) {
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			jndcar.setLeavefactime(date.parse(leavefactime));
		}
		List<Jndcar> list = jndcarMapper.selectByCriteria(jndcar, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		for (Jndcar jndcar2 : list) {
			Store stor = storeMapper.selectByPrimaryKey(jndcar2.getInstoreid());
			if (stor != null) {
				jndcar2.setRoughweight(stor.getName());
			} else {
				jndcar2.setRoughweight(null);
			}
			Jndfile jndfile = new Jndfile();
			jndfile.setCarid(jndcar2.getId());
			jndfile.setType("3");// 加拿大入库检验单图片
			String location = jndfileMapper.querylocation(jndfile);
			jndfile.setType("4");// 中国入库检验单图片
			String location2 = jndfileMapper.querylocation(jndfile);
			if (location != null && location != "") {
				jndcar2.setNote(location);
			} else {
				jndcar2.setNote(null);
			}
			if (location2 != null && location2 != "") {
				jndcar2.setConfig(location2);
			} else {
				jndcar2.setConfig(null);
			}
		}
		if (jndcar.getCountry() != null) {
			Jndcar carprice = jndcarMapper.selectcarPrice(jndcar);
			map.put("carp1", carprice.getPrice());
			map.put("carp2", carprice.getCostprice());
			map.put("carp3", carprice.getCurrency());
		}
		int c = jndcarMapper.countByCriteria(jndcar);
		map.put("num", c);
		map.put("result", list);
		return map;
	}

	/**
	 * 加拿大车辆 进入待入中国库状态 （入中国资产库之前 如果资料不齐  可以进入待入库状态）
	 * @param dto
	 * @param carid
	 * @throws IOException 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void tempsaveCar(CarTypeinDto dto, String carid) throws IOException {

		if (StringUtils.isNotBlank(carid)) {
			Jndcar jndcar = new Jndcar();

			jndcar.setModifytime(new Date());// 记录创建时间
			jndcar.setNiden1(resourceService.uploadFileProcessStr(dto.getIden1(), FileTypeEnum.CARIDENTIFY));
			jndcar.setNiden2(resourceService.uploadFileProcessStr(dto.getIden2(), FileTypeEnum.CARIDENTIFY));
			jndcar.setNiden3(resourceService.uploadFileProcessStr(dto.getIden3(), FileTypeEnum.CARIDENTIFY));
			jndcar.setNiden4(resourceService.uploadFileProcessStr(dto.getIden4(), FileTypeEnum.CARIDENTIFY));
			jndcar.setNiden5(resourceService.uploadFileProcessStr(dto.getIden5(), FileTypeEnum.CARIDENTIFY));

			Map<String, Map<String, Object>> map = new HashMap<String, Map<String, Object>>();
			if (StringUtils.isNotBlank(jndcar.getNiden1())) {
				Map<String, Object> tMap = new HashMap<String, Object>();
				tMap.put("is", dto.getIden1().getInputStream());
				tMap.put("size", dto.getIden1().getSize());
				map.put(jndcar.getNiden1(), tMap);
			}
			if (StringUtils.isNotBlank(jndcar.getNiden2())) {
				Map<String, Object> tMap = new HashMap<String, Object>();
				tMap.put("is", dto.getIden2().getInputStream());
				tMap.put("size", dto.getIden2().getSize());
				map.put(jndcar.getNiden2(), tMap);
			}
			if (StringUtils.isNotBlank(jndcar.getNiden3())) {
				Map<String, Object> tMap = new HashMap<String, Object>();
				tMap.put("is", dto.getIden3().getInputStream());
				tMap.put("size", dto.getIden3().getSize());
				map.put(jndcar.getNiden3(), tMap);
			}
			if (StringUtils.isNotBlank(jndcar.getNiden4())) {
				Map<String, Object> tMap = new HashMap<String, Object>();
				tMap.put("is", dto.getIden4().getInputStream());
				tMap.put("size", dto.getIden4().getSize());
				map.put(jndcar.getNiden4(), tMap);
			}
			if (StringUtils.isNotBlank(jndcar.getNiden5())) {
				Map<String, Object> tMap = new HashMap<String, Object>();
				tMap.put("is", dto.getIden5().getInputStream());
				tMap.put("size", dto.getIden5().getSize());
				map.put(jndcar.getNiden5(), tMap);
			}

			if (map.entrySet().size() > 0) {
				resourceService.asyncSaveFiles(map, true);
			}

			jndcar.setId(Integer.parseInt(carid));
			jndcar.setStatus("8");// 出库至中国资产库待审核

			jndcar.setBrand(dto.getBrand());
			jndcar.setModel(dto.getModel());
			jndcar.setVersion(dto.getVersion());
			jndcar.setVin(dto.getVin());

			jndcar.setEnginenum(dto.getEngineNum());
			if (StringUtils.isNotBlank(dto.getLeaveFactoryTime())) {
				jndcar.setLeavefactime(DateUtils.parse(dto.getLeaveFactoryTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
			}
			if (StringUtils.isNotBlank(dto.getPurchaseTime())) {
				jndcar.setPurchasetime(DateUtils.parse(dto.getPurchaseTime(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
			}
			jndcar.setOutcolor(dto.getOutlookColor());

			jndcar.setIncolor(dto.getInnerColor());
			jndcar.setRealsale(dto.getRealSale());
			jndcar.setPrice(new BigDecimal(dto.getBuyPrice()));
			if (StringUtils.isNotBlank(dto.getLowPrice())) {
				jndcar.setCostprice(new BigDecimal(dto.getLowPrice()));
			}
			if (StringUtils.isNotBlank(dto.getSellerprice())) {
				jndcar.setSellerprice(new BigDecimal(dto.getSellerprice()));
			}
			jndcar.setBuyername(dto.getBuyerName());
			jndcar.setAddress(dto.getAddress());
			jndcar.setEnergytype(dto.getEnergyType());
			jndcar.setBuyeruser(dto.getBuyerName());
			jndcar.setDecorate(dto.getDecorate());

			jndcarMapper.updateByPrimaryKeySelective(jndcar);
		}

	}

	/**
	 * <p>根据条件查询仓库列表</p>
	 * @param store
	 * @return
	 * @author wangzh
	 */
	public List<Store> storeListQuery(Store store) {
		return storeMapper.selectByCriteria(store);
	}

	/**
	 * 
	 * <p>商城需求单审核保存</p>
	 * @param result
	 * @param id
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void mallNeedAuditSave(String result, Integer id) {
		Jndneed need = jndneedMapper.selectByPrimaryKey(id);
		if (need.getStatus() == null || need.getStatus().intValue() != 3) {// 默认null正常 1失效 3商城未审核
			throw new PortalAppUnCheckedException("该需求单已审核，请返回列表查看！");
		}
		Integer neednum = 0;
		if (StringUtils.isNotBlank(result)) {
			JSONArray json = JSONArray.fromObject(result); // 首先把字符串转成 JSONArray 对象
			if (json.size() > 0) {
				String vin3 = null;
				for (int i = 0; i < json.size(); i++) {
					JSONObject job = json.getJSONObject(i);// 单个需求单匹配结果 code：子需求id,vin:添加的车架号n个

					Integer snid = job.getInt("code");
					String vin = job.getString("vin");
					Integer num = job.getInt("num");

					Jndsubneed sn = jndsubneedMapper.selectByPrimaryKey(snid);// 前端code用变为id了
					if (sn == null) {
						throw new PortalAppUnCheckedException("第" + (i + 1) + "个需求单缺失，请联系管理员！");
					}

					String contractcode = sn.getMallcontractcode();// 子需求关联的商城合同编号
					String ordercode = sn.getMallordercode();// 子需求关联的商城子订单编号

					JndCarorderDetail CarorderDetail = new JndCarorderDetail();
					CarorderDetail.setSubordercode(ordercode);
					List<JndCarorderDetail> listCarorderDetail = jndCarorderDetailMapper.selectByCriteria(CarorderDetail);// 子订单生成的相应数量的海外车辆list

					String vin2 = null;
					JSONArray vin1 = JSONArray.fromObject(vin);

					for (int j = 0; j < vin1.size(); j++) {
						boolean match = false;// 未匹配
						String v = vin1.get(j).toString();// 单个需求单单个vin

						// 1.先验证在非商城海外库表是否匹配
						Jndcar jcar = new Jndcar();
						jcar.setBrand(sn.getBrand());
						jcar.setModel(sn.getModel());
						jcar.setVersion(sn.getVersion());
						jcar.setVin(v);
						Jndcar jndcar = jndcarMapper.matchingVin(jcar);

						if (jndcar == null) {// 未匹配成功
							// 2.验证在中国仓库表是否匹配
							Car car = new Car();
							car.setBrand(sn.getBrand());
							car.setModel(sn.getModel());
							car.setVersion(sn.getVersion());
							car.setVin(v);
							Car car1 = carMapper.matchingVin(car);
							if (car1 == null) {// 未匹配成功

							} else {
								match = true;
								CarorderDetail.setVinsource(1);// 中国库匹配
								car = new Car();
								car.setMallCarSkuCode(listCarorderDetail.get(j).getSkucode());
								car.setId(car1.getId());
								if ("5".equals(listCarorderDetail.get(j).getVerifystatus())) {
									car.setMallCarStatus(2);// 商城已经销售
								} else {
									car.setMallCarStatus(1);// 商城订购
								}
								carMapper.updateByPrimaryKeySelective(car);
							}
						} else {
							if (StringUtils.isNotBlank(jndcar.getMallcontractcode())) {// 商城车辆
								Jndneed Jndneed = new Jndneed();
								Jndneed.setCode(jndcar.getNeedcode());
								Jndneed.setStatus(1);// 废弃需求
								List<Jndneed> Jndneedlst = jndneedMapper.selectByCriteria(Jndneed);
								if (Jndneedlst.size() > 0) {// 查询废弃需求
									match = true;
									CarorderDetail.setVinsource(2);// 海外库匹配
									jcar = new Jndcar();
									jcar.setMallcontractcode(contractcode);
									jcar.setMallordercode(ordercode);
									jcar.setSkucode(listCarorderDetail.get(j).getSkucode());// 必须设置上
									jcar.setId(jndcar.getId());
									jndcarMapper.updateByPrimaryKeySelective(jcar);
								}

							} else {// 非商城车辆
								match = true;
								CarorderDetail.setVinsource(2);// 海外库匹配
								jcar = new Jndcar();
								jcar.setMallcontractcode(contractcode);
								jcar.setMallordercode(ordercode);
								jcar.setSkucode(listCarorderDetail.get(j).getSkucode());// 必须设置上
								jcar.setId(jndcar.getId());
								jndcarMapper.updateByPrimaryKeySelective(jcar);
							}

						}
						if (match) {
							if (StringUtils.isBlank(listCarorderDetail.get(j).getVin())) {
								CarorderDetail.setVin(v);
								CarorderDetail.setId(listCarorderDetail.get(j).getId());
								jndCarorderDetailMapper.updateByPrimaryKeySelective(CarorderDetail);// 添加车架号和匹配来源标记
							}
						} else {// 匹配失败
							if (vin2 == null) {
								vin2 = v;
							} else {
								vin2 = vin2 + "," + v;
							}
						}
					}
					if (vin2 != null) {
						if (vin3 == null) {
							vin3 = "商城订单编号[" + ordercode + "]填写的车架号[" + vin2 + "]未匹配成功。";
						} else {
							vin3 = vin3 + "\n" + "商城订单编号[" + ordercode + "]填写的车架号[" + vin2 + "]未匹配成功。";
						}
					} else if (vin3 == null) {
						neednum = neednum + num;
						Jndsubneed subneed = new Jndsubneed();
						subneed.setId(snid);
						subneed.setNum2(sn.getNum());
						subneed.setNum(sn.getNum() - num);
						subneed.setNum3(num);
						subneed.setMatching(1);// 这个子需求匹配了
						jndsubneedMapper.updateByPrimaryKeySelective(subneed);// 修改匹配数量
					}
				}
				if (vin3 != null) {
					throw new PortalAppUnCheckedException(vin3);
				}
			}
		}
		Jndneed jndn = new Jndneed();
		jndn.setId(id);
		jndn.setNum(need.getNum() - neednum);
		jndn.setNum2(need.getNum());
		jndn.setNum3(neednum);
		jndneedMapper.updateMallStatus(jndn);
		flowscheme flow = new flowscheme();
		flow.setTaskid(id);
		flow.setTaskname("商城需求[id=" + id + "]单审核通过");
		sellContractService.insertSelective(flow);
	}
}