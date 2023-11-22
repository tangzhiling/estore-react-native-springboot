package com.estore.project.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.estore.common.annotation.Excel;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 购物车管理对象 pro_shopping
 * 
 * @author zhang
 * @date 2023-11-07
 */
public class ProShopping
{
    private static final long serialVersionUID = 1L;

    /** 购物车ID */
    private Long shoppingId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 商品ID */
    @Excel(name = "商品ID")
    private Long productId;

    /** 数量 */
    @Excel(name = "数量")
    private Long count;

    /** 是否选中 */
    @Excel(name = "是否选中")
    private String isCheck;

    /** 商品标题 */
    @Excel(name = "商品标题")
    private String title;

    /** 封面 */
    @Excel(name = "封面")
    private String image;

    /** 商品价格 */
    private BigDecimal price;

    /** 关联的优惠价格 */
    private BigDecimal eventsPrice;

    /**打折比例 */
    private BigDecimal scale;

    private BigDecimal countPrice;

    private String eventsTitle;



    private Date createTime;

    public void setShoppingId(Long shoppingId) 
    {
        this.shoppingId = shoppingId;
    }

    public Long getShoppingId() 
    {
        return shoppingId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public BigDecimal getScale() {
        return scale;
    }

    public void setScale(BigDecimal scale) {
        this.scale = scale;
    }

    public BigDecimal getEventsPrice() {
        return eventsPrice;
    }

    public void setEventsPrice(BigDecimal eventsPrice) {
        this.eventsPrice = eventsPrice;
    }

    public BigDecimal getCountPrice() {
        return countPrice;
    }

    public void setCountPrice(BigDecimal countPrice) {
        this.countPrice = countPrice;
    }

    public String getEventsTitle() {
        return eventsTitle;
    }

    public void setEventsTitle(String eventsTitle) {
        this.eventsTitle = eventsTitle;
    }

    public void setIsCheck(String isCheck)
    {
        this.isCheck = isCheck;
    }

    public String getIsCheck() 
    {
        return isCheck;
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
            .append("shoppingId", getShoppingId())
            .append("userId", getUserId())
            .append("productId", getProductId())
            .append("count", getCount())
            .append("isCheck", getIsCheck())
            .append("createTime", getCreateTime())
            .toString();
    }
}
