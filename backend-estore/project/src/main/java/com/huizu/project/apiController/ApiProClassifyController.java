package com.estore.project.apiController;

import com.estore.common.annotation.Anonymous;
import com.estore.common.annotation.Log;
import com.estore.common.core.controller.BaseController;
import com.estore.common.core.domain.AjaxResult;
import com.estore.common.core.page.TableDataInfo;
import com.estore.common.enums.BusinessType;
import com.estore.common.utils.poi.ExcelUtil;
import com.estore.project.domain.ProClassify;
import com.estore.project.service.IProClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 商品分类Controller
 * 
 * @author zhang
 * @date 2023-11-03
 */
@Anonymous
@RestController
@RequestMapping("/api/proclassify")
public class ApiProClassifyController extends BaseController
{
    @Autowired
    private IProClassifyService proClassifyService;

    /**
     * 查询商品分类列表
     */
    @PostMapping("/list")
    public TableDataInfo list(ProClassify proClassify)
    {
//        startPage();
        List<ProClassify> list = proClassifyService.selectProClassifyList(proClassify);
        return getDataTable(list);
    }
}
