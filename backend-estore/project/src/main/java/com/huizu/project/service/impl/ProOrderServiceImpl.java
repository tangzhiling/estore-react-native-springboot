package com.estore.project.service.impl;

import java.math.BigDecimal;
import java.util.*;

import com.estore.common.core.domain.AjaxResult;
import com.estore.common.core.redis.RedisCache;
import com.estore.common.exception.ServiceException;
import com.estore.common.utils.DateUtils;
import com.estore.common.utils.SnowFlake;
import com.estore.common.utils.StringUtils;
import com.estore.project.domain.*;
import com.estore.project.mapper.*;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import com.estore.project.service.IProOrderService;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;

/**
 * 订单管理Service业务层处理
 * 
 * @author zhang
 * @date 2023-11-03
 */
@Service
@EnableScheduling
public class ProOrderServiceImpl implements IProOrderService 
{
    @Autowired
    private ProOrderMapper proOrderMapper;

    @Autowired
    private ProOrderChildMapper proOrderChildMapper;

    @Autowired
    private ProCouponMapper proCouponMapper;

    @Autowired
    private ProProductMapper proProductMapper;

    @Autowired
    private ProUserMapper proUserMapper;

    @Autowired
    private ProShoppingMapper shoppingMapper;

    @Autowired
    private ProAddressMapper proAddressMapper;

    @Autowired
    private RedisCache redisCache;

    /**
     * 查询订单管理
     * 
     * @param orderId 订单管理主键
     * @return 订单管理
     */
    @Override
    public ProOrder selectProOrderByOrderId(String orderId)
    {
        ProOrder order = proOrderMapper.selectProOrderByOrderId(orderId);
        ProOrderChild proOrderChildPram = new ProOrderChild();
        proOrderChildPram.setOrderId(order.getOrderId());
        order.setChildList(proOrderChildMapper.selectProOrderChildList(proOrderChildPram));
        return order;
    }

    /**
     * 查询订单管理列表
     * 
     * @param proOrder 订单管理
     * @return 订单管理
     */
    @Override
    public List<ProOrder> selectProOrderList(ProOrder proOrder)
    {
        List<ProOrder> proOrders = proOrderMapper.selectProOrderList(proOrder);
        for (ProOrder order : proOrders) {
            ProOrderChild proOrderChildPram = new ProOrderChild();
            proOrderChildPram.setOrderId(order.getOrderId());
            order.setChildList(proOrderChildMapper.selectProOrderChildList(proOrderChildPram));
        }
        return proOrders;
    }

    /**
     * 新增订单管理
     * 
     * @param proOrder 订单管理
     * @return 结果
     */
    @Override
    public int insertProOrder(ProOrder proOrder)
    {
        proOrder.setCreateTime(DateUtils.getNowDate());
        return proOrderMapper.insertProOrder(proOrder);
    }

    /**
     * 修改订单管理
     * 
     * @param proOrder 订单管理
     * @return 结果
     */
    @Override
    public int updateProOrder(ProOrder proOrder)
    {
        return proOrderMapper.updateProOrder(proOrder);
    }

    /**
     * 批量删除订单管理
     * 
     * @param orderIds 需要删除的订单管理主键
     * @return 结果
     */
    @Override
    public int deleteProOrderByOrderIds(String[] orderIds)
    {
        return proOrderMapper.deleteProOrderByOrderIds(orderIds);
    }

    /**
     * 删除订单管理信息
     * 
     * @param orderId 订单管理主键
     * @return 结果
     */
    @Override
    public int deleteProOrderByOrderId(String orderId)
    {
        return proOrderMapper.deleteProOrderByOrderId(orderId);
    }

    public AjaxResult verifyOrder(ProOrder proOrder){
        return null;
    }

