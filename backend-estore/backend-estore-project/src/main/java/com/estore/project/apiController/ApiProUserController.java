package com.estore.project.apiController;

import com.estore.common.annotation.Anonymous;
import com.estore.common.core.controller.BaseController;
import com.estore.common.core.domain.AjaxResult;
import com.estore.project.domain.ProUser;
import com.estore.project.service.IProUserService;
import com.estore.project.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户信息Controller
 * 
 * @author zhang
 * @date 2023-11-03
 */
@Anonymous
@RestController
@RequestMapping("/api/prouser")
public class ApiProUserController extends BaseController
{
    @Autowired
    private IProUserService sysUserService;


    /**
     * 获取用户信息详细信息
     */
    @PostMapping(value = "/getById")
    public AjaxResult getInfo(HttpServletRequest request)
    {
        String token = request.getHeader(TokenUtils.getAppTokenHeader());
        Long userId = Long.valueOf(TokenUtils.parseToken(token).getSubject());//获取用户ID
        return success(sysUserService.selectProUserByUserId(userId));
    }

    /**
     * 登录-账号密码
     * @param proUser
     * @return
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody ProUser proUser){
        return sysUserService.login(proUser);
    }

    /**
     * 注册
     * @param proUser
     * @return
     */
    @PostMapping("/register")
    public AjaxResult register(@RequestBody ProUser proUser){
        return toAjax(sysUserService.register(proUser));
    }


    /**
     * 修改用户信息
     */
    @PostMapping("/update")
    public AjaxResult edit(@RequestBody ProUser proUser, HttpServletRequest request)
    {
        String token = request.getHeader(TokenUtils.getAppTokenHeader());
        Long userId = Long.valueOf(TokenUtils.parseToken(token).getSubject());//获取用户ID
        proUser.setUserId(userId);
        return toAjax(sysUserService.updateProUser(proUser));
    }
}
