package com.estore.project.mapper;

import java.util.List;
import com.estore.project.domain.ProClassify;

/**
 * 商品分类Mapper接口
 * 
 * @author zhang
 * @date 2023-11-03
 */
public interface ProClassifyMapper 
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
     * 删除商品分类
     * 
     * @param classifyId 商品分类主键
     * @return 结果
     */
    public int deleteProClassifyByClassifyId(Long classifyId);

    /**
     * 批量删除商品分类
     * 
     * @param classifyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProClassifyByClassifyIds(Long[] classifyIds);
}
