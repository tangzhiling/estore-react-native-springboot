package com.estore.project.apiController;

import com.estore.common.annotation.Anonymous;
import com.estore.common.annotation.Log;
import com.estore.common.core.controller.BaseController;
import com.estore.common.core.domain.AjaxResult;
import com.estore.common.core.page.TableDataInfo;
import com.estore.common.enums.BusinessType;
import com.estore.common.utils.poi.ExcelUtil;
import com.estore.project.domain.ProCoupon;
import com.estore.project.service.IProCouponService;
import com.estore.project.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 优惠卷管理Controller
 * 
 * @author zhang
 * @date 2023-11-03
 */
@Anonymous
@RestController
@RequestMapping("/api/procoupon")
public class ApiProCouponController extends BaseController
{
    @Autowired
    private IProCouponService proCouponService;

    /**
     * 查询优惠卷管理列表
     */
    @PostMapping("/list")
    public TableDataInfo list(ProCoupon proCoupon, HttpServletRequest request)
    {
//        startPage();
        String token = request.getHeader(TokenUtils.getAppTokenHeader());
        Long userId = Long.valueOf(TokenUtils.parseToken(token).getSubject());//获取用户ID
        proCoupon.setUserId(userId);
        List<ProCoupon> list = proCouponService.selectProCouponList(proCoupon);
        return getDataTable(list);
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

}
