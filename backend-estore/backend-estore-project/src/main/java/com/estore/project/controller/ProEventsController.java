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
import com.estore.project.domain.ProEvents;
import com.estore.project.service.IProEventsService;
import com.estore.common.utils.poi.ExcelUtil;
import com.estore.common.core.page.TableDataInfo;

/**
 * 活动管理Controller
 * 
 * @author zhang
 * @date 2023-11-03
 */
@RestController
@RequestMapping("/project/proevents")
public class ProEventsController extends BaseController
{
    @Autowired
    private IProEventsService proEventsService;

    /**
     * 查询活动管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:proevents:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProEvents proEvents)
    {
        startPage();
        List<ProEvents> list = proEventsService.selectProEventsList(proEvents);
        return getDataTable(list);
    }

    /**
     * 导出活动管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:proevents:export')")
    @Log(title = "活动管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProEvents proEvents)
    {
        List<ProEvents> list = proEventsService.selectProEventsList(proEvents);
        ExcelUtil<ProEvents> util = new ExcelUtil<ProEvents>(ProEvents.class);
        util.exportExcel(response, list, "活动管理数据");
    }

    /**
     * 获取活动管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:proevents:query')")
    @GetMapping(value = "/{eventsId}")
    public AjaxResult getInfo(@PathVariable("eventsId") Long eventsId)
    {
        return success(proEventsService.selectProEventsByEventsId(eventsId));
    }

    /**
     * 新增活动管理
     */
    @PreAuthorize("@ss.hasPermi('project:proevents:add')")
    @Log(title = "活动管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProEvents proEvents)
    {
        return toAjax(proEventsService.insertProEvents(proEvents));
    }

    /**
     * 修改活动管理
     */
    @PreAuthorize("@ss.hasPermi('project:proevents:edit')")
    @Log(title = "活动管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProEvents proEvents)
    {
        return toAjax(proEventsService.updateProEvents(proEvents));
    }

    /**
     * 删除活动管理
     */
    @PreAuthorize("@ss.hasPermi('project:proevents:remove')")
    @Log(title = "活动管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{eventsIds}")
    public AjaxResult remove(@PathVariable Long[] eventsIds)
    {
        return toAjax(proEventsService.deleteProEventsByEventsIds(eventsIds));
    }
}
