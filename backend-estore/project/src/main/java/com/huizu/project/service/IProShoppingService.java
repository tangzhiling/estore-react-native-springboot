package com.estore.project.service;

import java.util.List;
import com.estore.project.domain.ProShopping;

/**
 * 购物车管理Service接口
 * 
 * @author zhang
 * @date 2023-11-07
 */
public interface IProShoppingService 
{
    /**
     * 查询购物车管理
     * 
     * @param shoppingId 购物车管理主键
     * @return 购物车管理
     */
    public ProShopping selectProShoppingByShoppingId(Long shoppingId);

    /**
     * 查询购物车管理列表
     * 
     * @param proShopping 购物车管理
     * @return 购物车管理集合
     */
    public List<ProShopping> selectProShoppingList(ProShopping proShopping);

    /**
     * 新增购物车管理
     * 
     * @param proShopping 购物车管理
     * @return 结果
     */
    public int insertProShopping(ProShopping proShopping);

    /**
     * 修改购物车管理
     * 
     * @param proShopping 购物车管理
     * @return 结果
     */
    public int updateProShopping(ProShopping proShopping);

    /**
     * 批量删除购物车管理
     * 
     * @param shoppingIds 需要删除的购物车管理主键集合
     * @return 结果
     */
    public int deleteProShoppingByShoppingIds(Long[] shoppingIds);

    /**
     * 删除购物车管理信息
     * 
     * @param shoppingId 购物车管理主键
     * @return 结果
     */
    public int deleteProShoppingByShoppingId(Long shoppingId);

    /**
     * 首次加入购物车
     * @param proShopping
     * @return
     */
    public int addProduct(ProShopping proShopping);

    public int addApi(ProShopping proShopping);

    public int subtractApi(ProShopping proShopping);
}
