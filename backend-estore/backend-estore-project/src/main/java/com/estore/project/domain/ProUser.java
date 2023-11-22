package com.estore.project.domain;

import java.math.BigDecimal;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.estore.common.annotation.Excel;
import com.estore.common.core.domain.BaseEntity;

/**
 * 用户信息对象 sys_user
 * 
 * @author zhang
 * @date 2023-11-03
 */
public class ProUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户ID */
    private Long userId;

//    /** 部门ID */
//    @Excel(name = "部门ID")
//    private Long deptId;

    /** 用户账号 */
    @Excel(name = "用户账号")
    private String userName;

    /** 用户昵称 */
    @Excel(name = "用户昵称")
    private String nickName;

    /** 余额 */
    private BigDecimal balance;

//    /** 用户类型（00系统用户） */
//    @Excel(name = "用户类型", readConverterExp = "0=0系统用户")
//    private String userType;
//
//    /** 用户邮箱 */
//    @Excel(name = "用户邮箱")
//    private String email;
//
//    /** 手机号码 */
//    @Excel(name = "手机号码")
//    private String phonenumber;
//
//    /** 用户性别（0男 1女 2未知） */
//    @Excel(name = "用户性别", readConverterExp = "0=男,1=女,2=未知")
//    private String sex;

    /** 头像地址 */
    @Excel(name = "头像地址")
    private String avatar;

    /** 密码 */
    @Excel(name = "密码")
    private String password;

    /** 帐号状态（0正常 1停用） */
    @Excel(name = "帐号状态", readConverterExp = "0=正常,1=停用")
    private String status;

    private Date createTime;

//    /** 删除标志（0代表存在 2代表删除） */
//    private String delFlag;
//
//    /** 最后登录IP */
//    @Excel(name = "最后登录IP")
//    private String loginIp;
//
//    /** 最后登录时间 */
//    @JsonFormat(pattern = "yyyy-MM-dd")
//    @Excel(name = "最后登录时间", width = 30, dateFormat = "yyyy-MM-dd")
//    private Date loginDate;

    private String password2;

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
    }
    public void setNickName(String nickName) 
    {
        this.nickName = nickName;
    }

    public String getNickName() 
    {
        return nickName;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public void setAvatar(String avatar)
    {
        this.avatar = avatar;
    }

    public String getAvatar() 
    {
        return avatar;
    }
    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("userId", getUserId())
            .append("userName", getUserName())
            .append("nickName", getNickName())
            .append("avatar", getAvatar())
            .append("password", getPassword())
            .append("status", getStatus())
            .toString();
    }
}
