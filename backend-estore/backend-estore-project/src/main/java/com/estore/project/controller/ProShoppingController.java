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
import com.estore.project.domain.ProShopping;
import com.estore.project.service.IProShoppingService;
import com.estore.common.utils.poi.ExcelUtil;
import com.estore.common.core.page.TableDataInfo;

/**
 * 购物车管理Controller
 * 
 * @author zhang
 * @date 2023-11-07
 */
@RestController
@RequestMapping("/project/proshopping")
public class ProShoppingController extends BaseController
{
    @Autowired
    private IProShoppingService proShoppingService;

    /**
     * 查询购物车管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:proshopping:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProShopping proShopping)
    {
        startPage();
        List<ProShopping> list = proShoppingService.selectProShoppingList(proShopping);
        return getDataTable(list);
    }

    /**
     * 导出购物车管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:proshopping:export')")
    @Log(title = "购物车管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProShopping proShopping)
    {
        List<ProShopping> list = proShoppingService.selectProShoppingList(proShopping);
        ExcelUtil<ProShopping> util = new ExcelUtil<ProShopping>(ProShopping.class);
        util.exportExcel(response, list, "购物车管理数据");
    }

    /**
     * 获取购物车管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:proshopping:query')")
    @GetMapping(value = "/{shoppingId}")
    public AjaxResult getInfo(@PathVariable("shoppingId") Long shoppingId)
    {
        return success(proShoppingService.selectProShoppingByShoppingId(shoppingId));
    }

    /**
     * 新增购物车管理
     */
    @PreAuthorize("@ss.hasPermi('project:proshopping:add')")
    @Log(title = "购物车管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProShopping proShopping)
    {
        return toAjax(proShoppingService.insertProShopping(proShopping));
    }

    /**
     * 修改购物车管理
     */
    @PreAuthorize("@ss.hasPermi('project:proshopping:edit')")
    @Log(title = "购物车管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProShopping proShopping)
    {
        return toAjax(proShoppingService.updateProShopping(proShopping));
    }

    /**
     * 删除购物车管理
     */
    @PreAuthorize("@ss.hasPermi('project:proshopping:remove')")
    @Log(title = "购物车管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{shoppingIds}")
    public AjaxResult remove(@PathVariable Long[] shoppingIds)
    {
        return toAjax(proShoppingService.deleteProShoppingByShoppingIds(shoppingIds));
    }
}
