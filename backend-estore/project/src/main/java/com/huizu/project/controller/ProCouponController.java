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
import com.estore.project.domain.ProCoupon;
import com.estore.project.service.IProCouponService;
import com.estore.common.utils.poi.ExcelUtil;
import com.estore.common.core.page.TableDataInfo;

/**
 * 优惠卷管理Controller
 * 
 * @author zhang
 * @date 2023-11-03
 */
@RestController
@RequestMapping("/project/procoupon")
public class ProCouponController extends BaseController
{
    @Autowired
    private IProCouponService proCouponService;

    /**
     * 查询优惠卷管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:procoupon:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProCoupon proCoupon)
    {
        startPage();
        List<ProCoupon> list = proCouponService.selectProCouponList(proCoupon);
        return getDataTable(list);
    }

    /**
     * 导出优惠卷管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:procoupon:export')")
    @Log(title = "优惠卷管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProCoupon proCoupon)
    {
        List<ProCoupon> list = proCouponService.selectProCouponList(proCoupon);
        ExcelUtil<ProCoupon> util = new ExcelUtil<ProCoupon>(ProCoupon.class);
        util.exportExcel(response, list, "优惠卷管理数据");
    }

    /**
     * 获取优惠卷管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:procoupon:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(proCouponService.selectProCouponById(id));
    }

    /**
     * 新增优惠卷管理
     */
    @PreAuthorize("@ss.hasPermi('project:procoupon:add')")
    @Log(title = "优惠卷管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProCoupon proCoupon)
    {
        return toAjax(proCouponService.insertProCoupon(proCoupon));
    }

    /**
     * 修改优惠卷管理
     */
    @PreAuthorize("@ss.hasPermi('project:procoupon:edit')")
    @Log(title = "优惠卷管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProCoupon proCoupon)
    {
        return toAjax(proCouponService.updateProCoupon(proCoupon));
    }

    /**
     * 删除优惠卷管理
     */
    @PreAuthorize("@ss.hasPermi('project:procoupon:remove')")
    @Log(title = "优惠卷管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(proCouponService.deleteProCouponByIds(ids));
    }
}
