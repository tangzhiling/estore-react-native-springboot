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
import com.estore.project.domain.ProProduct;
import com.estore.project.service.IProProductService;
import com.estore.common.utils.poi.ExcelUtil;
import com.estore.common.core.page.TableDataInfo;

/**
 * 商品管理Controller
 * 
 * @author zhang
 * @date 2023-11-03
 */
@RestController
@RequestMapping("/project/proproduct")
public class ProProductController extends BaseController
{
    @Autowired
    private IProProductService proProductService;

    /**
     * 查询商品管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:proproduct:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProProduct proProduct)
    {
        startPage();
        List<ProProduct> list = proProductService.selectProProductList(proProduct);
        return getDataTable(list);
    }

    /**
     * 导出商品管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:proproduct:export')")
    @Log(title = "商品管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProProduct proProduct)
    {
        List<ProProduct> list = proProductService.selectProProductList(proProduct);
        ExcelUtil<ProProduct> util = new ExcelUtil<ProProduct>(ProProduct.class);
        util.exportExcel(response, list, "商品管理数据");
    }

    /**
     * 获取商品管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:proproduct:query')")
    @GetMapping(value = "/{productId}")
    public AjaxResult getInfo(@PathVariable("productId") Long productId)
    {
        return success(proProductService.selectProProductByProductId(productId));
    }

    /**
     * 新增商品管理
     */
    @PreAuthorize("@ss.hasPermi('project:proproduct:add')")
    @Log(title = "商品管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProProduct proProduct)
    {
        return toAjax(proProductService.insertProProduct(proProduct));
    }

    /**
     * 修改商品管理
     */
    @PreAuthorize("@ss.hasPermi('project:proproduct:edit')")
    @Log(title = "商品管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProProduct proProduct)
    {
        return toAjax(proProductService.updateProProduct(proProduct));
    }

    /**
     * 删除商品管理
     */
    @PreAuthorize("@ss.hasPermi('project:proproduct:remove')")
    @Log(title = "商品管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{productIds}")
    public AjaxResult remove(@PathVariable Long[] productIds)
    {
        return toAjax(proProductService.deleteProProductByProductIds(productIds));
    }
}
