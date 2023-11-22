package com.estore.project.apiController;

import com.estore.common.annotation.Anonymous;
import com.estore.common.core.controller.BaseController;
import com.estore.common.core.domain.AjaxResult;
import com.estore.common.core.page.TableDataInfo;
import com.estore.project.domain.ProShopping;
import com.estore.project.service.IProShoppingService;
import com.estore.project.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 购物车管理Controller
 * 
 * @author zhang
 * @date 2023-11-07
 */
@Anonymous
@RestController
@RequestMapping("/api/proshopping")
public class ApiProShoppingController extends BaseController
{
    @Autowired
    private IProShoppingService proShoppingService;

    /**
     * 查询购物车管理列表
     */
    @PostMapping("/list")
    public TableDataInfo list(ProShopping proShopping, HttpServletRequest request)
    {
        String token = request.getHeader(TokenUtils.getAppTokenHeader());
        Long userId = Long.valueOf(TokenUtils.parseToken(token).getSubject());//获取用户ID
        proShopping.setUserId(userId);
        List<ProShopping> list = proShoppingService.selectProShoppingList(proShopping);
        return getDataTable(list);
    }

    /**
     * 首次加入
     */
    @PostMapping("/addProduct")
    public AjaxResult addProduct(@RequestBody ProShopping proShopping,HttpServletRequest request)
    {
        String token = request.getHeader(TokenUtils.getAppTokenHeader());
        Long userId = Long.valueOf(TokenUtils.parseToken(token).getSubject());//获取用户ID
        proShopping.setUserId(userId);
        return toAjax(proShoppingService.addProduct(proShopping));
    }

    /**
     * 添加
     */
    @PostMapping("/add")
    public AjaxResult add(@RequestBody ProShopping proShopping,HttpServletRequest request)
    {
        String token = request.getHeader(TokenUtils.getAppTokenHeader());
        Long userId = Long.valueOf(TokenUtils.parseToken(token).getSubject());//获取用户ID
        proShopping.setUserId(userId);
        return toAjax(proShoppingService.addApi(proShopping));
    }

    /**
     * 减少
     */
    @PostMapping("/subtract")
    public AjaxResult subtract(@RequestBody ProShopping proShopping,HttpServletRequest request)
    {
        String token = request.getHeader(TokenUtils.getAppTokenHeader());
        Long userId = Long.valueOf(TokenUtils.parseToken(token).getSubject());//获取用户ID
        proShopping.setUserId(userId);
        return toAjax(proShoppingService.subtractApi(proShopping));
    }

    @PostMapping("/deletes")
    public AjaxResult deletes(@RequestBody Map<String,Object> map){
        ArrayList<Integer> ids = (ArrayList<Integer>) map.get("ids");
        //流转换Java 8的Stream API来实现转换。它首先通过stream()方法将ArrayList转换为Stream对象，然后使用map()方法将每个Integer对象转换为Long对象
        Long[] longArray = ids.stream().map(Integer::longValue).toArray(Long[]::new);
        return toAjax(proShoppingService.deleteProShoppingByShoppingIds(longArray));
    }

}
