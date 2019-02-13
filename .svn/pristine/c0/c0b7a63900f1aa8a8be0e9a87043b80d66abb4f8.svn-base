package com.yyq.car.portal.ms.app.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yyq.car.portal.common.mapper.jnd.jndSiteMapper;
import com.yyq.car.portal.common.mapper.mall.CarsourceFileMapper;
import com.yyq.car.portal.common.mapper.mall.CarsourceMapper;
import com.yyq.car.portal.common.mapper.mallcontract.MallDisplacementTaxMapper;
import com.yyq.car.portal.common.mapper.mallcontract.MallOrderDetailMapper;
import com.yyq.car.portal.common.model.jnd.jndSite;
import com.yyq.car.portal.common.model.mall.Carsource;
import com.yyq.car.portal.common.model.mall.CarsourceFile;
import com.yyq.car.portal.common.model.mallcontract.MallDisplacementTax;
import com.yyq.car.portal.common.model.mallcontract.MallOrderDetail;
import com.yyq.car.portal.common.vo.MallOrderDetailVO;
import com.yyq.car.portal.ms.web.util.BeanStatus;


/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author liliang
 * @since 2018-10-16
 */
@Service
public class MallOrderDetailService {

	@Autowired
	private MallOrderDetailMapper orderDetailMapper;

	@Autowired
	private CarsourceMapper carsourceMapper;

	@Autowired
	private jndSiteMapper SiteMapper;

	@Autowired
	private MallDisplacementTaxMapper displacementTaxMapper;

	@Autowired
	CarsourceFileMapper sourcefileMapper;

	@Autowired
	CarsourceFileMapper carsourceFileMapper;

	// 订单节点状态(1待核实(默认） 2 废弃 3未完成 5 已完成)
	private static int ORDER_DEL = 2;

	/**
	* 
	* 订单详情       分页结果集
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数   
	* @return  分页结果  
	* @author liliang
	*/
	public Map<String, Object> list(MallOrderDetail vo, String start, String pageSize) throws ParseException {
		int ps = Integer.parseInt(pageSize);
		vo.setStatus(BeanStatus.OK.getKey());
		List<MallOrderDetail> list = orderDetailMapper.selectByCriteria(vo, new RowBounds((Integer.parseInt(start) - 1) * ps, ps));
		int total = orderDetailMapper.countByCriteria(vo);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", list);
		returnMap.put("total", total);

		return returnMap;
	}

	/**
	 * <p>根据id 获取对象</p>
	 * @author liliang
	 * @throws Exception 
	 */
	public MallOrderDetail loadById(String id) {
		MallOrderDetail orderDetail = orderDetailMapper.selectByPrimaryKey(id);
		return orderDetail;
	}

	/**
	 * <p>根据参数 获取对象</p>
	 * @author liliang
	 * @throws Exception 
	 */
	public List<MallOrderDetail> selectByCriteria(MallOrderDetail pojo) {
		List<MallOrderDetail> orderDetailList = orderDetailMapper.selectByCriteria(pojo);
		return orderDetailList;
	}

	/**
	 * <p>update订单状态</p>
	 *    删除订单  订单状态为作废   同时更改status 为1 
	 * @author liliang
	 * @throws Exception 
	 */

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void updateState(MallOrderDetail orderdetail, String loginname) throws Exception {
		Date time =  new Date();
		if (StringUtils.isNotBlank(orderdetail.getId())) {
			MallOrderDetail loadOrderDetail = orderDetailMapper.selectByPrimaryKey(orderdetail.getId());
			MallOrderDetail pojo = new MallOrderDetail();
			pojo.setId(orderdetail.getId());
			pojo.setUpdatename(loginname);
			pojo.setUpdatetime(time);
			if (3 == (orderdetail.getOrderstatus().intValue())) { //
				pojo.setOrderstatus(orderdetail.getOrderstatus());
				pojo.setRemarks(orderdetail.getRemarks());
				Boolean ischange = true;
				// 如果数量和加装包 和审核之前对比 都改变 , 则改变以下字段。
				// 数量
				int num1 = orderdetail.getNum();
				if (loadOrderDetail.getNum().intValue() == num1) { // 判断未改变的, 其余都是已经改变的。要改变字段。
					if (null == loadOrderDetail.getDecoratepackage()) {  // 审核之前 加装包 为null
						if (null == orderdetail.getChangedecoratepackage()) {
							ischange = false;
						}
					} else if (null != loadOrderDetail.getDecoratepackage()) {   // 审核之前 加装包 不为null
						if (null != orderdetail.getChangedecoratepackage()
								&& loadOrderDetail.getDecoratepackage().equals(orderdetail.getChangedecoratepackage())) {
							ischange = false;
						}
					}

				}
				if (ischange) {
					Map<String, BigDecimal> returnmap = order_check_summoney_Method(orderdetail.getId(), orderdetail.getChangedecoratepackage(), num1);
					pojo.setCarprice(returnmap.get("carprice"));
					pojo.setTotalprice(returnmap.get("finaltotalPrice"));
					pojo.setDecoratepackage(orderdetail.getChangedecoratepackage());
					pojo.setDecorateprice(returnmap.get("packagePrice"));
					pojo.setDownpay(returnmap.get("downpay_n"));
					pojo.setNum(num1);
				}
			} else if (2 == (orderdetail.getOrderstatus().intValue())) {   // 废弃 同时设置status 为 3 删除
				pojo.setStatus(BeanStatus.DEL.getKey());
				pojo.setOrderstatus(orderdetail.getOrderstatus());
				pojo.setUpdatename(loginname);
				pojo.setUpdatetime(time);
				pojo.setReason(orderdetail.getReason());
			}
			orderDetailMapper.updateByPrimaryKeySelective(pojo);

		}
	}

