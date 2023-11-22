package com.estore.project.service;

import java.util.List;
import com.estore.project.domain.ProProduct;

/**
 * 商品管理Service接口
 * 
 * @author zhang
 * @date 2023-11-03
 */
public interface IProProductService 
{
    /**
     * 查询商品管理
     * 
     * @param productId 商品管理主键
     * @return 商品管理
     */
    public ProProduct selectProProductByProductId(Long productId);

    /**
     * 查询商品管理列表
     * 
     * @param proProduct 商品管理
     * @return 商品管理集合
     */
    public List<ProProduct> selectProProductList(ProProduct proProduct);

    /**
     * 新增商品管理
     * 
     * @param proProduct 商品管理
     * @return 结果
     */
    public int insertProProduct(ProProduct proProduct);

    /**
     * 修改商品管理
     * 
     * @param proProduct 商品管理
     * @return 结果
     */
    public int updateProProduct(ProProduct proProduct);

    /**
     * 批量删除商品管理
     * 
     * @param productIds 需要删除的商品管理主键集合
     * @return 结果
     */
    public int deleteProProductByProductIds(Long[] productIds);

    /**
     * 删除商品管理信息
     * 
     * @param productId 商品管理主键
     * @return 结果
     */
    public int deleteProProductByProductId(Long productId);
}
