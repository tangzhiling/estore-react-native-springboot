package com.estore.common.utils.wx;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

public class Code2sessionResponse implements Serializable {
    private String openid;
    private String unionid;
    @JsonProperty("session_key")
    private String sessionKey;
    @JsonProperty("access_token")
    private String accessToken;
    private Integer errcode;
    private String errmsg;

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getUnionid() {
        return unionid;
    }

    public void setUnionid(String unionid) {
        this.unionid = unionid;
    }

    public String getSessionKey() {
        return sessionKey;
    }

    public void setSessionKey(String sessionKey) {
        this.sessionKey = sessionKey;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public Integer getErrcode() {
        return errcode;
    }

    public void setErrcode(Integer errcode) {
        this.errcode = errcode;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg;
    }

    @Override
    public String toString() {
        return "Code2sessionResponse{" +
                "openid='" + openid + '\'' +
                ", unionid='" + unionid + '\'' +
                ", sessionKey='" + sessionKey + '\'' +
                ", accessToken='" + accessToken + '\'' +
                ", errcode=" + errcode +
                ", errmsg='" + errmsg + '\'' +
                '}';
    }
}
