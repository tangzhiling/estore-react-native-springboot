package com.estore.common.utils.wx;

import com.alibaba.fastjson2.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class MessageUtil {


    private static final Logger logger = LoggerFactory.getLogger(MessageUtil.class);

    /**
     * 统一服务消息
     * 小程序模板消息,发送服务通知
     *
     * @param token       小程序ACCESS_TOKEN
     * @param touser      用户openid，可以是小程序的openid，也可以是公众号的openid
     * @param template_id 小程序模板消息模板id
     * @param page        小程序页面路径
     * @param formid      小程序模板消息formid
     * @param data        小程序模板消息formid
     *                    //     * @param emphasis_keyword 小程序模板放大关键词
     * @return
     * @author HGL
     */
    public static JSONObject sendWeappMessage(String token, String touser, String template_id, String page, String formid, JSONObject data) {
        JSONObject obj = new JSONObject();
        JSONObject weapp_template_msg = new JSONObject();
        String result = "";
        try {
            String url = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/uniform_send?access_token=" + token;
            weapp_template_msg.put("template_id", template_id);
            weapp_template_msg.put("page", page);
            weapp_template_msg.put("form_id", formid);
            weapp_template_msg.put("data", data);
            weapp_template_msg.put("emphasis_keyword", data.getJSONObject("keyword1").getString("value"));
            obj.put("touser", touser);
            obj.put("weapp_template_msg", weapp_template_msg);
            result = HttpClientUtil2.doPostJson(url, obj.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        JSONObject jsonObject = JSONObject.parseObject(result);
        return jsonObject;
    }
}


//    /**
//     * 统一服务消息
//     * 公众号模板消息,发送公众号通知
//     *
//     * @param openId     用户openid
//     * @param orderNo    订单id
//     * @param price      价格
//     * @param toName     收货人
//     * @param toTel      手机号
//     * @param userRemark 备注
//     * @return
//     */
//    public static JSONObject sendMpMessage(String openId, String orderNo, BigDecimal price, String toName, String toTel, String userRemark) {
//        JSONObject result = new JSONObject();
//        JSONObject obj = new JSONObject();
//        JSONObject mp_template_msg = new JSONObject();
//        JSONObject miniprogram = new JSONObject();
//        try {
//            String path = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/uniform_send?access_token=" + 小程序ACCESS_TOKEN;
//            obj.put("touser", openId);
//            mp_template_msg.put("appid", "公众号appid");
//            mp_template_msg.put("template_id", "公众号模板消息模板id");
//            mp_template_msg.put("url", "pages/index?foo=bar");  //公众号模板消息所要跳转的url
//            miniprogram.put("appid", "所要跳转的小程序appid"); //公众号模板消息所要跳转的小程序appid，小程序的必须与公众号具有绑定关系
//            miniprogram.put("page", "pages/index?foo=bar"); //公众号模板消息所要跳转的小程序页面
//            mp_template_msg.put("miniprogram", miniprogram);
//            Map<String, TemplatData> mapdata = new LinkedHashMap<>();
//            // 封装模板数据
//            TemplatData first = new TemplatData();
//            first.setValue("您有新的订单，请点击查看！");
//            first.setColor("#173177");
//            mapdata.put("first", first);
//
//            TemplatData keyword1 = new TemplatData();
//            keyword1.setValue(orderNo);
//            keyword1.setColor("#173177");
//            mapdata.put("keyword1", keyword1);
//
//            TemplatData keyword2 = new TemplatData();
//            keyword2.setValue(price + "");
//            keyword2.setColor("#173177");
//            mapdata.put("keyword2", keyword2);
//
//            TemplatData keyword3 = new TemplatData();
//            keyword3.setValue(Utils.DateTransition(new Date()));
//            keyword3.setColor("#173177");
//            mapdata.put("keyword3", keyword3);
//
//            TemplatData keyword4 = new TemplatData();
//            keyword4.setValue(toName);
//            keyword4.setColor("#173177");
//            mapdata.put("keyword4", keyword4);
//
//            TemplatData keyword5 = new TemplatData();
//            keyword5.setValue(toTel);
//            keyword5.setColor("#173177");
//            mapdata.put("keyword5", keyword5);
//
//            TemplatData remark = new TemplatData();
//            remark.setValue(userRemark);
//            remark.setColor("#173177");
//            mapdata.put("remark", remark);
//
//            mp_template_msg.put("data", mapdata);
//            obj.put("mp_template_msg", mp_template_msg);
//            logger.info(mp_template_msg.toString());
//            logger.info(obj.toString());
//            result = HttpClientUtil.Post(path, obj);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        logger.info("发送统一服务提醒返回的数据" + result + "，要接收消息的openid:" + openId);
//        return result;
//    }
//}