    //设置事务回滚异常防止数据错乱 只对数据库操作生效 redis不生效
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult payOrder(ProOrder proOrder){
        List<ProOrderChild> childList = new ArrayList<>();
        String orderId = String.valueOf(SnowFlake.nextId());
        Long couponId = proOrder.getCouponId();
        ProUser proUser = proUserMapper.selectProUserByUserId(proOrder.getUserId());
        ProCoupon proCoupon = proCouponMapper.selectProCouponById(couponId);
        BigDecimal countPrice = proOrder.getCountPrice();//总金额（优惠后）
        BigDecimal countPrice2 = new BigDecimal(0);

        Long count = proOrder.getCount();
        BigDecimal couponPrice = new BigDecimal(0);//优惠卷优惠金额
        BigDecimal eventsPrice = new BigDecimal(0);//活动优惠的金额
        ProProduct proProduct = proProductMapper.selectProProductByProductId(proOrder.getProductId());
        ProAddress proAddress = proAddressMapper.selectProAddressByAddressId(proOrder.getAddressId());
        if (proAddress==null)
            return AjaxResult.error("请选择正确的地址");
        if (proProduct==null)
            throw new ServiceException("商品已不存在");
        //redis判断库存
        Long productInventory = (Long)redisCache.getCacheObject("productId="+String.valueOf(proProduct.getProductId()));//商品剩余库存
        if (productInventory-count<0)
            return AjaxResult.error("库存不足");

//        if (proProduct.getInventoryCount()-count<0)
//            throw new ServiceException("库存不足");
        eventsPrice = proProduct.getPrice().subtract(proProduct.getEventsPrice());
        countPrice2 = proProduct.getEventsPrice().multiply(BigDecimal.valueOf(count));

        if (proCoupon!=null){
            if ("2".equals(proCoupon.getStatus()))
                return AjaxResult.error("优惠卷已被使用");
            Date newDate = new Date();
            Date activeTime = proCoupon.getActiveTime();
            Date expiredTime = proCoupon.getExpiredTime();
            if (newDate.getTime()<activeTime.getTime())
                throw new ServiceException("优惠卷未到使用时间");
            if (newDate.getTime()>expiredTime.getTime())
                throw new ServiceException("优惠卷已过期");

            if (proCoupon.getCondition().compareTo(countPrice)>0)
                throw new ServiceException("不满足使用金额");
            String[] ranges = proCoupon.getRange().split(",");
            boolean isRange = false;
            for (String range : ranges) {
                if (Long.parseLong(range)==proOrder.getProductId())
                    isRange = true;
            }
            if (!isRange)
                throw new ServiceException("优惠卷不能被此商品使用");
            if ("1".equals(proCoupon.getType())){
                //金额则扣
                couponPrice = proCoupon.getDiscount();
                countPrice2 =  countPrice2.subtract(proCoupon.getDiscount());
                proCoupon.setStatus("1");
                proCouponMapper.updateProCoupon(proCoupon);

            }else if ("2".equals(proCoupon.getType())){
                //比例折扣
                couponPrice = countPrice.subtract(countPrice2.multiply(proCoupon.getDiscount()));
                countPrice2 =  countPrice2.multiply(proCoupon.getDiscount());
                proCoupon.setStatus("2");
                proCouponMapper.updateProCoupon(proCoupon);
            }
        }

        if (countPrice2.compareTo(countPrice)!=0)
            return AjaxResult.error("价格发生变动,请重新下单");
        if (proUser.getBalance().compareTo(countPrice)<0)
            throw new ServiceException("余额不足");
        //商品子集
        ProOrderChild proOrderChild = new ProOrderChild();
        proOrderChild.setProductId(proOrder.getProductId());
        proOrderChild.setCount(proOrder.getCount());
        proOrderChild.setPrice(proProduct.getEventsPrice());//购买时的价格
        proOrderChild.setCountPrice(proOrder.getCountPrice());
        childList.add(proOrderChild);

        proOrder.setOrderId(orderId);
        proOrder.setCountPrice(countPrice);
        proOrder.setEventsPrice(eventsPrice);
        proOrder.setCouponPrice(couponPrice);
        proOrder.setCreateTime(new Date());
        proOrder.setStatus("1");
        proOrder.setChildList(childList);
        //更改库存 只更新redis 稍后定时任务再更新 数据库
        redisCache.setCacheObject("productId="+String.valueOf(proProduct.getProductId()),productInventory-count);

//        proProduct.setInventoryCount(proProduct.getInventoryCount()-1);
//        proProduct.setSalesCount(proProduct.getSalesCount()+1);
//        proProductMapper.updateProProduct(proProduct);

        proUser.setBalance(proUser.getBalance().subtract(countPrice));

        //地址赋值
//        Long productInventory = (Long)redisCache.getCacheObject(String.valueOf(proProduct.getProductId()));//商品剩余库存
        proOrder = addAddRess(proOrder);

        proUserMapper.updateProUser(proUser);
        proOrderMapper.insertProOrder(proOrder);
        insertOrderChild(proOrder);
        return AjaxResult.success("支付成功");
    }

