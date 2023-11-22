package com.estore.project.service;

import java.util.List;
import java.util.Map;

import com.estore.common.core.domain.AjaxResult;
import com.estore.project.domain.ProOrder;

/**
 * 订单管理Service接口
 * 
 * @author zhang
 * @date 2023-11-03
 */
public interface IProOrderService 
{
    /**
     * 查询订单管理
     * 
     * @param orderId 订单管理主键
     * @return 订单管理
     */
    public ProOrder selectProOrderByOrderId(String orderId);

    /**
     * 查询订单管理列表
     * 
     * @param proOrder 订单管理
     * @return 订单管理集合
     */
    public List<ProOrder> selectProOrderList(ProOrder proOrder);

    /**
     * 新增订单管理
     * 
     * @param proOrder 订单管理
     * @return 结果
     */
    public int insertProOrder(ProOrder proOrder);

    /**
     * 修改订单管理
     * 
     * @param proOrder 订单管理
     * @return 结果
     */
    public int updateProOrder(ProOrder proOrder);

    /**
     * 批量删除订单管理
     * 
     * @param orderIds 需要删除的订单管理主键集合
     * @return 结果
     */
    public int deleteProOrderByOrderIds(String[] orderIds);

    /**
     * 删除订单管理信息
     * 
     * @param orderId 订单管理主键
     * @return 结果
     */
    public int deleteProOrderByOrderId(String orderId);

    public AjaxResult verifyOrder(ProOrder proOrder);

    public AjaxResult payOrder(ProOrder proOrder);

    public AjaxResult verifyShopping(Map<String,Object> map);
}
