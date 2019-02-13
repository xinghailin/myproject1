package com.yyq.car.portal.ms.app.service;

import java.io.IOException;
import java.text.ParseException;
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
import org.springframework.web.multipart.MultipartFile;
import org.ufa.log.Logger;
import org.ufa.log.LoggerFactory;

import com.yyq.car.portal.common.constant.Constants;
import com.yyq.car.portal.common.constant.FileTypeEnum;
import com.yyq.car.portal.common.dto.Bottom_BannerDto;
import com.yyq.car.portal.common.dto.IntroduceDto;
import com.yyq.car.portal.common.dto.PurchaseareaDto;
import com.yyq.car.portal.common.dto.PurchaseareapicDto;
import com.yyq.car.portal.common.dto.PurchasepicDto;
import com.yyq.car.portal.common.dto.WebBannerDto;
import com.yyq.car.portal.common.dto.WebPurchaseAreaDto;
import com.yyq.car.portal.common.exception.PortalBizCheckedException;
import com.yyq.car.portal.common.mapper.web.IntroduceMapper;
import com.yyq.car.portal.common.mapper.web.PurchaseareaMapper;
import com.yyq.car.portal.common.mapper.web.PurchaseareapicMapper;
import com.yyq.car.portal.common.mapper.web.PurchaseareapicnameMapper;
import com.yyq.car.portal.common.mapper.web.PurchasetitleMapper;
import com.yyq.car.portal.common.mapper.web.WebBannerMapper;
import com.yyq.car.portal.common.model.web.Introduce;
import com.yyq.car.portal.common.model.web.Purchasearea;
import com.yyq.car.portal.common.model.web.Purchaseareapic;
import com.yyq.car.portal.common.model.web.Purchaseareapicname;
import com.yyq.car.portal.common.model.web.Purchasetitle;
import com.yyq.car.portal.common.model.web.WebBanner;
import com.yyq.car.portal.common.service.ResourcePersistenceService;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.common.util.StringUtil;
import com.yyq.car.portal.ms.web.util.UUIDTool;


/**
 * 网站管理
 * @author liangli
 *
 */
@Service
public class WebService {
	private final Logger logger = LoggerFactory.getLogger(WebService.class);

	@Autowired
	private IntroduceMapper introduceMapper;

	@Autowired
	ResourcePersistenceService resourceService;

	@Autowired
	WebBannerMapper web_bannerMapper;

	@Autowired
	PurchaseareaMapper purchaseareaMapper;
	@Autowired
	PurchaseareapicMapper purchaseareapicMapper;
	
	@Autowired
	PurchaseareapicnameMapper purchaseareapicnameMapper;
	
	@Autowired
	PurchasetitleMapper purchasetitleMapper;	
	
	
	

