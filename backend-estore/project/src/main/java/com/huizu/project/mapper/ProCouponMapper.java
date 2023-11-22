package com.estore.project.mapper;

import java.util.List;
import com.estore.project.domain.ProCoupon;

/**
 * 优惠卷管理Mapper接口
 *
 * @author zhang
 * @date 2023-11-04
 */
public interface ProCouponMapper
{
    /**
     * 查询优惠卷管理
     *
     * @param id 优惠卷管理主键
     * @return 优惠卷管理
     */
    public ProCoupon selectProCouponById(Long id);

    /**
     * 查询优惠卷管理列表
     *
     * @param proCoupon 优惠卷管理
     * @return 优惠卷管理集合
     */
    public List<ProCoupon> selectProCouponList(ProCoupon proCoupon);

    /**
     * 新增优惠卷管理
     *
     * @param proCoupon 优惠卷管理
     * @return 结果
     */
    public int insertProCoupon(ProCoupon proCoupon);

    /**
     * 修改优惠卷管理
     *
     * @param proCoupon 优惠卷管理
     * @return 结果
     */
    public int updateProCoupon(ProCoupon proCoupon);

    /**
     * 删除优惠卷管理
     *
     * @param id 优惠卷管理主键
     * @return 结果
     */
    public int deleteProCouponById(Long id);

    /**
     * 批量删除优惠卷管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProCouponByIds(Long[] ids);
}
