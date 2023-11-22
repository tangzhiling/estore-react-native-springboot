package com.estore.project.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.estore.common.annotation.Excel;

/**
 * 优惠卷管理对象 pro_coupon
 * 
 * @author zhang
 * @date 2023-11-03
 */
public class ProCoupon
{
    private static final long serialVersionUID = 1L;

    /** 随机生成的券码序列号 */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 使用状态 */
    @Excel(name = "使用状态")
    private String status;

    /** 表示满减，固定金额折扣还是倍率折扣 */
    @Excel(name = "表示满减，固定金额折扣还是倍率折扣")
    private String type;

    /** 折扣金额，如果满减和固定金额，则填写数额；如果是倍率折扣则填写小于1的浮点数 */
    @Excel(name = "折扣金额，如果满减和固定金额，则填写数额；如果是倍率折扣则填写小于1的浮点数")
    private BigDecimal discount;

    /** 需满足价格 */
    @Excel(name = "需满足价格")
    private BigDecimal condition;

    /** 生效时间，如果未达到则不可用 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生效时间，如果未达到则不可用", width = 30, dateFormat = "yyyy-MM-dd")
    private Date activeTime;

    /** 过期时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "过期时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date expiredTime;

    /** ‘mid’, ‘mid’]用于表明COUPON生效产品 */
    @Excel(name = "‘mid’, ‘mid’]用于表明COUPON生效产品")
    private String range;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setDiscount(BigDecimal discount)
    {
        this.discount = discount;
    }

    public BigDecimal getDiscount()
    {
        return discount;
    }
    public void setCondition(BigDecimal condition)
    {
        this.condition = condition;
    }

    public BigDecimal getCondition()
    {
        return condition;
    }
    public void setActiveTime(Date activeTime) 
    {
        this.activeTime = activeTime;
    }

    public Date getActiveTime() 
    {
        return activeTime;
    }
    public void setExpiredTime(Date expiredTime) 
    {
        this.expiredTime = expiredTime;
    }

    public Date getExpiredTime() 
    {
        return expiredTime;
    }
    public void setRange(String range) 
    {
        this.range = range;
    }

    public String getRange() 
    {
        return range;
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
            .append("id", getId())
            .append("userId", getUserId())
            .append("status", getStatus())
            .append("type", getType())
            .append("discount", getDiscount())
            .append("condition", getCondition())
            .append("activeTime", getActiveTime())
            .append("expiredTime", getExpiredTime())
            .append("range", getRange())
            .toString();
    }
}
