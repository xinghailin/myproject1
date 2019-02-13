package com.yyq.car.portal.ms.app.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.yyq.car.portal.common.dto.JndCarorderDetailDTO;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.exception.PortalAppUnCheckedException;
import com.yyq.car.portal.common.mapper.jnd.JndsubneedMapper;
import com.yyq.car.portal.common.mapper.jnd.jndSiteMapper;
import com.yyq.car.portal.common.mapper.mall.CarsourceFileMapper;
import com.yyq.car.portal.common.mapper.mall.CarsourceMapper;
import com.yyq.car.portal.common.mapper.mall.mallUserMapper;
import com.yyq.car.portal.common.mapper.mallcontract.JndCarorderDetailMapper;
import com.yyq.car.portal.common.mapper.mallcontract.MallCarorderDetailMapper;
import com.yyq.car.portal.common.mapper.mallcontract.MallOrderDetailMapper;
import com.yyq.car.portal.common.mapper.mallcontract.MallSealApplyMapper;
import com.yyq.car.portal.common.model.jnd.jndSite;
import com.yyq.car.portal.common.model.mall.Carsource;
import com.yyq.car.portal.common.model.mall.CarsourceFile;
import com.yyq.car.portal.common.model.mall.mallUser;
import com.yyq.car.portal.common.model.mallcontract.JndCarorderDetail;
import com.yyq.car.portal.common.model.mallcontract.MallCarorderDetail;
import com.yyq.car.portal.common.model.mallcontract.MallOrderDetail;
import com.yyq.car.portal.common.model.mallcontract.MallSealApply;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.common.vo.MallSealApplyVO;
import com.yyq.car.portal.ms.web.util.BeanStatus;
import com.yyq.car.portal.ms.web.util.UUIDTool;


/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author liliang
 * @since 2018-10-23
 */
@Service
public class MallContractService {

	@Autowired
	private JndsubneedMapper jndsubneedMapper;

	@Autowired
	private MallSealApplyMapper sealApplyMapper;

	@Autowired
	private MallOrderDetailMapper orderDetailMapper;

	@Autowired
	private JndCarorderDetailMapper jndCarorderDetailMapper;
	@Autowired
	private mallUserMapper mallUserMapper;
	@Autowired
	private CarsourceMapper carsourceMapper;
	@Autowired
	private CarsourceFileMapper carsourceFileMapper;
	@Autowired
	private jndSiteMapper jndSiteMapper;
	@Autowired
	private MallCarorderDetailMapper mallCarorderDetailMapper;
	private static final String PURCHASE = "2";// 金融

	// private Logger logger = LoggerFactory.getLogger(MallContractService.class);

