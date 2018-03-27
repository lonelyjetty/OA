package com.bizdata.app.circle.sensitive_words.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
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

import com.bizdata.app.circle.sensitive_words.controller.vo.SenWordSearchVO;
import com.bizdata.app.circle.sensitive_words.domain.SensitiveWord;
import com.bizdata.app.circle.sensitive_words.service.SensitiveWordService;
import com.bizdata.app.miaodetail.domain.MiaoDetail;
import com.bizdata.app.miaodetail.excleutil.ExcelRead;
import com.bizdata.app.miaodetail.excleutil.ExcelUtil;
import com.bizdata.app.sleepdata.controller.vo.SleepSearchVO;
import com.bizdata.commons.utils.DateEditor;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/admin/sensitive_words")
public class SensitiveWordController {

    @InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) throws Exception {
        //对于需要转换为Date类型的属性，使用DateEditor进行处理
        binder.registerCustomEditor(Date.class, new DateEditor());
    }

    private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

    private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

    private final SensitiveWordService sensitiveWordService;

    @Autowired
    public SensitiveWordController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO, JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, SensitiveWordService sensitiveWordService) {
        this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
        this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
        this.sensitiveWordService = sensitiveWordService;
    }


    /**
     * 展示对应模板页面
     *
     * @return 模板页面
     */
    @RequiresPermissions("sensitive_words:view")
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView view() {
        return new ModelAndView("app_page/circle/sensitive_words/list");
    }

    /**
     * 分页查询记录
     *
     * @param jqGridPageVO  分页参数
     * @param jqGridSortVO  排序参数
     * @param sleepSearchVO 查询参数
     * @return 分页记录
     */
    @RequiresPermissions("sensitive_words:view")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, SenWordSearchVO senWordSearchVO) {
        JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
        JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
        Page<SensitiveWord> dataPage = sensitiveWordService.findAllByPage(jpaPageParamVO, jpaSortParamVO, senWordSearchVO);
        return new JpaPageResultVO<>(dataPage, SensitiveWord.class);
    }
    
    @RequiresPermissions("sensitive_words:view")
	@RequestMapping(value = "/upload",method=RequestMethod.POST)
	@ResponseBody
	public boolean XlsUpload(@RequestParam(value="excelFile",required = false)MultipartFile file) {
		if(file == null) {
			return false;
		}
		System.out.println("----------");
		String name = file.getOriginalFilename();
        long size = file.getSize();
        if(name == null || ExcelUtil.EMPTY.equals(name) && size==0){
            return false;
        }
        //读取Excel数据到List中 
        try {
        	//从第2行读取数据
        	List<ArrayList<String>> list = new ExcelRead().readExcel(file,2);
        	for(int i=0;i<list.size();i++) {
        		String s = list.get(i).get(0);
            	if(sensitiveWordService.checkIsExist(s)) {
            		continue;
            	}
            	SensitiveWord sen = new SensitiveWord();
            	sen.setWord(s);
            	sen.setType("0");
            	sen.setUpdatetime(new Date());
            	sensitiveWordService.save(sen);
        	}
        	return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
 
    @RequiresPermissions("sensitive_words:view")
	@RequestMapping(value = "/fileDownLoad",method=RequestMethod.GET)
	@ResponseBody
    public void fileDownLoad(HttpServletResponse response) throws Exception  
    {  
        // 第一步，创建一个webbook，对应一个Excel文件  
        HSSFWorkbook wb = new HSSFWorkbook();  
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet  
        HSSFSheet sheet = wb.createSheet("学生表一");  
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
        HSSFRow row = sheet.createRow((int) 0);  
        // 第四步，创建单元格，并设置值表头 设置表头居中  
        HSSFCellStyle style = wb.createCellStyle();
        HSSFCell cell = row.createCell((short) 0);
        cell.setCellValue("敏感词");
        cell.setCellStyle(style);
        cell = row.createCell((short) 1); 
        cell.setCellValue("类型");
        cell.setCellStyle(style);
        cell = row.createCell((short) 2);
        cell.setCellValue("更新时间");
        cell.setCellStyle(style);
        // 第五步，写入实体数据 实际应用中这些数据从数据库得到
        List<SensitiveWord> words = sensitiveWordService.findAll();
        if(words!=null) {
		    for (int i = 0; i < words.size(); i++)  
		    	{  
		        row = sheet.createRow((int) i + 1);
		        SensitiveWord word = words.get(i);
		        // 第四步，创建单元格，并设置值 
		        row.createCell((short) 0).setCellValue(word.getWord());  
		        row.createCell((short) 1).setCellValue("不能出现");  
		        row.createCell((short) 2).setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(word.getUpdatetime()));  
		        cell = row.createCell((short) 3);
		    }
        }
        // 第六步，将文件存到指定位置  
        try  
        {  	OutputStream output=response.getOutputStream();
        	response.setHeader("Content-disposition", "attachment; filename="+"敏感词列表"+".xls");
        	response.setContentType("application/msexcel"); 
            wb.write(output);
            output.close();  
        }  
        catch (Exception e)  
        {  
            e.printStackTrace();
        }  
    }
}
