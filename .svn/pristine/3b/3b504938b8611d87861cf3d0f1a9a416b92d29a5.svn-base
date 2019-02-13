/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.CarTypeService
 * Created By: wangzh 
 * Created on: 2017年8月15日 下午11:27:56
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.constant.Constants;
import com.yyq.car.portal.common.constant.FileTypeEnum;
import com.yyq.car.portal.common.exception.PortalBizCheckedException;
import com.yyq.car.portal.common.mapper.product.CarTypeLightMapper;
import com.yyq.car.portal.common.mapper.product.CarTypeMapper;
import com.yyq.car.portal.common.mapper.product.CarTypePicMapper;
import com.yyq.car.portal.common.model.comm.Abrand;
import com.yyq.car.portal.common.model.product.CarType;
import com.yyq.car.portal.common.model.product.CarTypeLight;
import com.yyq.car.portal.common.model.product.CarTypePic;
import com.yyq.car.portal.common.service.ResourcePersistenceService;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.common.util.StringUtil;


/**
 * <P>车型Service</P>
 * @author wangzh
 */
@Service
public class CarTypeService {

	@Autowired
	private CarTypeMapper carTypeMapper;

	@Autowired
	private CarTypePicMapper carTypePicMapper;

	@Autowired
	private CarTypeLightMapper carTypeLightMapper;

	@Autowired
	private BrandAndModelService brandAndModelService;
	@Autowired
	private ResourcePersistenceService resourceService;

	public List<Map<String, Object>> carTypeQuery(Map<String, Object> map) {
		List<Map<String, Object>> lst = carTypeMapper.selectByCriteriaForMsPage(map);
		return lst;
	}

	public List<CarType> querySellerPpriceByCar(CarType carType) {
		List<CarType> lst = carTypeMapper.selectByCriteria(carType);
		return lst;

	}

	public int carTypeCount(Map<String, Object> map) {
		return carTypeMapper.countByCriteriaForMsPage(map);
	}

