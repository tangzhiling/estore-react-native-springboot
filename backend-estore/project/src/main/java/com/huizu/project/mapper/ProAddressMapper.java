package com.estore.project.mapper;

import java.util.List;
import com.estore.project.domain.ProAddress;

/**
 * 地址管理Mapper接口
 * 
 * @author zhang
 * @date 2023-11-07
 */
public interface ProAddressMapper 
{
    /**
     * 查询地址管理
     * 
     * @param addressId 地址管理主键
     * @return 地址管理
     */
    public ProAddress selectProAddressByAddressId(Long addressId);

    /**
     * 查询地址管理列表
     * 
     * @param proAddress 地址管理
     * @return 地址管理集合
     */
    public List<ProAddress> selectProAddressList(ProAddress proAddress);

    /**
     * 新增地址管理
     * 
     * @param proAddress 地址管理
     * @return 结果
     */
    public int insertProAddress(ProAddress proAddress);

    /**
     * 修改地址管理
     * 
     * @param proAddress 地址管理
     * @return 结果
     */
    public int updateProAddress(ProAddress proAddress);

    /**
     * 删除地址管理
     * 
     * @param addressId 地址管理主键
     * @return 结果
     */
    public int deleteProAddressByAddressId(Long addressId);

    /**
     * 批量删除地址管理
     * 
     * @param addressIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProAddressByAddressIds(Long[] addressIds);
}
