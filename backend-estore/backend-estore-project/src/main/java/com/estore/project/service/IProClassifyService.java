package com.estore.project.service;

import java.util.List;
import com.estore.project.domain.ProClassify;

/**
 * 商品分类Service接口
 * 
 * @author zhang
 * @date 2023-11-03
 */
public interface IProClassifyService 
{
    /**
     * 查询商品分类
     * 
     * @param classifyId 商品分类主键
     * @return 商品分类
     */
    public ProClassify selectProClassifyByClassifyId(Long classifyId);

    /**
     * 查询商品分类列表
     * 
     * @param proClassify 商品分类
     * @return 商品分类集合
     */
    public List<ProClassify> selectProClassifyList(ProClassify proClassify);

    /**
     * 新增商品分类
     * 
     * @param proClassify 商品分类
     * @return 结果
     */
    public int insertProClassify(ProClassify proClassify);

    /**
     * 修改商品分类
     * 
     * @param proClassify 商品分类
     * @return 结果
     */
    public int updateProClassify(ProClassify proClassify);

    /**
     * 批量删除商品分类
     * 
     * @param classifyIds 需要删除的商品分类主键集合
     * @return 结果
     */
    public int deleteProClassifyByClassifyIds(Long[] classifyIds);

    /**
     * 删除商品分类信息
     * 
     * @param classifyId 商品分类主键
     * @return 结果
     */
    public int deleteProClassifyByClassifyId(Long classifyId);
}
