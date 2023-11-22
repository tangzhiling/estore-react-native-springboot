package com.estore.project.config;


import com.estore.common.exception.ServiceException;
import com.estore.project.utils.TokenUtils;
import io.jsonwebtoken.Claims;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class JwtInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 从请求头中获取 Token
        String token = request.getHeader(TokenUtils.getAppTokenHeader());
        if (token == null || "".equals(token)) {
            // 如果没有 Token，则返回 401 错误
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            throw new ServiceException("未获取到用户token，请先登录",401);
        }

        // 解析 Token
        Claims claims = null; // 这里使用 jwtService 对象解析 Token，请自行修改
        try {
            claims = TokenUtils.parseToken(token);
        } catch (Exception e) {
            // Token 不正确，返回 401 错误
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            throw new ServiceException("token不存在",401);
//            return false;
        }
        // 把解析出来的用户信息放入请求属性中，方便后续操作使用
        request.setAttribute("user", claims.getSubject());
        // 返回 true，表示允许继续访问后续的处理器和拦截器
        return true;
    }
}
