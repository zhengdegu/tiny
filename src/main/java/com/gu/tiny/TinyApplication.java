package com.gu.tiny;

import com.gu.tiny.common.properties.SwaggerProperties;
import com.gu.tiny.security.properties.IgnoreUrlsProperties;
import com.gu.tiny.security.properties.SecurityProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

/**
 * @author FastG
 */
@EnableConfigurationProperties({SecurityProperties.class, IgnoreUrlsProperties.class,SwaggerProperties.class})
@SpringBootApplication
public class TinyApplication {

	public static void main(String[] args) {
		SpringApplication.run(TinyApplication.class, args);
	}

}
