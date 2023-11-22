package com.estore.common.utils.im;

import com.alibaba.fastjson2.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.estore.common.core.redis.RedisCache;
import com.estore.common.utils.http.HttpUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * description: TencentCloudImUtil <br>
 * date: 2022/6/9 17:29 <br>
 * author: 18721 <br>
 * version: 1.0 <br>
 */
@Slf4j
@Component
public class TencentCloudImUtil {

    private static  final String base = "dd";
    private static final String HTTPS_URL_PREFIX = "https://console.tim.qq.com/";
    private static final String APP_MANAGER = "administrator";
    private static final String REDIS_IM_USER_SIG = "silence:im_user_sig:";

    private long sdkAppId = 1600006726;

    private String key = "0b4064ab4196c18ae8741bf2973a03766eed46eecbaf6d7932628b26e4720830";

    @Autowired
    private RedisCache redisCache;

//
//    @Autowired
//	private RedisUtil redisUtil;

    /**
     * 获取管理员
     */
    public String getTxCloudUserSig() {
        String userSig = (String) redisCache.getCacheObject(base+REDIS_IM_USER_SIG + APP_MANAGER);
        if (StringUtils.isEmpty(userSig)) {
            TLSSigAPIv2 tlsSigApi = new TLSSigAPIv2(sdkAppId, key);
            userSig = tlsSigApi.genUserSig(APP_MANAGER, 86400);
            redisCache.setCacheObject(base + REDIS_IM_USER_SIG + APP_MANAGER, userSig, 86400, TimeUnit.SECONDS);
            log.info("签名 {}",userSig);
        }
        log.info("签名 {}",userSig);
        return userSig;
    }

    /**
     * 获取用户签名
     */
    public String getTxCloudUserSig(String userId) {
        String userSig = (String) redisCache.getCacheObject(base+REDIS_IM_USER_SIG + userId);
        if (StringUtils.isEmpty(userSig)) {
            TLSSigAPIv2 tlsSigApi = new TLSSigAPIv2(sdkAppId, key);
            userSig = tlsSigApi.genUserSig(userId, 86400);
            redisCache.setCacheObject(base + REDIS_IM_USER_SIG + userId, userSig, 86400, TimeUnit.SECONDS);
            log.info("签名 {}",userSig);
        }
        log.info("签名 {}",userSig);
        return userSig;
    }

    /**
     * 获取腾讯im请求路径
     */
    private String getHttpsUrl(String imServiceApi, Integer random) {
        return String.format("%s%s?sdkappid=%s&identifier=%s&usersig=%s&random=%s&contenttype=json",
            HTTPS_URL_PREFIX, imServiceApi, sdkAppId, APP_MANAGER, this.getTxCloudUserSig(), random);
    }

    /**
     * 导入单个账号
     * @param userId 用户id
     */
    public void accountImport(String userId) {
        accountImport(userId, null);
    }

    public void accountImport(String userId, String userName) {
        accountImport(userId, userName, null);
    }

    public void accountImport(String userId, String userName, String faceUrl) {
        Integer random = RandomUtils.nextInt(0, 999999999);
        String httpsUrl = getHttpsUrl(TencentCloudImApiConstant.AccountManage.ACCOUNT_IMPORT, random);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("Identifier", userId);
        if (StringUtils.isNotEmpty(userName)) {
            jsonObject.put("Nick", userName);
        }
        if (StringUtils.isNotEmpty(faceUrl)) {
            jsonObject.put("FaceUrl", faceUrl);
        }
        log.info("腾讯云im导入单个账号，请求参数：{}", jsonObject.toString());
//        String result = HttpUtil.doPost2(httpsUrl, jsonObject);
        String result = HttpUtils.sendPost(httpsUrl, jsonObject.toString());
        log.info("腾讯云im导入单个账号，返回结果：{}", result);
    }

