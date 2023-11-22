package com.estore.project.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.estore.project.mapper.ProOrderChildMapper;
import com.estore.project.domain.ProOrderChild;
import com.estore.project.service.IProOrderChildService;

/**
 * 订单子集Service业务层处理
 * 
 * @author zhang
 * @date 2023-11-04
 */
@Service
public class ProOrderChildServiceImpl implements IProOrderChildService 
{
    @Autowired
    private ProOrderChildMapper proOrderChildMapper;

    /**
     * 查询订单子集
     * 
     * @param childId 订单子集主键
     * @return 订单子集
     */
    @Override
    public ProOrderChild selectProOrderChildByChildId(Long childId)
    {
        return proOrderChildMapper.selectProOrderChildByChildId(childId);
    }

    /**
     * 查询订单子集列表
     * 
     * @param proOrderChild 订单子集
     * @return 订单子集
     */
    @Override
    public List<ProOrderChild> selectProOrderChildList(ProOrderChild proOrderChild)
    {
        return proOrderChildMapper.selectProOrderChildList(proOrderChild);
    }

    /**
     * 新增订单子集
     * 
     * @param proOrderChild 订单子集
     * @return 结果
     */
    @Override
    public int insertProOrderChild(ProOrderChild proOrderChild)
    {
        return proOrderChildMapper.insertProOrderChild(proOrderChild);
    }

    /**
     * 修改订单子集
     * 
     * @param proOrderChild 订单子集
     * @return 结果
     */
    @Override
    public int updateProOrderChild(ProOrderChild proOrderChild)
    {
        return proOrderChildMapper.updateProOrderChild(proOrderChild);
    }

    /**
     * 批量删除订单子集
     * 
     * @param childIds 需要删除的订单子集主键
     * @return 结果
     */
    @Override
    public int deleteProOrderChildByChildIds(Long[] childIds)
    {
        return proOrderChildMapper.deleteProOrderChildByChildIds(childIds);
    }

    /**
     * 删除订单子集信息
     * 
     * @param childId 订单子集主键
     * @return 结果
     */
    @Override
    public int deleteProOrderChildByChildId(Long childId)
    {
        return proOrderChildMapper.deleteProOrderChildByChildId(childId);
    }
}
