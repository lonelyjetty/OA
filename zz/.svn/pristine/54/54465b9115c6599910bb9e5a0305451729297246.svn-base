package com.bizdata.app.miaodetail.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.app.circle.sensitive_words.domain.SensitiveWord;
import com.bizdata.app.maguser.service.MagUserService;
import com.bizdata.app.miaodetail.controller.vo.SearchMiaoDetailVO;
import com.bizdata.app.miaodetail.domain.MiaoDetail;
import com.bizdata.app.miaodetail.excleutil.ExcelRead;
import com.bizdata.app.miaodetail.excleutil.ExcelUtil;
import com.bizdata.app.miaodetail.service.MiaoDetailService;
import com.bizdata.app.miaototal.service.MiaoTotalService;
import com.bizdata.commons.utils.DateEditor;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;
import com.bizdata.config.FileUploadConfig;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;

@Controller
@RequestMapping("/admin/miao_detail")
public class MiaoDetailController {
	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;
	private final MiaoDetailService miaoDetailService;
	private final MiaoTotalService miaoTotalService;

	private final MagUserService magUserService;
	@Autowired
    private FileUploadConfig fileUploadConfig;
	
	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}
	
	@Autowired
	public MiaoDetailController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, MiaoDetailService miaoDetailService,
			MiaoTotalService miaoTotalService,MagUserService magUserService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.miaoDetailService = miaoDetailService;
		this.miaoTotalService = miaoTotalService;
		this.magUserService = magUserService;
	}
	
	@RequiresPermissions("miao_detail:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/miaodetail/list");
	}
	
	/**
	 * 查询分页记录
	 *
	 * @param jqGridPageVO
	 *            分页参数
	 * @param jqGridSortVO
	 *            排序参数
	 * @param searchLoseWeightDataVO
	 *            查询参数
	 * @return 分页记录
	 */
	@RequiresPermissions("miao_detail:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<MiaoDetail, MiaoDetail> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, SearchMiaoDetailVO searchMiaoDetailVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		//System.out.println("数据列表开始！");
		Page<MiaoDetail> miaoDetail = miaoDetailService.findAllByPage(jpaPageParamVO, jpaSortParamVO, searchMiaoDetailVO);
		return new JpaPageResultVO<>(miaoDetail, MiaoDetail.class);
	}
	/**
	 * 查询分页记录
	 *
	 * @param jqGridPageVO
	 *            分页参数
	 * @param jqGridSortVO
	 *            排序参数
	 * @param searchLoseWeightDataVO
	 *            查询参数
	 * @return 分页记录
	 */
	@RequiresPermissions("miao_total:view")
	@RequestMapping(value = "/userdetallist", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<MiaoDetail, MiaoDetail> userdetallist(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, SearchMiaoDetailVO searchMiaoDetailVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<MiaoDetail> miaoDetail = miaoDetailService.findAllByPage(jpaPageParamVO, jpaSortParamVO, searchMiaoDetailVO);
		return new JpaPageResultVO<>(miaoDetail, MiaoDetail.class);
	}
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void fileDownLoad(HttpServletResponse response) {
		// 第一步，创建一个webbook，对应一个Excel文件  
        HSSFWorkbook wb = new HSSFWorkbook();  
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet  
        HSSFSheet sheet = wb.createSheet("用户妙币操作");  
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
        HSSFRow row = sheet.createRow((int) 0);  
        // 第四步，创建单元格，并设置值表头 设置表头居中  
        HSSFCellStyle style = wb.createCellStyle();
        HSSFCell cell = row.createCell((short) 0);
        cell.setCellValue("用户ID");
        cell.setCellStyle(style);
        cell = row.createCell((short) 1); 
        cell.setCellValue("妙币");
        cell.setCellStyle(style);
        // 第五步，写入实体数据 实际应用中这些数据从数据库得到
//        List<SensitiveWord> words = sensitiveWordService.findAll();
//        if(words!=null) {
//		    for (int i = 0; i < words.size(); i++)  
//		    	{  
//		        row = sheet.createRow((int) i + 1);
//		        SensitiveWord word = words.get(i);
//		        // 第四步，创建单元格，并设置值 
//		        row.createCell((short) 0).setCellValue(word.getWord());  
//		        row.createCell((short) 1).setCellValue("不能出现");  
//		        row.createCell((short) 2).setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(word.getUpdatetime()));  
//		        cell = row.createCell((short) 3);
//		    }
//        }
        // 第六步，将文件存到指定位置  
        try  
        {  	OutputStream output=response.getOutputStream();
        	response.setHeader("Content-disposition", "attachment; filename="+"model"+".xls");
        	response.setContentType("application/msexcel"); 
            wb.write(output);
            output.close();  
        }  
        catch (Exception e)  
        {  
            e.printStackTrace();
        }
	}
	@RequestMapping(value = "/detalfileDownLoad",method=RequestMethod.GET)
	@ResponseBody
    public void detalfileDownLoad(HttpServletResponse response) throws Exception  
    {  
        // 第一步，创建一个webbook，对应一个Excel文件  
        HSSFWorkbook wb = new HSSFWorkbook();  
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet  
        HSSFSheet sheet = wb.createSheet("用户妙币操作");  
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
        HSSFRow row = sheet.createRow((int) 0);  
        // 第四步，创建单元格，并设置值表头 设置表头居中  
        HSSFCellStyle style = wb.createCellStyle();
        HSSFCell cell = row.createCell((short) 0);
        cell.setCellValue("用户ID");
        cell.setCellStyle(style);
        cell = row.createCell((short) 1); 
        cell.setCellValue("妙币");
        cell.setCellStyle(style);
        cell = row.createCell((short) 2);
        cell.setCellValue("任务名称");
        cell.setCellStyle(style);
        // 第五步，写入实体数据 实际应用中这些数据从数据库得到
//        List<SensitiveWord> words = sensitiveWordService.findAll();
//        if(words!=null) {
//		    for (int i = 0; i < words.size(); i++)  
//		    	{  
//		        row = sheet.createRow((int) i + 1);
//		        SensitiveWord word = words.get(i);
//		        // 第四步，创建单元格，并设置值 
//		        row.createCell((short) 0).setCellValue(word.getWord());  
//		        row.createCell((short) 1).setCellValue("不能出现");  
//		        row.createCell((short) 2).setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(word.getUpdatetime()));  
//		        cell = row.createCell((short) 3);
//		    }
//        }
        // 第六步，将文件存到指定位置 
        try  
        {  	OutputStream output=response.getOutputStream();
        	response.setHeader("Content-disposition", "attachment; filename="+"model"+".xls");
        	response.setContentType("application/msexcel"); 
            wb.write(output);
            output.close();  
        }  
        catch (Exception e)  
        {  
            e.printStackTrace();
        }  
    }
//	@RequestMapping(method = RequestMethod.GET, value = "/down")
//	public void downloadLocal(HttpServletResponse response, String filename) throws FileNotFoundException {
//		String name = "aa.xlsx";
//		String path="E:\\工作\\";
//        // 读到流中
//        InputStream inStream = new FileInputStream(new File(path+filename));// 文件的存放路径
//        // 设置输出的格式
//        response.reset();
//        response.setContentType("bin");
//        response.addHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
//        // 循环取出流中的数据
//        byte[] b = new byte[100];
//        int len;
//        try {
//            while ((len = inStream.read(b)) > 0)
//                response.getOutputStream().write(b, 0, len);
//            inStream.close();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }

	@RequestMapping(value = "/uploadxls",method=RequestMethod.POST)
	@ResponseBody
	public List<String> XlsUpload(@RequestParam(value="excelFile",required = false)MultipartFile file,
			@RequestParam(value="errorid",required=false)String errorid) {
		if(file == null) {
			return null;
		}
		int id = 0;
		int numm = 0;
		int total=0;
		String name = file.getOriginalFilename();
        long size = file.getSize();
        if(name == null || ExcelUtil.EMPTY.equals(name) && size==0){
            return null;
        }
        //读取Excel数据到List中 
        try {
        	List<ArrayList<String>> list = new ExcelRead().readExcel(file,3);
        	for(int i=0;i<list.size();i++) {
        		//用户id
        		int s = Integer.parseInt(list.get(i).get(0));
        		//判断上次出错位置
        		if(errorid != null) {
        			if(!(s+"").equals(errorid)) {
            			continue;
            		}
        		}
        		//妙币值
        		int num = Integer.parseInt(list.get(i).get(1));
            	if(!miaoTotalService.updateMiao(s, num) || !magUserService.updateMiao(s,num)) {
            		//出错id
            		id = s;
            		//出错位置
            		numm = i;
            		break;
            	}
            	//任务名称
            	String taskname = list.get(i).get(2);
            	MiaoDetail miaoDetail = new MiaoDetail();
            	if(0<=num) {
            		miaoDetail.setModifytype(1);
            	}else {
            		miaoDetail.setModifytype(-1);
            	}
            	miaoDetail.setAccountnum(s);
            	miaoDetail.setUserId(magUserService.getIdByAccountnum(s));
            	miaoDetail.setMiaoMoney(num);
            	if(null!=taskname && !"".equals(taskname)) {
            		miaoDetail.setTaskName(taskname);
            	}else {
            		miaoDetail.setTaskName("管理员操作");
            	}
            	miaoDetailService.save(miaoDetail);
            	numm = i;
            	total = total+num;
        	}
		} catch (Exception e) {
		}
        List<String> ss = new ArrayList<String>();
        ss.add(numm+"");
        ss.add(total+"");
        ss.add(id+"");
		return ss;
	}
}
