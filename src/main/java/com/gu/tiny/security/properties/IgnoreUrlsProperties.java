package com.gu.tiny.security.properties;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.ArrayList;
import java.util.List;

/**
 * 用于配置白名单资源路径
 * @author g130016
 */
@Getter
@Setter
@ConfigurationProperties(prefix = "gu.secure.ignored")
public class IgnoreUrlsProperties {

    private List<String> urls = new ArrayList<>();

}
