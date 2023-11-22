package com.estore.project.config;

import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

public class Main {
    private static final int THREAD_POOL_SIZE = 50;
    private static final int TOTAL_STOCK = 100;
    private static final Semaphore semaphore = new Semaphore(TOTAL_STOCK);
    private static final AtomicInteger remainingStock = new AtomicInteger(TOTAL_STOCK);

    public static void main(String[] args) {
        ExecutorService executorService = Executors.newFixedThreadPool(THREAD_POOL_SIZE);

        // 模拟多个用户发起抢购请求
        for (int i = 1; i <= THREAD_POOL_SIZE; i++) {
            final int userId = i;
            executorService.execute(() -> {
                try {
                    // 尝试获取信号量，如果获取成功表示可以进行抢购
                    if (semaphore.tryAcquire(1, 500, TimeUnit.MILLISECONDS)) {
                        boolean purchaseResult = performPurchase(userId);
                        if (purchaseResult) {
                            System.out.println("User " + userId + " successfully purchased the product.");
                        } else {
                            System.out.println("User " + userId + " failed to purchase. Product out of stock.");
                        }
                    } else {
                        System.out.println("User " + userId + " timed out. Unable to acquire semaphore.");
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } finally {
                    // 释放信号量
                    semaphore.release();
                }
            });
        }

        // 关闭线程池
        executorService.shutdown();
    }

    private static boolean performPurchase(int userId) {
        // 模拟抢购操作，使用AtomicInteger保证库存的原子性
        int stock = remainingStock.decrementAndGet();
        if (stock >= 0) {
            // 执行抢购逻辑，例如生成订单等
            return true;
        } else {
            // 恢复库存
            remainingStock.incrementAndGet();
            return false;
        }
    }
}
