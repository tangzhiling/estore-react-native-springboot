package com.estore.project.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estore.common.core.domain.AjaxResult;
import com.estore.common.exception.ServiceException;
import com.estore.common.utils.DateUtils;
import com.estore.common.utils.SecurityUtils;
import com.estore.project.domain.ProUser;
import com.estore.project.utils.TokenUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.estore.project.mapper.ProUserMapper;
import com.estore.project.service.IProUserService;

/**
 * 用户信息Service业务层处理
 * 
 * @author zhang
 * @date 2023-11-03
 */
@Service
public class ProUserServiceImpl implements IProUserService
{
    @Autowired
    private ProUserMapper proUserMapper;

    /**
     * 查询用户信息
     * 
     * @param userId 用户信息主键
     * @return 用户信息
     */
    @Override
    public ProUser selectProUserByUserId(Long userId)
    {
        return proUserMapper.selectProUserByUserId(userId);
    }

    /**
     * 查询用户信息列表
     * 
     * @param proUser 用户信息
     * @return 用户信息
     */
    @Override
    public List<ProUser> selectProUserList(ProUser proUser)
    {
        return proUserMapper.selectProUserList(proUser);
    }

    /**
     * 新增用户信息
     * 
     * @param proUser 用户信息
     * @return 结果
     */
    @Override
    public int insertProUser(ProUser proUser)
    {
        proUser.setCreateTime(DateUtils.getNowDate());
        return proUserMapper.insertProUser(proUser);
    }

    /**
     * 修改用户信息
     * 
     * @param proUser 用户信息
     * @return 结果
     */
    @Override
    public int updateProUser(ProUser proUser)
    {
        return proUserMapper.updateProUser(proUser);
    }

    /**
     * 批量删除用户信息
     * 
     * @param userIds 需要删除的用户信息主键
     * @return 结果
     */
    @Override
    public int deleteProUserByUserIds(Long[] userIds)
    {
        return proUserMapper.deleteProUserByUserIds(userIds);
    }

    /**
     * 删除用户信息信息
     * 
     * @param userId 用户信息主键
     * @return 结果
     */
    @Override
    public int deleteProUserByUserId(Long userId)
    {
        return proUserMapper.deleteProUserByUserId(userId);
    }

    /**
     * 注册
     * @param proUser
     * @return
     */
    public int register(ProUser proUser){
        if (proUser.getUserName()==null||"".equals(proUser.getUserName()))
            throw new ServiceException("请输入账号");
        if (proUser.getPassword()==null||"".equals(proUser.getPassword()))
            throw new ServiceException("请输入密码");
        if (!proUser.getPassword().equals(proUser.getPassword2()))
            throw new ServiceException("两次输入的密码不一致");
        ProUser proUser1 = proUserMapper.selectProUserByUserName(proUser.getUserName());
        if (proUser1!=null)
            throw new ServiceException("该用户已注册,请前去登录");
        ProUser newProUser = new ProUser();
        String randomString = RandomStringUtils.randomAlphabetic(6);//6位随机
        newProUser.setUserName(proUser.getUserName());
        newProUser.setPassword(SecurityUtils.encryptPassword(proUser.getPassword()));
        newProUser.setNickName("用户"+randomString);
        newProUser.setCreateTime(new Date());
        return proUserMapper.insertProUser(newProUser);
    }

    /**
     * 登录返回用户信息以及token
     * @param proUser
     * @return
     */
    @Override
    public AjaxResult login(ProUser proUser) {
        Map<String,Object> respMap = new HashMap<>();
        if (proUser.getUserName()==null||"".equals(proUser.getUserName()))
            throw new ServiceException("请输入账号");
        if (proUser.getPassword()==null||"".equals(proUser.getPassword()))
            throw new ServiceException("请输入密码");
        ProUser proUser1 = proUserMapper.selectProUserByUserName(proUser.getUserName());
        if (proUser1==null)
            throw new ServiceException("用户不存在，请先注册");
        //加密传入密码
        //校验密码
        boolean isPassword = SecurityUtils.matchesPassword(proUser.getPassword(), proUser1.getPassword());
        if (!isPassword)
            throw new ServiceException("密码错误，请重新输入");
        String token = TokenUtils.generateAppToken(String.valueOf(proUser1.getUserId()));
        respMap.put(TokenUtils.getAppTokenHeader(),token);
        respMap.put("user",proUser1);
        return AjaxResult.success(respMap);
    }
}
