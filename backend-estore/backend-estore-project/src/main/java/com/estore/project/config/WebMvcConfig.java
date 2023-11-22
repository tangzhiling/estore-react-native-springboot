package com.estore.project.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 注册 JwtInterceptor 拦截器，并设置拦截规则
        registry.addInterceptor(new JwtInterceptor())
                .addPathPatterns("/api/order/**")//拦截订单信息
                .addPathPatterns("/api/procoupon/**")//拦截获取我的优惠卷列表
                .addPathPatterns("/api/prouser/update")//拦截修改用户信息
                .addPathPatterns("/api/prouser/getById");//拦截获取用户信息

    }
}
