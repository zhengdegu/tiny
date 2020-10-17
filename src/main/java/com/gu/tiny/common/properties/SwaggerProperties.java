package com.gu.tiny.common.properties;

import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * Swagger自定义配置
 * @author g130016
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ConfigurationProperties(prefix = "gu.swagger-manager")
public class SwaggerProperties {
    /**
     * API文档生成基础路径
     */
    private String apiBasePackage="com.gu.tiny.modules";
    /**
     * 是否要启用登录认证
     */
    private boolean enableSecurity=true;
    /**
     * 文档标题
     */
    private String title="tiny项目骨架";
    /**
     * 文档描述
     */
    private String description="tiny项目骨架相关接口文档";
    /**
     * 文档版本
     */
    private String version="1.0.0";
    /**
     * 文档联系人姓名
     */
    private String contactName="guzhende";
    /**
     * 文档联系人网址
     */
    private String contactUrl="guzhende";
    /**
     * 文档联系人邮箱
     */
    private String contactEmail="18811476204";
}
