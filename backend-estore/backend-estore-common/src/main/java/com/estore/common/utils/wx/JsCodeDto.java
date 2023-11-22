package com.estore.common.utils.wx;


/**
 * 微信code返回信息
 */

public class JsCodeDto {
    private String openid;//微信用户的唯一标识
    private String session_key;//会话密钥
    private String unionid;//用户在微信开放平台的唯一标识符。本字段在满足一定条件的情况下才返回。
    private Integer errcode;
    private String errmsg;

    public JsCodeDto() {
    }

    public JsCodeDto(String openid, String session_key, String unionid, Integer errcode, String errmsg) {
        this.openid = openid;
        this.session_key = session_key;
        this.unionid = unionid;
        this.errcode = errcode;
        this.errmsg = errmsg;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getSession_key() {
        return session_key;
    }

    public void setSession_key(String session_key) {
        this.session_key = session_key;
    }

    public String getUnionid() {
        return unionid;
    }

    public void setUnionid(String unionid) {
        this.unionid = unionid;
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
        return "JsCodeDto{" +
                "openid='" + openid + '\'' +
                ", session_key='" + session_key + '\'' +
                ", unionid='" + unionid + '\'' +
                ", errcode=" + errcode +
                ", errmsg='" + errmsg + '\'' +
                '}';
    }
}