	/**
	* 
	* 合同盖章       分页结果集
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数   
	* @return  分页结果  
	* @author liliang
	*/
	public Map<String, Object> list(MallSealApplyVO vo, String start, String pageSize) throws ParseException {
		int ps = Integer.parseInt(pageSize);
		MallSealApply sealApply = new MallSealApply();
		if (StringUtils.isNotEmpty(vo.getSealtime_s())) {
			sealApply.setSealtime(DateUtils.parse(vo.getSealtime_s(), DateUtils.DEFAULT_DATE_FORMAT_DEFAULT));
		}
		sealApply.setCode(vo.getMallcontractcode());
		sealApply.setUsername(vo.getUsername());
		sealApply.setStatus(BeanStatus.OK.getKey());
		sealApply.setSealstatus(6);
		List<MallSealApply> list = sealApplyMapper.selectByCriteria(sealApply, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int total = sealApplyMapper.countByCriteria(sealApply);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", list);
		returnMap.put("total", total);
		return returnMap;
	}

	/**
	* 
	* 订单       分页结果集
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数   
	* @return  分页结果  
	* @author liliang
	*/
	public Map<String, Object> orderlist(MallOrderDetail vo, String start, String pageSize) throws ParseException {
		int ps = Integer.parseInt(pageSize);
		MallOrderDetail detail = new MallOrderDetail();
		detail.setSealapplycode(vo.getSealapplycode());
		detail.setCode(vo.getCode());
		detail.setUsername(vo.getUsername());
		List<MallOrderDetail> list = orderDetailMapper.selectByCriteria(detail, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int total = orderDetailMapper.countByCriteria(detail);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", list);
		returnMap.put("total", total);
		return returnMap;
	}

	/**
	* 
	* 车辆      分页结果集
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数   
	* @return  分页结果  
	* @author liliang
	*/
	public Map<String, Object> carlist(MallSealApplyVO sealapplyvo, String start, String pageSize) throws ParseException {
		int ps = Integer.parseInt(pageSize);
		MallSealApplyVO vo = new MallSealApplyVO();
		vo.setStart((Integer.parseInt(start) - 1) * ps);
		vo.setPageSize(ps);
		vo.setSkucode(sealapplyvo.getSkucode());
		vo.setSubordercode(sealapplyvo.getSubordercode());
		List<JndCarorderDetailDTO> list = jndCarorderDetailMapper.selectDetailByCriteria(vo);
		int total = jndCarorderDetailMapper.countDetailByCriteria(vo);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", list);
		returnMap.put("total", total);
		return returnMap;
	}

	/**
	 * 
	 * @author xhl
	 * @param map
	 * @param status 
	 * @param id
	 * @return
	 *2018年11月8日上午11:01:28
	 *
	 */
	public String downPaymentAydit(ModelMap map, String skucode, String status) {
		// TODO Auto-generated method stub
		JndCarorderDetail carorderDetail = new JndCarorderDetail();
		carorderDetail.setSkucode(skucode);
		List<JndCarorderDetail> carorderDetail1 = jndCarorderDetailMapper.selectByCriteria(carorderDetail);// 商城车辆信息表
		MallOrderDetail orderDetail1 = new MallOrderDetail();
		orderDetail1.setCode(carorderDetail1.get(0).getSubordercode());
		List<MallOrderDetail> orderDetail = orderDetailMapper.selectByCriteria(orderDetail1);// 商城车辆订单表
		orderDetail1 = orderDetail.get(0);
		mallUser user = new mallUser();
		user.setUsername(orderDetail.get(0).getUsername());
		List<mallUser> user1 = mallUserMapper.selectByCriteria(user);// 商城创建订单账户信息
		Carsource carsource = carsourceMapper.selectByPrimaryKey(carorderDetail1.get(0).getSourceid());// 查询车源信息
		CarsourceFile carsourceFile = new CarsourceFile();
		carsourceFile.setSourceid(carorderDetail1.get(0).getSourceid());
		carsourceFile.setType(1);
		List<CarsourceFile> carsourceFile1 = carsourceFileMapper.selectByCriteria(carsourceFile);// 车源图片
		jndSite site = jndSiteMapper.selectByPrimaryKey(carsource.getAreaid());// 查询地区汇率
		UserDTO userInfo = SecurityHelper.getAdminUserInfo();
		map.put("carorderDetail", carorderDetail1.get(0));// 车辆信息表
		map.put("orderDetail", orderDetail1);// 车辆订单表
		if (PURCHASE.equals(user1.get(0).getUsertype())) {// 采购金融
			map.put("totalprice", carorderDetail1.get(0).getTotalprice());// 商品价
		} else {
			map.put("totalprice", carorderDetail1.get(0).getTotalprice() + "+安日计息年化8.5%");// 商品价
		}
		BigDecimal downpay = (orderDetail1.getDecorateprice().add(orderDetail1.getCarprice()).subtract(carsource.getFavor())).divide(new BigDecimal(100))
				.multiply(carsource.getDownpayscale()).setScale(2, RoundingMode.HALF_UP);
		// 预计支付当地杂费：佣金+杂费+保险+短驳费+服务费
		BigDecimal incidentals = orderDetail1.getCmsn().add(orderDetail1.getOverseadrayage()).add(orderDetail1.getOversea4sprice())
				.add(orderDetail1.getOverseashotinsurance()).add(orderDetail1.getServicecharge());
		BigDecimal oceanFreight = orderDetail1.getSeatransportprice().add(orderDetail1.getSeatransportinsurance());

		map.put("carsource", carsource);// 车源信息表
		map.put("carsourceFile1", carsourceFile1);// 车源图片
		map.put("site", site);// 地区
		map.put("name", userInfo.getName());// 操作人
		Date time = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		map.put("time", sdf.format(time));// 操作时间
		if (status.equals("1")) {// 定金
			map.put("downpay", downpay);// 定金
			return "mallContract/downPaymentAydit";
		}
		if (status.equals("2")) {// 杂费
			map.put("incidentals", incidentals);// 杂费
			return "mallContract/incidentalsAydit";
		}
		map.put("oceanFreight", oceanFreight);// 海运费
		return "mallContract/oceanFreightAydit";// 海运
	}

	/**
	 * 
	 * @author xhl
	 * @param id
	 * @param currency
	 * @param receivedmoney
	 * @param rate
	 * @param status
	 *2018年11月8日下午2:07:43
	 *
	 */
	// @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED,
	// timeout = 3)
	public void saveMallCarStatus(String id, String currency, String receivedmoney, String rate, Integer status) {
		// TODO Auto-generated method stub
		JndCarorderDetail car = jndCarorderDetailMapper.selectByPrimaryKey(id);
		if (car.getVerifystatus() != null) {
			if (car.getVerifystatus() >= status) {
				throw new PortalAppUnCheckedException("车辆已审核！");
			}
		}
		car.setVerifystatus(status);
		jndCarorderDetailMapper.updateByPrimaryKey(car);
		MallOrderDetail OrderDetail = new MallOrderDetail();
		OrderDetail.setCode(car.getSubordercode());
		JndCarorderDetail car1 = new JndCarorderDetail();
		car1.setSubordercode(car.getSubordercode());
		car1.setVerifystatus(5);
		List<JndCarorderDetail> carlist = jndCarorderDetailMapper.selectByCriteria(car1);
		List<MallOrderDetail> list = orderDetailMapper.selectByCriteria(OrderDetail);
		if (list.get(0).getNum() == carlist.size() + 1) {
			list.get(0).setPaystatus(2);
		}
		if (list.get(0).getCarstatus() != null) {
			if (list.get(0).getCarstatus() < status) {
				list.get(0).setCarstatus(status);
				orderDetailMapper.updateByPrimaryKey(list.get(0));
			}
		} else {
			list.get(0).setCarstatus(status);
			orderDetailMapper.updateByPrimaryKey(list.get(0));
		}
		UserDTO userInfo = SecurityHelper.getAdminUserInfo();
		MallCarorderDetail carorder = new MallCarorderDetail();
		carorder.setId(UUIDTool.getUUID());
		carorder.setSourceid(car.getSourceid());
		carorder.setSkucode(car.getSkucode());
		carorder.setOrdercode(car.getOrdercode());
		carorder.setSubordercode(car.getSubordercode());
		carorder.setContractcode(car.getContractcode());
		carorder.setCreatetime(new Date());
		carorder.setVerifystatus(status);
		carorder.setVerifier(userInfo.getName());
		carorder.setReceivedmoney(new BigDecimal(receivedmoney));
		carorder.setCurrency(Integer.parseInt(currency));
		if (currency.equals("1")) {
			carorder.setUnit(car.getUnit());
		}
		carorder.setRate(rate);
		mallCarorderDetailMapper.insertSelective(carorder);
	}

}
