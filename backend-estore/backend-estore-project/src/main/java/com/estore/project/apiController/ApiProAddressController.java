package com.estore.project.apiController;

import com.estore.common.annotation.Anonymous;
import com.estore.common.core.controller.BaseController;
import com.estore.common.core.domain.AjaxResult;
import com.estore.common.core.page.TableDataInfo;
import com.estore.project.domain.ProAddress;
import com.estore.project.service.IProAddressService;
import com.estore.project.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 地址管理Controller
 * 
 * @author zhang
 * @date 2023-11-07
 */
@Anonymous
@RestController
@RequestMapping("/api/proaddress")
public class ApiProAddressController extends BaseController
{
    @Autowired
    private IProAddressService proAddressService;

    /**
     * 查询用户地址列表
     */
    @PostMapping("/list")
    public TableDataInfo list(ProAddress proAddress,HttpServletRequest request)
    {
//        startPage();
        String token = request.getHeader(TokenUtils.getAppTokenHeader());
        Long userId = Long.valueOf(TokenUtils.parseToken(token).getSubject());//获取用户ID
        proAddress.setUserId(userId);
        List<ProAddress> list = proAddressService.selectProAddressList(proAddress);
        return getDataTable(list);
    }

    /**
     * 查询用户默认
     */
    @PostMapping("/getByDefault")
    public AjaxResult getByDefault(ProAddress proAddress,HttpServletRequest request)
    {
//        startPage();
        String token = request.getHeader(TokenUtils.getAppTokenHeader());
        Long userId = Long.valueOf(TokenUtils.parseToken(token).getSubject());//获取用户ID
        return proAddressService.getByDefault(userId);
    }

    /**
     * 获取用户地址详细信息
     */
    @PostMapping(value = "/getById")
    public AjaxResult getInfo(@RequestBody Map<String,Object> map)
    {
        Long addressId = Long.parseLong(String.valueOf(map.get("addressId")));
        return success(proAddressService.selectProAddressByAddressId(addressId));
    }

    /**
     * 新增用户地址
     */
    @PostMapping("/add")
    public AjaxResult add(@Valid @RequestBody ProAddress proAddress, HttpServletRequest request)
    {
        String token = request.getHeader(TokenUtils.getAppTokenHeader());
        Long userId = Long.valueOf(TokenUtils.parseToken(token).getSubject());//获取用户ID
        proAddress.setUserId(userId);
        return toAjax(proAddressService.insertProAddress(proAddress));
    }

    /**
     * 修改用户地址
     */
    @PostMapping("/update")
    public AjaxResult edit(@RequestBody ProAddress proAddress,HttpServletRequest request)
    {
        String token = request.getHeader(TokenUtils.getAppTokenHeader());
        Long userId = Long.valueOf(TokenUtils.parseToken(token).getSubject());//获取用户ID
        proAddress.setUserId(userId);
        return toAjax(proAddressService.updateProAddress(proAddress));
    }

    /**
     * 删除用户地址
     */
    @PostMapping("/deletes")
    public AjaxResult remove(@RequestBody Map<String,Object> map)
    {
        ArrayList<Integer> ids = (ArrayList<Integer>) map.get("ids");
        //流转换Java 8的Stream API来实现转换。它首先通过stream()方法将ArrayList转换为Stream对象，然后使用map()方法将每个Integer对象转换为Long对象
        Long[] longArray = ids.stream().map(Integer::longValue).toArray(Long[]::new);
        return toAjax(proAddressService.deleteProAddressByAddressIds(longArray));
    }
}