    /**修改用户信息
     *
     */
    public void updateImport(Map<String,Object> map) {
        String userId = String.valueOf(map.get("userId"));
        String nickName = String.valueOf(map.get("nickName"));
        String avatarImage = String.valueOf(map.get("avatarImage"));

        ObjectMapper mapper = new ObjectMapper();
        Integer random = RandomUtils.nextInt(0, 999999999);
        String httpsUrl = getHttpsUrl(TencentCloudImApiConstant.PortraitManage.PORTRAIT_SET, random);
        JSONObject jsonObject = new JSONObject();
//        jsonObject.put("Random", random);//随机数
        List<JSONObject> body = new ArrayList<>();
        JSONObject bodyData = new JSONObject();
        bodyData.put("Tag","Tag_Profile_IM_Nick");//昵称
        bodyData.put("Value",nickName);//头像
        body.add(bodyData);
        bodyData.put("Tag","Tag_Profile_IM_Image");//头像
        bodyData.put("Value",avatarImage);//头像
        body.add(bodyData);
        jsonObject.put("From_Account", userId);//用户ID
        jsonObject.put("ProfileItem", body);

//        log.info("腾讯云im创建群组，请求参数：{}", jsonObject.toString());
//        String result = HttpUtil.doPost2(httpsUrl, jsonObject);
        String result = HttpUtils.sendPost(httpsUrl, jsonObject.toString());

//        log.info("腾讯云im创建群组，返回结果：{}", result);
        Map<String, Object> resmap = null;
        try {
            resmap = mapper.readValue(result, Map.class);
            if("0".equals(String.valueOf(resmap.get("ErrorCode")))){
                System.err.println(resmap.get("ErrorCode"));
                System.err.println("成功");
            }
            System.err.println(resmap.get("ErrorCode"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 导入多个账号
     * @param userIds 用户id集合
     */
    public void multiAccountImport(List<String> userIds) {
        Integer random = RandomUtils.nextInt(0, 999999999);
        String httpsUrl = getHttpsUrl(TencentCloudImApiConstant.AccountManage.MULTI_ACCOUNT_IMPORT, random);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("Accounts", userIds);
//        log.info("腾讯云im导入多个账号，请求参数：{}", jsonObject.toString());
//        String result = HttpUtil.doPost2(httpsUrl, jsonObject);
        String result = HttpUtils.sendPost(httpsUrl, jsonObject.toString());

//        log.info("腾讯云im导入单个账户，返回结果：{}", result);
    }

    /**
     * 删除账号
     * @param userIds 用户id集合
     */
    public void accountDelete(List<String> userIds) {
        Integer random = RandomUtils.nextInt(0, 999999999);
        String httpsUrl = getHttpsUrl(TencentCloudImApiConstant.AccountManage.ACCOUNT_DELETE, random);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("DeleteItem", getUserIdJsonList(userIds));
//        log.info("腾讯云im删除账号，请求参数：{}", jsonObject.toString());
//        String result = HttpUtil.doPost2(httpsUrl, jsonObject);
        String result = HttpUtils.sendPost(httpsUrl, jsonObject.toString());

//        log.info("腾讯云im删除账户，返回结果：{}", result);
    }

    /**
     * 查询账号是否已经导入im
     * @param userIds 用户id集合
     */
    public String accountCheck(List<String> userIds) {
        Integer random = RandomUtils.nextInt(0, 999999999);
        String httpsUrl = getHttpsUrl(TencentCloudImApiConstant.AccountManage.ACCOUNT_CHECK, random);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("CheckItem", getUserIdJsonList(userIds));
//        log.info("腾讯云im查询账号，请求参数：{}", jsonObject.toString());
//        String result = HttpUtil.doPost2(httpsUrl, jsonObject);
        String result = HttpUtils.sendPost(httpsUrl, jsonObject.toString());

//        log.info("腾讯云im查询账号，返回结果：{}", result);
        return result;
    }

    private List<JSONObject> getUserIdJsonList(List<String> userIds) {
        return userIds.stream().map(v -> {
            JSONObject userIdJson = new JSONObject();
            userIdJson.put("UserID", v);
            return userIdJson;
        }).collect(Collectors.toList());
    }

    /**
     * 单发单聊消息
     * @param syncOtherMachine 是否同步消息到发送方（1-同步，2-不同步）
     * @param fromUserId 发送方用户id
     * @param toUserId 接收方用户id
     * @param msgType 消息对象类型
     * @param msgContent 消息内容
     */
    public String sendMsg(Integer syncOtherMachine, String fromUserId, String toUserId, String msgType, String msgContent) {
        Integer random = RandomUtils.nextInt(0, 999999999);
        String httpsUrl = getHttpsUrl(TencentCloudImApiConstant.SingleChatManage.SEND_MSG, random);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("SyncOtherMachine", syncOtherMachine);
        if (StringUtils.isNotEmpty(fromUserId)) {
            // 发送方不为空表示指定发送用户，为空表示为管理员发送消息
            jsonObject.put("From_Account", fromUserId);
        }
        jsonObject.put("To_Account", toUserId);
        jsonObject.put("MsgRandom", random);
        List<JSONObject> msgBody = getMsgBody(msgType, msgContent);
        jsonObject.put("MsgBody", msgBody);
//        log.info("腾讯云im单发单聊消息，请求参数：{}", jsonObject.toString());
//        String result = HttpUtil.doPost2(httpsUrl, jsonObject);
        String result = HttpUtils.sendPost(httpsUrl, jsonObject.toString());

//        log.info("腾讯云im单发单聊消息，返回结果：{}", result);
        return result;
    }

    /**
     * 批量发单聊消息
     * @param syncOtherMachine 是否同步消息到发送方（1-同步，2-不同步）
     * @param fromUserId 发送方用户id
     * @param toUserIds 接收方用户id集合
     * @param msgType 消息对象类型
     * @param msgContent 消息内容
     */
    public String batchSendMsg(Integer syncOtherMachine, String fromUserId, List<String> toUserIds, String msgType, String msgContent) {
        Integer random = RandomUtils.nextInt(0, 999999999);
        String httpsUrl = getHttpsUrl(TencentCloudImApiConstant.SingleChatManage.BATCH_SEND_MSG, random);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("SyncOtherMachine", syncOtherMachine);
        if (StringUtils.isNotEmpty(fromUserId)) {
            // 发送方不为空表示指定发送用户，为空表示为管理员发送消息
            jsonObject.put("From_Account", fromUserId);
        }
        jsonObject.put("To_Account", toUserIds);
        jsonObject.put("MsgRandom", random);
        List<JSONObject> msgBody = getMsgBody(msgType, msgContent);
        jsonObject.put("MsgBody", msgBody);
//        log.info("腾讯云im批量发单聊消息，请求参数：{}", jsonObject.toString());
//        String result = HttpUtil.doPost2(httpsUrl, jsonObject);
        String result = HttpUtils.sendPost(httpsUrl, jsonObject.toString());

//        log.info("腾讯云im批量发单聊消息，返回结果：{}", result);
        return result;
    }


    /**
     * 拼接发送消息内容
     * @param msgType 消息类型
     * @param msgContent 发送消息内容
     * @return 消息内容
     */
    private List<JSONObject> getMsgBody(String msgType, String msgContent) {
        List<JSONObject> msgBody = new ArrayList<>();
        if (msgType.equals(TencentCloudImConstant.TIM_TEXT_ELEM)) {
            // 文本类型
            JSONObject msgBodyJson = new JSONObject();
            msgBodyJson.put("MsgType", msgType);
            JSONObject msgContentObj = new JSONObject();
            msgContentObj.put("Text", msgContent);
            msgBodyJson.put("MsgContent", msgContentObj);
            msgBody.add(msgBodyJson);
        }
        return msgBody;
    }

    /**
     * 查询单聊消息
     * @param fromUserId 发送方用户id
     * @param toUserId 接收方用户id
     * @param maxCnt 查询条数
     * @param startTime 起始时间（单位：秒）
     * @param endTime 结束时间（单位：秒）
     * @param lastMsgKey 最后一条消息的 MsgKey
     * @return 单聊消息列表
     */
    public String adminGetRoamMsg(String fromUserId, String toUserId, Integer maxCnt, Long startTime, Long endTime, String lastMsgKey) {
        Integer random = RandomUtils.nextInt(0, 999999999);
        String httpsUrl = getHttpsUrl(TencentCloudImApiConstant.SingleChatManage.ADMIN_GET_ROAM_MSG, random);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("From_Account", fromUserId);
        jsonObject.put("To_Account", toUserId);
        jsonObject.put("MaxCnt", maxCnt);
        jsonObject.put("MinTime", startTime);
        jsonObject.put("MaxTime", endTime);
        if (StringUtils.isNotEmpty(lastMsgKey)){
            jsonObject.put("LastMsgKey", lastMsgKey);
        }
//        log.info("腾讯云im查询单聊消息，请求参数：{}", jsonObject.toString());
//        String result = HttpUtil.doPost2(httpsUrl, jsonObject);
        String result = HttpUtils.sendPost(httpsUrl, jsonObject.toString());
//        log.info("腾讯云im查询单聊消息，返回结果：{}", result);
        return result;
    }

    /**
     * 撤回单聊消息
     * @param fromUserId 发送方用户id
     * @param toUserId 接收方用户id
     * @param msgKey MsgKey
     */
    public void adminMsgWithDraw(String fromUserId, String toUserId, String msgKey) {
        Integer random = RandomUtils.nextInt(0, 999999999);
        String httpsUrl = getHttpsUrl(TencentCloudImApiConstant.SingleChatManage.ADMIN_MSG_WITH_DRAW, random);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("From_Account", fromUserId);
        jsonObject.put("To_Account", toUserId);
        jsonObject.put("MsgKey", msgKey);
//        log.info("腾讯云im撤回单聊消息，请求参数：{}", jsonObject.toString());
//        String result = HttpUtil.doPost2(httpsUrl, jsonObject);
        String result = HttpUtils.sendPost(httpsUrl, jsonObject.toString());

//        log.info("腾讯云im撤回单聊消息，返回结果：{}", result);
    }

    /**
     * 设置单聊消息已读
     * @param reportUserId 读取消息的用户
     * @param peerUserId 发送消息的用户
     */
    public void adminSetMsgRead(String reportUserId, String peerUserId) {
        Integer random = RandomUtils.nextInt(0, 999999999);
        String httpsUrl = getHttpsUrl(TencentCloudImApiConstant.SingleChatManage.ADMIN_SET_MSG_READ, random);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("Report_Account", reportUserId);
        jsonObject.put("Peer_Account", peerUserId);
//        log.info("腾讯云im设置单聊消息已读，请求参数：{}", jsonObject.toString());
//        String result = HttpUtil.doPost2(httpsUrl, jsonObject);
        String result = HttpUtils.sendPost(httpsUrl, jsonObject.toString());
//        log.info("腾讯云im设置单聊消息已读，返回结果：{}", result);
    }

    /**
     * 创建群组
     * @param userId
     * @param userName
     * @return
     */
    public String createGroup(String userId, String userName) {
    	ObjectMapper mapper = new ObjectMapper();
        Integer random = RandomUtils.nextInt(0, 999999999);
        String httpsUrl = getHttpsUrl(TencentCloudImApiConstant.GroupManage.CREATE_GROUP, random);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("Identifier", userId);
        jsonObject.put("Owner_Account", userId);
        if (StringUtils.isNotEmpty(userName)) {
            jsonObject.put("Name", userName);
        }
        jsonObject.put("Type", "Public");
       
//        log.info("腾讯云im创建群组，请求参数：{}", jsonObject.toString());
//        String result = HttpUtil.doPost2(httpsUrl, jsonObject);
        String result = HttpUtils.sendPost(httpsUrl, jsonObject.toString());

//        log.info("腾讯云im创建群组，返回结果：{}", result);
        Map<String, Object> resmap = null;
		try {
			resmap = mapper.readValue(result, Map.class);
			if("0".equals(String.valueOf(resmap.get("ErrorCode")))){
				return String.valueOf(resmap.get("GroupId"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
    }

    /**
     * 添加成成员
     * @param groupId
     * @param userIds
     */
    public void addGroupMember(String groupId, List<String> userIds) {
        ObjectMapper mapper = new ObjectMapper();
        Integer random = RandomUtils.nextInt(0, 999999999);
        String httpsUrl = getHttpsUrl(TencentCloudImApiConstant.GroupManage.ADD_GROUP_MEMBER, random);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("GroupId", groupId);//群组id
        List<Map<String,String>> userList = new ArrayList<>();
        for (String userId : userIds) {
            Map<String,String> map = new HashMap<>();
            map.put("Member_Account",userId);
            userList.add(map);
        }
        jsonObject.put("MemberList", userList);//群中人

//        log.info("腾讯云im创建群组，请求参数：{}", jsonObject.toString());
//        String result = HttpUtil.doPost2(httpsUrl, jsonObject);
        String result = HttpUtils.sendPost(httpsUrl, jsonObject.toString());

//        log.info("腾讯云im创建群组，返回结果：{}", result);
        Map<String, Object> resmap = null;
        try {
            resmap = mapper.readValue(result, Map.class);
            if("0".equals(String.valueOf(resmap.get("ErrorCode")))){
                System.err.println(resmap.get("ErrorCode"));
                System.err.println("成功");
            }
            System.err.println(resmap.get("ErrorCode"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 发送群聊消息
     * @param groupId
     * @param userId
     * @param msgType
     * @param msgContent
     */
    public void sendGroupMsg(String groupId,String userId,String msgType,String msgContent) {
        ObjectMapper mapper = new ObjectMapper();
        Integer random = RandomUtils.nextInt(0, 999999999);
        String httpsUrl = getHttpsUrl(TencentCloudImApiConstant.GroupManage.SEND_GROUP_MSG, random);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("GroupId", groupId);//群组id
        jsonObject.put("From_Account", userId);//消息发送者
        jsonObject.put("Random", random);//随机数

        List<JSONObject> msgBody = getMsgBody(msgType, msgContent);
        jsonObject.put("MsgBody", msgBody);

//        log.info("腾讯云im创建群组，请求参数：{}", jsonObject.toString());
//        String result = HttpUtil.doPost2(httpsUrl, jsonObject);
        String result = HttpUtils.sendPost(httpsUrl, jsonObject.toString());

//        log.info("腾讯云im创建群组，返回结果：{}", result);
        Map<String, Object> resmap = null;
        try {
            resmap = mapper.readValue(result, Map.class);
            if("0".equals(String.valueOf(resmap.get("ErrorCode")))){
                System.err.println(resmap.get("ErrorCode"));
                System.err.println("成功");
            }
            System.err.println(resmap.get("ErrorCode"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取群聊下的成员列表 资料
     * @param map
     */
    public List<Map<String, Object>> getGroupUserList(Map<String,Object> map) {
        String groupId = String.valueOf(map.get("groupId"));

        ObjectMapper mapper = new ObjectMapper();
        Integer random = RandomUtils.nextInt(0, 999999999);
        String httpsUrl = getHttpsUrl(TencentCloudImApiConstant.GroupManage.GET_GROUP_MEMBER_INFO, random);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("GroupId", groupId);//群组id
        if (map.containsKey("limit")){
            Integer limit = Integer.parseInt(String.valueOf(map.get("limit")));
            jsonObject.put("Limit", limit);//群组id
        }

        //需要获取的信息 不传则全部信息
        jsonObject.put("MemberInfoFilter",
                new String[]{
                "Member_Account",
                "Role",
                "JoinTime"
//                "MsgSeq",
//                "MsgFlag",
//                "LastSendMsgTime",
//                "MuteUntil",
//                "NameCard"
        });//群组id


//        log.info("腾讯云im创建群组，请求参数：{}", jsonObject.toString());
//        String result = HttpUtil.doPost2(httpsUrl, jsonObject);
        String result = HttpUtils.sendPost(httpsUrl, jsonObject.toString());

//        log.info("腾讯云im创建群组，返回结果：{}", result);
        Map<String, Object> resmap = null;
        try {
            resmap = mapper.readValue(result, Map.class);
            if("0".equals(String.valueOf(resmap.get("ErrorCode")))){
                List<Map<String,Object>> userList = (List<Map<String,Object>>)resmap.get("MemberList");
                return userList;
            }
            System.err.println(resmap.get("ErrorCode"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    
    //会话列表
    public List<Map<String,Object>> getList(String userId) {
    	List<Map<String,Object>> list=new ArrayList<>();
    	ObjectMapper mapper = new ObjectMapper();
        Integer random = RandomUtils.nextInt(0, 999999999);
        String httpsUrl = getHttpsUrl(TencentCloudImApiConstant.recentcontact.GET_LIST, random);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("From_Account", userId);
        jsonObject.put("TimeStamp", 0);
        jsonObject.put("StartIndex", 0);
        jsonObject.put("TopTimeStamp", 0);
        jsonObject.put("TopStartIndex", 0);
        jsonObject.put("AssistFlags", 0);
       
//        log.info("腾讯云im会话列表，请求参数：{}", jsonObject.toString());
        String result = HttpUtils.sendPost(httpsUrl, jsonObject.toString());
//        log.info("腾讯云im会话列表，返回结果：{}", result);
        Map<String, Object> resmap = null;
		try {
			resmap = mapper.readValue(result, Map.class);
			if("0".equals(String.valueOf(resmap.get("ErrorCode")))){
				if(resmap.containsKey("SessionItem")){
					list=(List<Map<String, Object>>) resmap.get("SessionItem");
				}
				
				return list;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
    }
}
