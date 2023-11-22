package com.estore.project.utils;


import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.estore.common.utils.http.HttpUtils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class GaoDe {

    private static final String key = "92d4057359c07fdebf7632bbf82c71e5";
    private static final String BASE_PATH = "https://restapi.amap.com/v3";

    public static void main(String[] args) {
//        System.out.println(getAddressStr("117.06557", "36.63124"));
//        System.out.println(coordinate("市辖区东城区"));
//        System.out.println(distance("117.076455,36.666412", "117.119995,36.631218"));
//        System.out.println(GetDistance(117.076455, 36.666412, 117.119995, 36.631218)/1000);
    }

    /**
     *
     * @param log 经度
     * @param lat 纬度
     *      *根据经纬度获取省市区
     * @return
     */
    public static String getAddressStr(String log, String lat){
        //lat 小  log  大
        //参数解释: 纬度,经度 采用高德API可参考高德文档https://lbs.amap.com/
        //注意key是在高德开放平台申请的key,具体获得key的步骤请查看网址:https://developer.amap.com/api/webservice/guide/create-project/get-key
//        String key = "84008947ead24d3101fe242c6c49a6e0";
        String parameters="?key="+key;
        parameters+="&location="+log+","+lat;//经纬度坐标
        parameters+="&extensions=true";//返回结果控制，extensions 参数取值为 all 时会返回基本地址信息、附近 POI 内容、道路信息以及道路交叉口信息。
        parameters+="&radius=10";//搜索半径，radius取值范围在0~3000，默认是1000。单位：米
        parameters+="&batch=false";//批量查询控制，batch 参数设置为 false 时进行单点查询，此时即使传入多个经纬度也只返回第一个经纬度的地址解析查询结果。
        parameters+="&roadlevel=0";//道路等级，当 roadlevel = 0 时，显示所有道路
//        String urlString = "https://restapi.amap.com/v3/geocode/regeo?location="+lat+","+log+"&extensions=base&batch=false&roadlevel=0&key="+key;
        String urlString = BASE_PATH+"/geocode/regeo"+parameters;
        StringBuilder res = new StringBuilder();
        try {
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setDoOutput(true);
            conn.setRequestMethod("POST");
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
            String line;
            while ((line = in.readLine()) != null) {
                res.append(line).append("\n");
            }
            in.close();
            //解析结果
            JSONObject jsonObject = JSONObject.parseObject(res.toString());
            System.out.println("jsonObject = " + jsonObject);
            JSONObject jsonObject1 = jsonObject.getJSONObject("regeocode");
            res = new StringBuilder(jsonObject1.getString("formatted_address"));
        } catch (Exception e) {
            System.out.println("获取地址信息异常");
            e.printStackTrace();
            return null;
        }
        System.out.println("通过API获取到具体位置:"+res);
        return res.toString();
    }

    /**
     * 高德地图WebAPI : 地址转化为高德坐标
     * String address：高德地图地址
     * KEY-为地图key,这里的key要申请对应服务的key 一定要选择“web服务”项的key
     * 输入：成都市武侯区
     * 输出：104.043390,30.641982
     */
    public static String coordinate(String address) {
        try {
            address = URLEncoder.encode(address, "utf-8");
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String url = BASE_PATH + "/geocode/geo?address=" + address + "&output=json&key="+ key;
        String coordinateString = null;
        //            String temp= HttpUtils.doGet(url);
        String temp= HttpUtils.sendGet(url);//请求
        JSONObject jsonobject = JSONObject.from(temp);
        JSONArray pathArray = jsonobject.getJSONArray("geocodes");
        coordinateString = pathArray.getJSONObject(0).getString("location");
        return coordinateString;
    }

    /**
     * {经度，纬度}
     * 高德地图WebAPI : 驾车路径规划 计算两地之间行驶的距离(米)
     * String origins:起始坐标
     * String destination:终点坐标
     *输入：原坐标:{116.45925,39.910031}，目标坐标:{116.587922,40.081577}
     *输出：25424
     */
    public static String distance(String origins, String destination) {
        String distanceString = null;
        try {
            String url = BASE_PATH + "/direction/driving?" + "origin=" + origins + "&destination=" + destination
                    + "&output=json"+ "&key="+ key;
//            String aa =HttpClientUtil.doGet(url);
            String aa= HttpUtils.sendGet(url);//请求
            JSONObject jsonobject=JSONObject.from(aa);
            JSONArray pathArray = jsonobject.getJSONObject("route").getJSONArray("paths");
            distanceString = pathArray.getJSONObject(0).getString("distance");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return distanceString;
    }

    /**
     * 默认地球半径
     */
    private static double EARTH_RADIUS = 6371000;//赤道半径(单位m)

    /**
     * 转化为弧度(rad)
     * */
    private static double rad(double d)
    {
        return d * Math.PI / 180.0;
    }
    /**
     * @param lon1 第一点的精度
     * @param lat1 第一点的纬度
     * @param lon2 第二点的精度
     * @param lat2 第二点的纬度
     * @return 返回的距离，单位m
     * */
    public static double GetDistance(double lon1,double lat1,double lon2, double lat2) {
        double radLat1 = rad(lat1);
        double radLat2 = rad(lat2);
        double a = radLat1 - radLat2;
        double b = rad(lon1) - rad(lon2);
        double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) + Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(b / 2), 2)));
        s = s * EARTH_RADIUS;
        s = Math.round(s * 10000) / 10000;
        return s;
    }

    /**
     * @param lon1 第一点的精度
     * @param lat1 第一点的纬度
     * @param lon2 第二点的精度
     * @param lat2 第二点的纬度
     * @return 返回的距离，单位m
     * */
    public static double GetDistance(String lon1,String lat1,String lon2, String lat2) {
        double radLat1 = rad(Double.parseDouble(lat1));
        double radLat2 = rad(Double.parseDouble(lat2));
        double a = radLat1 - radLat2;
        double b = rad(Double.parseDouble(lon1)) - rad(Double.parseDouble(lon2));
        double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) + Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(b / 2), 2)));
        s = s * EARTH_RADIUS;
        s = Math.round(s * 10000) / 10000;
        return s;
    }

}
