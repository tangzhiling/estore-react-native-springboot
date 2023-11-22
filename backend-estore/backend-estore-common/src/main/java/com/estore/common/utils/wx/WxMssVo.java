package com.estore.common.utils.wx;

import lombok.Data;

import java.util.Map;

/*
 * 小程序推送所需数据
 * */
@Data
public class WxMssVo {
    private String touser;//用户openid
    private String template_id;//模版id
    private String page = "pages/index/index";//默认跳到小程序首页
//    private String emphasis_keyword = "keyword1.DATA";//放大那个推送字段
    private Map<String, String> data;//推送文字
}