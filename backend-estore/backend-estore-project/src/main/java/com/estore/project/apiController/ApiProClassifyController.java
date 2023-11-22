package com.estore.project.apiController;

import com.estore.common.annotation.Anonymous;
import com.estore.common.core.controller.BaseController;
import com.estore.common.core.page.TableDataInfo;
import com.estore.project.domain.ProClassify;
import com.estore.project.service.IProClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
