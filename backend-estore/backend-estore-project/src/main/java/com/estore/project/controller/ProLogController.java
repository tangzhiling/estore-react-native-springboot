package com.estore.project.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.estore.project.domain.ProLog;
import com.estore.project.service.IProLogService;
import com.estore.common.utils.poi.ExcelUtil;
import com.estore.common.core.page.TableDataInfo;

/**
 * 日志管理Controller
 * 
 * @author zhang
 * @date 2023-11-03
 */
@RestController
@RequestMapping("/project/prolog")
public class ProLogController extends BaseController
{
    @Autowired
    private IProLogService proLogService;

    /**
     * 查询日志管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:prolog:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProLog proLog)
    {
        startPage();
        List<ProLog> list = proLogService.selectProLogList(proLog);
        return getDataTable(list);
    }

    /**
     * 导出日志管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:prolog:export')")
    @Log(title = "日志管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProLog proLog)
    {
        List<ProLog> list = proLogService.selectProLogList(proLog);
        ExcelUtil<ProLog> util = new ExcelUtil<ProLog>(ProLog.class);
        util.exportExcel(response, list, "日志管理数据");
    }

    /**
     * 获取日志管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:prolog:query')")
    @GetMapping(value = "/{logId}")
    public AjaxResult getInfo(@PathVariable("logId") Long logId)
    {
        return success(proLogService.selectProLogByLogId(logId));
    }

    /**
     * 新增日志管理
     */
    @PreAuthorize("@ss.hasPermi('project:prolog:add')")
    @Log(title = "日志管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProLog proLog)
    {
        return toAjax(proLogService.insertProLog(proLog));
    }

    /**
     * 修改日志管理
     */
    @PreAuthorize("@ss.hasPermi('project:prolog:edit')")
    @Log(title = "日志管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProLog proLog)
    {
        return toAjax(proLogService.updateProLog(proLog));
    }

    /**
     * 删除日志管理
     */
    @PreAuthorize("@ss.hasPermi('project:prolog:remove')")
    @Log(title = "日志管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{logIds}")
    public AjaxResult remove(@PathVariable Long[] logIds)
    {
        return toAjax(proLogService.deleteProLogByLogIds(logIds));
    }
}
