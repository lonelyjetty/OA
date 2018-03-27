package com.bizdata.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 文件上传相关配置
 * <p>
 * Created by sdevil507 on 2017/9/5.
 */
@Component
@ConfigurationProperties(prefix = "upload")
@Data
public class FileUploadConfig {

    /**
     * 文件保存绝对路径
     */
    private String filePath;

    /**
     * 文件服务器地址前缀
     */
    private String serverPrefix;

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getServerPrefix() {
		return serverPrefix;
	}

	public void setServerPrefix(String serverPrefix) {
		this.serverPrefix = serverPrefix;
	}
    
    
}
