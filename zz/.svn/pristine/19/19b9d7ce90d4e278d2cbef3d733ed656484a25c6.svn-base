package com.bizdata.app.device.devicemanager.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.app.device.devicecata.service.DeviceCataService;
import com.bizdata.app.device.devicemanager.controller.vo.AddDeviceManagerVO;
import com.bizdata.app.device.devicemanager.controller.vo.AlterDeviceManagerVO;
import com.bizdata.app.device.devicemanager.controller.vo.DeviceManagerVO;
import com.bizdata.app.device.devicemanager.domain.DeviceManager;
import com.bizdata.app.device.devicemanager.service.DeviceManagerService;
import com.bizdata.app.device.devicesource.domain.DeviceSource;
import com.bizdata.app.device.devicesource.service.DeviceSourceService;
import com.bizdata.commons.utils.DateEditor;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;
import com.bizdata.config.FileUploadConfig;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.resp.ResultUtil;
import me.sdevil507.resp.ResultVO;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;

@Controller
@RequestMapping("/admin/devicemanager")
@Slf4j
public class devicemanagerController {

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final DeviceManagerService deviceManagerService;

	private final DeviceSourceService deviceSourceService;

	private final DeviceCataService deviceCataService;

	private final FileUploadConfig fileUploadConfig;

	@Autowired
	public devicemanagerController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, DeviceManagerService deviceManagerService,
			FileUploadConfig fileUploadConfig, DeviceSourceService deviceSourceService,
			DeviceCataService deviceCataService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.deviceManagerService = deviceManagerService;
		this.fileUploadConfig = fileUploadConfig;
		this.deviceSourceService = deviceSourceService;
		this.deviceCataService = deviceCataService;
	}

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	/**
	 * 展示对应模板页面
	 *
	 * @return 模板页面
	 */
	@RequiresPermissions("manager_device:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/device/devicemanager/list");
	}

	/**
	 * 增加设备跳转
	 *
	 * @return 模板页面
	 */
	@RequiresPermissions("manager_device:view")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView viewadd(String deviceId) {
		DeviceSource deviceSource = deviceSourceService.findOne(deviceId);
		String functionType = deviceSource.getFunctionType();
		Integer num = 0;
		// 设置复选框中有哪些值被选中
		if (StringUtils.isNumeric(functionType)) {
			List<Boolean> isChecked = new ArrayList<Boolean>();
			num = Integer.valueOf(functionType);
			String temp = Integer.toBinaryString(num);
			char[] c = temp.toCharArray();
			for (int i = 0; i < 8; i++) {
				if (i < c.length) {
					// 如果有等于1
					if ('1' == c[c.length - i - 1]) {
						isChecked.add(true);
					} else {
						isChecked.add(false);
					}
				} else {
					isChecked.add(false);
				}
			}
			deviceSource.setIsChecked(isChecked);
		}
		AddDeviceManagerVO addDeviceManagerVO = new AddDeviceManagerVO();
		addDeviceManagerVO.setDeviceSource(deviceSource);
		Map<String, String> deviceCatas = deviceCataService.findNameAndId();
		addDeviceManagerVO.setDeviceCatas(deviceCatas);
		return new ModelAndView("app_page/device/devicesource/addto", "addDeviceManagerVO", addDeviceManagerVO);
	}

	/**
	 * 列表显示
	 * 
	 * @param jqGridPageVO
	 * @param jqGridSortVO
	 * @param deviceManagerVO
	 * @return
	 */
	@RequiresPermissions("manager_device:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<DeviceManager, DeviceManager> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			DeviceManagerVO deviceManagerVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<DeviceManager> deviceManagers = deviceManagerService.findAllByPage(jpaPageParamVO, jpaSortParamVO,
				deviceManagerVO);
		for (DeviceManager deviceManager : deviceManagers) {
			deviceManager
					.setDeviceCataName(deviceCataService.findOne(deviceManager.getDeviceCataId()).getDeviceCataName());
		}
		return new JpaPageResultVO<>(deviceManagers, DeviceManager.class);
	}

	/**
	 * 保存或者更新
	 * 
	 * @param deviceManager
	 * @return
	 */
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO add(DeviceManager deviceManager) {
		ResultVO resultVO;
		if (null == deviceManager.getCreateDate()) {
			deviceManager.setCreateDate(new Date());
		}
		String logo = deviceManager.getDeviceLogo();
		if (logo.indexOf("http:") == -1) {
			deviceManager.setDeviceLogo(fileUploadConfig.getServerPrefix() + deviceManager.getDeviceLogo()); // 设置前缀
		}
		String[] nums = deviceManager.getFunctionType().split(",");
		if (nums.length != 0) {
			int sum = 0;
			for (int i = 0; i < nums.length; i++) {
				sum += (int) Math.pow(2, Integer.valueOf(nums[i]) - 1);
			}
			deviceManager.setFunctionType(String.valueOf(sum));
		}
		if (deviceManagerService.save(deviceManager)) {
			resultVO = ResultUtil.create(0, "保存设备管理信息成功!");
		} else {
			resultVO = ResultUtil.create(-1, "保存设备管理信息失败!");
		}
		return resultVO;
	}

	/**
	 * 逻辑删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO del(String id) {
		ResultVO resultVO;

		DeviceManager deviceManager = deviceManagerService.findOne(id);
		if (null != deviceManager) {
			// 修改状态值1:上线-1:下线
			if ("1".equals(deviceManager.getState())) {
				deviceManager.setState("-1");
			} else if ("-1".equals(deviceManager.getState())) {
				deviceManager.setState("1");
			}
			// 保存对象
			boolean result = deviceManagerService.save(deviceManager);
			if (!result) {
				log.error("更新失败！");
				resultVO = ResultUtil.create(-1, "发生错误，请检查日志");
			} else {
				resultVO = ResultUtil.create(0, "执行成功");
			}
		} else {
			resultVO = ResultUtil.create(-1, "该设备管理不存在");
		}

		return resultVO;
	}
	
	/**
	 * 跳转到修改页面
	 * @param id
	 * @return
	 */
	@RequiresPermissions("manager_device:view")
	@RequestMapping(value = "/edit_view", method = RequestMethod.GET)
	public ModelAndView readOne(String id) {
		DeviceManager deviceManager = deviceManagerService.findOne(id);
		String functionType = deviceManager.getFunctionType();
		Integer num = 0;
		// 设置复选框中有哪些值被选中
		if (StringUtils.isNumeric(functionType)) {
			List<Boolean> isChecked = new ArrayList<Boolean>();
			num = Integer.valueOf(functionType);
			String temp = Integer.toBinaryString(num);
			char[] c = temp.toCharArray();
			for (int i = 0; i < 8; i++) {
				if (i < c.length) {
					// 如果有等于1
					if ('1' == c[c.length - i - 1]) {
						isChecked.add(true);
					} else {
						isChecked.add(false);
					}
				} else {
					isChecked.add(false);
				}
			}
			deviceManager.setIsChecked(isChecked);
		}
		AlterDeviceManagerVO alterDeviceManagerVO = new AlterDeviceManagerVO();
		alterDeviceManagerVO.setDeviceManager(deviceManager);
		Map<String, String> deviceCatas = deviceCataService.findNameAndId();
		alterDeviceManagerVO.setDeviceCatas(deviceCatas);
		return new ModelAndView("app_page/device/deviceManager/edit", "alterDeviceManagerVO", alterDeviceManagerVO);
	}

}
