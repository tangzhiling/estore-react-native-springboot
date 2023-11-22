package com.estore.project.mapper;

import java.util.List;
import com.estore.project.domain.ProEvents;

/**
 * 活动管理Mapper接口
 * 
 * @author zhang
 * @date 2023-11-03
 */
public interface ProEventsMapper 
{
    /**
     * 查询活动管理
     * 
     * @param eventsId 活动管理主键
     * @return 活动管理
     */
    public ProEvents selectProEventsByEventsId(Long eventsId);


    /**
     * 查询活动管理
     *
     * @param eventsId 活动管理主键
     * @return 活动管理
     */
    public ProEvents selectProEventsByClassifyId(Long classifyId);

    /**
     * 查询活动管理列表
     * 
     * @param proEvents 活动管理
     * @return 活动管理集合
     */
    public List<ProEvents> selectProEventsList(ProEvents proEvents);

    /**
     * 新增活动管理
     * 
     * @param proEvents 活动管理
     * @return 结果
     */
    public int insertProEvents(ProEvents proEvents);

    /**
     * 修改活动管理
     * 
     * @param proEvents 活动管理
     * @return 结果
     */
    public int updateProEvents(ProEvents proEvents);

    /**
     * 删除活动管理
     * 
     * @param eventsId 活动管理主键
     * @return 结果
     */
    public int deleteProEventsByEventsId(Long eventsId);

    /**
     * 批量删除活动管理
     * 
     * @param eventsIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProEventsByEventsIds(Long[] eventsIds);
}
