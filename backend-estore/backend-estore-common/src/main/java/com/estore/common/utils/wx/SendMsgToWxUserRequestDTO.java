package com.estore.common.utils.wx;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SendMsgToWxUserRequestDTO {
    /**
     * token
     */
    private String accessToken;
    /**
     * 接收方openId
     */
    private String touser;


    private String template_id;

    private String page;

    /**
     * 小程序模板数据
     */
    private Object data;

    private String miniprogram_state;
}