	public List<Map<String, Object>> findCarBrand() {
		return carTypeMapper.queryCarBrand();
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void addCarType(CarType carType, String[] outpic, String[] inpic, String[] detailpic, String[] lightpic, String[] title, String[] content) {

		Date now = new Date();

		// 保存车型
		carType.setCreatetime(now);
		// 通过0首付产品本金计算月供
		String _bj = carType.getDownPay();
		if (StringUtils.isNotBlank(_bj)) {

			BigDecimal bj = new BigDecimal(_bj.trim());

			BigDecimal bjdivide48 = bj.divide(new BigDecimal(48), 10, BigDecimal.ROUND_HALF_DOWN);
			BigDecimal bjremain = bj.multiply(new BigDecimal(0.04 * 4 / 48));
			BigDecimal yg1 = bj.multiply(new BigDecimal(0.018 * 4)).add(bjdivide48).add(bjremain);// 第1个月月供
			BigDecimal yg2 = bjdivide48.add(bjremain);// 第2个月月供
			BigDecimal bj3d4 = bj.multiply(new BigDecimal(0.75));// 四分之三的本金
			BigDecimal yg13 = bj3d4.multiply(new BigDecimal(0.02 * 3 * 37 / 36)).add(bj3d4.divide(new BigDecimal(36), 10, BigDecimal.ROUND_HALF_DOWN));// 第13个月月供
			BigDecimal yg14 = bj3d4.divide(new BigDecimal(36), 10, BigDecimal.ROUND_HALF_DOWN).add(bj3d4.multiply(new BigDecimal(0.02 * 3 / 36)));// 第14个月月供
			carType.setOneMonthPay(yg1.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
			carType.setEveryMonthPay(yg2.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
			carType.setThirteenthMonthPay(yg13.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
			carType.setFourteenthMonthPay(yg14.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
			carType.setFinalPayment(bj3d4.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
		}
		carTypeMapper.insertSelective(carType);
		Integer id = carType.getId();

		// 保存车型关联图片1、外观 2、内饰 3、细节
		if (outpic != null && outpic.length > 0) {// 外观图片
			for (int i = 0; i < outpic.length; i++) {
				String op = outpic[i];
				if (StringUtils.isNotBlank(op)) {
					CarTypePic temp = new CarTypePic();
					temp.setTypeid(id);
					temp.setType(1);
					temp.setCreatetime(now);
					temp.setPic(op);
					carTypePicMapper.insertSelective(temp);
				}
			}
		}
		if (inpic != null && inpic.length > 0) {// 内饰图片
			for (int i = 0; i < inpic.length; i++) {
				String op = inpic[i];
				if (StringUtils.isNotBlank(op)) {
					CarTypePic temp = new CarTypePic();
					temp.setTypeid(id);
					temp.setType(2);
					temp.setCreatetime(now);
					temp.setPic(op);
					carTypePicMapper.insertSelective(temp);
				}
			}
		}
		if (detailpic != null && detailpic.length > 0) {// 细节图片
			for (int i = 0; i < detailpic.length; i++) {
				String op = detailpic[i];
				if (StringUtils.isNotBlank(op)) {
					CarTypePic temp = new CarTypePic();
					temp.setTypeid(id);
					temp.setType(3);
					temp.setCreatetime(now);
					temp.setPic(op);
					carTypePicMapper.insertSelective(temp);
				}
			}
		}

		// 保存车型亮点
		for (int i = 0; i < lightpic.length; i++) {
			if (StringUtils.isNotBlank(lightpic[i]) || StringUtils.isNotBlank(title[i]) || StringUtils.isNotBlank(content[i])) {// 有一个有值就可以保存
				CarTypeLight temp = new CarTypeLight();
				temp.setCreatetime(now);
				temp.setTypeid(id);
				if (StringUtils.isNotBlank(lightpic[i])) {
					temp.setPic(lightpic[i]);
				}
				if (StringUtils.isNotBlank(title[i])) {
					temp.setTitle(title[i]);
				}
				if (StringUtils.isNotBlank(content[i])) {
					temp.setContent(content[i]);
				}
				carTypeLightMapper.insertSelective(temp);
			}
		}
	}

	public void getEditCarType(Integer id, ModelMap map) {
		CarType ct = carTypeMapper.selectByPrimaryKey(id);
		if (ct != null) {
			map.put("ct", ct);// 车型
			CarTypePic ctp = new CarTypePic();
			ctp.setTypeid(ct.getId());
			ctp.setType(1);
			List<CarTypePic> outLst = carTypePicMapper.selectByCriteria(ctp);
			map.put("outLst", outLst);// 外观图
			map.put("outBegin", outLst.size() + 1);
			ctp.setType(2);
			List<CarTypePic> inLst = carTypePicMapper.selectByCriteria(ctp);
			map.put("inLst", inLst);// 内饰图
			map.put("inBegin", inLst.size() + 1);
			ctp.setType(3);
			List<CarTypePic> detailLst = carTypePicMapper.selectByCriteria(ctp);
			map.put("detailLst", detailLst);// 细节图
			map.put("detailBegin", detailLst.size() + 1);
			CarTypeLight ctl = new CarTypeLight();
			ctl.setTypeid(ct.getId());
			List<CarTypeLight> lightLst = carTypeLightMapper.selectByCriteria(ctl);
			map.put("lightLst", lightLst);// 亮点
			map.put("lightBegin", lightLst.size() + 1);
			Abrand lst = brandAndModelService.queryId(ct.getBrand());
			
			List<Map<String, Object>> model = brandAndModelService.queryByBrandidModel(lst.getBrandid());// 根据品牌id查询型号
			map.put("model", model);
			List<Map<String, Object>> version = brandAndModelService.queryVersion(ct.getModel());// 根据型号查询版别
			map.put("version", version);
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void editCarType(CarType carType, String olddownPay, String[] outpic, String[] inpic, String[] detailpic, String[] lightpic, String[] title,
			String[] content) {

		Date now = new Date();
		String downpay = carType.getDownPay();// 新输入的本金
		if (StringUtils.isNotBlank(downpay)) {
			if (downpay.equals(olddownPay)) {

			} else {
				// 通过0首付产品本金计算月供
				// String _bj = carType.getDownPay();
				BigDecimal bj = new BigDecimal(downpay.trim());

				BigDecimal bjdivide48 = bj.divide(new BigDecimal(48), 10, BigDecimal.ROUND_HALF_DOWN);
				BigDecimal bjremain = bj.multiply(new BigDecimal(0.04 * 4 / 48));
				BigDecimal yg1 = bj.multiply(new BigDecimal(0.018 * 4)).add(bjdivide48).add(bjremain);// 第1个月月供
				BigDecimal yg2 = bjdivide48.add(bjremain);// 第2个月月供
				BigDecimal bj3d4 = bj.multiply(new BigDecimal(0.75));// 四分之三的本金
				BigDecimal yg13 = bj3d4.multiply(new BigDecimal(0.02 * 3 * 37 / 36)).add(bj3d4.divide(new BigDecimal(36), 10, BigDecimal.ROUND_HALF_DOWN));// 第13个月月供
				BigDecimal yg14 = bj3d4.divide(new BigDecimal(36), 10, BigDecimal.ROUND_HALF_DOWN).add(bj3d4.multiply(new BigDecimal(0.02 * 3 / 36)));// 第14个月月供
				carType.setOneMonthPay(yg1.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
				carType.setEveryMonthPay(yg2.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
				carType.setThirteenthMonthPay(yg13.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
				carType.setFourteenthMonthPay(yg14.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
				carType.setFinalPayment(bj3d4.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
			}
		}
		// 保存车型
		carTypeMapper.updateByPrimaryKeySelective(carType);
		Integer id = carType.getId();

		// 删除原有的图片
		carTypePicMapper.deleteByCarType(id);

		// 保存车型关联图片1、外观 2、内饰 3、细节
		if (outpic != null && outpic.length > 0) {// 外观图片
			for (int i = 0; i < outpic.length; i++) {
				String op = outpic[i];
				if (StringUtils.isNotBlank(op)) {
					CarTypePic temp = new CarTypePic();
					temp.setTypeid(id);
					temp.setType(1);
					temp.setCreatetime(now);
					temp.setPic(op);
					carTypePicMapper.insertSelective(temp);
				}
			}
		}
		if (inpic != null && inpic.length > 0) {// 内饰图片
			for (int i = 0; i < inpic.length; i++) {
				String op = inpic[i];
				if (StringUtils.isNotBlank(op)) {
					CarTypePic temp = new CarTypePic();
					temp.setTypeid(id);
					temp.setType(2);
					temp.setCreatetime(now);
					temp.setPic(op);
					carTypePicMapper.insertSelective(temp);
				}
			}
		}
		if (detailpic != null && detailpic.length > 0) {// 细节图片
			for (int i = 0; i < detailpic.length; i++) {
				String op = detailpic[i];
				if (StringUtils.isNotBlank(op)) {
					CarTypePic temp = new CarTypePic();
					temp.setTypeid(id);
					temp.setType(3);
					temp.setCreatetime(now);
					temp.setPic(op);
					carTypePicMapper.insertSelective(temp);
				}
			}
		}

		// 删除原有的亮点
		carTypeLightMapper.deleteByCarType(id);
		// 保存车型亮点
		for (int i = 0; i < lightpic.length; i++) {
			if (StringUtils.isNotBlank(lightpic[i]) || StringUtils.isNotBlank(title[i]) || StringUtils.isNotBlank(content[i])) {// 有一个有值就可以保存
				CarTypeLight temp = new CarTypeLight();
				temp.setCreatetime(now);
				temp.setTypeid(id);
				if (StringUtils.isNotBlank(lightpic[i])) {
					temp.setPic(lightpic[i]);
				}
				if (StringUtils.isNotBlank(title[i])) {
					temp.setTitle(title[i]);
				}
				if (StringUtils.isNotBlank(content[i])) {
					temp.setContent(content[i]);
				}
				carTypeLightMapper.insertSelective(temp);
			}
		}
	}

	public void delete(Integer id) {
		carTypeMapper.deleteByPrimaryKey(id);
	}

	/**
	 * <p>查询所有或根据id查询一个车型</p>
	 * @param id
	 * @return
	 * @author wangzh
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void updateAllCarType(Integer id) {
		if (id != null) {
			CarType carType = carTypeMapper.selectByPrimaryKey(id);
			if (carType != null) {
				// 通过0首付产品本金计算月供
				String _bj = carType.getDownPay();
				if (StringUtils.isNotBlank(_bj)) {
					BigDecimal bj = new BigDecimal(_bj.trim());

					BigDecimal bjdivide48 = bj.divide(new BigDecimal(48), 10, BigDecimal.ROUND_HALF_DOWN);
					BigDecimal bjremain = bj.multiply(new BigDecimal(0.04 * 4 / 48));
					BigDecimal yg1 = bj.multiply(new BigDecimal(0.018 * 4)).add(bjdivide48).add(bjremain);// 第1个月月供
					BigDecimal yg2 = bjdivide48.add(bjremain);// 第2个月月供
					BigDecimal bj3d4 = bj.multiply(new BigDecimal(0.75));// 四分之三的本金
					BigDecimal yg13 = bj3d4.multiply(new BigDecimal(0.02 * 3 * 37 / 36)).add(bj3d4.divide(new BigDecimal(36), 10, BigDecimal.ROUND_HALF_DOWN));// 第13个月月供
					BigDecimal yg14 = bj3d4.divide(new BigDecimal(36), 10, BigDecimal.ROUND_HALF_DOWN).add(bj3d4.multiply(new BigDecimal(0.02 * 3 / 36)));// 第14个月月供
					CarType carType1 = new CarType();
					carType1.setId(id);
					carType1.setOneMonthPay(yg1.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
					carType1.setEveryMonthPay(yg2.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
					carType1.setThirteenthMonthPay(yg13.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
					carType1.setFourteenthMonthPay(yg14.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
					carType1.setFinalPayment(bj3d4.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
					carTypeMapper.updateByPrimaryKeySelective(carType1);
				}

			}
		} else {
			List<CarType> lst = carTypeMapper.selectByCriteria(new CarType());
			for (CarType carType : lst) {

				// 通过0首付产品本金计算月供
				String _bj = carType.getDownPay();
				if (StringUtils.isNotBlank(_bj)) {
					BigDecimal bj = new BigDecimal(_bj.trim());

					BigDecimal bjdivide48 = bj.divide(new BigDecimal(48), 10, BigDecimal.ROUND_HALF_DOWN);
					BigDecimal bjremain = bj.multiply(new BigDecimal(0.04 * 4 / 48));
					BigDecimal yg1 = bj.multiply(new BigDecimal(0.018 * 4)).add(bjdivide48).add(bjremain);// 第1个月月供
					BigDecimal yg2 = bjdivide48.add(bjremain);// 第2个月月供
					BigDecimal bj3d4 = bj.multiply(new BigDecimal(0.75));// 四分之三的本金
					BigDecimal yg13 = bj3d4.multiply(new BigDecimal(0.02 * 3 * 37 / 36)).add(bj3d4.divide(new BigDecimal(36), 10, BigDecimal.ROUND_HALF_DOWN));// 第13个月月供
					BigDecimal yg14 = bj3d4.divide(new BigDecimal(36), 10, BigDecimal.ROUND_HALF_DOWN).add(bj3d4.multiply(new BigDecimal(0.02 * 3 / 36)));// 第14个月月供
					CarType carType1 = new CarType();
					carType1.setId(carType.getId());
					carType1.setOneMonthPay(yg1.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
					carType1.setEveryMonthPay(yg2.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
					carType1.setThirteenthMonthPay(yg13.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
					carType1.setFourteenthMonthPay(yg14.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
					carType1.setFinalPayment(bj3d4.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString());
					carTypeMapper.updateByPrimaryKeySelective(carType1);
				}
			}
		}
	}

	/**
	 * <p>文件上传通用方法</p>
	 * @param file
	 * @param type
	 * @return
	 * @author nj
	 * @throws IOException 
	 */
	public String uploadPic(MultipartFile file) throws IOException {
		if (file.getSize() > Constants.PROFILE_PHOTO_MAX_SIZE) {
			throw new PortalBizCheckedException("图片文件不能超过10M");
		}
		String targetName = StringUtil.createFileName();
		String path = resourceService.getFilePath(FileTypeEnum.MODEL);
		String picPath = path + "/" + DateUtils.formateCurrent(DateUtils.COMPACT_DATE_FORMAT) + "/" + targetName;
		// 上传图片
		resourceService.asyncSaveFile(picPath, file.getInputStream(), true);
		return picPath;
	}
}
