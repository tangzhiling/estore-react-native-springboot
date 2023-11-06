## 登录

##### 简要描述

- 无

##### 请求URL

- ```
  http://localhost:8080/prod-api/api/prouser/login
  ```

##### 请求方式

- post

##### Header

| header | 示例值                                                       | 必选 | 类型   | 说明 |
| :----- | :----------------------------------------------------------- | ---- | ------ | ---- |
| token  | eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDMifQ.qctw0dfkidlTGRQVbTSrscAMjm8ugr9FRWiyswP35oGiWkGVyOw8JIxpWDB6yOQK9fjJwUsWSvsE9Q_lSVVXHw | 是   | string | 无   |

##### 请求参数示例

```
{
  "userName": "123456789",
  "password": "123456789"
}
```

##### 请求json字段说明

| 字段名   | 必选 | 类型   | 说明     |
| :------- | :--- | ------ | -------- |
| userName | 是   | string | 用户账号 |
| password | 是   | string | 用户密码 |

##### 成功返回示例

```
{
  "msg": "操作成功",
  "code": 200,
  "data": {
    "user": {
      "createBy": null,
      "createTime": "2023-11-04 09:11:07",
      "updateBy": null,
      "updateTime": null,
      "remark": null,
      "userId": 103,
      "userName": "123456789",
      "nickName": "用户abcd",
      "avatar": null,
      "password": "$2a$10$nOkfQIfVpTzTh23ZEDwGyeYGy6nWmjkj4B0k4jBNfGtakH0BNP1nS",
      "status": "0",
      "password2": null
    },
    "token": "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDMifQ.qctw0dfkidlTGRQVbTSrscAMjm8ugr9FRWiyswP35oGiWkGVyOw8JIxpWDB6yOQK9fjJwUsWSvsE9Q_lSVVXHw"
  }
}
```

##### 成功返回示例的参数说明

| 参数名          | 类型   | 说明     |
| :-------------- | :----- | -------- |
| msg             | string | 无       |
| code            | string | 无       |
| data            | object | 无       |
| user            | object | 用户信息 |
| user.createBy   | object | 无       |
| user.createTime | string | 无       |
| user.updateBy   | object | 无       |
| user.updateTime | object | 无       |
| user.remark     | object | 无       |
| user.userId     | string | 用户ID   |
| user.userName   | string | 用户名   |
| user.nickName   | string | 昵称     |
| user.avatar     | object | 头像     |
| token           | string | 无       |





## 注册

##### 简要描述

- 无

##### 请求URL

- ```
  http://localhost:8080/api/prouser/register
  ```

  

##### 请求方式

- post

##### Header

| header | 示例值                                                       | 必选 | 类型   | 说明 |
| :----- | :----------------------------------------------------------- | ---- | ------ | ---- |
| token  | eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDMifQ.qctw0dfkidlTGRQVbTSrscAMjm8ugr9FRWiyswP35oGiWkGVyOw8JIxpWDB6yOQK9fjJwUsWSvsE9Q_lSVVXHw | 是   | string | 无   |

##### 请求参数示例

```
{
  "userName": "123456789",
  "password": "123456789",
  "password2": "123456789"
}
```

##### 请求json字段说明

| 字段名    | 必选 | 类型   | 说明 |
| :-------- | :--- | ------ | ---- |
| userName  | 是   | string | 账号 |
| password  | 是   | string | 密码 |
| password2 | 是   | string | 密码 |

##### 成功返回示例

```
{
  "msg": "操作成功",
  "code": 200
}
```



## 修改用户信息(需token)

##### 简要描述

- 无

##### 请求URL

- `http://localhost:8080/api/prouser/update`

##### 请求方式

- post

##### Header

| header | 示例值                                                       | 必选 | 类型   | 说明 |
| :----- | :----------------------------------------------------------- | ---- | ------ | ---- |
| token  | eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDMifQ.qctw0dfkidlTGRQVbTSrscAMjm8ugr9FRWiyswP35oGiWkGVyOw8JIxpWDB6yOQK9fjJwUsWSvsE9Q_lSVVXHw | 是   | string | 无   |

##### 请求参数示例

```
{
  "nickName": "修改昵称",
   "avatar":"/profile/upload/2023/11/06/user1.png"
}
```

##### 请求json字段说明

| 字段名   | 必选 | 类型   | 说明 |
| :------- | :--- | ------ | ---- |
| nickName | 是   | string | 昵称 |



## 获取用户信息(需token)

##### 简要描述

- 无

##### 请求URL

- `http://localhost:8080/api/prouser/getById`

##### 请求方式

- post

##### Header

