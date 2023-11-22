package com.estore.project.service.impl;

import java.util.List;
import com.estore.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.estore.project.mapper.ProLogMapper;
import com.estore.project.domain.ProLog;
import com.estore.project.service.IProLogService;

/**
 * 日志管理Service业务层处理
 * 
 * @author zhang
 * @date 2023-11-03
 */
@Service
public class ProLogServiceImpl implements IProLogService 
{
    @Autowired
    private ProLogMapper proLogMapper;

    /**
     * 查询日志管理
     * 
     * @param logId 日志管理主键
     * @return 日志管理
     */
    @Override
    public ProLog selectProLogByLogId(Long logId)
    {
        return proLogMapper.selectProLogByLogId(logId);
    }

    /**
     * 查询日志管理列表
     * 
     * @param proLog 日志管理
     * @return 日志管理
     */
    @Override
    public List<ProLog> selectProLogList(ProLog proLog)
    {
        return proLogMapper.selectProLogList(proLog);
    }

    /**
     * 新增日志管理
     * 
     * @param proLog 日志管理
     * @return 结果
     */
    @Override
    public int insertProLog(ProLog proLog)
    {
        proLog.setCreateTime(DateUtils.getNowDate());
        return proLogMapper.insertProLog(proLog);
    }

    /**
     * 修改日志管理
     * 
     * @param proLog 日志管理
     * @return 结果
     */
    @Override
    public int updateProLog(ProLog proLog)
    {
        return proLogMapper.updateProLog(proLog);
    }

    /**
     * 批量删除日志管理
     * 
     * @param logIds 需要删除的日志管理主键
     * @return 结果
     */
    @Override
    public int deleteProLogByLogIds(Long[] logIds)
    {
        return proLogMapper.deleteProLogByLogIds(logIds);
    }

    /**
     * 删除日志管理信息
     * 
     * @param logId 日志管理主键
     * @return 结果
     */
    @Override
    public int deleteProLogByLogId(Long logId)
    {
        return proLogMapper.deleteProLogByLogId(logId);
    }
}
