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
import com.estore.project.domain.ProClassify;
import com.estore.project.service.IProClassifyService;
import com.estore.common.utils.poi.ExcelUtil;
import com.estore.common.core.page.TableDataInfo;

/**
 * 商品分类Controller
 * 
 * @author zhang
 * @date 2023-11-03
 */
@RestController
@RequestMapping("/project/proclassify")
public class ProClassifyController extends BaseController
{
    @Autowired
    private IProClassifyService proClassifyService;

    /**
     * 查询商品分类列表
     */
    @PreAuthorize("@ss.hasPermi('project:proclassify:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProClassify proClassify)
    {
        startPage();
        List<ProClassify> list = proClassifyService.selectProClassifyList(proClassify);
        return getDataTable(list);
    }

    /**
     * 导出商品分类列表
     */
    @PreAuthorize("@ss.hasPermi('project:proclassify:export')")
    @Log(title = "商品分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProClassify proClassify)
    {
        List<ProClassify> list = proClassifyService.selectProClassifyList(proClassify);
        ExcelUtil<ProClassify> util = new ExcelUtil<ProClassify>(ProClassify.class);
        util.exportExcel(response, list, "商品分类数据");
    }

    /**
     * 获取商品分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:proclassify:query')")
    @GetMapping(value = "/{classifyId}")
    public AjaxResult getInfo(@PathVariable("classifyId") Long classifyId)
    {
        return success(proClassifyService.selectProClassifyByClassifyId(classifyId));
    }

    /**
     * 新增商品分类
     */
    @PreAuthorize("@ss.hasPermi('project:proclassify:add')")
    @Log(title = "商品分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProClassify proClassify)
    {
        return toAjax(proClassifyService.insertProClassify(proClassify));
    }

    /**
     * 修改商品分类
     */
    @PreAuthorize("@ss.hasPermi('project:proclassify:edit')")
    @Log(title = "商品分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProClassify proClassify)
    {
        return toAjax(proClassifyService.updateProClassify(proClassify));
    }

    /**
     * 删除商品分类
     */
    @PreAuthorize("@ss.hasPermi('project:proclassify:remove')")
    @Log(title = "商品分类", businessType = BusinessType.DELETE)
	@DeleteMapping("/{classifyIds}")
    public AjaxResult remove(@PathVariable Long[] classifyIds)
    {
        return toAjax(proClassifyService.deleteProClassifyByClassifyIds(classifyIds));
    }
}
