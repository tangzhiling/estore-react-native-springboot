package com.estore.project.service;

import java.util.List;
import com.estore.project.domain.ProOrderChild;

/**
 * 订单子集Service接口
 * 
 * @author zhang
 * @date 2023-11-04
 */
public interface IProOrderChildService 
{
    /**
     * 查询订单子集
     * 
     * @param childId 订单子集主键
     * @return 订单子集
     */
    public ProOrderChild selectProOrderChildByChildId(Long childId);

    /**
     * 查询订单子集列表
     * 
     * @param proOrderChild 订单子集
     * @return 订单子集集合
     */
    public List<ProOrderChild> selectProOrderChildList(ProOrderChild proOrderChild);

    /**
     * 新增订单子集
     * 
     * @param proOrderChild 订单子集
     * @return 结果
     */
    public int insertProOrderChild(ProOrderChild proOrderChild);

    /**
     * 修改订单子集
     * 
     * @param proOrderChild 订单子集
     * @return 结果
     */
    public int updateProOrderChild(ProOrderChild proOrderChild);

    /**
     * 批量删除订单子集
     * 
     * @param childIds 需要删除的订单子集主键集合
     * @return 结果
     */
    public int deleteProOrderChildByChildIds(Long[] childIds);

    /**
     * 删除订单子集信息
     * 
     * @param childId 订单子集主键
     * @return 结果
     */
    public int deleteProOrderChildByChildId(Long childId);
}
