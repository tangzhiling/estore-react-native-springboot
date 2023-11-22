package com.estore.project.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.estore.common.annotation.Excel;
import com.estore.common.core.domain.BaseEntity;

/**
 * 订单管理对象 pro_order
 * 
 * @author zhang
 * @date 2023-11-03
 */
public class ProOrder
{
    private static final long serialVersionUID = 1L;

    /** 订单ID */
    private String orderId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 商品ID */
    @Excel(name = "商品ID")
    private Long productId;

    private String title;

    private String image;

    private BigDecimal productPrice;

    /** 数量 */
    @Excel(name = "数量")
    private Long count;

    /** 订单总金额 */
    @Excel(name = "订单总金额")
    private BigDecimal countPrice;

    /** 优惠卷优惠的金额 */
    @Excel(name = "优惠卷优惠的金额")
    private BigDecimal couponPrice;

    /** 活动优惠的金额 */
    @Excel(name = "活动优惠的金额")
    private BigDecimal eventsPrice;

    /** 订单状态 */
    @Excel(name = "订单状态")
    private String status;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /** 省 */
    @Excel(name = "省")
    private String positionProvince;

    /** 市 */
    @Excel(name = "市")
    private String positionCity;

    /** 区 */
    @Excel(name = "区")
    private String positionArea;

    /** 详细地址 */
    @Excel(name = "详细地址")
    private String detailsPosition;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 电话 */
    @Excel(name = "电话")
    private String phone;

    private List<ProOrderChild> childList;

    private Long couponId;

    private Long addressId;

    public void setOrderId(String orderId) 
    {
        this.orderId = orderId;
    }

    public String getOrderId() 
    {
        return orderId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    public String getPositionProvince() {
        return positionProvince;
    }

    public void setPositionProvince(String positionProvince) {
        this.positionProvince = positionProvince;
    }

    public String getPositionCity() {
        return positionCity;
    }

    public void setPositionCity(String positionCity) {
        this.positionCity = positionCity;
    }

    public String getPositionArea() {
        return positionArea;
    }

    public void setPositionArea(String positionArea) {
        this.positionArea = positionArea;
    }

    public String getDetailsPosition() {
        return detailsPosition;
    }

    public void setDetailsPosition(String detailsPosition) {
        this.detailsPosition = detailsPosition;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public BigDecimal getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(BigDecimal productPrice) {
        this.productPrice = productPrice;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public void setCountPrice(BigDecimal countPrice)
    {
        this.countPrice = countPrice;
    }

    public BigDecimal getCountPrice() 
    {
        return countPrice;
    }
    public void setCouponPrice(BigDecimal couponPrice) 
    {
        this.couponPrice = couponPrice;
    }

    public BigDecimal getCouponPrice() 
    {
        return couponPrice;
    }
    public void setEventsPrice(BigDecimal eventsPrice) 
    {
        this.eventsPrice = eventsPrice;
    }

    public BigDecimal getEventsPrice() 
    {
        return eventsPrice;
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

    public List<ProOrderChild> getChildList() {
        return childList;
    }

    public void setChildList(List<ProOrderChild> childList) {
        this.childList = childList;
    }

    public Long getCouponId() {
        return couponId;
    }

    public void setCouponId(Long couponId) {
        this.couponId = couponId;
    }

    public Long getAddressId() {
        return addressId;
    }

    public void setAddressId(Long addressId) {
        this.addressId = addressId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("orderId", getOrderId())
            .append("userId", getUserId())
            .append("countPrice", getCountPrice())
            .append("couponPrice", getCouponPrice())
            .append("eventsPrice", getEventsPrice())
            .append("createTime", getCreateTime())
            .append("status", getStatus())
            .toString();
    }
}
