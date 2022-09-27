package com.nunbub.marondalgram.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.nunbub.marondalgram.common.FileManagerService;
import com.nunbub.marondalgram.common.PermissionInterceptor;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {

	@Autowired
	private PermissionInterceptor interceptor;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH + "/");
		
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(interceptor)
		// 인터셉터를 거쳐서 처리할 페이지 규칙
		.addPathPatterns("/**")
		// 제외할 페이지 규칙
		.excludePathPatterns("/static/**", "/images/**","/user/signout");
		
	}
}