| header | 示例值                                                       | 必选 | 类型   | 说明 |
| :----- | :----------------------------------------------------------- | ---- | ------ | ---- |
| token  | eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDMifQ.qctw0dfkidlTGRQVbTSrscAMjm8ugr9FRWiyswP35oGiWkGVyOw8JIxpWDB6yOQK9fjJwUsWSvsE9Q_lSVVXHw | 是   | string | 无   |

##### 成功返回示例

```
{
  "msg": "操作成功",
  "code": 200,
  "data": {
    "createBy": null,
    "createTime": "2023-11-04 09:11:07",
    "updateBy": null,
    "updateTime": null,
    "remark": null,
    "userId": 103,
    "userName": "123456789",
    "nickName": "修改个昵称哈",
    "avatar": null,
    "password": "$2a$10$nOkfQIfVpTzTh23ZEDwGyeYGy6nWmjkj4B0k4jBNfGtakH0BNP1nS",
    "status": "0",
    "password2": null
  }
}
```

##### 成功返回示例的参数说明

| 参数名    | 类型   | 说明   |
| :-------- | :----- | ------ |
| msg       | string | 无     |
| code      | string | 无     |
| data      | object | 无     |
| userId    | string | 用户ID |
| userName  | string | 用户名 |
| nickName  | string | 昵称   |
| avatar    | object | 头像   |
| password2 | object | 无     |



## 获取优惠卷列表(需token)

##### 简要描述

- 无

##### 请求URL

- `http://localhost:8080/api/procoupon/list`

##### 请求方式

- post

##### Header

| header | 示例值                                                       | 必选 | 类型   | 说明 |
| :----- | :----------------------------------------------------------- | ---- | ------ | ---- |
| token  | eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDMifQ.qctw0dfkidlTGRQVbTSrscAMjm8ugr9FRWiyswP35oGiWkGVyOw8JIxpWDB6yOQK9fjJwUsWSvsE9Q_lSVVXHw | 是   | string | 无   |

##### 成功返回示例

```
{
  "total": 2,
  "rows": [
    {
      "id": 1,
      "userId": 103,
      "status": "1",
      "type": "2",
      "discount": "0.8",
      "condition": "100",
      "activeTime": "2023-11-04",
      "expiredTime": "2023-11-05",
      "range": null,
      "createTime": null
    },
    {
      "id": 2,
      "userId": 103,
      "status": "1",
      "type": "1",
      "discount": "20",
      "condition": "100",
      "activeTime": "2023-11-04",
      "expiredTime": "2023-11-05",
      "range": null,
      "createTime": null
    }
  ],
  "code": 200,
  "msg": "查询成功"
}
```

##### 成功返回示例的参数说明

| 参数名      | 类型   | 说明                       |
| :---------- | :----- | -------------------------- |
| total       | string | 无                         |
| rows        | array  | 无                         |
| id          | string | 优惠卷ID                   |
| userId      | string | 无                         |
| status      | string | 优惠卷状态 1待使用 2已使用 |
| type        | string | 类型 1 满减 2比例折扣      |
| discount    | string | 满减金额或则扣比例         |
| condition   | string | 满足金额                   |
| activeTime  | string | 开始时间                   |
| expiredTime | string | 结束时间                   |
| createTime  | object | 发放时间                   |
| code        | string | 无                         |
| msg         | string | 无                         |





## 获取订单列表(需token)

##### 简要描述

- 无

##### 请求URL

- `http://localhost:8080/api/order/list`

##### 请求方式

- post

##### Header

| header | 示例值                                                       | 必选 | 类型   | 说明 |
| :----- | :----------------------------------------------------------- | ---- | ------ | ---- |
| token  | eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDMifQ.qctw0dfkidlTGRQVbTSrscAMjm8ugr9FRWiyswP35oGiWkGVyOw8JIxpWDB6yOQK9fjJwUsWSvsE9Q_lSVVXHw | 是   | string | 无   |

##### 成功返回示例

```
{
  "total": 1,
  "rows": [
    {
      "orderId": "918197915980136448",
      "userId": 103,
      "productId": 1,
      "title": "苹果",
      "image": "/profile/upload/2023/11/03/zhuchemorentoux_20231103184444A001.png",
      "productPrice": 999,
      "count": 1,
      "countPrice": 888,
      "couponPrice": 0,
      "eventsPrice": 199.8,
      "status": "1",
      "createTime": "2023-11-04 15:11:48",
      "childList": null,
      "couponId": null
    }
  ],
  "code": 200,
  "msg": "查询成功"
}
```

##### 成功返回示例的参数说明