    //设置事务回滚异常防止数据错乱
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult verifyShopping(Map<String,Object> map){
        List<Integer> ids = (List<Integer>) map.get("ids");
        //存取更新库存后的商品
        List<ProProduct> productList = new ArrayList<>();
        List<ProOrderChild> childList = new ArrayList<>();
        BigDecimal countPrice = new BigDecimal(map.get("countPrice").toString());
        BigDecimal countPrice2 = new BigDecimal(0);
        BigDecimal eventsPrice = new BigDecimal(0);
        Long userId = (Long)map.get("userId");//用户ID
        Long addressId = (Long)map.get("addressId");//用户ID

        ProAddress proAddress = proAddressMapper.selectProAddressByAddressId(addressId);
        ProUser proUser = proUserMapper.selectProUserByUserId(userId);

        if (ids.isEmpty())
            return AjaxResult.error("请先在购物车中添加商品");

        if (proAddress==null)
            return AjaxResult.error("请选择正确的地址");

        for (Integer id : ids) {
            ProShopping proShopping = shoppingMapper.selectProShoppingByShoppingId(Long.valueOf(id));
            ProProduct proProduct = proProductMapper.selectProProductByProductId(proShopping.getProductId());
            //再次校验防止超发
//            if (proProduct==null||proProduct.getInventoryCount()-proShopping.getCount()<0)
//                return AjaxResult.error("所选商品中部分商品已删除或库存不足");
            //校验商品
            Long productInventory = (Long)redisCache.getCacheObject("productId="+String.valueOf(proShopping.getProductId()));//商品剩余库存
            if (proProduct==null||productInventory-proShopping.getCount()<0){
                return AjaxResult.error("所选商品中部分商品已删除或库存不足");
            }

            //检验价格变动
            countPrice2 = countPrice2.add(proProduct.getEventsPrice().multiply(BigDecimal.valueOf(proShopping.getCount())));

            proProduct.setInventoryCount(proProduct.getInventoryCount()-proShopping.getCount());
            productList.add(proProduct);

            ProOrderChild proOrderChild = new ProOrderChild();
            proOrderChild.setProductId(proShopping.getProductId());
            proOrderChild.setCount(proShopping.getCount());
            proOrderChild.setCountPrice(proShopping.getCountPrice());
            childList.add(proOrderChild);
        }
        if (countPrice.compareTo(countPrice2)!=0)
            return AjaxResult.error("价格发生变动,请重新下单");
        if (proUser.getBalance().compareTo(countPrice)<0)
            throw new ServiceException("余额不足");
        ProOrder proOrder = new ProOrder();
        String orderId = String.valueOf(SnowFlake.nextId());
        proOrder.setOrderId(orderId);
        proOrder.setCountPrice(countPrice);
        proOrder.setEventsPrice(eventsPrice);
        proOrder.setCouponPrice(new BigDecimal(0));
        proOrder.setCreateTime(new Date());
        proOrder.setStatus("1");
        proOrder.setChildList(childList);
        //更改库存
        for (ProProduct proProduct : productList) {
            //更改库存 只更新redis 稍后定时任务再更新 数据库
            redisCache.setCacheObject("productId="+String.valueOf(proProduct.getProductId()),proProduct.getInventoryCount());
//            proProductMapper.updateProProduct(proProduct);
        }

        //地址赋值
        proOrder = addAddRess(proOrder);

        proUser.setBalance(proUser.getBalance().subtract(countPrice));
        proUserMapper.updateProUser(proUser);
        proOrderMapper.insertProOrder(proOrder);
        insertOrderChild(proOrder);
        return AjaxResult.success("支付成功");
    }

    // 定时任务或异步任务，将 Redis 中的抢购信息同步到数据库
    @Scheduled(fixedRate = 5000) // 每5秒执行一次
    public void synchronizeSeckillToDatabase() {
        System.err.println("进入定时更新库存");
        // 从 Redis 中读取商品信息
        Collection<String> productIds = redisCache.keys("productId=");
        for (String productId : productIds) {
            ProProduct proProduct = proProductMapper.selectProProductByProductId(Long.valueOf(productId));//先查询数据库中的信息
            Long productInventory = (Long)redisCache.getCacheObject("productId="+productId);//redis的库存信息
            if (proProduct!=null){
                if (proProduct.getInventoryCount()>productInventory){
                    proProduct.setInventoryCount(productInventory);
                    proProduct.setSalesCount(proProduct.getSalesCount()+(proProduct.getInventoryCount()-productInventory));
                    proProductMapper.updateProProduct(proProduct);
                }
            }
        }
        // 更新到数据库
    }


    /**
     * 计算一个数组数据是否全在另一个数组
     * @param array1
     * @param array2
     * @return
     */
    public static boolean isAllElementsInSecondArray(int[] array1, int[] array2) {
        for (int i = 0; i < array1.length; i++) {
            if (!ArrayUtils.contains(array2, array1[i])) {
                return false;
            }
        }
        return true;
    }

    /**
     * 添加地址
     * @param
     * @return
     */
    private ProOrder addAddRess(ProOrder proOrder) {
        ProAddress proAddress = proAddressMapper.selectProAddressByAddressId(proOrder.getAddressId());
        if (proAddress == null)
            throw new ServiceException("请选择选择地址");

        proOrder.setName(proAddress.getName());
        proOrder.setPhone(proAddress.getPhone());
        proOrder.setPositionProvince(proAddress.getPositionProvince());
        proOrder.setPositionCity(proAddress.getPositionCity());
        proOrder.setPositionArea(proAddress.getPositionArea());
        proOrder.setDetailsPosition(proAddress.getDetailsPosition());
//        proOrder.setLongitude(proAddress.getLongitude());
//        proOrder.setLatitude(proAddress.getLatitude());
        return proOrder;
    }

    /**
     * 添加订单子集
     * @param proOrder
     * @return
     */
    private Map<String, Object> insertOrderChild(ProOrder proOrder){
        Map<String,Object> respMap = new HashMap<>();
        String orderId = proOrder.getOrderId();
        List<ProOrderChild> childList = proOrder.getChildList();
        if (childList.size()<1)
            throw new ServiceException("请先选择商品");
        for (ProOrderChild proOrderChild : childList) {
            proOrderChild.setOrderId(orderId);
            proOrderChildMapper.insertProOrderChild(proOrderChild);
        }
        return respMap;
    }
}
