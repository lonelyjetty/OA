package com.bizdata.upload.controller;

import com.bizdata.config.FileUploadConfig;
import lombok.extern.slf4j.Slf4j;
import me.sdevil507.resp.ResultUtil;
import me.sdevil507.resp.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * 文件上传Controller
 * <p>
 * Created by sdevil507 on 2017/9/5.
 */
@Controller
@Slf4j
public class FileUploadController {

    @Autowired
    private FileUploadConfig fileUploadConfig;

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO upload(@RequestParam("file") MultipartFile file) {
        ResultVO resultVO = null;
        if (!file.isEmpty()) {
            // 获取文件名
            String fileName = file.getOriginalFilename();
            // 获取文件的后缀名
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            // 文件上传后的路径
            String filePath = fileUploadConfig.getFilePath();
            fileName = UUID.randomUUID() + suffixName;
            File dest = new File(filePath + fileName);
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            try {
            	System.out.println(dest.getAbsolutePath());
                file.transferTo(dest);
                resultVO = ResultUtil.create(0, "文件上传成功!", fileName);
            } catch (IOException e) {
                e.printStackTrace();
                resultVO = ResultUtil.create(-2, "上传文件失败!");
            }
        } else {
            ResultUtil.create(-1, "上传文件为空!");
        }
        return resultVO;
    }
}