	/**
	* 
	* 订单详情       分页结果集  添加合同跳转到可以勾选页面
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数   
	* @return  分页结果  
	* @author liliang
	*/
	public Map<String, Object> checkbox_list(MallOrderDetailVO vo, String start, String pageSize) throws ParseException {
		int ps = Integer.parseInt(pageSize);
		vo.setStart((Integer.parseInt(start) - 1) * ps);
		vo.setPageSize(ps);
		vo.setStatus(BeanStatus.OK.getKey());
		vo.setIssealapply(BeanStatus.OK.getKey());
		vo.setOrderstatus(BeanStatus.DEL.getKey());
		List<MallOrderDetail> list = orderDetailMapper.checkboxList(vo);
		int total = orderDetailMapper.countcheckboxList(vo);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", list);
		returnMap.put("total", total);

		return returnMap;
	}


		/**
		 * 
		 * <p>返回加装包    对象list </p>
		 * @param Carsource
		 * @author liliang
		 */
		public List<CarsourceFile> getSourceFileListByParam(MallOrderDetail record) {
			    CarsourceFile f1 = new CarsourceFile();
				f1.setSourceid(record.getSourceid());
				f1.setType(3);// decorate
				List<CarsourceFile> ds = sourcefileMapper.selectByCriteria(f1);
			    return ds;
		}
		
		/**
		 * 
		 * <p>返回加装包    对象list 颜色</p>
		 * @param Carsource
		 * @author liliang
		 */
		public List<CarsourceFile> getSourceFileList_colourByParam(MallOrderDetail record) {
			    CarsourceFile f1 = new CarsourceFile();
				f1.setSourceid(record.getSourceid());
				f1.setType(4);// decorate
				List<CarsourceFile> ds = sourcefileMapper.selectByCriteria(f1);
			    return ds;
		}
		
		/**
		 * 
		 * <p>返回区域列表    对象list </p>
		 * @param Carsource  
		 * @author liliang
		 */
		public jndSite getSiteById(Integer id) {
			jndSite ds = SiteMapper.selectByPrimaryKey(id);
			return ds;
		}
		
