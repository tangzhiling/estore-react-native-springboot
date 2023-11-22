package com.estore.project.apiController;

import com.estore.common.annotation.Anonymous;
import com.estore.common.annotation.Log;
import com.estore.common.core.controller.BaseController;
import com.estore.common.core.domain.AjaxResult;
import com.estore.common.core.page.TableDataInfo;
import com.estore.common.enums.BusinessType;
import com.estore.common.utils.poi.ExcelUtil;
import com.estore.project.domain.ProProduct;
import com.estore.project.service.IProProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 商品管理Controller
 * 
 * @author zhang
 * @date 2023-11-03
 */
@Anonymous
@RestController
@RequestMapping("/api/proproduct")
public class ApiProProductController extends BaseController
{
    @Autowired
    private IProProductService proProductService;

    /**
     * 查询商品管理列表
     */
    @PostMapping("/list")
    public TableDataInfo list(@RequestBody(required = false) ProProduct proProduct)
    {
//        startPage();
        if (proProduct==null)
            proProduct = new ProProduct();
        List<ProProduct> list = proProductService.selectProProductList(proProduct);
        return getDataTable(list);
    }

    /**
     * 获取商品管理详细信息
     */
    @PostMapping(value = "/getById")
    public AjaxResult getInfo(@RequestBody Map<String,Object> map)
    {
        Long productId = Long.parseLong(String.valueOf(map.get("productId")));
        return success(proProductService.selectProProductByProductId(productId));
    }

}
