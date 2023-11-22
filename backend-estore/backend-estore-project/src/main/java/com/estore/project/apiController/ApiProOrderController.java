package com.estore.project.apiController;

import com.estore.common.annotation.Anonymous;
import com.estore.common.core.controller.BaseController;
import com.estore.common.core.domain.AjaxResult;
import com.estore.common.core.page.TableDataInfo;
import com.estore.project.domain.ProOrder;
import com.estore.project.service.IProOrderService;
import com.estore.project.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 订单管理Controller
 * 
 * @author zhang
 * @date 2023-11-03
 */
@Anonymous
@RestController
@RequestMapping("/api/order")
public class ApiProOrderController extends BaseController
{
    @Autowired
    private IProOrderService proOrderService;

    /**
     * 查询订单管理列表
     */
    @PostMapping("/list")
    public TableDataInfo list(@RequestBody(required = false) ProOrder proOrder,HttpServletRequest request)
    {
        if (proOrder==null)
            proOrder = new ProOrder();
        String token = request.getHeader(TokenUtils.getAppTokenHeader());
        Long userId = Long.valueOf(TokenUtils.parseToken(token).getSubject());//获取用户ID
        proOrder.setUserId(userId);
        List<ProOrder> list = proOrderService.selectProOrderList(proOrder);
        return getDataTable(list);
    }

    /**
     * 获取订单管理详细信息
     */
    @PostMapping(value = "/getById")
    public AjaxResult getInfo(@RequestBody Map<String,Object> map)
    {
        String orderId = String.valueOf(map.get("orderId"));
        return success(proOrderService.selectProOrderByOrderId(orderId));
    }

    /**
     * 支付订单
     */
    @PostMapping("/payOrder")
    public AjaxResult payOrder(@RequestBody ProOrder proOrder, HttpServletRequest request)
    {
        String token = request.getHeader(TokenUtils.getAppTokenHeader());
        Long userId = Long.valueOf(TokenUtils.parseToken(token).getSubject());//获取用户ID
        proOrder.setUserId(userId);
        return proOrderService.payOrder(proOrder);
    }

    /**
     * 购物车订单
     * @param map
     * @param request
     * @return
     */
    @PostMapping("/verifyShopping")
    public AjaxResult verifyShopping(@RequestBody Map<String,Object> map,HttpServletRequest request){
        String token = request.getHeader(TokenUtils.getAppTokenHeader());
        Long userId = Long.valueOf(TokenUtils.parseToken(token).getSubject());//获取用户ID
        map.put("userId",userId);
        return proOrderService.verifyShopping(map);
    }

    /**
     * 删除订单管理
     */
    @PostMapping("/delete")
    public AjaxResult remove(@RequestBody Map<String,Object> map)
    {
        String orderId = (String) map.get("orderId");
        return toAjax(proOrderService.deleteProOrderByOrderId(orderId));
    }

}