	/**
	 * <p>TODO</p>
	 * @author liliang
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public Map<String, Object> updateIntroduce(IntroduceDto dto, int loginid) throws IOException {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "保存失败了。。");
		returnMap.put("rescode", "0");
		Date date = new Date();
		if (StringUtils.isNotBlank(dto.getId_chinese())) {// 说明时update
			Introduce introduce1 = new Introduce();
			introduce1.setId(dto.getId_chinese());
			introduce1.setContent(dto.getContent_chinese());
			introduce1.setModifytime(date);
			introduce1.setModifyuser(loginid);

			Introduce introduce2 = new Introduce();
			introduce2.setId(dto.getId_english());
			introduce2.setContent(dto.getContent_english());
			introduce2.setModifytime(date);
			introduce2.setModifyuser(loginid);

			Introduce introduce3 = new Introduce();
			introduce3.setId(dto.getId_spaish());
			introduce3.setContent(dto.getContent_spaish());
			introduce3.setModifytime(date);
			introduce3.setModifyuser(loginid);

			introduceMapper.updateByPrimaryKeySelective(introduce1);
			introduceMapper.updateByPrimaryKeySelective(introduce2);
			introduceMapper.updateByPrimaryKeySelective(introduce3);

		} else {// 说明是新增

			Introduce introduce1 = new Introduce();
			introduce1.setId(UUIDTool.getUUID());
			introduce1.setContent(dto.getContent_chinese());
			introduce1.setCreatetime(date);
			introduce1.setCreateuser(loginid);
			introduce1.setPosition(1);
			introduce1.setLanguage("chinese");

			Introduce introduce2 = new Introduce();
			introduce2.setId(UUIDTool.getUUID());
			introduce2.setContent(dto.getContent_english());
			introduce2.setCreatetime(date);
			introduce2.setCreateuser(loginid);
			introduce2.setPosition(1);
			introduce2.setLanguage("english");

			Introduce introduce3 = new Introduce();
			introduce3.setId(UUIDTool.getUUID());
			introduce3.setContent(dto.getContent_spaish());
			introduce3.setCreatetime(date);
			introduce3.setCreateuser(loginid);
			introduce3.setPosition(1);
			introduce3.setLanguage("spaish");

			introduceMapper.insertSelective(introduce1);
			introduceMapper.insertSelective(introduce2);
			introduceMapper.insertSelective(introduce3);

		}
		returnMap.put("result", "保存成功！");
		returnMap.put("rescode", "1");
		return returnMap;
	}

	public IntroduceDto loadIntroduce() {
		Introduce record = new Introduce();
		IntroduceDto dto = new IntroduceDto();
		List<Introduce> listIntroduce = introduceMapper.selectByCriteria(record);
		for (Introduce entity : listIntroduce) {
			if ("chinese".equals(entity.getLanguage())) {
				dto.setId_chinese(entity.getId());
				dto.setContent_chinese(entity.getContent());
			} else if ("english".equals(entity.getLanguage())) {
				dto.setId_english(entity.getId());
				dto.setContent_english(entity.getContent());
			} else if ("spaish".equals(entity.getLanguage())) {
				dto.setId_spaish(entity.getId());
				dto.setContent_spaish(entity.getContent());
			}
		}

		return dto;
	}

	public WebBannerDto loadWebBanner() {

		WebBannerDto dto = new WebBannerDto();
		WebBanner record = new WebBanner();
		record.setMap(1);
		List<WebBanner> listWebBanner = web_bannerMapper.selectByCriteria(record);
		for (WebBanner entity : listWebBanner) {
			if (entity.getPosition().equals(new Integer(1))) {
				dto.setId_introduce(entity.getId());
				dto.setUrl_introduce(entity.getUrl());
			} else if (entity.getPosition().equals(new Integer(2))) {
				dto.setId_organize(entity.getId());
				dto.setUrl_organize(entity.getUrl());
			} else if (entity.getPosition().equals(new Integer(3))) {
				dto.setId_layout(entity.getId());
				dto.setUrl_layout(entity.getUrl());
			} else if (entity.getPosition().equals(new Integer(4))) {
				dto.setId_brand(entity.getId());
				dto.setUrl_brand(entity.getUrl());
			} else if (entity.getPosition().equals(new Integer(5))) {
				dto.setId_global_dev(entity.getId());
				dto.setUrl_global_dev(entity.getUrl());
			} else if (entity.getPosition().equals(new Integer(6))) {
				dto.setId_global_model(entity.getId());
				dto.setUrl_global_model(entity.getUrl());
			}
		}

		return dto;
	}

	/**
	 * top_banner update
	 * @param dto
	 * @param banner
	 * @throws IOException 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void updateTopBanner(WebBannerDto dto, int loginid) throws IOException {
		Date date = new Date();
		if (StringUtils.isNotBlank(dto.getId_introduce())) {// 有id说明时更新
          if(!dto.getPic_introduce().isEmpty()){
			WebBanner banner_introduce = new WebBanner();
			boolean hasdot_introduce = false;
			String nanem_pic_introduce = dto.getPic_introduce().getOriginalFilename();
			if (StringUtils.isNotBlank(nanem_pic_introduce)) {
				int dot = nanem_pic_introduce.lastIndexOf(".");
				if (dot > 0) {
					hasdot_introduce = true;
					nanem_pic_introduce = nanem_pic_introduce.substring(dot);
				}
			}
			String path_pic_introduce = uploadFileTogether(dto.getPic_introduce(), FileTypeEnum.web_pic, hasdot_introduce, nanem_pic_introduce);
			banner_introduce.setId(dto.getId_introduce());
			banner_introduce.setUrl(path_pic_introduce);
			banner_introduce.setModifytime(date);
			banner_introduce.setModifyuser(loginid);
			
			web_bannerMapper.updateByPrimaryKeySelective(banner_introduce);
          }
		 
	        	   
          if(!dto.getPic_organize().isEmpty()){	          
			WebBanner banner_organize = new WebBanner();
			boolean hasdot_organize = false;
			String nanem_pic_organize = dto.getPic_organize().getOriginalFilename();
			if (StringUtils.isNotBlank(nanem_pic_organize)) {
				int dot = nanem_pic_organize.lastIndexOf(".");
				if (dot > 0) {
					hasdot_organize = true;
					nanem_pic_organize = nanem_pic_organize.substring(dot);
				}
			}
			String path_pic_organize = uploadFileTogether(dto.getPic_organize(), FileTypeEnum.web_pic, hasdot_organize, nanem_pic_organize);

			banner_organize.setId(dto.getId_organize());
			banner_organize.setUrl(path_pic_organize);
			banner_organize.setModifytime(date);
			banner_organize.setModifyuser(loginid);

			web_bannerMapper.updateByPrimaryKeySelective(banner_organize);
          }
 		 
   	   
          if(!dto.getPic_layout().isEmpty()){	 
			WebBanner banner_layout = new WebBanner();
			boolean hasdot_layout = false;
			String nanem_pic_layout = dto.getPic_layout().getOriginalFilename();
			if (StringUtils.isNotBlank(nanem_pic_layout)) {
				int dot = nanem_pic_layout.lastIndexOf(".");
				if (dot > 0) {
					hasdot_layout = true;
					nanem_pic_layout = nanem_pic_layout.substring(dot);
				}
			}
			String path_pic_layout = uploadFileTogether(dto.getPic_layout(), FileTypeEnum.web_pic, hasdot_layout, nanem_pic_layout);

			banner_layout.setId(dto.getId_layout());
			banner_layout.setUrl(path_pic_layout);
			banner_layout.setModifytime(date);
			banner_layout.setModifyuser(loginid);
			
			web_bannerMapper.updateByPrimaryKeySelective(banner_layout);
          }
  		 
      	   
          if(!dto.getPic_brand().isEmpty()){	 
			WebBanner banner_brand = new WebBanner();
			boolean hasdot_brand = false;
			String nanem_pic_brand = dto.getPic_brand().getOriginalFilename();
			if (StringUtils.isNotBlank(nanem_pic_brand)) {
				int dot = nanem_pic_brand.lastIndexOf(".");
				if (dot > 0) {
					hasdot_brand = true;
					nanem_pic_brand = nanem_pic_brand.substring(dot);
				}
			}
			String path_pic_brand = uploadFileTogether(dto.getPic_brand(), FileTypeEnum.web_pic, hasdot_brand, nanem_pic_brand);

			banner_brand.setId(dto.getId_brand());
			banner_brand.setUrl(path_pic_brand);
			banner_brand.setModifytime(date);
			banner_brand.setModifyuser(loginid);
			
			web_bannerMapper.updateByPrimaryKeySelective(banner_brand);
          }
   		 
     	   
          if(!dto.getPic_global_dev().isEmpty()){
			WebBanner banner_global_dev = new WebBanner();
			boolean hasdot_global_dev = false;
			String nanem_pic_global_dev = dto.getPic_global_dev().getOriginalFilename();
			if (StringUtils.isNotBlank(nanem_pic_global_dev)) {
				int dot = nanem_pic_global_dev.lastIndexOf(".");
				if (dot > 0) {
					hasdot_global_dev = true;
					nanem_pic_global_dev = nanem_pic_global_dev.substring(dot);
				}
			}
			String path_pic_global_dev = uploadFileTogether(dto.getPic_global_dev(), FileTypeEnum.web_pic, hasdot_global_dev, nanem_pic_global_dev);

			banner_global_dev.setId(dto.getId_global_dev());
			banner_global_dev.setUrl(path_pic_global_dev);
			banner_global_dev.setModifytime(date);
			banner_global_dev.setModifyuser(loginid);
			
			web_bannerMapper.updateByPrimaryKeySelective(banner_global_dev);
          }
    		 
    	   
          if(!dto.getPic_global_model().isEmpty()){
			WebBanner banner_global_model = new WebBanner();
			boolean hasdot_global_model = false;
			String nanem_pic_global_model = dto.getPic_global_model().getOriginalFilename();
			if (StringUtils.isNotBlank(nanem_pic_global_model)) {
				int dot = nanem_pic_global_model.lastIndexOf(".");
				if (dot > 0) {
					hasdot_global_model = true;
					nanem_pic_global_model = nanem_pic_global_model.substring(dot);
				}
			}
			String path_pic_global_model = uploadFileTogether(dto.getPic_global_dev(), FileTypeEnum.web_pic, hasdot_global_model, nanem_pic_global_model);

			banner_global_model.setId(dto.getId_global_model());
			banner_global_model.setUrl(path_pic_global_model);
			banner_global_model.setModifytime(date);
			banner_global_model.setModifyuser(loginid);
			
			web_bannerMapper.updateByPrimaryKeySelective(banner_global_model);
          }
 		 

			

		} else {
          if(!dto.getPic_introduce().isEmpty()){
			WebBanner banner_introduce = new WebBanner();
			boolean hasdot_introduce = false;
			String nanem_pic_introduce = dto.getPic_introduce().getOriginalFilename();
			if (StringUtils.isNotBlank(nanem_pic_introduce)) {
				int dot = nanem_pic_introduce.lastIndexOf(".");
				if (dot > 0) {
					hasdot_introduce = true;
					nanem_pic_introduce = nanem_pic_introduce.substring(dot);
				}
			}
			String path_pic_introduce = uploadFileTogether(dto.getPic_introduce(), FileTypeEnum.web_pic, hasdot_introduce, nanem_pic_introduce);
			banner_introduce.setId(UUIDTool.getUUID());
			banner_introduce.setCreatetime(date);
			banner_introduce.setCreateuser(loginid);
			banner_introduce.setLanguage("chinese");
			banner_introduce.setPosition(1);
			banner_introduce.setMap(1);
			banner_introduce.setUrl(path_pic_introduce);
			
			web_bannerMapper.insertSelective(banner_introduce);
          }
          if(!dto.getPic_organize().isEmpty()){
			WebBanner banner_organize = new WebBanner();
			boolean hasdot_organize = false;
			String nanem_pic_organize = dto.getPic_organize().getOriginalFilename();
			if (StringUtils.isNotBlank(nanem_pic_organize)) {
				int dot = nanem_pic_organize.lastIndexOf(".");
				if (dot > 0) {
					hasdot_organize = true;
					nanem_pic_organize = nanem_pic_organize.substring(dot);
				}
			}
			String path_pic_organize = uploadFileTogether(dto.getPic_organize(), FileTypeEnum.web_pic, hasdot_organize, nanem_pic_organize);
			banner_organize.setId(UUIDTool.getUUID());
			banner_organize.setCreatetime(date);
			banner_organize.setCreateuser(loginid);
			banner_organize.setLanguage("chinese");
			banner_organize.setPosition(2);
			banner_organize.setMap(1);
			banner_organize.setUrl(path_pic_organize);
			
			web_bannerMapper.insertSelective(banner_organize);
          }
          if(!dto.getPic_layout().isEmpty()){
			WebBanner banner_layout = new WebBanner();
			boolean hasdot_layout = false;
			String nanem_pic_layout = dto.getPic_layout().getOriginalFilename();
			if (StringUtils.isNotBlank(nanem_pic_layout)) {
				int dot = nanem_pic_layout.lastIndexOf(".");
				if (dot > 0) {
					hasdot_layout = true;
					nanem_pic_layout = nanem_pic_layout.substring(dot);
				}
			}
			String path_pic_layout = uploadFileTogether(dto.getPic_layout(), FileTypeEnum.web_pic, hasdot_layout, nanem_pic_layout);
			banner_layout.setId(UUIDTool.getUUID());
			banner_layout.setCreatetime(date);
			banner_layout.setCreateuser(loginid);
			banner_layout.setLanguage("chinese");
			banner_layout.setPosition(3);
			banner_layout.setMap(1);
			banner_layout.setUrl(path_pic_layout);
			
			web_bannerMapper.insertSelective(banner_layout);
          }
	      if(!dto.getPic_brand().isEmpty()){
			WebBanner banner_brand = new WebBanner();
			boolean hasdot_brand = false;
			String nanem_pic_brand = dto.getPic_brand().getOriginalFilename();
			if (StringUtils.isNotBlank(nanem_pic_brand)) {
				int dot = nanem_pic_brand.lastIndexOf(".");
				if (dot > 0) {
					hasdot_brand = true;
					nanem_pic_brand = nanem_pic_brand.substring(dot);
				}
			}
			String path_pic_brand = uploadFileTogether(dto.getPic_brand(), FileTypeEnum.web_pic, hasdot_brand, nanem_pic_brand);
			banner_brand.setId(UUIDTool.getUUID());
			banner_brand.setCreatetime(date);
			banner_brand.setCreateuser(loginid);
			banner_brand.setLanguage("chinese");
			banner_brand.setPosition(4);
			banner_brand.setMap(1);
			banner_brand.setUrl(path_pic_brand);
		
			web_bannerMapper.insertSelective(banner_brand);
          }
	      if(!dto.getPic_global_dev().isEmpty()){
			WebBanner banner_global_dev = new WebBanner();
			boolean hasdot_global_dev = false;
			String nanem_pic_global_dev = dto.getPic_global_dev().getOriginalFilename();
			if (StringUtils.isNotBlank(nanem_pic_global_dev)) {
				int dot = nanem_pic_global_dev.lastIndexOf(".");
				if (dot > 0) {
					hasdot_global_dev = true;
					nanem_pic_global_dev = nanem_pic_global_dev.substring(dot);
				}
			}
			String path_pic_global_dev = uploadFileTogether(dto.getPic_global_dev(), FileTypeEnum.web_pic, hasdot_global_dev, nanem_pic_global_dev);
			banner_global_dev.setId(UUIDTool.getUUID());
			banner_global_dev.setCreatetime(date);
			banner_global_dev.setCreateuser(loginid);
			banner_global_dev.setLanguage("chinese");
			banner_global_dev.setPosition(5);
			banner_global_dev.setMap(1);
			banner_global_dev.setUrl(path_pic_global_dev);
			web_bannerMapper.insertSelective(banner_global_dev);
          }
	      if(!dto.getPic_global_model().isEmpty()){
			WebBanner banner_global_model = new WebBanner();
			boolean hasdot_global_model = false;
			String nanem_pic_global_model = dto.getPic_global_model().getOriginalFilename();
			if (StringUtils.isNotBlank(nanem_pic_global_model)) {
				int dot = nanem_pic_global_model.lastIndexOf(".");
				if (dot > 0) {
					hasdot_global_model = true;
					nanem_pic_global_model = nanem_pic_global_model.substring(dot);
				}
			}
			String path_pic_global_model = uploadFileTogether(dto.getPic_global_model(), FileTypeEnum.web_pic, hasdot_global_model, nanem_pic_global_model);
			banner_global_model.setId(UUIDTool.getUUID());
			banner_global_model.setCreatetime(date);
			banner_global_model.setCreateuser(loginid);
			banner_global_model.setLanguage("chinese");
			banner_global_model.setPosition(6);
			banner_global_model.setMap(1);
			banner_global_model.setUrl(path_pic_global_model);
			
			web_bannerMapper.insertSelective(banner_global_model);
          }
		
		}
	}

	/**
	* <p>同步保存文件</p>
	* @param file
	* @return
	* @throws IOException
	* @author wangzh
	*/
	public String uploadFileTogether(MultipartFile file, FileTypeEnum fte, boolean hasdot, String suffix) throws IOException {
		String picPath = null;
		if (file != null && file.getSize() > 0) {
			if (file.getSize() > Constants.PROFILE_PHOTO_MAX_SIZE) {
				throw new PortalBizCheckedException("文件不能超过10M");
			}
			String targetFileName = StringUtil.createFileName();
			if (hasdot) {
				targetFileName = targetFileName + suffix;
			}
			String path = resourceService.getFilePath(fte);
			picPath = path + "/" + DateUtils.formateCurrent(DateUtils.COMPACT_DATE_FORMAT) + "/" + targetFileName;
			resourceService.saveFileFtp(picPath, file.getInputStream(), true);
		}
		return picPath;
	}

