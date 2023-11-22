package com.estore.project.service.impl;

import java.util.List;
import com.estore.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.estore.project.mapper.ProShoppingMapper;
import com.estore.project.domain.ProShopping;
import com.estore.project.service.IProShoppingService;

/**
 * 购物车管理Service业务层处理
 * 
 * @author zhang
 * @date 2023-11-07
 */
@Service
public class ProShoppingServiceImpl implements IProShoppingService 
{
    @Autowired
    private ProShoppingMapper proShoppingMapper;

    /**
     * 查询购物车管理
     * 
     * @param shoppingId 购物车管理主键
     * @return 购物车管理
     */
    @Override
    public ProShopping selectProShoppingByShoppingId(Long shoppingId)
    {
        return proShoppingMapper.selectProShoppingByShoppingId(shoppingId);
    }

    /**
     * 查询购物车管理列表
     * 
     * @param proShopping 购物车管理
     * @return 购物车管理
     */
    @Override
    public List<ProShopping> selectProShoppingList(ProShopping proShopping)
    {
        return proShoppingMapper.selectProShoppingList(proShopping);
    }

    /**
     * 新增购物车管理
     * 
     * @param proShopping 购物车管理
     * @return 结果
     */
    @Override
    public int insertProShopping(ProShopping proShopping)
    {
        proShopping.setCreateTime(DateUtils.getNowDate());
        return proShoppingMapper.insertProShopping(proShopping);
    }

    /**
     * 修改购物车管理
     * 
     * @param proShopping 购物车管理
     * @return 结果
     */
    @Override
    public int updateProShopping(ProShopping proShopping)
    {
        return proShoppingMapper.updateProShopping(proShopping);
    }

    /**
     * 批量删除购物车管理
     * 
     * @param shoppingIds 需要删除的购物车管理主键
     * @return 结果
     */
    @Override
    public int deleteProShoppingByShoppingIds(Long[] shoppingIds)
    {
        return proShoppingMapper.deleteProShoppingByShoppingIds(shoppingIds);
    }

    /**
     * 删除购物车管理信息
     * 
     * @param shoppingId 购物车管理主键
     * @return 结果
     */
    @Override
    public int deleteProShoppingByShoppingId(Long shoppingId)
    {
        return proShoppingMapper.deleteProShoppingByShoppingId(shoppingId);
    }

    /**
     * 首次加入购物车
     * @param proShopping
     * @return
     */
    public int addProduct(ProShopping proShopping){
        Long productId = proShopping.getProductId();
        ProShopping proShoppingPram = new ProShopping();
        proShoppingPram.setUserId(proShopping.getUserId());
        proShoppingPram.setProductId(productId);
        ProShopping proShopping1 = proShoppingMapper.selectProShoppingByUserIdAndProductId(proShoppingPram);
        if (proShopping1!=null){
            proShopping1.setCount(proShopping1.getCount()+proShopping.getCount());
            return proShoppingMapper.updateProShopping(proShopping1);
        }else {
            return proShoppingMapper.insertProShopping(proShopping);
        }
    }

    public int addApi(ProShopping proShopping){
        ProShopping proShopping1 = proShoppingMapper.selectProShoppingByShoppingId(proShopping.getShoppingId());
        proShopping1.setCount(proShopping1.getCount()+1);
        return proShoppingMapper.updateProShopping(proShopping1);
    }

    public int subtractApi(ProShopping proShopping){
        ProShopping proShopping1 = proShoppingMapper.selectProShoppingByShoppingId(proShopping.getShoppingId());
        proShopping1.setCount(proShopping1.getCount()-1);
        if (proShopping1.getCount()==0)
            return proShoppingMapper.deleteProShoppingByShoppingId(proShopping.getShoppingId());
        else
        return proShoppingMapper.updateProShopping(proShopping1);
    }
}
