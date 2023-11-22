package com.estore.project.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.estore.project.mapper.ProClassifyMapper;
import com.estore.project.domain.ProClassify;
import com.estore.project.service.IProClassifyService;

/**
 * 商品分类Service业务层处理
 * 
 * @author zhang
 * @date 2023-11-03
 */
@Service
public class ProClassifyServiceImpl implements IProClassifyService 
{
    @Autowired
    private ProClassifyMapper proClassifyMapper;

    /**
     * 查询商品分类
     * 
     * @param classifyId 商品分类主键
     * @return 商品分类
     */
    @Override
    public ProClassify selectProClassifyByClassifyId(Long classifyId)
    {
        return proClassifyMapper.selectProClassifyByClassifyId(classifyId);
    }

    /**
     * 查询商品分类列表
     * 
     * @param proClassify 商品分类
     * @return 商品分类
     */
    @Override
    public List<ProClassify> selectProClassifyList(ProClassify proClassify)
    {
        return proClassifyMapper.selectProClassifyList(proClassify);
    }

    /**
     * 新增商品分类
     * 
     * @param proClassify 商品分类
     * @return 结果
     */
    @Override
    public int insertProClassify(ProClassify proClassify)
    {
        return proClassifyMapper.insertProClassify(proClassify);
    }

    /**
     * 修改商品分类
     * 
     * @param proClassify 商品分类
     * @return 结果
     */
    @Override
    public int updateProClassify(ProClassify proClassify)
    {
        return proClassifyMapper.updateProClassify(proClassify);
    }

    /**
     * 批量删除商品分类
     * 
     * @param classifyIds 需要删除的商品分类主键
     * @return 结果
     */
    @Override
    public int deleteProClassifyByClassifyIds(Long[] classifyIds)
    {
        return proClassifyMapper.deleteProClassifyByClassifyIds(classifyIds);
    }

    /**
     * 删除商品分类信息
     * 
     * @param classifyId 商品分类主键
     * @return 结果
     */
    @Override
    public int deleteProClassifyByClassifyId(Long classifyId)
    {
        return proClassifyMapper.deleteProClassifyByClassifyId(classifyId);
    }
}
