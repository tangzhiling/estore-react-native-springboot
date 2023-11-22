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
import com.estore.project.domain.ProAddress;
import com.estore.project.service.IProAddressService;
import com.estore.common.utils.poi.ExcelUtil;
import com.estore.common.core.page.TableDataInfo;

/**
 * 地址管理Controller
 * 
 * @author zhang
 * @date 2023-11-07
 */
@RestController
@RequestMapping("/project/proaddress")
public class ProAddressController extends BaseController
{
    @Autowired
    private IProAddressService proAddressService;

    /**
     * 查询地址管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:proaddress:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProAddress proAddress)
    {
        startPage();
        List<ProAddress> list = proAddressService.selectProAddressList(proAddress);
        return getDataTable(list);
    }

    /**
     * 导出地址管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:proaddress:export')")
    @Log(title = "地址管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProAddress proAddress)
    {
        List<ProAddress> list = proAddressService.selectProAddressList(proAddress);
        ExcelUtil<ProAddress> util = new ExcelUtil<ProAddress>(ProAddress.class);
        util.exportExcel(response, list, "地址管理数据");
    }

    /**
     * 获取地址管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:proaddress:query')")
    @GetMapping(value = "/{addressId}")
    public AjaxResult getInfo(@PathVariable("addressId") Long addressId)
    {
        return success(proAddressService.selectProAddressByAddressId(addressId));
    }

    /**
     * 新增地址管理
     */
    @PreAuthorize("@ss.hasPermi('project:proaddress:add')")
    @Log(title = "地址管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProAddress proAddress)
    {
        return toAjax(proAddressService.insertProAddress(proAddress));
    }

    /**
     * 修改地址管理
     */
    @PreAuthorize("@ss.hasPermi('project:proaddress:edit')")
    @Log(title = "地址管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProAddress proAddress)
    {
        return toAjax(proAddressService.updateProAddress(proAddress));
    }

    /**
     * 删除地址管理
     */
    @PreAuthorize("@ss.hasPermi('project:proaddress:remove')")
    @Log(title = "地址管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{addressIds}")
    public AjaxResult remove(@PathVariable Long[] addressIds)
    {
        return toAjax(proAddressService.deleteProAddressByAddressIds(addressIds));
    }
}