	/**
	 * bottom_banner update
	 * @param dto
	 * @param banner
	 * @throws IOException 
	 */
	@SuppressWarnings("null")
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void updateBottomBanner(Bottom_BannerDto dto, int loginid) throws IOException {
		Date date = new Date();
		if (StringUtils.isNotBlank(dto.getId_organize_chinese())) {// 说明是update
			if (!dto.getPic_organize_chinese().isEmpty()) {
				WebBanner banner_organize_chinese = new WebBanner();
				boolean hasdot_organize_chinese = false;
				String nanem_pic_organize_chinese = dto.getPic_organize_chinese().getOriginalFilename();
				if (StringUtils.isNotBlank(nanem_pic_organize_chinese)) {
					int dot = nanem_pic_organize_chinese.lastIndexOf(".");
					if (dot > 0) {
						hasdot_organize_chinese = true;
						nanem_pic_organize_chinese = nanem_pic_organize_chinese.substring(dot);
					}
				}
				String path_pic_organize_chinese = uploadFileTogether(dto.getPic_organize_chinese(), FileTypeEnum.web_pic, hasdot_organize_chinese,
						nanem_pic_organize_chinese);
				banner_organize_chinese.setId(dto.getId_organize_chinese());
				banner_organize_chinese.setModifytime(date);
				banner_organize_chinese.setModifyuser(loginid);
				banner_organize_chinese.setUrl(path_pic_organize_chinese);
				web_bannerMapper.updateByPrimaryKeySelective(banner_organize_chinese);
			}

			if (!dto.getPic_organize_english().isEmpty()) {
				WebBanner banner_organize_english = new WebBanner();
				boolean hasdot_organize_english = false;
				String nanem_pic_organize_english = dto.getPic_organize_english().getOriginalFilename();
				if (StringUtils.isNotBlank(nanem_pic_organize_english)) {
					int dot = nanem_pic_organize_english.lastIndexOf(".");
					if (dot > 0) {
						hasdot_organize_english = true;
						nanem_pic_organize_english = nanem_pic_organize_english.substring(dot);
					}
				}
				String path_pic_organize_english = uploadFileTogether(dto.getPic_organize_english(), FileTypeEnum.web_pic, hasdot_organize_english,
						nanem_pic_organize_english);
				banner_organize_english.setId(dto.getId_organize_english());
				banner_organize_english.setModifytime(date);
				banner_organize_english.setModifyuser(loginid);
				banner_organize_english.setUrl(path_pic_organize_english);
				web_bannerMapper.updateByPrimaryKeySelective(banner_organize_english);
			}
			if (!dto.getPic_organize_spaish().isEmpty()) {
				WebBanner banner_organize_spaish = new WebBanner();
				boolean hasdot_organize_spaish = false;
				String nanem_pic_organize_spaish = dto.getPic_organize_spaish().getOriginalFilename();
				if (StringUtils.isNotBlank(nanem_pic_organize_spaish)) {
					int dot = nanem_pic_organize_spaish.lastIndexOf(".");
					if (dot > 0) {
						hasdot_organize_spaish = true;
						nanem_pic_organize_spaish = nanem_pic_organize_spaish.substring(dot);
					}
				}
				String path_pic_organize_spaish = uploadFileTogether(dto.getPic_organize_spaish(), FileTypeEnum.web_pic, hasdot_organize_spaish,
						nanem_pic_organize_spaish);
				banner_organize_spaish.setId(dto.getId_organize_spaish());
				banner_organize_spaish.setModifytime(date);
				banner_organize_spaish.setModifyuser(loginid);
				banner_organize_spaish.setUrl(path_pic_organize_spaish);
				web_bannerMapper.updateByPrimaryKeySelective(banner_organize_spaish);

			}
			if (!dto.getPic_layout().isEmpty()) {
				WebBanner banner_layout = new WebBanner();
				boolean hasdot_layout = false;
				String nanem_pic_layout = dto.getPic_layout().getOriginalFilename();
				if (StringUtils.isNotBlank(nanem_pic_layout)) {
					int dot = nanem_pic_layout.lastIndexOf(".");
					if (dot > 0) {
						hasdot_layout = true;
						nanem_pic_layout = nanem_pic_layout.substring(dot);
					}
				}
				String path_pic_layout = uploadFileTogether(dto.getPic_layout(), FileTypeEnum.web_pic, hasdot_layout, nanem_pic_layout);
				banner_layout.setId(dto.getId_layout());
				banner_layout.setModifytime(date);
				banner_layout.setModifyuser(loginid);
				banner_layout.setUrl(path_pic_layout);
				web_bannerMapper.updateByPrimaryKeySelective(banner_layout);
			}
			if (!dto.getPic_brand_chinese().isEmpty()) {
				WebBanner banner_brand_chinese = new WebBanner();
				boolean hasdot_brand_chinese = false;
				String nanem_pic_brand_chinese = dto.getPic_brand_chinese().getOriginalFilename();
				if (StringUtils.isNotBlank(nanem_pic_brand_chinese)) {
					int dot = nanem_pic_brand_chinese.lastIndexOf(".");
					if (dot > 0) {
						hasdot_brand_chinese = true;
						nanem_pic_brand_chinese = nanem_pic_brand_chinese.substring(dot);
					}
				}
				String path_pic_brand_chinese = uploadFileTogether(dto.getPic_brand_chinese(), FileTypeEnum.web_pic, hasdot_brand_chinese,
						nanem_pic_brand_chinese);
				banner_brand_chinese.setId(dto.getId_brand_chinese());
				banner_brand_chinese.setModifytime(date);
				banner_brand_chinese.setModifyuser(loginid);
				banner_brand_chinese.setUrl(path_pic_brand_chinese);
				web_bannerMapper.updateByPrimaryKeySelective(banner_brand_chinese);
			}

			if (!dto.getPic_brand_english().isEmpty()) {
				WebBanner banner_brand_english = new WebBanner();
				boolean hasdot_brand_english = false;
				String nanem_pic_brand_english = dto.getPic_brand_english().getOriginalFilename();
				if (StringUtils.isNotBlank(nanem_pic_brand_english)) {
					int dot = nanem_pic_brand_english.lastIndexOf(".");
					if (dot > 0) {
						hasdot_brand_english = true;
						nanem_pic_brand_english = nanem_pic_brand_english.substring(dot);
					}
				}
				String path_pic_brand_english = uploadFileTogether(dto.getPic_brand_english(), FileTypeEnum.web_pic, hasdot_brand_english,
						nanem_pic_brand_english);
				banner_brand_english.setId(dto.getId_brand_english());
				banner_brand_english.setModifytime(date);
				banner_brand_english.setModifyuser(loginid);
				banner_brand_english.setUrl(path_pic_brand_english);
				web_bannerMapper.updateByPrimaryKeySelective(banner_brand_english);
			}

			if (!dto.getPic_brand_spaish().isEmpty()) {
				WebBanner banner_brand_spaish = new WebBanner();
				boolean hasdot_brand_spaish = false;
				String nanem_pic_brand_spaish = dto.getPic_brand_spaish().getOriginalFilename();
				if (StringUtils.isNotBlank(nanem_pic_brand_spaish)) {
					int dot = nanem_pic_brand_spaish.lastIndexOf(".");
					if (dot > 0) {
						hasdot_brand_spaish = true;
						nanem_pic_brand_spaish = nanem_pic_brand_spaish.substring(dot);
					}
				}
				String path_pic_brand_spaish = uploadFileTogether(dto.getPic_brand_spaish(), FileTypeEnum.web_pic, hasdot_brand_spaish, nanem_pic_brand_spaish);
				banner_brand_spaish.setId(dto.getId_brand_spaish());
				banner_brand_spaish.setModifytime(date);
				banner_brand_spaish.setModifyuser(loginid);
				banner_brand_spaish.setUrl(path_pic_brand_spaish);
				web_bannerMapper.updateByPrimaryKeySelective(banner_brand_spaish);
			}
			if (!dto.getPic_global_dev().isEmpty()) {
				WebBanner banner_global_dev = new WebBanner();
				boolean hasdot_global_dev = false;
				String nanem_pic_global_dev = dto.getPic_global_dev().getOriginalFilename();
				if (StringUtils.isNotBlank(nanem_pic_global_dev)) {
					int dot = nanem_pic_global_dev.lastIndexOf(".");
					if (dot > 0) {
						hasdot_global_dev = true;
						nanem_pic_global_dev = nanem_pic_global_dev.substring(dot);
					}
				}
				String path_pic_global_dev = uploadFileTogether(dto.getPic_global_dev(), FileTypeEnum.web_pic, hasdot_global_dev, nanem_pic_global_dev);
				banner_global_dev.setId(dto.getId_global_dev());
				banner_global_dev.setModifytime(date);
				banner_global_dev.setModifyuser(loginid);
				banner_global_dev.setUrl(path_pic_global_dev);
				web_bannerMapper.updateByPrimaryKeySelective(banner_global_dev);
			}
			
			
			
		} else {
			if (!dto.getPic_organize_chinese().isEmpty()) {
				WebBanner banner_organize_chinese = new WebBanner();
				boolean hasdot_organize_chinese = false;
				String nanem_pic_organize_chinese = dto.getPic_organize_chinese().getOriginalFilename();
				if (StringUtils.isNotBlank(nanem_pic_organize_chinese)) {
					int dot = nanem_pic_organize_chinese.lastIndexOf(".");
					if (dot > 0) {
						hasdot_organize_chinese = true;
						nanem_pic_organize_chinese = nanem_pic_organize_chinese.substring(dot);
					}
				}
				String path_pic_organize_chinese = uploadFileTogether(dto.getPic_organize_chinese(), FileTypeEnum.web_pic, hasdot_organize_chinese,
						nanem_pic_organize_chinese);
				banner_organize_chinese.setId(UUIDTool.getUUID());
				banner_organize_chinese.setCreatetime(date);
				banner_organize_chinese.setCreateuser(loginid);
				banner_organize_chinese.setLanguage("chinese");
				banner_organize_chinese.setPosition(2);
				banner_organize_chinese.setMap(2);
				banner_organize_chinese.setUrl(path_pic_organize_chinese);
				web_bannerMapper.insertSelective(banner_organize_chinese);
			}

			if (!dto.getPic_organize_english().isEmpty()) {
				WebBanner banner_organize_english = new WebBanner();
				boolean hasdot_organize_english = false;
				String nanem_pic_organize_english = dto.getPic_organize_english().getOriginalFilename();
				if (StringUtils.isNotBlank(nanem_pic_organize_english)) {
					int dot = nanem_pic_organize_english.lastIndexOf(".");
					if (dot > 0) {
						hasdot_organize_english = true;
						nanem_pic_organize_english = nanem_pic_organize_english.substring(dot);
					}
				}
				String path_pic_organize_english = uploadFileTogether(dto.getPic_organize_english(), FileTypeEnum.web_pic, hasdot_organize_english,
						nanem_pic_organize_english);
				banner_organize_english.setId(UUIDTool.getUUID());
				banner_organize_english.setCreatetime(date);
				banner_organize_english.setCreateuser(loginid);
				banner_organize_english.setLanguage("english");
				banner_organize_english.setPosition(2);
				banner_organize_english.setMap(2);
				banner_organize_english.setUrl(path_pic_organize_english);
				web_bannerMapper.insertSelective(banner_organize_english);
			}
			if (!dto.getPic_organize_spaish().isEmpty()) {
				WebBanner banner_organize_spaish = new WebBanner();
				boolean hasdot_organize_spaish = false;
				String nanem_pic_organize_spaish = dto.getPic_organize_spaish().getOriginalFilename();
				if (StringUtils.isNotBlank(nanem_pic_organize_spaish)) {
					int dot = nanem_pic_organize_spaish.lastIndexOf(".");
					if (dot > 0) {
						hasdot_organize_spaish = true;
						nanem_pic_organize_spaish = nanem_pic_organize_spaish.substring(dot);
					}
				}
				String path_pic_organize_spaish = uploadFileTogether(dto.getPic_organize_spaish(), FileTypeEnum.web_pic, hasdot_organize_spaish,
						nanem_pic_organize_spaish);
				banner_organize_spaish.setId(UUIDTool.getUUID());
				banner_organize_spaish.setCreatetime(date);
				banner_organize_spaish.setCreateuser(loginid);
				banner_organize_spaish.setLanguage("spaish");
				banner_organize_spaish.setPosition(2);
				banner_organize_spaish.setMap(2);
				banner_organize_spaish.setUrl(path_pic_organize_spaish);
				web_bannerMapper.insertSelective(banner_organize_spaish);

			}
			if (!dto.getPic_layout().isEmpty()) {
				WebBanner banner_layout = new WebBanner();
				boolean hasdot_layout = false;
				String nanem_pic_layout = dto.getPic_layout().getOriginalFilename();
				if (StringUtils.isNotBlank(nanem_pic_layout)) {
					int dot = nanem_pic_layout.lastIndexOf(".");
					if (dot > 0) {
						hasdot_layout = true;
						nanem_pic_layout = nanem_pic_layout.substring(dot);
					}
				}
				String path_pic_layout = uploadFileTogether(dto.getPic_layout(), FileTypeEnum.web_pic, hasdot_layout, nanem_pic_layout);
				banner_layout.setId(UUIDTool.getUUID());
				banner_layout.setCreatetime(date);
				banner_layout.setCreateuser(loginid);
				banner_layout.setLanguage("chinese");
				banner_layout.setPosition(3);
				banner_layout.setMap(2);
				banner_layout.setUrl(path_pic_layout);
				web_bannerMapper.insertSelective(banner_layout);
			}
			if (!dto.getPic_brand_chinese().isEmpty()) {
				WebBanner banner_brand_chinese = new WebBanner();
				boolean hasdot_brand_chinese = false;
				String nanem_pic_brand_chinese = dto.getPic_brand_chinese().getOriginalFilename();
				if (StringUtils.isNotBlank(nanem_pic_brand_chinese)) {
					int dot = nanem_pic_brand_chinese.lastIndexOf(".");
					if (dot > 0) {
						hasdot_brand_chinese = true;
						nanem_pic_brand_chinese = nanem_pic_brand_chinese.substring(dot);
					}
				}
				String path_pic_brand_chinese = uploadFileTogether(dto.getPic_brand_chinese(), FileTypeEnum.web_pic, hasdot_brand_chinese,
						nanem_pic_brand_chinese);
				banner_brand_chinese.setId(UUIDTool.getUUID());
				banner_brand_chinese.setCreatetime(date);
				banner_brand_chinese.setCreateuser(loginid);
				banner_brand_chinese.setLanguage("chinese");
				banner_brand_chinese.setPosition(4);
				banner_brand_chinese.setMap(2);
				banner_brand_chinese.setUrl(path_pic_brand_chinese);
				web_bannerMapper.insertSelective(banner_brand_chinese);
			}

			if (!dto.getPic_brand_english().isEmpty()) {
				WebBanner banner_brand_english = new WebBanner();
				boolean hasdot_brand_english = false;
				String nanem_pic_brand_english = dto.getPic_brand_english().getOriginalFilename();
				if (StringUtils.isNotBlank(nanem_pic_brand_english)) {
					int dot = nanem_pic_brand_english.lastIndexOf(".");
					if (dot > 0) {
						hasdot_brand_english = true;
						nanem_pic_brand_english = nanem_pic_brand_english.substring(dot);
					}
				}
				String path_pic_brand_english = uploadFileTogether(dto.getPic_brand_english(), FileTypeEnum.web_pic, hasdot_brand_english,
						nanem_pic_brand_english);
				banner_brand_english.setId(UUIDTool.getUUID());
				banner_brand_english.setCreatetime(date);
				banner_brand_english.setCreateuser(loginid);
				banner_brand_english.setLanguage("english");
				banner_brand_english.setPosition(4);
				banner_brand_english.setMap(2);
				banner_brand_english.setUrl(path_pic_brand_english);
				web_bannerMapper.insertSelective(banner_brand_english);
			}

			if (!dto.getPic_brand_spaish().isEmpty()) {
				WebBanner banner_brand_spaish = new WebBanner();
				boolean hasdot_brand_spaish = false;
				String nanem_pic_brand_spaish = dto.getPic_brand_spaish().getOriginalFilename();
				if (StringUtils.isNotBlank(nanem_pic_brand_spaish)) {
					int dot = nanem_pic_brand_spaish.lastIndexOf(".");
					if (dot > 0) {
						hasdot_brand_spaish = true;
						nanem_pic_brand_spaish = nanem_pic_brand_spaish.substring(dot);
					}
				}
				String path_pic_brand_spaish = uploadFileTogether(dto.getPic_brand_spaish(), FileTypeEnum.web_pic, hasdot_brand_spaish, nanem_pic_brand_spaish);
				banner_brand_spaish.setId(UUIDTool.getUUID());
				banner_brand_spaish.setCreatetime(date);
				banner_brand_spaish.setCreateuser(loginid);
				banner_brand_spaish.setLanguage("spaish");
				banner_brand_spaish.setPosition(4);
				banner_brand_spaish.setMap(2);
				banner_brand_spaish.setUrl(path_pic_brand_spaish);
				web_bannerMapper.insertSelective(banner_brand_spaish);
			}
			if (!dto.getPic_global_dev().isEmpty()) {
				WebBanner banner_global_dev = new WebBanner();
				boolean hasdot_global_dev = false;
				String nanem_pic_global_dev = dto.getPic_global_dev().getOriginalFilename();
				if (StringUtils.isNotBlank(nanem_pic_global_dev)) {
					int dot = nanem_pic_global_dev.lastIndexOf(".");
					if (dot > 0) {
						hasdot_global_dev = true;
						nanem_pic_global_dev = nanem_pic_global_dev.substring(dot);
					}
				}
				String path_pic_global_dev = uploadFileTogether(dto.getPic_global_dev(), FileTypeEnum.web_pic, hasdot_global_dev, nanem_pic_global_dev);
				banner_global_dev.setId(UUIDTool.getUUID());
				banner_global_dev.setCreatetime(date);
				banner_global_dev.setCreateuser(loginid);
				banner_global_dev.setLanguage("chinese");
				banner_global_dev.setPosition(5);
				banner_global_dev.setMap(2);
				banner_global_dev.setUrl(path_pic_global_dev);
				web_bannerMapper.insertSelective(banner_global_dev);
			}	
		}
	}
	
	
	
	
	
	
	public Bottom_BannerDto loadBottom_WebBanner() {

		Bottom_BannerDto dto = new Bottom_BannerDto();
		WebBanner record = new WebBanner();
		record.setMap(2);
		List<WebBanner> listWebBanner = web_bannerMapper.selectByCriteria(record);
		for (WebBanner entity : listWebBanner) {
		   if (entity.getPosition().equals(new Integer(2))) {
			   if("chinese".equals(entity.getLanguage())){
				   dto.setId_organize_chinese(entity.getId());
				   dto.setUrl_organize_chinese(entity.getUrl());
			   }else if("english".equals(entity.getLanguage())){
				   dto.setId_organize_english(entity.getId());
				   dto.setUrl_organize_english(entity.getUrl());
			   }else if("spaish".equals(entity.getLanguage())){
				   dto.setId_organize_spaish(entity.getId());
				   dto.setUrl_organize_spaish(entity.getUrl());
			   }	
			} else if (entity.getPosition().equals(new Integer(3))) {
				dto.setId_layout(entity.getId());
				dto.setUrl_layout(entity.getUrl());
			} else if (entity.getPosition().equals(new Integer(4))) {
				if("chinese".equals(entity.getLanguage())){
					dto.setId_brand_chinese(entity.getId());
					dto.setUrl_brand_chinese(entity.getUrl());
				}else if("english".equals(entity.getLanguage())){
					dto.setId_brand_english(entity.getId());
					dto.setUrl_brand_english(entity.getUrl());
				}else if("spaish".equals(entity.getLanguage())){
					dto.setId_brand_spaish(entity.getId());
					dto.setUrl_brand_spaish(entity.getUrl());
				}
			} else if (entity.getPosition().equals(new Integer(5))) {
				dto.setId_global_dev(entity.getId());
				dto.setUrl_global_dev(entity.getUrl());
			} 
		}

		return dto;
	}
	
