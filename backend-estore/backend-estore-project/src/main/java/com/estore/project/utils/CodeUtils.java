//package com.huizu.project.utils;
//
//import com.alibaba.fastjson2.JSON;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.huizu.common.utils.OssUtil;
//import com.huizu.common.utils.http.HttpUtils;
//import org.springframework.http.HttpEntity;
//import org.springframework.http.HttpMethod;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Component;
//import org.springframework.util.LinkedMultiValueMap;
//import org.springframework.util.MultiValueMap;
//import org.springframework.web.client.RestTemplate;
//
//import javax.annotation.Resource;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.Map;
//
//@Component
//public class CodeUtils {
//
//    @Resource
//    private ProUserCodeMapper proUserCodeMapper;
//     //用户端推广
//    static String AppSecret = "7fcbf9bcd26cfc3622371c0d1129e8c5";
//
//    static String APPID= "wx45f86db9e12994b6";
//
//
//    public String getQuery(Map<String, Object> map) {
//        String codeId = String.valueOf(map.get("codeId"));
//        String scene = String.valueOf(map.get("userId"));
//        String skipUrl = String.valueOf(map.get("skipUrl"));
//
//        Map<String, Object> accessToken = getToken(codeId);
//        RestTemplate rest = new RestTemplate();
//        try {
//            String url = "https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token="
//                    + accessToken.get("accessToken");
//            Map<String, Object> param = new HashMap<>();
//            param.put("scene", scene);
//            param.put("page", skipUrl);
//            param.put("width", 430);
//            param.put("auto_color", false);
//            param.put("env_version", "trial");//体验版
//            param.put("check_path",false);
//            Map<String, Object> line_color = new HashMap<>();
//            line_color.put("r", 0);
//            line_color.put("g", 0);
//            line_color.put("b", 0);
//            param.put("line_color", line_color);
//            MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
//            HttpEntity requestEntity = new HttpEntity(param, headers);
//            ResponseEntity<byte[]> entity = rest.exchange(url, HttpMethod.POST, requestEntity, byte[].class,
//                    new Object[0]);
//            System.out.println(entity);
//            byte[] result = entity.getBody();
//            String s = OssUtil.insertByte(result);
//            return s;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
//
//
//    public Map<String, Object> getToken(String codeId) {
//        Map map = new HashMap();
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        System.out.println(codeId);
//        ProUserCode userCode = proUserCodeMapper.selectProUserCodeByOpenId(codeId);
//        System.out.println(userCode);
//
//        if (userCode!=null){
//           map = JSON.parseObject(JSON.toJSONString(userCode), Map.class);
//            if (map.containsKey("accessToken") && !"".equals(map.get("accessToken"))) {
//                try {
//                    Date date = sdf.parse(String.valueOf(map.get("updateTime")));
//                    Date nowDate = new Date();
//                    long interval = (nowDate.getTime() - date.getTime()) / 1000;
//                    if (interval < 500) {
//                        map.put("accessToken",userCode.getAccessToken());
//                    } else {
//                        // 重新获取access_token保存并返回
//                        map.put("accessToken", exchangeAccessToken(map));
//                    }
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//        return map;
//    }
//
//    //更新推广码
//    public String exchangeAccessToken(Map<String, Object> map) {
//        ObjectMapper mapper = new ObjectMapper();
//        ProUserCode proUserCode = new ProUserCode();
//        String access_Token = "";
//        String openId = map.get("openId").toString();//1
//        // 获取access_token的接口地址（GET） 限200（次/天）
//        String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET"
//                .replace("APPID", APPID).replace("APPSECRET", AppSecret);
//        // 获得access_token
//        String str = HttpUtils.sendGet(url, null);
//        // 保存access_token
//        if (str != null) {
//            try{
//                Map<String, Object> resmap = mapper.readValue(str, Map.class);
//                access_Token = resmap.get("access_token").toString();
//                proUserCode.setAccessToken(access_Token);// access_token
//                proUserCode.setExpiresIn(resmap.get("expires_in").toString());// 有效时间
//                Date date = new Date();
//                long time = date.getTime()+1000*60*60*2;
//                proUserCode.setUpdateTime(new Date(time));// 添加时间(或更改时间)
//                proUserCode.setOpenId(openId);
//                proUserCodeMapper.updateProUserCode(proUserCode);
//            }catch(Exception e){
//                e.printStackTrace();
//            }
//        }
//        return access_Token;
//    }
//
//
//}