		/**
		* 
		*订单中 通过  数量和 加装包 的更改。 来显示实际 money
		* @author liliang
		 * @throws Exception 
		*/
		public Map<String, BigDecimal> order_check_summoney_Method(String id, String packids,Integer num) throws Exception {
			Map<String, BigDecimal> returnMap = new HashMap<String, BigDecimal>();
			// 先获得加装包的费用 
			BigDecimal old_colourPrice = new BigDecimal(0);
			BigDecimal new_colourPrice = new BigDecimal(0);
			BigDecimal packagePrice = new BigDecimal(0);
			BigDecimal downpay_n = new BigDecimal(0);
			 if(StringUtils.isNotBlank(packids)){
				 List<String> packidList = Arrays.asList(packids.split(","));
				 for(String packid :packidList){
					CarsourceFile carsourceFile = carsourceFileMapper.selectByPrimaryKey(Integer.valueOf(packid));
					if(null == carsourceFile){
						throw new Exception("勾选的配置 从数据中查询不到,请检查");
					}else{
						if(3 == carsourceFile.getType().intValue()){// 加装包
							packagePrice = packagePrice.add(carsourceFile.getPrice());
						}else if(4 == carsourceFile.getType().intValue())
							new_colourPrice = new_colourPrice.add(carsourceFile.getPrice());
					}
					
				 }
			 }
			 packagePrice = packagePrice.setScale(2, BigDecimal.ROUND_HALF_UP);
			 //获得车源信息
			 MallOrderDetail orderDetail = orderDetailMapper.selectByPrimaryKey(id);
			 if(StringUtils.isNotBlank(orderDetail.getDecoratepackage())){
				 List<String> old_packidList = Arrays.asList(orderDetail.getDecoratepackage().split(","));
				 for(String packid :old_packidList){
					CarsourceFile old_carsourceFile = carsourceFileMapper.selectByPrimaryKey(Integer.valueOf(packid));
					if(null == old_carsourceFile){
						throw new Exception("勾选的配置 从数据中查询不到,请检查");
					}else{
						if(3 == old_carsourceFile.getType().intValue()){// 加装包
							//packagePrice = packagePrice.add(old_carsourceFile.getPrice());
						}else if(4 == old_carsourceFile.getType().intValue())
							old_colourPrice = old_colourPrice.add(old_carsourceFile.getPrice());
					}
					
				 }
			 }
			 //  车价  =   车价-颜色的+颜色的
			 orderDetail.setCarprice(orderDetail.getCarprice().subtract(old_colourPrice).add(new_colourPrice).setScale(2, BigDecimal.ROUND_HALF_UP));
			 Carsource carsource = carsourceMapper.selectByPrimaryKey(orderDetail.getSourceid());
			    jndSite site  = SiteMapper.selectByPrimaryKey(orderDetail.getAreaid());
				BigDecimal sumPrice = new BigDecimal(0);
				BigDecimal finaltotalPrice = new BigDecimal(0);
				//+海运保险  rmb
				//车价+加装费+境外4s店杂费+优惠+佣金+境外短驳费+境外短期保险+海运费+服务费
				sumPrice = orderDetail.getCarprice()//车价
						      .add(packagePrice)//加装费
						      .add(carsource.getOversea4sprice()==null?new BigDecimal(0):carsource.getOversea4sprice())//境外4s店杂费
						      .subtract(carsource.getFavor()==null?new BigDecimal(0):carsource.getFavor())//优惠
						      .add(carsource.getCmsn()==null?new BigDecimal(0):carsource.getCmsn())//佣金
						      .add(carsource.getOverseadrayage()==null?new BigDecimal(0):carsource.getOverseadrayage())//境外短驳费
						      .add(carsource.getOverseashotinsurance()==null?new BigDecimal(0):carsource.getOverseashotinsurance())//境外短期保险
						      .add(carsource.getSeatransportprice()==null?new BigDecimal(0):carsource.getSeatransportprice())//海运费  	 
					      	  .add(carsource.getServiceprice()==null?new BigDecimal(0):carsource.getServiceprice()).setScale(2, BigDecimal.ROUND_HALF_UP);//服务费
				MallDisplacementTax displacementTax = new MallDisplacementTax();
				displacementTax.setType(carsource.getType());
				List<MallDisplacementTax> mallDisplacementTaxList = displacementTaxMapper.selectByCriteria(displacementTax);
				mallDisplacementTaxList =  mallDisplacementTaxList.parallelStream()
							   .filter(c->c.getStartdisplacement()<=carsource.getDisplacement())
							   .filter(c->c.getEnddisplacement()>carsource.getDisplacement())
							   .collect(Collectors.toList());
				//关税=按照美规/非美规以及排量的大小查找对应的关税比率*开证价*汇率
				BigDecimal gettax = mallDisplacementTaxList.get(0).getTax().multiply(carsource.getIssuingprice()).multiply(site.getExchangerate());
			    finaltotalPrice =(
			    				sumPrice.multiply(site.getExchangerate())
			    				.add(carsource.getCustomsclearancefee()==null?new BigDecimal(0):carsource.getCustomsclearancefee())
			    				.add(gettax)
			    				.add(carsource.getSeatransportinsurance()==null?new BigDecimal(0):carsource.getSeatransportinsurance())//海运保险
			    				)
			    				.multiply(new BigDecimal(num)).setScale(2, BigDecimal.ROUND_HALF_UP);
			    // 定金
			    downpay_n= (orderDetail.getCarprice()//车价
					      .add(packagePrice)//加装费
					      .subtract(carsource.getFavor()==null?new BigDecimal(0):carsource.getFavor()))//优惠
					      .multiply(new BigDecimal(num))// 数量
					      .multiply(carsource.getDownpayscale().divide(new BigDecimal(100), 5, RoundingMode.HALF_UP)).setScale(2, BigDecimal.ROUND_HALF_UP);
			    returnMap.put("carprice", orderDetail.getCarprice());
			    returnMap.put("packagePrice", packagePrice);
			    returnMap.put("finaltotalPrice",finaltotalPrice);
			    returnMap.put("downpay_n", downpay_n);
				return returnMap;
		}
	
}
