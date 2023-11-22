package com.estore.project.service.impl;

import java.util.List;

import com.estore.common.core.redis.RedisCache;
import com.estore.common.utils.DateUtils;
import com.estore.project.mapper.ProEventsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.estore.project.mapper.ProProductMapper;
import com.estore.project.domain.ProProduct;
import com.estore.project.service.IProProductService;

/**
 * 商品管理Service业务层处理
 * 
 * @author zhang
 * @date 2023-11-03
 */
@Service
public class ProProductServiceImpl implements IProProductService 
{
    @Autowired
    private ProProductMapper proProductMapper;

    @Autowired
    private ProEventsMapper proEventsMapper;

    @Autowired
    private RedisCache redisCache;

    /**
     * 查询商品管理
     * 
     * @param productId 商品管理主键
     * @return 商品管理
     */
    @Override
    public ProProduct selectProProductByProductId(Long productId)
    {
        return proProductMapper.selectProProductByProductId(productId);
    }

    /**
     * 查询商品管理列表
     * 
     * @param proProduct 商品管理
     * @return 商品管理
     */
    @Override
    public List<ProProduct> selectProProductList(ProProduct proProduct)
    {
        return proProductMapper.selectProProductList(proProduct);
    }

    /**
     * 新增商品管理
     * 
     * @param proProduct 商品管理
     * @return 结果
     */
    @Override
    public int insertProProduct(ProProduct proProduct)
    {
        proProduct.setCreateTime(DateUtils.getNowDate());
        redisCache.setCacheObject("productId="+String.valueOf(proProduct.getProductId()),proProduct.getInventoryCount());
        return proProductMapper.insertProProduct(proProduct);
    }

    /**
     * 修改商品管理
     * 
     * @param proProduct 商品管理
     * @return 结果
     */
    @Override
    public int updateProProduct(ProProduct proProduct)
    {
        redisCache.setCacheObject("productId="+String.valueOf(proProduct.getProductId()),proProduct.getInventoryCount());
        return proProductMapper.updateProProduct(proProduct);
    }

    /**
     * 批量删除商品管理
     * 
     * @param productIds 需要删除的商品管理主键
     * @return 结果
     */
    @Override
    public int deleteProProductByProductIds(Long[] productIds)
    {
        return proProductMapper.deleteProProductByProductIds(productIds);
    }

    /**
     * 删除商品管理信息
     * 
     * @param productId 商品管理主键
     * @return 结果
     */
    @Override
    public int deleteProProductByProductId(Long productId)
    {
        return proProductMapper.deleteProProductByProductId(productId);
    }
}
