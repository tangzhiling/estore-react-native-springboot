package com.estore.project.service.impl;

import java.util.List;
import com.estore.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.estore.project.mapper.ProCouponMapper;
import com.estore.project.domain.ProCoupon;
import com.estore.project.service.IProCouponService;

/**
 * 优惠卷管理Service业务层处理
 *
 * @author zhang
 * @date 2023-11-04
 */
@Service
public class ProCouponServiceImpl implements IProCouponService
{
    @Autowired
    private ProCouponMapper proCouponMapper;

    /**
     * 查询优惠卷管理
     *
     * @param id 优惠卷管理主键
     * @return 优惠卷管理
     */
    @Override
    public ProCoupon selectProCouponById(Long id)
    {
        return proCouponMapper.selectProCouponById(id);
    }

    /**
     * 查询优惠卷管理列表
     *
     * @param proCoupon 优惠卷管理
     * @return 优惠卷管理
     */
    @Override
    public List<ProCoupon> selectProCouponList(ProCoupon proCoupon)
    {
        return proCouponMapper.selectProCouponList(proCoupon);
    }

    /**
     * 新增优惠卷管理
     *
     * @param proCoupon 优惠卷管理
     * @return 结果
     */
    @Override
    public int insertProCoupon(ProCoupon proCoupon)
    {
        proCoupon.setCreateTime(DateUtils.getNowDate());
        proCoupon.setStatus("1");
        return proCouponMapper.insertProCoupon(proCoupon);
    }

    /**
     * 修改优惠卷管理
     *
     * @param proCoupon 优惠卷管理
     * @return 结果
     */
    @Override
    public int updateProCoupon(ProCoupon proCoupon)
    {
        return proCouponMapper.updateProCoupon(proCoupon);
    }

    /**
     * 批量删除优惠卷管理
     *
     * @param ids 需要删除的优惠卷管理主键
     * @return 结果
     */
    @Override
    public int deleteProCouponByIds(Long[] ids)
    {
        return proCouponMapper.deleteProCouponByIds(ids);
    }

    /**
     * 删除优惠卷管理信息
     *
     * @param id 优惠卷管理主键
     * @return 结果
     */
    @Override
    public int deleteProCouponById(Long id)
    {
        return proCouponMapper.deleteProCouponById(id);
    }
}
