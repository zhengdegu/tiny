package com.gu.tiny.config;

import com.gu.tiny.common.config.BaseRedisConfig;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Configuration;

/**
 * Redis配置类
 * @author g130016
 */
@EnableCaching
@Configuration
public class RedisConfig extends BaseRedisConfig {

}