	/**
	* 
	* 车源区域页面       分页结果集
	* @param  通过查询条件 返回分页结果集
	* @param 查询条件  ,页码,页数   
	* @return  分页结果  
	* @author liliang
	*/
	public Map<String, Object> purchase_arealist(Purchasearea record, String start, String pageSize) throws ParseException {
		Map<String, Object> pmap = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		pmap.put("start", (Integer.parseInt(start) - 1) * ps);
		pmap.put("size", ps);
		pmap.put("content", record.getContent());
		record.setLanguage("chinese");
		List<Map<String, Object>> list = purchaseareaMapper.selectByCriteriaBytype(pmap);
		int total = purchaseareaMapper.countByCriteriaBytype(pmap);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", list);
		returnMap.put("total", total);
		return returnMap;
	}
	
	
	
	
	
	/**
	 * bottom_banner update
	 * @param dto
	 * @param banner
	 * @throws IOException 
	 */
	@SuppressWarnings("null")
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 3)
	public void updatePurchase_area(PurchaseareaDto dto, int loginid) throws IOException {
		Date date = new Date();
		if (StringUtils.isNotBlank(dto.getGroupId())) {// 说明是update
			  
			Purchasearea purchasearea = new Purchasearea();
			purchasearea.setId(dto.getId_content_chinese());
			purchasearea.setModifytime(date);
			purchasearea.setModifyuser(loginid);
			purchasearea.setContent(dto.getContent_chinese());
			purchaseareaMapper.updateByPrimaryKeySelective(purchasearea);

			Purchasetitle purchasetitle = new Purchasetitle();
			purchasetitle.setId(dto.getId_title_chinese());
			purchasetitle.setModifytime(date);
			purchasetitle.setModifyuser(loginid);
			purchasetitle.setTitleName(dto.getTitle_chinese());
			purchasetitleMapper.updateByPrimaryKeySelective(purchasetitle);
            if(StringUtils.isNotBlank(dto.getId_title_2_chinese()) && StringUtils.isNotBlank(dto.getTitle_2_chinese())){
    			Purchasetitle purchasetitle_2 = new Purchasetitle();
    			purchasetitle_2.setId(dto.getId_title_2_chinese());
    			purchasetitle_2.setModifytime(date);
    			purchasetitle_2.setModifyuser(loginid);
    			purchasetitle_2.setTitleName(dto.getTitle_2_chinese());
    			purchasetitleMapper.updateByPrimaryKeySelective(purchasetitle_2);
            }


			// english
			Purchasearea purchasearea_english = new Purchasearea();

			purchasearea_english.setId(dto.getId_content_english());
			purchasearea_english.setModifytime(date);
			purchasearea_english.setModifyuser(loginid);
			purchasearea_english.setContent(dto.getContent_english());
			purchaseareaMapper.updateByPrimaryKeySelective(purchasearea_english);

			Purchasetitle purchasetitle_english = new Purchasetitle();
			purchasetitle_english.setId(dto.getId_title_english());
			purchasetitle_english.setModifytime(date);
			purchasetitle_english.setModifyuser(loginid);
			purchasetitle_english.setTitleName(dto.getTitle_english());
			purchasetitleMapper.updateByPrimaryKeySelective(purchasetitle_english);

			
			if(StringUtils.isNotBlank(dto.getId_title_2_english()) && StringUtils.isNotBlank(dto.getTitle_2_english())){
				Purchasetitle purchasetitle_english_2 = new Purchasetitle();
				purchasetitle_english_2.setId(dto.getId_title_2_english());
				purchasetitle_english_2.setModifytime(date);
				purchasetitle_english_2.setModifyuser(loginid);
				purchasetitle_english_2.setTitleName(dto.getTitle_2_english());
				purchasetitleMapper.updateByPrimaryKeySelective(purchasetitle_english_2);
			}


			// spaish

			Purchasearea purchasearea_spaish = new Purchasearea();
			purchasearea_spaish.setId(dto.getId_content_spaish());
			purchasearea_spaish.setModifytime(date);
			purchasearea_spaish.setModifyuser(loginid);
			purchasearea_spaish.setContent(dto.getContent_spaish());
			purchaseareaMapper.updateByPrimaryKeySelective(purchasearea_spaish);

			Purchasetitle purchasetitle_spaish = new Purchasetitle();
			purchasetitle_spaish.setId(dto.getId_title_spaish());
			purchasetitle_spaish.setModifytime(date);
			purchasetitle_spaish.setModifyuser(loginid);
			purchasetitle_spaish.setTitleName(dto.getTitle_spaish());
			purchasetitleMapper.updateByPrimaryKeySelective(purchasetitle_spaish);
			
			if(StringUtils.isNotBlank(dto.getId_title_2_spaish()) && StringUtils.isNotBlank(dto.getTitle_2_spaish())){
				Purchasetitle purchasetitle_spaish_2 = new Purchasetitle();
				purchasetitle_spaish_2.setId(dto.getId_title_2_spaish());
				purchasetitle_spaish_2.setModifytime(date);
				purchasetitle_spaish_2.setModifyuser(loginid);
				purchasetitle_spaish_2.setTitleName(dto.getTitle_2_spaish());
				purchasetitleMapper.updateByPrimaryKeySelective(purchasetitle_spaish_2);
			}


						
		} else {
			String groupid = UUIDTool.getUUID();
			// area 和title
			// chinese
			if (StringUtils.isNotBlank(dto.getContent_chinese())) {
				String area_chinese_id = UUIDTool.getUUID();
				Purchasearea purchasearea = new Purchasearea();
				purchasearea.setId(area_chinese_id);
				purchasearea.setCreatetime(date);
				purchasearea.setCreateuser(loginid);
				purchasearea.setLanguage("chinese");
				purchasearea.setContent(dto.getContent_chinese());
				purchasearea.setGroupId(groupid);
				purchaseareaMapper.insertSelective(purchasearea);

				if (StringUtils.isNotBlank(dto.getTitle_chinese())) {
					Purchasetitle purchasetitle = new Purchasetitle();
					purchasetitle.setId(UUIDTool.getUUID());
					purchasetitle.setCreatetime(date);
					purchasetitle.setCreateuser(loginid);
					purchasetitle.setLanguage("chinese");
					purchasetitle.setTitleType(1);
					purchasetitle.setTitleName(dto.getTitle_chinese());
					purchasetitle.setParentId(area_chinese_id);
					purchasetitle.setParentGroupId(groupid);
					purchasetitleMapper.insert(purchasetitle);
				}

				if (StringUtils.isNotBlank(dto.getTitle_2_chinese())) {
					Purchasetitle purchasetitle_2 = new Purchasetitle();
					purchasetitle_2.setId(UUIDTool.getUUID());
					purchasetitle_2.setCreatetime(date);
					purchasetitle_2.setCreateuser(loginid);
					purchasetitle_2.setLanguage("chinese");
					purchasetitle_2.setTitleType(2);
					purchasetitle_2.setTitleName(dto.getTitle_2_chinese());
					purchasetitle_2.setParentId(area_chinese_id);
					purchasetitle_2.setParentGroupId(groupid);
					purchasetitleMapper.insert(purchasetitle_2);
				}
			}
			// english
			if (StringUtils.isNotBlank(dto.getContent_english())) {
				Purchasearea purchasearea_english = new Purchasearea();
				String area_english_id = UUIDTool.getUUID();
				purchasearea_english.setId(area_english_id);
				purchasearea_english.setCreatetime(date);
				purchasearea_english.setCreateuser(loginid);
				purchasearea_english.setLanguage("english");
				purchasearea_english.setContent(dto.getContent_english());
				purchasearea_english.setGroupId(groupid);
				purchaseareaMapper.insertSelective(purchasearea_english);

				if (StringUtils.isNotBlank(dto.getTitle_english())) {
					Purchasetitle purchasetitle_english = new Purchasetitle();
					purchasetitle_english.setId(UUIDTool.getUUID());
					purchasetitle_english.setCreatetime(date);
					purchasetitle_english.setCreateuser(loginid);
					purchasetitle_english.setLanguage("english");
					purchasetitle_english.setTitleType(1);
					purchasetitle_english.setTitleName(dto.getTitle_english());
					purchasetitle_english.setParentId(area_english_id);
					purchasetitle_english.setParentGroupId(groupid);
					purchasetitleMapper.insert(purchasetitle_english);
				}

				if (StringUtils.isNotBlank(dto.getTitle_2_english())) {
					Purchasetitle purchasetitle_english_2 = new Purchasetitle();
					purchasetitle_english_2.setId(UUIDTool.getUUID());
					purchasetitle_english_2.setCreatetime(date);
					purchasetitle_english_2.setCreateuser(loginid);
					purchasetitle_english_2.setLanguage("english");
					purchasetitle_english_2.setTitleType(2);
					purchasetitle_english_2.setTitleName(dto.getTitle_2_english());
					purchasetitle_english_2.setParentId(area_english_id);
					purchasetitle_english_2.setParentGroupId(groupid);
					purchasetitleMapper.insert(purchasetitle_english_2);
				}
			}
			// spaish

			if (StringUtils.isNotBlank(dto.getContent_spaish())) {
				Purchasearea purchasearea_spaish = new Purchasearea();
				String area_spaish_id = UUIDTool.getUUID();
				purchasearea_spaish.setId(area_spaish_id);
				purchasearea_spaish.setCreatetime(date);
				purchasearea_spaish.setCreateuser(loginid);
				purchasearea_spaish.setLanguage("spaish");
				purchasearea_spaish.setContent(dto.getContent_spaish());
				purchasearea_spaish.setGroupId(groupid);
				purchaseareaMapper.insertSelective(purchasearea_spaish);

				if (StringUtils.isNotBlank(dto.getTitle_chinese())) {
					Purchasetitle purchasetitle_spaish = new Purchasetitle();
					purchasetitle_spaish.setId(UUIDTool.getUUID());
					purchasetitle_spaish.setCreatetime(date);
					purchasetitle_spaish.setCreateuser(loginid);
					purchasetitle_spaish.setLanguage("spaish");
					purchasetitle_spaish.setTitleType(1);
					purchasetitle_spaish.setTitleName(dto.getTitle_spaish());
					purchasetitle_spaish.setParentId(area_spaish_id);
					purchasetitle_spaish.setParentGroupId(groupid);
					purchasetitleMapper.insert(purchasetitle_spaish);
				}
				if (StringUtils.isNotBlank(dto.getTitle_2_spaish())) {
					Purchasetitle purchasetitle_spaish_2 = new Purchasetitle();
					purchasetitle_spaish_2.setId(UUIDTool.getUUID());
					purchasetitle_spaish_2.setCreatetime(date);
					purchasetitle_spaish_2.setCreateuser(loginid);
					purchasetitle_spaish_2.setLanguage("spaish");
					purchasetitle_spaish_2.setTitleType(2);
					purchasetitle_spaish_2.setTitleName(dto.getTitle_2_spaish());
					purchasetitle_spaish_2.setParentId(area_spaish_id);
					purchasetitle_spaish_2.setParentGroupId(groupid);
					purchasetitleMapper.insert(purchasetitle_spaish_2);

				}
			}

		}
	}
	
	
	
	
	
	
	
	
	/**
	*  修改页面  根据车源区域group_id   封装成 PurchaseareaDto对象
	* @author liliang
	*/
	public PurchaseareaDto LoadPurchaseareaDtoById(String group_id)  {
		PurchaseareaDto dto = new PurchaseareaDto();
		if(StringUtils.isBlank(group_id)){
			return dto;
		}
		Purchasearea purchasearea = new Purchasearea();
		purchasearea.setGroupId(group_id);
		dto.setGroupId(group_id);
		List<Purchasearea> purchasearealist = purchaseareaMapper.selectByCriteria(purchasearea);
		for(Purchasearea p:purchasearealist){
			
			// 以下设置内容
			if("chinese".equals(p.getLanguage())){
				dto.setContent_chinese(p.getContent());
				dto.setId_content_chinese(p.getId());
			}else if("english".equals(p.getLanguage())){
				dto.setContent_english(p.getContent());
				dto.setId_content_english(p.getId());
			}else if("spaish".equals(p.getLanguage())){
				dto.setContent_spaish(p.getContent());
				dto.setId_content_spaish(p.getId());
			}
		}
		
		// 以下title_1
		Purchasetitle purchasetitle = new Purchasetitle();
		purchasetitle.setParentGroupId(group_id);
		purchasetitle.setTitleType(1);
		List<Purchasetitle> title_top_list = purchasetitleMapper.selectByCriteria(purchasetitle);
		for(Purchasetitle title:title_top_list){
			
			if("chinese".equals(title.getLanguage())){
				dto.setTitle_chinese(title.getTitleName());
				dto.setId_title_chinese(title.getId());
			}else if("english".equals(title.getLanguage())){
				dto.setTitle_english(title.getTitleName());
				dto.setId_title_english(title.getId());
			}else if("spaish".equals(title.getLanguage())){
				dto.setTitle_spaish(title.getTitleName());
				dto.setId_title_spaish(title.getId());
			}
		}

		// 以下title_2
		Purchasetitle purchasetitle_2 = new Purchasetitle();
		purchasetitle_2.setParentGroupId(group_id);
		purchasetitle_2.setTitleType(2);
		List<Purchasetitle> title_bottom_list = purchasetitleMapper.selectByCriteria(purchasetitle_2);
		for(Purchasetitle title_2:title_bottom_list){
			
			if("chinese".equals(title_2.getLanguage())){
				dto.setTitle_2_chinese(title_2.getTitleName());
				dto.setId_title_2_chinese(title_2.getId());
			}else if("english".equals(title_2.getLanguage())){
				dto.setTitle_2_english(title_2.getTitleName());
				dto.setId_title_2_english(title_2.getId());
			}else if("spaish".equals(title_2.getLanguage())){
				dto.setTitle_2_spaish(title_2.getTitleName());
				dto.setId_title_2_spaish(title_2.getId());
			}
		}		
		return dto;
	}
	
	
	
	
	
	/**
	 * <p>TODO</p>
	 * @author liliang
	 * @throws Exception 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void updatePurchase_are_pic(PurchaseareapicDto dto, int loginid,MultipartFile[] files) throws Exception {
		
		//Purchasetitle loadp_title = purchasetitleMapper.selectByPrimaryKey(dto.getId());
		Purchasetitle loadp_title = purchasetitleMapper.selectByPrimaryKey(dto.getId_title_chinese());
	    Integer title_type = loadp_title.getTitleType(); // 全局类型
	    String title_parentGroupId =  loadp_title.getParentGroupId();
		Purchasetitle record = new Purchasetitle();
		record.setParentId(loadp_title.getParentId());
		record.setTitleType(title_type);
		
	//	purchasetitleMapper.selectByPrimaryKey(dto.getId());
		//Date date = new Date();
		if (StringUtils.isNotBlank(dto.getGroupId())) {// 说明时update

		} else {// 说明是新增

			for (int i = 0; i < files.length; i++) {
				if (!files[i].isEmpty()) {
					boolean hasdot_introduce = false;
					String nanem_pic_introduce = files[i].getOriginalFilename();
					if (StringUtils.isNotBlank(nanem_pic_introduce)) {
						int dot = nanem_pic_introduce.lastIndexOf(".");
						if (dot > 0) {
							hasdot_introduce = true;
							nanem_pic_introduce = nanem_pic_introduce.substring(dot);
						}
					}
					String path_pic_introduce = uploadFileTogether(files[i], FileTypeEnum.web_model_pic, hasdot_introduce, nanem_pic_introduce);

					String pic_id = UUIDTool.getUUID();
					Purchaseareapic purchaseareapic = new Purchaseareapic();
					purchaseareapic.setId(pic_id);
					purchaseareapic.setUrl(path_pic_introduce);
					purchaseareapic.setCreatetime(new Date());
					purchaseareapic.setCreateuser(loginid);
					purchaseareapic.setParentId(dto.getId_title_chinese());
					purchaseareapic.setParentGroupId(title_parentGroupId);
					purchaseareapicMapper.insertSelective(purchaseareapic);

					if (StringUtils.isNotBlank(dto.getTitle_chinese()[i])) {// 不等于空 开始新增
						Purchaseareapicname loadpurchaseareapicname_chinese = new Purchaseareapicname();
						loadpurchaseareapicname_chinese.setPicName(dto.getTitle_chinese()[i]);
						loadpurchaseareapicname_chinese.setLanguage("chinese");
						loadpurchaseareapicname_chinese.setParentParentId(dto.getId_title_chinese());// title_id
						List<Purchaseareapicname> loadpicname_chinese = purchaseareapicnameMapper.selectByCriteria(loadpurchaseareapicname_chinese);
						if (null != loadpicname_chinese && loadpicname_chinese.size() > 0) {
							throw new Exception("该标题下名字为  " + dto.getTitle_chinese()[i] + "  的已存在,请重新填写名字");
						} else {
							Purchaseareapicname purchaseareapicname_chinese = new Purchaseareapicname();
							purchaseareapicname_chinese.setId(UUIDTool.getUUID());
							purchaseareapicname_chinese.setPicName(dto.getTitle_chinese()[i]);
							purchaseareapicname_chinese.setLanguage("chinese");
							purchaseareapicname_chinese.setParentId(pic_id);// 图片id
							purchaseareapicname_chinese.setParentGroupId(title_parentGroupId);
							purchaseareapicname_chinese.setParentTitleType(title_type);
							purchaseareapicname_chinese.setParentParentId(dto.getId_title_chinese());
							purchaseareapicnameMapper.insertSelective(purchaseareapicname_chinese);
						}

					}
					if (StringUtils.isNotBlank(dto.getTitle_english()[i])) {// 不等于空 开始新增
						Purchaseareapicname loadpurchaseareapicname_english = new Purchaseareapicname();
						loadpurchaseareapicname_english.setPicName(dto.getTitle_english()[i]);
						loadpurchaseareapicname_english.setLanguage("english");
						loadpurchaseareapicname_english.setParentParentId(dto.getId_title_english());// title_id
						List<Purchaseareapicname> loadpicname_english = purchaseareapicnameMapper.selectByCriteria(loadpurchaseareapicname_english);
						if (null != loadpicname_english && loadpicname_english.size() > 0) {
							throw new Exception("该标题下名字为  " + dto.getTitle_english()[i] + "  的已存在,请重新填写名字");
						} else {
							Purchaseareapicname purchaseareapicname_english = new Purchaseareapicname();
							purchaseareapicname_english.setId(UUIDTool.getUUID());
							purchaseareapicname_english.setPicName(dto.getTitle_english()[i]);
							purchaseareapicname_english.setLanguage("english");
							purchaseareapicname_english.setParentId(pic_id);// 图片id
							purchaseareapicname_english.setParentGroupId(title_parentGroupId);
							purchaseareapicname_english.setParentTitleType(title_type);
							purchaseareapicname_english.setParentParentId(dto.getId_title_english());
							purchaseareapicnameMapper.insertSelective(purchaseareapicname_english);
						}

					}

					if (StringUtils.isNotBlank(dto.getTitle_spaish()[i])) {// 不等于空 开始新增
						Purchaseareapicname loadpurchaseareapicname_spaish = new Purchaseareapicname();
						loadpurchaseareapicname_spaish.setPicName(dto.getTitle_chinese()[i]);
						loadpurchaseareapicname_spaish.setLanguage("spaish");
						loadpurchaseareapicname_spaish.setParentParentId(dto.getId_title_spaish());// title_id
						List<Purchaseareapicname> loadpicname_spaish = purchaseareapicnameMapper.selectByCriteria(loadpurchaseareapicname_spaish);
						if (null != loadpicname_spaish && loadpicname_spaish.size() > 0) {
							throw new Exception("该标题下名字为  " + dto.getTitle_spaish()[i] + "  的已存在,请重新填写名字");
						} else {
							Purchaseareapicname purchaseareapicname_spaish = new Purchaseareapicname();
							purchaseareapicname_spaish.setId(UUIDTool.getUUID());
							purchaseareapicname_spaish.setPicName(dto.getTitle_spaish()[i]);
							purchaseareapicname_spaish.setLanguage("spaish");
							purchaseareapicname_spaish.setParentId(pic_id);// 图片id
							purchaseareapicname_spaish.setParentGroupId(title_parentGroupId);
							purchaseareapicname_spaish.setParentTitleType(title_type);
							purchaseareapicname_spaish.setParentParentId(dto.getId_title_spaish());
							purchaseareapicnameMapper.insertSelective(purchaseareapicname_spaish);
						}

					}

				}
			}
		}

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	* 
	* 车型 图片 名字       分页结果集
	* @param  通过title_id 返回分页结果集
	* @param 查询条件  ,页码,页数   
	* @return  分页结果  
	* @author liliang
	*/
	public Map<String, Object> purchase_pic_url_namelist(String title_id, String start, String pageSize) throws ParseException {
		Map<String, Object> pmap = new HashMap<String, Object>();
		int ps = Integer.parseInt(pageSize);
		pmap.put("start", (Integer.parseInt(start) - 1) * ps);
		pmap.put("size", ps);
		pmap.put("parent_id", title_id);
		List<Map<String, Object>> list = purchaseareapicMapper.selectByCriteriaByparentid(pmap);
		int total = purchaseareapicMapper.countByCriteriaByparentid(pmap);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", list);
		returnMap.put("total", total);
		return returnMap;
	}
	
	/**
	*  修改页面  pic_id   封装成 pic  对象  包含url 三种语言的名字
	* @author liliang
	*/
	public PurchasepicDto loadPurchasepicDtoByPic_id(String pic_id)  {
		PurchasepicDto dto = new PurchasepicDto();
		if(StringUtils.isBlank(pic_id)){
			return dto;
		}
		
		Purchaseareapic pic = purchaseareapicMapper.selectByPrimaryKey(pic_id);
		// 以下设置图片url
		dto.setId(pic.getId());
		dto.setUrl(pic.getUrl());
		dto.setParent_id(pic.getParentId());
		Purchaseareapicname picname = new Purchaseareapicname();
		picname.setParentId(pic_id);
		List<Purchaseareapicname> picnamelist = purchaseareapicnameMapper.selectByCriteria(picname);
		for(Purchaseareapicname p:picnamelist){
			// 以下设置图片 名称
			if("chinese".equals(p.getLanguage())){
				dto.setPic_name_chinese(p.getPicName());
				dto.setId_pic_name_chinese(p.getId());
			}else if("english".equals(p.getLanguage())){
				dto.setPic_name_english(p.getPicName());
				dto.setId_pic_name_english(p.getId());
			}else if("spaish".equals(p.getLanguage())){
				dto.setPic_name_spaish(p.getPicName());
				dto.setId_pic_name_spaish(p.getId());
			}
		}
		return dto;
	}
	
	
	
	
	/**
	 * <p>TODO</p>
	 * @author liliang
	 * @throws Exception 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void updatePurchase_onepic(PurchasepicDto dto, int loginid) throws Exception {

		Date date = new Date();
		Purchaseareapic loadpic = purchaseareapicMapper.selectByPrimaryKey(dto.getId());
		String parent_parent_id = loadpic.getParentId();
		if (null != dto.getFile() && !dto.getFile().isEmpty()) {// 说明图片有更新
			boolean hasdot_introduce = false;
			String nanem_pic_introduce = dto.getFile().getOriginalFilename();
			if (StringUtils.isNotBlank(nanem_pic_introduce)) {
				int dot = nanem_pic_introduce.lastIndexOf(".");
				if (dot > 0) {
					hasdot_introduce = true;
					nanem_pic_introduce = nanem_pic_introduce.substring(dot);
				}
			}
			String path_pic_introduce = uploadFileTogether(dto.getFile(), FileTypeEnum.web_model_pic, hasdot_introduce, nanem_pic_introduce);

			Purchaseareapic purchaseareapic = new Purchaseareapic();
			purchaseareapic.setId(dto.getId());
			purchaseareapic.setUrl(path_pic_introduce);
			purchaseareapic.setModifytime(date);
			purchaseareapic.setModifyuser(loginid);
			purchaseareapicMapper.updateByPrimaryKeySelective(purchaseareapic);
		}
		if (StringUtils.isNotBlank(dto.getPic_name_chinese())) {
			Purchaseareapicname loadpicname_chinese = new Purchaseareapicname();
			loadpicname_chinese.setParentParentId(parent_parent_id);
			loadpicname_chinese.setPicName(dto.getPic_name_chinese());
			loadpicname_chinese.setLanguage("chinese");
			List<Purchaseareapicname> lpic_name_chineseList = purchaseareapicnameMapper.selectByCriteria(loadpicname_chinese);
			if (null != lpic_name_chineseList && lpic_name_chineseList.size() > 0) {
				if (!dto.getId_pic_name_chinese().equals(lpic_name_chineseList.get(0).getId())) {
					throw new Exception("该标题下名字为  " + dto.getPic_name_chinese() + "  的已存在,请重新填写名字");
				}

			} else {
				Purchaseareapicname purchaseareapicname_chinese = new Purchaseareapicname();
				purchaseareapicname_chinese.setId(dto.getId_pic_name_chinese());
				purchaseareapicname_chinese.setPicName(dto.getPic_name_chinese());
				purchaseareapicnameMapper.updateByPrimaryKeySelective(purchaseareapicname_chinese);
			}
		}
		if (StringUtils.isNotBlank(dto.getPic_name_english())) {
			Purchaseareapicname loadpicname_english = new Purchaseareapicname();
			loadpicname_english.setParentParentId(parent_parent_id);
			loadpicname_english.setPicName(dto.getPic_name_english());
			loadpicname_english.setLanguage("english");
			List<Purchaseareapicname> lpic_name_englishList = purchaseareapicnameMapper.selectByCriteria(loadpicname_english);
			if (null != lpic_name_englishList && lpic_name_englishList.size() > 0) {
				if (!dto.getId_pic_name_english().equals(lpic_name_englishList.get(0).getId())) {
					throw new Exception("该标题下名字为  " + dto.getPic_name_english() + "  的已存在,请重新填写名字");
				}

			} else {
				Purchaseareapicname purchaseareapicname_english = new Purchaseareapicname();
				purchaseareapicname_english.setId(dto.getId_pic_name_english());
				purchaseareapicname_english.setPicName(dto.getPic_name_english());
				purchaseareapicnameMapper.updateByPrimaryKeySelective(purchaseareapicname_english);
			}
		}

		if (StringUtils.isNotBlank(dto.getPic_name_spaish())) {
			Purchaseareapicname loadpicname_spaish = new Purchaseareapicname();
			loadpicname_spaish.setParentParentId(parent_parent_id);
			loadpicname_spaish.setPicName(dto.getPic_name_spaish());
			loadpicname_spaish.setLanguage("spaish");
			List<Purchaseareapicname> lpic_name_spaishList = purchaseareapicnameMapper.selectByCriteria(loadpicname_spaish);
			if (null != lpic_name_spaishList && lpic_name_spaishList.size() > 0) {
				if (!dto.getId_pic_name_spaish().equals(lpic_name_spaishList.get(0).getId())) {
					throw new Exception("该标题下名字为  " + dto.getPic_name_spaish() + "  的已存在,请重新填写名字");
				}
			} else {
				Purchaseareapicname purchaseareapicname_spaish = new Purchaseareapicname();
				purchaseareapicname_spaish.setId(dto.getId_pic_name_spaish());
				purchaseareapicname_spaish.setPicName(dto.getPic_name_spaish());
				purchaseareapicnameMapper.updateByPrimaryKeySelective(purchaseareapicname_spaish);
			}
		}
	}
	
	
	/**
	 * <p>删除 采购车源 图片名字</p>
	 * @author liliang
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void pic_delete(String title_id) throws IOException {
		if(StringUtils.isNotBlank(title_id)){//
			Purchaseareapicname purchaseareapicname = new Purchaseareapicname();
			purchaseareapicname.setParentId(title_id);
			List<Purchaseareapicname> pic_nameList = purchaseareapicnameMapper.selectByCriteria(purchaseareapicname);
			for(Purchaseareapicname pic_name : pic_nameList){
				purchaseareapicnameMapper.deleteByPrimaryKey(pic_name.getId());
			}
			purchaseareapicMapper.deleteByPrimaryKey(title_id);
			
		}
		
	}
	
	/**
	 * <p>删除 采购车源区域</p>
	 * @author liliang
	 * @throws Exception 
	 */
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public void area_delete(String group_id) throws Exception {
		if(StringUtils.isNotBlank(group_id)){//
			Purchaseareapic purchaseareapic = new Purchaseareapic();
			purchaseareapic.setParentGroupId(group_id);
			List<Purchaseareapic> pic_nameList = purchaseareapicMapper.selectByCriteria(purchaseareapic);
			if(null !=pic_nameList && pic_nameList.size()>0){
				throw new Exception("请先删除改区域下的 图片,然后再删除该区域");
			}
			
			
			Purchasearea purchasearea = new Purchasearea();
			purchasearea.setGroupId(group_id);
			List<Purchasearea> area_List =purchaseareaMapper.selectByCriteria(purchasearea);
	        for(Purchasearea area : area_List){
	        	purchaseareaMapper.deleteByPrimaryKey(area.getId());
	        }
	        
	        Purchasetitle purchasetitle = new Purchasetitle();
	        purchasetitle.setParentGroupId(group_id);
			List<Purchasetitle> title_List =purchasetitleMapper.selectByCriteria(purchasetitle);
	        for(Purchasetitle title : title_List){
	        	purchasetitleMapper.deleteByPrimaryKey(title.getId());
	        }
			
		}
		
	}
	
	public WebPurchaseAreaDto loadWebPurchaseArea(String title_id) {
		WebPurchaseAreaDto dto = new WebPurchaseAreaDto();
		Purchasetitle title_chinese = purchasetitleMapper.selectByPrimaryKey(title_id);
		Purchasetitle record  = new Purchasetitle();
		record.setTitleType(title_chinese.getTitleType());
		record.setParentGroupId(title_chinese.getParentGroupId());
		List<Purchasetitle> titleList = purchasetitleMapper.selectByCriteria(record);
		dto.setId_parent_group_id(title_chinese.getParentGroupId());
		for (Purchasetitle entity : titleList) {
			if ("chinese".equals(entity.getLanguage())) {
				dto.setId_title_chinese(entity.getId());
			} else if ("english".equals(entity.getLanguage())) {
				dto.setId_title_english(entity.getId());
			} else if ("spaish".equals(entity.getLanguage())) {
				dto.setId_title_spaish(entity.getId());
			}
		}
		return dto;
	}
	
	
	
}
