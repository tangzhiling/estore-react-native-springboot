package com.estore.project.service;

import java.util.List;
import com.estore.project.domain.ProLog;

/**
 * 日志管理Service接口
 * 
 * @author zhang
 * @date 2023-11-03
 */
public interface IProLogService 
{
    /**
     * 查询日志管理
     * 
     * @param logId 日志管理主键
     * @return 日志管理
     */
    public ProLog selectProLogByLogId(Long logId);

    /**
     * 查询日志管理列表
     * 
     * @param proLog 日志管理
     * @return 日志管理集合
     */
    public List<ProLog> selectProLogList(ProLog proLog);

    /**
     * 新增日志管理
     * 
     * @param proLog 日志管理
     * @return 结果
     */
    public int insertProLog(ProLog proLog);

    /**
     * 修改日志管理
     * 
     * @param proLog 日志管理
     * @return 结果
     */
    public int updateProLog(ProLog proLog);

    /**
     * 批量删除日志管理
     * 
     * @param logIds 需要删除的日志管理主键集合
     * @return 结果
     */
    public int deleteProLogByLogIds(Long[] logIds);

    /**
     * 删除日志管理信息
     * 
     * @param logId 日志管理主键
     * @return 结果
     */
    public int deleteProLogByLogId(Long logId);
}