| 参数名       | 类型   | 说明           |
| :----------- | :----- | -------------- |
| total        | string | 无             |
| rows         | array  | 无             |
| orderId      | string | 订单ID         |
| userId       | string | 无             |
| productId    | string | 商品ID         |
| title        | string | 商品标题       |
| image        | string | 商品封面       |
| productPrice | string | 商品单价       |
| count        | string | 购买数量       |
| countPrice   | string | 总金额         |
| couponPrice  | string | 优惠卷优惠金额 |
| eventsPrice  | string | 活动优惠金额   |
| status       | string | 无             |
| createTime   | string | 订单创建时间   |
| couponId     | object | 无             |
| code         | string | 无             |
| msg          | string | 无             |



## 获取订单详情(需token)

##### 简要描述

- 无

##### 请求URL

- `http://localhost:8080/api/order/getById`

##### 请求方式

- post

##### Header

| header | 示例值                                                       | 必选 | 类型   | 说明 |
| :----- | :----------------------------------------------------------- | ---- | ------ | ---- |
| token  | eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDMifQ.qctw0dfkidlTGRQVbTSrscAMjm8ugr9FRWiyswP35oGiWkGVyOw8JIxpWDB6yOQK9fjJwUsWSvsE9Q_lSVVXHw | 是   | string | 无   |

##### 请求参数示例

```
{
  "orderId": "918197915980136448"
}
```

##### 请求json字段说明

| 字段名  | 必选 | 类型   | 说明 |
| :------ | :--- | ------ | ---- |
| orderId | 是   | string | 无   |

##### 成功返回示例

```
{
  "msg": "操作成功",
  "code": 200,
  "data": {
    "orderId": "918197915980136448",
    "userId": 103,
    "productId": 1,
    "title": "苹果",
    "image": "/profile/upload/2023/11/03/Apple.png",
    "productPrice": 999,
    "count": 1,
    "countPrice": 888,
    "couponPrice": 0,
    "eventsPrice": 199.8,
    "status": "1",
    "createTime": "2023-11-04 15:11:48",
    "childList": null,
    "couponId": null
  }
}
```

##### 成功返回示例的参数说明

| 参数名       | 类型   | 说明           |
| :----------- | :----- | -------------- |
| total        | string | 无             |
| rows         | array  | 无             |
| orderId      | string | 订单ID         |
| userId       | string | 无             |
| productId    | string | 商品ID         |
| title        | string | 商品标题       |
| image        | string | 商品封面       |
| productPrice | string | 商品单价       |
| count        | string | 购买数量       |
| countPrice   | string | 总金额         |
| couponPrice  | string | 优惠卷优惠金额 |
| eventsPrice  | string | 活动优惠金额   |
| status       | string | 无             |
| createTime   | string | 订单创建时间   |
| code         | string | 无             |
| msg          | string | 无             |





## 支付订单(需token)



- [简要描述](http://8.140.129.248:4999/web/#简要描述)
- [请求URL](http://8.140.129.248:4999/web/#请求URL)
- [请求方式](http://8.140.129.248:4999/web/#请求方式)
- [Header](http://8.140.129.248:4999/web/#Header)
- [请求参数示例](http://8.140.129.248:4999/web/#请求参数示例)
- [请求json字段说明](http://8.140.129.248:4999/web/#请求json字段说明)
- [成功返回示例](http://8.140.129.248:4999/web/#成功返回示例)
- [失败返回示例](http://8.140.129.248:4999/web/#失败返回示例)
- 备注

##### 简要描述

- 无

##### 请求URL

- `http://localhost:8080/api/order/payOrder`

##### 请求方式

- post

##### Header

| header | 示例值                                                       | 必选 | 类型   | 说明 |
| :----- | :----------------------------------------------------------- | ---- | ------ | ---- |
| token  | eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDMifQ.qctw0dfkidlTGRQVbTSrscAMjm8ugr9FRWiyswP35oGiWkGVyOw8JIxpWDB6yOQK9fjJwUsWSvsE9Q_lSVVXHw | 是   | string | 无   |

##### 请求参数示例

```
{
  "productId": "1",
  "count": "1",
  "countPrice": "888",
  "couponId": ""
}
```

##### 请求json字段说明

| 字段名     | 必选 | 类型   | 说明                                |
| :--------- | :--- | ------ | ----------------------------------- |
| productId  | 是   | string | 商品ID                              |
| count      | 是   | string | 购买数量                            |
| countPrice | 是   | string | 总价格(直接取活动价格*数量即可)     |
| couponId   | 否   | string | 优惠卷ID 选填 选中则传id 不选则不传 |

##### 成功返回示例

```
{
  "msg": "支付成功",
  "code": 200
}
```