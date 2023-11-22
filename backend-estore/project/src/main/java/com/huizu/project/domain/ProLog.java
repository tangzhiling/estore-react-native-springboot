package com.estore.project.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.estore.common.annotation.Excel;
import com.estore.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * 日志管理对象 pro_log
 * 
 * @author zhang
 * @date 2023-11-03
 */
public class ProLog
{
    private static final long serialVersionUID = 1L;

    /** 日志ID */
    private Long logId;

    /** 请求用户 */
    @Excel(name = "请求用户")
    private Long userId;

    /** 访问方法名 */
    @Excel(name = "访问方法名")
    private String method;

    /** 访问包名 */
    @Excel(name = "访问包名")
    private String packageName;

    /** 类名 */
    @Excel(name = "类名")
    private String className;

    /** 请求类型 */
    @Excel(name = "请求类型")
    private String requstName;

    /** ip */
    @Excel(name = "ip")
    private String ip;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    public void setLogId(Long logId) 
    {
        this.logId = logId;
    }

    public Long getLogId() 
    {
        return logId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setMethod(String method) 
    {
        this.method = method;
    }

    public String getMethod() 
    {
        return method;
    }
    public void setPackageName(String packageName) 
    {
        this.packageName = packageName;
    }

    public String getPackageName() 
    {
        return packageName;
    }
    public void setClassName(String className) 
    {
        this.className = className;
    }

    public String getClassName() 
    {
        return className;
    }
    public void setRequstName(String requstName) 
    {
        this.requstName = requstName;
    }

    public String getRequstName() 
    {
        return requstName;
    }
    public void setIp(String ip) 
    {
        this.ip = ip;
    }

    public String getIp() 
    {
        return ip;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("logId", getLogId())
            .append("userId", getUserId())
            .append("method", getMethod())
            .append("packageName", getPackageName())
            .append("className", getClassName())
            .append("requstName", getRequstName())
            .append("ip", getIp())
            .append("createTime", getCreateTime())
            .toString();
    }
}
