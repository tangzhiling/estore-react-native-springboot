package com.estore.project.service.impl;

import java.util.List;

import com.estore.common.core.domain.AjaxResult;
import com.estore.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.estore.project.mapper.ProAddressMapper;
import com.estore.project.domain.ProAddress;
import com.estore.project.service.IProAddressService;

/**
 * 地址管理Service业务层处理
 * 
 * @author zhang
 * @date 2023-11-07
 */
@Service
public class ProAddressServiceImpl implements IProAddressService 
{
    @Autowired
    private ProAddressMapper proAddressMapper;

    /**
     * 查询地址管理
     * 
     * @param addressId 地址管理主键
     * @return 地址管理
     */
    @Override
    public ProAddress selectProAddressByAddressId(Long addressId)
    {
        return proAddressMapper.selectProAddressByAddressId(addressId);
    }

    /**
     * 查询地址管理列表
     * 
     * @param proAddress 地址管理
     * @return 地址管理
     */
    @Override
    public List<ProAddress> selectProAddressList(ProAddress proAddress)
    {
        return proAddressMapper.selectProAddressList(proAddress);
    }

    /**
     * 新增地址管理
     * 
     * @param proAddress 地址管理
     * @return 结果
     */
    @Override
    public int insertProAddress(ProAddress proAddress)
    {
        proAddress.setCreateTime(DateUtils.getNowDate());
        if ("1".equals(proAddress.getIsDefault())){
            ProAddress proAddressPram = new ProAddress();
            proAddressPram.setUserId(proAddress.getUserId());
            List<ProAddress> proAddresses = proAddressMapper.selectProAddressList(proAddressPram);
            for (ProAddress address : proAddresses) {
                address.setIsDefault("0");
                proAddressMapper.updateProAddress(address);//更新默认地址状态
            }
        }
        return proAddressMapper.insertProAddress(proAddress);
    }

    /**
     * 修改地址管理
     * 
     * @param proAddress 地址管理
     * @return 结果
     */
    @Override
    public int updateProAddress(ProAddress proAddress)
    {
        if ("1".equals(proAddress.getIsDefault())){
            ProAddress proAddressPram = new ProAddress();
            proAddressPram.setUserId(proAddress.getUserId());
            List<ProAddress> proAddresses = proAddressMapper.selectProAddressList(proAddressPram);
            for (ProAddress address : proAddresses) {
                address.setIsDefault("0");
                proAddressMapper.updateProAddress(address);//更新默认地址状态
            }
        }
        return proAddressMapper.updateProAddress(proAddress);
    }

    /**
     * 批量删除地址管理
     * 
     * @param addressIds 需要删除的地址管理主键
     * @return 结果
     */
    @Override
    public int deleteProAddressByAddressIds(Long[] addressIds)
    {
        return proAddressMapper.deleteProAddressByAddressIds(addressIds);
    }

    /**
     * 删除地址管理信息
     * 
     * @param addressId 地址管理主键
     * @return 结果
     */
    @Override
    public int deleteProAddressByAddressId(Long addressId)
    {
        return proAddressMapper.deleteProAddressByAddressId(addressId);
    }

    /**
     * 查询用户默认地址
     * @param
     * @return 用户地址
     */
    public AjaxResult getByDefault(Long userId){
        ProAddress proAddress = new ProAddress();
        proAddress.setUserId(userId);
        proAddress.setIsDefault("1");
        List<ProAddress> proAddresses = proAddressMapper.selectProAddressList(proAddress);
        if (proAddresses.size()>0)
            return AjaxResult.success(proAddresses.get(0));
        else
            return AjaxResult.success();
    }
}
