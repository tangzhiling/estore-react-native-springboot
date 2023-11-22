package com.estore.project.mapper;

import java.util.List;

import com.estore.project.domain.ProUser;

/**
 * 用户信息Mapper接口
 * 
 * @author zhang
 * @date 2023-11-03
 */
public interface ProUserMapper
{
    /**
     * 查询用户信息
     * 
     * @param userId 用户信息主键
     * @return 用户信息
     */
    public ProUser selectProUserByUserId(Long userId);

    /**
     * 查询用户信息
     *
     * @param userId 用户信息主键
     * @return 用户信息
     */
    public ProUser selectProUserByUserName(String userName);


    /**
     * 查询用户信息列表
     * 
     * @param proUser 用户信息
     * @return 用户信息集合
     */
    public List<ProUser> selectProUserList(ProUser proUser);

    /**
     * 新增用户信息
     * 
     * @param proUser 用户信息
     * @return 结果
     */
    public int insertProUser(ProUser proUser);

    /**
     * 修改用户信息
     * 
     * @param proUser 用户信息
     * @return 结果
     */
    public int updateProUser(ProUser proUser);


    public int updateProUserBalance(ProUser proUser);

    /**
     * 删除用户信息
     * 
     * @param userId 用户信息主键
     * @return 结果
     */
    public int deleteProUserByUserId(Long userId);

    /**
     * 批量删除用户信息
     * 
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProUserByUserIds(Long[] userIds);
}
