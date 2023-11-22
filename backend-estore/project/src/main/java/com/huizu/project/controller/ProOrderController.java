package com.estore.project.controller;

import java.util.List;
import java.util.Map;
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
import com.estore.project.domain.ProOrder;
import com.estore.project.service.IProOrderService;
import com.estore.common.utils.poi.ExcelUtil;
import com.estore.common.core.page.TableDataInfo;

/**
 * 订单管理Controller
 * 
 * @author zhang
 * @date 2023-11-03
 */
@RestController
@RequestMapping("/project/order")
public class ProOrderController extends BaseController
{
    @Autowired
    private IProOrderService proOrderService;

    /**
     * 查询订单管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:order:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProOrder proOrder)
    {
        startPage();
        List<ProOrder> list = proOrderService.selectProOrderList(proOrder);
        return getDataTable(list);
    }

    /**
     * 导出订单管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:order:export')")
    @Log(title = "订单管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProOrder proOrder)
    {
        List<ProOrder> list = proOrderService.selectProOrderList(proOrder);
        ExcelUtil<ProOrder> util = new ExcelUtil<ProOrder>(ProOrder.class);
        util.exportExcel(response, list, "订单管理数据");
    }

    /**
     * 获取订单管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:order:query')")
    @GetMapping(value = "/{orderId}")
    public AjaxResult getInfo(@PathVariable("orderId") String orderId)
    {
        return success(proOrderService.selectProOrderByOrderId(orderId));
    }

    /**
     * 新增订单管理
     */
    @PreAuthorize("@ss.hasPermi('project:order:add')")
    @Log(title = "订单管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProOrder proOrder)
    {
        return toAjax(proOrderService.insertProOrder(proOrder));
    }

    /**
     * 修改订单管理
     */
    @PreAuthorize("@ss.hasPermi('project:order:edit')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProOrder proOrder)
    {
        return toAjax(proOrderService.updateProOrder(proOrder));
    }

    /**
     * 删除订单管理
     */
    @PreAuthorize("@ss.hasPermi('project:order:remove')")
    @Log(title = "订单管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{orderIds}")
    public AjaxResult remove(@PathVariable String[] orderIds)
    {
        return toAjax(proOrderService.deleteProOrderByOrderIds(orderIds));
    }

}
