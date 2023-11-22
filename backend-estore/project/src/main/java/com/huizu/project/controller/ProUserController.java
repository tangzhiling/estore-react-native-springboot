package com.estore.project.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.estore.project.domain.ProUser;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.estore.common.annotation.Log;
import com.estore.common.core.controller.BaseController;
import com.estore.common.core.domain.AjaxResult;
import com.estore.common.enums.BusinessType;
import com.estore.project.service.IProUserService;
import com.estore.common.utils.poi.ExcelUtil;
import com.estore.common.core.page.TableDataInfo;

/**
 * 用户信息Controller
 * 
 * @author zhang
 * @date 2023-11-03
 */
@RestController
@RequestMapping("/project/prouser")
public class ProUserController extends BaseController
{
    @Autowired
    private IProUserService sysUserService;

    /**
     * 查询用户信息列表
     */
    @PreAuthorize("@ss.hasPermi('project:prouser:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProUser proUser)
    {
        startPage();
        List<ProUser> list = sysUserService.selectProUserList(proUser);
        return getDataTable(list);
    }

    /**
     * 导出用户信息列表
     */
    @PreAuthorize("@ss.hasPermi('project:prouser:export')")
    @Log(title = "用户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProUser proUser)
    {
        List<ProUser> list = sysUserService.selectProUserList(proUser);
        ExcelUtil<ProUser> util = new ExcelUtil<ProUser>(ProUser.class);
        util.exportExcel(response, list, "用户信息数据");
    }

    /**
     * 获取用户信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:prouser:query')")
    @GetMapping(value = "/{userId}")
    public AjaxResult getInfo(@PathVariable("userId") Long userId)
    {
        return success(sysUserService.selectProUserByUserId(userId));
    }

    /**
     * 新增用户信息
     */
    @PreAuthorize("@ss.hasPermi('project:prouser:add')")
    @Log(title = "用户信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProUser proUser)
    {
        return toAjax(sysUserService.insertProUser(proUser));
    }

    /**
     * 修改用户信息
     */
    @PreAuthorize("@ss.hasPermi('project:prouser:edit')")
    @Log(title = "用户信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProUser proUser)
    {
        return toAjax(sysUserService.updateProUser(proUser));
    }

    /**
     * 删除用户信息
     */
    @PreAuthorize("@ss.hasPermi('project:prouser:remove')")
    @Log(title = "用户信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds)
    {
        return toAjax(sysUserService.deleteProUserByUserIds(userIds));
    }
}
