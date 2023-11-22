package com.estore.project.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.estore.common.annotation.Excel;
import com.estore.common.core.domain.BaseEntity;

/**
 * 商品分类对象 pro_classify
 * 
 * @author zhang
 * @date 2023-11-03
 */
public class ProClassify
{
    private static final long serialVersionUID = 1L;

    /** 分类ID */
    private Long classifyId;

    /** 分类名称 */
    @Excel(name = "分类名称")
    private String name;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

    public void setClassifyId(Long classifyId) 
    {
        this.classifyId = classifyId;
    }

    public Long getClassifyId() 
    {
        return classifyId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("classifyId", getClassifyId())
            .append("name", getName())
            .append("sort", getSort())
            .toString();
    }
}
