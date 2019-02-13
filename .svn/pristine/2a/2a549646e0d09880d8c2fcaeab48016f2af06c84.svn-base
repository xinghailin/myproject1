/*******************************************************************************
 * Project   : car-ms
 * Class Name: com.yyq.car.portal.ms.app.service.BannerService
 * Created By: wangzh 
 * Created on: 2017年8月7日 下午5:03:10
 * Copyright © 2013-2014 YYQ All rights reserved.
 ******************************************************************************/
package com.yyq.car.portal.ms.app.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yyq.car.portal.common.constant.Constants;
import com.yyq.car.portal.common.constant.FileTypeEnum;
import com.yyq.car.portal.common.dto.UserDTO;
import com.yyq.car.portal.common.exception.PortalBizCheckedException;
import com.yyq.car.portal.common.mapper.comm.BannerMapper;
import com.yyq.car.portal.common.model.comm.Banner;
import com.yyq.car.portal.common.service.ResourcePersistenceService;
import com.yyq.car.portal.common.service.security.SecurityHelper;
import com.yyq.car.portal.common.util.DateUtils;
import com.yyq.car.portal.common.util.StringUtil;


/**
 * <P>bannerservice</P>
 * @author wangzh
 */
@Service
public class BannerService {

	@Autowired
	private BannerMapper mapper;

	@Autowired
	private ResourcePersistenceService resourceService;

	public List<Map<String, Object>> query(Integer start, Integer size) {
		return mapper.selectBySortMs(start, size);
	}

	public int count() {
		return mapper.countByCriteria(new Banner());
	}

	public void deleteById(Integer id) {
		mapper.deleteByPrimaryKey(id);
	}

	public void save(Integer id, String uri, Integer sort, MultipartFile pic) throws IOException {
		UserDTO user = SecurityHelper.getAdminUserInfo();
		if (id == null) {// 插入时
			Banner dto = new Banner();
			if (user != null) {
				dto.setUserId(user.getId());
			}
			dto.setUri(uri);
			dto.setCreateTime(new Date());
			dto.setPic(uploadFileProcess(pic, FileTypeEnum.BANNER));
			dto.setSort(sort);
			mapper.insertSelective(dto);
		} else {// 更新时
			Banner dto = new Banner();
			dto.setId(id);
			dto.setPic(uploadFileProcess(pic, FileTypeEnum.BANNER));
			dto.setUri(uri);
			dto.setSort(sort);
			if (user != null) {
				dto.setUserId(user.getId());
			}
			mapper.updateDtoByPrimaryKeySelective(dto);
		}
	}

	/**
	 * <p>异步保存图片</p>
	 * @param file
	 * @return
	 * @throws IOException
	 * @author wangzh
	 */
	private String uploadFileProcess(MultipartFile file, FileTypeEnum fte) throws IOException {
		String picPath = null;
		if (file != null && file.getSize() > 0) {
			if (file.getSize() > Constants.PROFILE_PHOTO_MAX_SIZE) {
				throw new PortalBizCheckedException("图片不能超过10M");
			}
			String targetFileName = StringUtil.createFileName();
			String path = resourceService.getFilePath(fte);
			picPath = path + "/" + DateUtils.formateCurrent(DateUtils.COMPACT_DATE_FORMAT) + "/" + targetFileName;
			resourceService.asyncSaveFile(picPath, file.getInputStream(), true);
		}
		return picPath;
	}

}