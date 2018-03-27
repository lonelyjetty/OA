package com.bizdata.app.device.devicecata.controller;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.app.device.devicecata.controller.vo.DeviceCataVO;
import com.bizdata.app.device.devicecata.domain.DeviceCata;
import com.bizdata.app.device.devicecata.service.DeviceCataService;
import com.bizdata.app.miaodetail.excleutil.ExcelRead;
import com.bizdata.app.miaodetail.excleutil.ExcelUtil;
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
@RequestMapping("/admin/devicecata")
@Slf4j
public class devicecataController {

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final DeviceCataService deviceCataService;

	private final FileUploadConfig fileUploadConfig;

	@Autowired
	public devicecataController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, DeviceCataService deviceCataService,
			FileUploadConfig fileUploadConfig) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.deviceCataService = deviceCataService;
		this.fileUploadConfig = fileUploadConfig;
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
	@RequiresPermissions("cata_device:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/device/devicecata/list");
	}

	/**
	 * 跳转到添加页面
	 * 
	 * @return
	 */
	@RequiresPermissions("cata_device:view")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView viewadd() {
		return new ModelAndView("app_page/device/devicecata/add");
	}

	/**
	 * 详细列表
	 * 
	 * @param jqGridPageVO
	 * @param jqGridSortVO
	 * @param deviceCataVO
	 * @return
	 */
	@RequiresPermissions("cata_device:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<DeviceCata, DeviceCata> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			DeviceCataVO deviceCataVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<DeviceCata> deviceCatas = deviceCataService.findAllByPage(jpaPageParamVO, jpaSortParamVO, deviceCataVO);
		return new JpaPageResultVO<>(deviceCatas, DeviceCata.class);
	}

	/**
	 * 保存或者修改
	 * 
	 * @param deviceSource
	 * @return
	 */
	@RequiresPermissions("cata_device:view")
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO add(DeviceCata deviceCata) {
		ResultVO resultVO;
		String logo = deviceCata.getCataLogo();
		if (logo.indexOf("http:") == -1) {
			deviceCata.setCataLogo(fileUploadConfig.getServerPrefix() + deviceCata.getCataLogo()); // 设置前缀
		}
		if (null == deviceCata.getCreateDate()) {
			deviceCata.setCreateDate(new Date());
		}
		if (deviceCataService.save(deviceCata)) {
			resultVO = ResultUtil.create(0, "保存设备分类成功!");
		} else {
			resultVO = ResultUtil.create(-1, "保存设备分类失败!");
		}
		return resultVO;
	}

	/**
	 * 跳转到编辑页面
	 * 
	 * @param id
	 * @return
	 */
	@RequiresPermissions("cata_device:view")
	@RequestMapping(value = "/edit_view", method = RequestMethod.GET)
	public ModelAndView readOne(String id) {
		DeviceCata deviceCata = deviceCataService.findOne(id);
		return new ModelAndView("app_page/device/devicecata/edit", "deviceCata", deviceCata);
	}

	/**
	 * 逻辑删除功能
	 * 
	 * @param id
	 * @return
	 */
	@RequiresPermissions("cata_device:view")
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO del(String id) {
		ResultVO resultVO;

		DeviceCata deviceCata = deviceCataService.findOne(id);
		if (null != deviceCata) {
			// 修改状态值0:正常1:删除
			if ("0".equals(deviceCata.getIsDel())) {
				deviceCata.setIsDel("1");
			}
			// 保存对象
			boolean result = deviceCataService.save(deviceCata);
			if (!result) {
				log.error("更新失败！");
				resultVO = ResultUtil.create(-1, "发生错误，请检查日志");
			} else {
				resultVO = ResultUtil.create(0, "执行成功");
			}
		} else {
			resultVO = ResultUtil.create(-1, "该设备分类不存在");
		}

		return resultVO;
	}

	/**
	 * 上传附件
	 * 
	 * @param file
	 * @return
	 */
	@RequiresPermissions("cata_device:view")
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public boolean XlsUpload(@RequestParam(value = "excelFile", required = false) MultipartFile file) {
		boolean result = false;
		if (file == null) {
			return result;
		}
		String name = file.getOriginalFilename();
		long size = file.getSize();
		if (name == null || ExcelUtil.EMPTY.equals(name) && size == 0) {
			return result;
		}
		// 读取Excel数据到List中
		try {
			// 从第2行读取数据
			List<ArrayList<String>> list = new ExcelRead().readExcel(file, 4);
			for (int i = 0; i < list.size(); i++) {
				String id = list.get(i).get(0);
				String type_name = list.get(i).get(1);
				String type_desc = list.get(i).get(2);
				String logo = list.get(i).get(3);
				// 赋值
				DeviceCata deviceCata = new DeviceCata();
				deviceCata.setId(id);
				deviceCata.setCataLogo(logo);
				deviceCata.setDescription(type_desc);
				deviceCata.setDeviceCataName(type_name);
				deviceCata.setCreateDate(new Date());
				deviceCata.setIsDel("0"); // 默认设置为正常
				deviceCataService.save(deviceCata); // 保存
			}
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 下载附件
	 * 
	 * @param response
	 * @throws Exception
	 */
	@RequiresPermissions("cata_device:view")
	@RequestMapping(value = "/fileDownLoad", method = RequestMethod.GET)
	@ResponseBody
	public void fileDownLoad(HttpServletResponse response) throws Exception {
		// 第一步，创建一个webbook，对应一个Excel文件
		@SuppressWarnings("resource")
		HSSFWorkbook wb = new HSSFWorkbook();
		// 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
		HSSFSheet sheet = wb.createSheet("open_device_type");
		// 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
		HSSFRow row = sheet.createRow((int) 0);
		// 第四步，创建单元格，并设置值表头 设置表头居中
		HSSFCellStyle style = wb.createCellStyle();
		HSSFCell cell = row.createCell((short) 0);
		cell.setCellValue("id");
		cell.setCellStyle(style);
		cell = row.createCell((short) 1);
		cell.setCellValue("type_name");
		cell.setCellStyle(style);
		cell = row.createCell((short) 2);
		cell.setCellValue("type_desc");
		cell.setCellStyle(style);
		cell = row.createCell((short) 3);
		cell.setCellValue("logo");
		cell.setCellStyle(style);
		// 第五步，写入实体数据 实际应用中这些数据从数据库得到
		List<DeviceCata> deviceCatas = deviceCataService.findAll();
		if (deviceCatas != null) {
			for (int i = 0; i < deviceCatas.size(); i++) {
				row = sheet.createRow((int) i + 1);
				DeviceCata deviceCata = deviceCatas.get(i);
				// 第四步，创建单元格，并设置值
				row.createCell((short) 0).setCellValue(deviceCata.getId());
				row.createCell((short) 1).setCellValue(deviceCata.getDeviceCataName());
				row.createCell((short) 2).setCellValue(deviceCata.getDescription());
				row.createCell((short) 3).setCellValue(deviceCata.getCataLogo());
				cell = row.createCell((short) 4);
			}
		}
		// 第六步，将文件存到指定位置
		try {
			OutputStream output = response.getOutputStream();
			response.setHeader("Content-disposition", "attachment; filename=" + "open_device_type" + ".xls");
			response.setContentType("application/msexcel");
			wb.write(output);
			output.flush();
			output.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
