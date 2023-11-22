package com.estore.project.config;


import com.estore.common.exception.ServiceException;
import com.estore.common.utils.StringUtils;
import com.estore.common.utils.ip.IpUtils;
import com.estore.project.domain.ProLog;
import com.estore.project.mapper.ProLogMapper;
import com.estore.project.utils.TokenUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Modifier;
import java.util.Date;
import java.util.Objects;

@Aspect
@Component
public class TokenLog {


    @Autowired
    private ProLogMapper proLogMapper;

    //设置切点
    @Pointcut("execution(* com.huizu.project.apiController.*.*(..))")
    public void webLog() {
    }

    /**
     * 对前端所有接口进行切面  来获取日志
     * @param joinPoint
     * @throws Throwable
     */
    @Before("webLog()")
    public void doBefore(JoinPoint joinPoint) throws Throwable
    {
        ServletRequestAttributes sra=(ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request= Objects.requireNonNull(sra).getRequest();
        String token = request.getHeader(TokenUtils.getAppTokenHeader());
        System.out.println("方法执行前 token"+token);
        Long userId = 0L;//获取用户ID
        //若登录记录用户信息
        if (request.getHeader(TokenUtils.getAppTokenHeader()) !=null&&!"".equals(token))
            userId = Long.valueOf(TokenUtils.parseToken(token).getSubject());
        String name = joinPoint.getSignature().getName();
        String simpleName = joinPoint.getSignature().getDeclaringType().getSimpleName();
        String declaringTypeName = joinPoint.getSignature().getDeclaringTypeName();
        int modifiers = joinPoint.getSignature().getModifiers();
        String method = request.getMethod();
        Date date = new Date();
        String ip = IpUtils.getIpAddr(request);
        ProLog proLog = new ProLog();
        proLog.setIp(ip);
        proLog.setPackageName(ip);
        proLog.setMethod(name);
        proLog.setClassName(simpleName);
        proLog.setPackageName(declaringTypeName);
        proLog.setRequstName(method);
        proLog.setIp(ip);
        proLog.setUserId(userId);
        proLog.setCreateTime(new Date());
        proLogMapper.insertProLog(proLog);
    }
}