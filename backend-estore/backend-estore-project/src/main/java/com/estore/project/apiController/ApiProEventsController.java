package com.estore.project.apiController;

import com.estore.common.annotation.Anonymous;
import com.estore.common.core.controller.BaseController;
import com.estore.common.core.domain.AjaxResult;
import com.estore.common.core.page.TableDataInfo;
import com.estore.project.domain.ProEvents;
import com.estore.project.service.IProEventsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 活动管理Controller
 * 
 * @author zhang
 * @date 2023-11-03
 */
@Anonymous
@RestController
@RequestMapping("/api/proevents")
public class ApiProEventsController extends BaseController
{
    @Autowired
    private IProEventsService proEventsService;

    /**
     * 查询活动管理列表
     */
    @PostMapping("/list")
    public TableDataInfo list(ProEvents proEvents)
    {
        startPage();
        List<ProEvents> list = proEventsService.selectProEventsList(proEvents);
        return getDataTable(list);
    }


    /**
     * 获取活动管理详细信息
     */
    @PostMapping(value = "/getById")
    public AjaxResult getInfo(@RequestBody Map<String,Object> map)
    {
        Long id = Long.parseLong(String.valueOf(map.get("id")));
        return success(proEventsService.selectProEventsByEventsId(id));
    }

}
