package com.estore.common.utils.dx;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.estore.common.core.domain.AjaxResult;

import java.util.HashMap;
import java.util.Map;

public class MessageUtils {

    private final static String dxApikey= "fa5edc36e74f4ae89b879a2cd3ed4286";

    private final static String dxUserid ="352517";

    private final static String dxUrl= "http://115.28.96.167:8081/api/sms/send";


    public static Map<String,Object> getMessage(Map<String,Object> map){
        Map<String,Object> respMap = new HashMap<>();
        String phone = "";
        if (map.containsKey("phone")) {
            phone = String.valueOf(map.get("phone"));
        } else {
            return AjaxResult.error("电话号码不能为空");
        }
        ObjectMapper mapper = new ObjectMapper();
        Long ts = System.currentTimeMillis();
        String strNum = String.valueOf(Math.floor(Math.random() * 500000 + 500000));
        String str = strNum.substring(0, strNum.indexOf('.'));
        String msgContent = "【鑫泽商城】您的验证码:" + str;
        Map<String, String> paras = new HashMap<String, String>();
        paras.put("userid", dxUserid);// 用户id
        paras.put("ts", ts.toString());
        paras.put("sign", SecurityUtil.md5enc(dxUserid + ts + dxApikey).toLowerCase());
        paras.put("mobile", phone);
        paras.put("msgcontent", msgContent);
//        HttpUtils.sendPost(dxUrl,paras);
        String result = HttpClientUtil.requestAsHttpPOST(dxUrl, paras,"utf-8", 10000, 20000);
        System.out.println(result);
        Map<String, Object> resmap = null;
        try {
            resmap = mapper.readValue(result, Map.class);
            respMap.put("message",str);
//            redisCache.setCacheObject(phone,str,1600, TimeUnit.SECONDS);
//            redisTemplate.opsForValue().set(phone,str,1600);
            return respMap;
        } catch (Exception e) {
            return AjaxResult.success("发送失败");
        }
    }
}
