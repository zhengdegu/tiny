package com.gu.tiny;

import com.gu.tiny.common.properties.SwaggerProperties;
import com.gu.tiny.common.utils.SpringContextHolder;
import com.gu.tiny.security.properties.IgnoreUrlsProperties;
import com.gu.tiny.security.properties.SecurityProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

/**
 * @author FastG
 */
@EnableConfigurationProperties({SecurityProperties.class, IgnoreUrlsProperties.class, SwaggerProperties.class})
@SpringBootApplication
public class TinyApplication {

	public static void main(String[] args) {
		SpringApplication.run(TinyApplication.class, args);
	}

	@Bean
	public SpringContextHolder springContextHolder() {
		return new SpringContextHolder();
	}
}
