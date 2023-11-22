package com.estore.project.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.estore.common.annotation.Excel;
import com.estore.common.core.domain.BaseEntity;

import java.math.BigDecimal;

/**
 * 订单子集对象 pro_order_child
 * 
 * @author zhang
 * @date 2023-11-04
 */
public class ProOrderChild
{
    private static final long serialVersionUID = 1L;

    /** 子集ID */
    private Long childId;

    /** 订单ID */
    @Excel(name = "订单ID")
    private String orderId;

    /** 商品ID */
    @Excel(name = "商品ID")
    private Long productId;

    /** 购买数量 */
    @Excel(name = "购买数量")
    private Long count;

    /** 商品单价 */
    @Excel(name = "商品单价")
    private BigDecimal price;

    /** 商品总金额 */
    private BigDecimal countPrice;

    private String title;

    private String image;

    public void setChildId(Long childId) 
    {
        this.childId = childId;
    }

    public Long getChildId() 
    {
        return childId;
    }
    public void setOrderId(String orderId) 
    {
        this.orderId = orderId;
    }

    public String getOrderId() 
    {
        return orderId;
    }
    public void setProductId(Long productId) 
    {
        this.productId = productId;
    }

    public Long getProductId() 
    {
        return productId;
    }
    public void setCount(Long count) 
    {
        this.count = count;
    }

    public Long getCount() 
    {
        return count;
    }


    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public void setCountPrice(BigDecimal countPrice)
    {
        this.countPrice = countPrice;
    }

    public BigDecimal getCountPrice()
    {
        return countPrice;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("childId", getChildId())
                .append("orderId", getOrderId())
                .append("productId", getProductId())
                .append("count", getCount())
                .append("countPrice", getCountPrice())
                .toString();
    }
}
