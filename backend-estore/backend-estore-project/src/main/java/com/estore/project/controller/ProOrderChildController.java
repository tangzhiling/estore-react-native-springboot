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
import com.estore.project.domain.ProOrderChild;
import com.estore.project.service.IProOrderChildService;
import com.estore.common.utils.poi.ExcelUtil;
import com.estore.common.core.page.TableDataInfo;

/**
 * 订单子集Controller
 * 
 * @author zhang
 * @date 2023-11-04
 */
@RestController
@RequestMapping("/project/proorderchild")
public class ProOrderChildController extends BaseController
{
    @Autowired
    private IProOrderChildService proOrderChildService;

    /**
     * 查询订单子集列表
     */
    @PreAuthorize("@ss.hasPermi('project:proorderchild:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProOrderChild proOrderChild)
    {
        startPage();
        List<ProOrderChild> list = proOrderChildService.selectProOrderChildList(proOrderChild);
        return getDataTable(list);
    }

    /**
     * 导出订单子集列表
     */
    @PreAuthorize("@ss.hasPermi('project:proorderchild:export')")
    @Log(title = "订单子集", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProOrderChild proOrderChild)
    {
        List<ProOrderChild> list = proOrderChildService.selectProOrderChildList(proOrderChild);
        ExcelUtil<ProOrderChild> util = new ExcelUtil<ProOrderChild>(ProOrderChild.class);
        util.exportExcel(response, list, "订单子集数据");
    }

    /**
     * 获取订单子集详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:proorderchild:query')")
    @GetMapping(value = "/{childId}")
    public AjaxResult getInfo(@PathVariable("childId") Long childId)
    {
        return success(proOrderChildService.selectProOrderChildByChildId(childId));
    }

    /**
     * 新增订单子集
     */
    @PreAuthorize("@ss.hasPermi('project:proorderchild:add')")
    @Log(title = "订单子集", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProOrderChild proOrderChild)
    {
        return toAjax(proOrderChildService.insertProOrderChild(proOrderChild));
    }

    /**
     * 修改订单子集
     */
    @PreAuthorize("@ss.hasPermi('project:proorderchild:edit')")
    @Log(title = "订单子集", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProOrderChild proOrderChild)
    {
        return toAjax(proOrderChildService.updateProOrderChild(proOrderChild));
    }

    /**
     * 删除订单子集
     */
    @PreAuthorize("@ss.hasPermi('project:proorderchild:remove')")
    @Log(title = "订单子集", businessType = BusinessType.DELETE)
	@DeleteMapping("/{childIds}")
    public AjaxResult remove(@PathVariable Long[] childIds)
    {
        return toAjax(proOrderChildService.deleteProOrderChildByChildIds(childIds));
    }
}
