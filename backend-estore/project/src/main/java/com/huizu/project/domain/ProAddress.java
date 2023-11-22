package com.estore.project.domain;

import java.math.BigDecimal;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.estore.common.annotation.Excel;
import com.estore.common.core.domain.BaseEntity;

/**
 * 地址管理对象 pro_address
 * 
 * @author zhang
 * @date 2023-11-07
 */
public class ProAddress
{
    private static final long serialVersionUID = 1L;

    /** 地址ID */
    private Long addressId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 电话 */
    @Excel(name = "电话")
    private String phone;

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

    /** 经度 */
    @Excel(name = "经度")
    private BigDecimal longitude;

    /** 纬度 */
    @Excel(name = "纬度")
    private BigDecimal latitude;

    /** 是否默认 0否 1是 */
    @Excel(name = "是否默认 0否 1是")
    private String isDefault;

    private Date createTime;

    public void setAddressId(Long addressId) 
    {
        this.addressId = addressId;
    }

    public Long getAddressId() 
    {
        return addressId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
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

    public void setPositionProvince(String positionProvince)
    {
        this.positionProvince = positionProvince;
    }

    public String getPositionProvince() 
    {
        return positionProvince;
    }

    public String getPositionCity() {
        return positionCity;
    }

    public void setPositionCity(String positionCity) {
        this.positionCity = positionCity;
    }

    public void setPositionArea(String positionArea)
    {
        this.positionArea = positionArea;
    }

    public String getPositionArea() 
    {
        return positionArea;
    }
    public void setDetailsPosition(String detailsPosition) 
    {
        this.detailsPosition = detailsPosition;
    }

    public String getDetailsPosition() 
    {
        return detailsPosition;
    }
    public void setLongitude(BigDecimal longitude) 
    {
        this.longitude = longitude;
    }

    public BigDecimal getLongitude() 
    {
        return longitude;
    }
    public void setLatitude(BigDecimal latitude) 
    {
        this.latitude = latitude;
    }

    public BigDecimal getLatitude() 
    {
        return latitude;
    }
    public void setIsDefault(String isDefault) 
    {
        this.isDefault = isDefault;
    }

    public String getIsDefault() 
    {
        return isDefault;
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
            .append("addressId", getAddressId())
            .append("userId", getUserId())
            .append("positionProvince", getPositionProvince())
            .append("positionCity", getPositionCity())
            .append("positionArea", getPositionArea())
            .append("detailsPosition", getDetailsPosition())
            .append("longitude", getLongitude())
            .append("latitude", getLatitude())
            .append("createTime", getCreateTime())
            .append("isDefault", getIsDefault())
            .toString();
    }
}
