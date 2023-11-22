package com.estore.project.domain;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.estore.common.annotation.Excel;

/**
 * 商品管理对象 pro_product
 * 
 * @author zhang
 * @date 2023-11-03
 */
public class ProProduct
{
    private static final long serialVersionUID = 1L;

    /** 商品id */
    private Long productId;

    /** 分类ID */
    @Excel(name = "分类ID")
    private Long classifyId;

    /** 商品标题 */
    @Excel(name = "商品标题")
    private String title;

    /** 商品价格 */
    @Excel(name = "商品价格")
    private BigDecimal price;

    /** 封面 */
    @Excel(name = "封面")
    private String image;

    /** 轮播图 */
    @Excel(name = "轮播图")
    private String image2s;

    /** 库存 */
    @Excel(name = "库存")
    private Long inventoryCount;

    /** 销量 */
    @Excel(name = "销量")
    private Long salesCount;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    private String classifyName;

    private BigDecimal scale;

    /** 关联的优惠价格 */
    private BigDecimal eventsPrice;

    private BigDecimal countPrice;

    private String eventsTitle;

    public void setProductId(Long productId) 
    {
        this.productId = productId;
    }

    public Long getProductId() 
    {
        return productId;
    }

    public Long getClassifyId() {
        return classifyId;
    }

    public void setClassifyId(Long classifyId) {
        this.classifyId = classifyId;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setPrice(BigDecimal price) 
    {
        this.price = price;
    }

    public BigDecimal getPrice() 
    {
        return price;
    }
    public void setImage(String image) 
    {
        this.image = image;
    }

    public String getImage() 
    {
        return image;
    }
    public void setImage2s(String image2s) 
    {
        this.image2s = image2s;
    }

    public String getImage2s() 
    {
        return image2s;
    }
    public void setInventoryCount(Long inventoryCount) 
    {
        this.inventoryCount = inventoryCount;
    }

    public Long getInventoryCount() 
    {
        return inventoryCount;
    }
    public void setSalesCount(Long salesCount) 
    {
        this.salesCount = salesCount;
    }

    public Long getSalesCount() 
    {
        return salesCount;
    }
    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public BigDecimal getEventsPrice() {
        return eventsPrice;
    }

    public void setEventsPrice(BigDecimal eventsPrice) {
        this.eventsPrice = eventsPrice;
    }

    public String getClassifyName() {
        return classifyName;
    }

    public void setClassifyName(String classifyName) {
        this.classifyName = classifyName;
    }

    public BigDecimal getScale() {
        return scale;
    }

    public void setScale(BigDecimal scale) {
        this.scale = scale;
    }

    public String getEventsTitle() {
        return eventsTitle;
    }

    public void setEventsTitle(String eventsTitle) {
        this.eventsTitle = eventsTitle;
    }

    public BigDecimal getCountPrice() {
        return countPrice;
    }

    public void setCountPrice(BigDecimal countPrice) {
        this.countPrice = countPrice;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("productId", getProductId())
            .append("title", getTitle())
            .append("price", getPrice())
            .append("image", getImage())
            .append("image2s", getImage2s())
            .append("inventoryCount", getInventoryCount())
            .append("salesCount", getSalesCount())
            .append("createTime", getCreateTime())
            .append("sort", getSort())
            .toString();
    }
}
