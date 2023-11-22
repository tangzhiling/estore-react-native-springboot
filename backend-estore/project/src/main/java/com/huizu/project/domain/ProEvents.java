package com.estore.project.domain;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.estore.common.annotation.Excel;
import com.estore.common.core.domain.BaseEntity;

/**
 * 活动管理对象 pro_events
 *
 * @author zhang
 * @date 2023-11-03
 */
public class ProEvents
{
    private static final long serialVersionUID = 1L;

    /** 活动ID */
    private Long eventsId;

    /** 活动标题 */
    @Excel(name = "活动标题")
    private String title;

    /** 活动封面 */
    @Excel(name = "活动封面")
    private String image;

    /** 活动内容 */
    @Excel(name = "活动内容")
    private String content;

    /** 活动金额 */
    @Excel(name = "活动金额")
    private BigDecimal price;

    /** 打折比例 */
    @Excel(name = "打折比例")
    private BigDecimal scale;

    /** 分类ID */
    @Excel(name = "分类ID")
    private Long classifyId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    public void setEventsId(Long eventsId)
    {
        this.eventsId = eventsId;
    }

    public Long getEventsId()
    {
        return eventsId;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle()
    {
        return title;
    }
    public void setImage(String image)
    {
        this.image = image;
    }

    public String getImage()
    {
        return image;
    }
    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent()
    {
        return content;
    }
    public void setPrice(BigDecimal price)
    {
        this.price = price;
    }

    public BigDecimal getPrice()
    {
        return price;
    }
    public void setScale(BigDecimal scale)
    {
        this.scale = scale;
    }

    public BigDecimal getScale()
    {
        return scale;
    }
    public void setClassifyId(Long classifyId)
    {
        this.classifyId = classifyId;
    }

    public Long getClassifyId()
    {
        return classifyId;
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
                .append("eventsId", getEventsId())
                .append("title", getTitle())
                .append("image", getImage())
                .append("content", getContent())
                .append("price", getPrice())
                .append("scale", getScale())
                .append("classifyId", getClassifyId())
                .append("createTime", getCreateTime())
                .toString();
    }
}
