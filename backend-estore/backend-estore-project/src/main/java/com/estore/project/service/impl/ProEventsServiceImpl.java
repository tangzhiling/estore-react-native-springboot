package com.estore.project.service.impl;

import java.util.List;

import com.estore.common.exception.ServiceException;
import com.estore.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.estore.project.mapper.ProEventsMapper;
import com.estore.project.domain.ProEvents;
import com.estore.project.service.IProEventsService;

/**
 * 活动管理Service业务层处理
 * 
 * @author zhang
 * @date 2023-11-03
 */
@Service
public class ProEventsServiceImpl implements IProEventsService 
{
    @Autowired
    private ProEventsMapper proEventsMapper;

    /**
     * 查询活动管理
     * 
     * @param eventsId 活动管理主键
     * @return 活动管理
     */
    @Override
    public ProEvents selectProEventsByEventsId(Long eventsId)
    {
        return proEventsMapper.selectProEventsByEventsId(eventsId);
    }

    /**
     * 查询活动管理列表
     * 
     * @param proEvents 活动管理
     * @return 活动管理
     */
    @Override
    public List<ProEvents> selectProEventsList(ProEvents proEvents)
    {
        return proEventsMapper.selectProEventsList(proEvents);
    }

    /**
     * 新增活动管理
     * 
     * @param proEvents 活动管理
     * @return 结果
     */
    @Override
    public int insertProEvents(ProEvents proEvents)
    {
        ProEvents proEventsPram = proEventsMapper.selectProEventsByEventsId(proEvents.getClassifyId());
        if (proEventsPram!=null)
            throw new ServiceException("此分类已绑定活动");
        proEvents.setCreateTime(DateUtils.getNowDate());
        return proEventsMapper.insertProEvents(proEvents);
    }

    /**
     * 修改活动管理
     * 
     * @param proEvents 活动管理
     * @return 结果
     */
    @Override
    public int updateProEvents(ProEvents proEvents)
    {
        return proEventsMapper.updateProEvents(proEvents);
    }

    /**
     * 批量删除活动管理
     * 
     * @param eventsIds 需要删除的活动管理主键
     * @return 结果
     */
    @Override
    public int deleteProEventsByEventsIds(Long[] eventsIds)
    {
        return proEventsMapper.deleteProEventsByEventsIds(eventsIds);
    }

    /**
     * 删除活动管理信息
     * 
     * @param eventsId 活动管理主键
     * @return 结果
     */
    @Override
    public int deleteProEventsByEventsId(Long eventsId)
    {
        return proEventsMapper.deleteProEventsByEventsId(eventsId);
    }
}
