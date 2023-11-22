package com.estore.common.utils.wx;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;

public class WxUtils {

    //    用户端
    private final static String AppId = "wx45f86db9e12994b6";  //公众平台自己的appId
    private final static String AppSecret="7fcbf9bcd26cfc3622371c0d1129e8c5";  //AppSecret


    /**
     * 根据code获取用户信息 用户
     * @param code
     * @return
     */
    public static Code2sessionResponse getJscode2session(String code){
        //获取openid等值
        String url="https://api.weixin.qq.com/sns/jscode2session?" +
                "appid="+AppId +
                "&secret="+AppSecret +
                "&js_code="+code +
                "&grant_type=authorization_code";
        String jsonData = HttpClientUtil2.doGet(url);
        Code2sessionResponse code2sessionResponse = JSON.parseObject(jsonData, Code2sessionResponse.class);
        if (code2sessionResponse.getAccessToken()==null){
            code2sessionResponse.setAccessToken(getAccessToken());
        }
        return code2sessionResponse;
    }

    /**
     *         //获取access_token 加密token等值
     * @return
     */
    public static String getAccessToken(){
        String urlToken = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential" +
                "&appid="+AppId+
                "&secret=" +AppSecret;
        String s = HttpClientUtil2.doGet(urlToken);
        JSONObject jsonObject = JSONObject.parseObject(s);
        String access_token = (String)jsonObject.get("access_token");
        return access_token;
    }




}
