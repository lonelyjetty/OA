package com.bizdata.config;

import com.bizdata.framework.extension.converter.String2SearchOperatorConverter;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 自定义Spring Mvc配置
 *
 * @author sdevil507
 * @version 1.0
 */
@Configuration
public class WebConfiguration extends WebMvcConfigurerAdapter {

    @Override
    public void addFormatters(FormatterRegistry registry) {
        //新增一个搜索类型枚举转换
        registry.addConverter(new String2SearchOperatorConverter());
        super.addFormatters(registry);
    }
}
