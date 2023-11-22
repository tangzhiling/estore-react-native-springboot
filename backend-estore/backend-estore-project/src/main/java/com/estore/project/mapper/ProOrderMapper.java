package com.estore.project.mapper;

import java.util.List;
import com.estore.project.domain.ProOrder;

/**
 * 订单管理Mapper接口
 * 
 * @author zhang
 * @date 2023-11-03
 */
public interface ProOrderMapper 
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
     * 删除订单管理
     * 
     * @param orderId 订单管理主键
     * @return 结果
     */
    public int deleteProOrderByOrderId(String orderId);

    /**
     * 批量删除订单管理
     * 
     * @param orderIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProOrderByOrderIds(String[] orderIds);
}
