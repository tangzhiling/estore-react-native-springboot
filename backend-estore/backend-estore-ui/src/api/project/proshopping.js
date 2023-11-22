import request from '@/utils/request'

// 查询购物车管理列表
export function listProshopping(query) {
  return request({
    url: '/project/proshopping/list',
    method: 'get',
    params: query
  })
}

// 查询购物车管理详细
export function getProshopping(shoppingId) {
  return request({
    url: '/project/proshopping/' + shoppingId,
    method: 'get'
  })
}

// 新增购物车管理
export function addProshopping(data) {
  return request({
    url: '/project/proshopping',
    method: 'post',
    data: data
  })
}

// 修改购物车管理
export function updateProshopping(data) {
  return request({
    url: '/project/proshopping',
    method: 'put',
    data: data
  })
}

// 删除购物车管理
export function delProshopping(shoppingId) {
  return request({
    url: '/project/proshopping/' + shoppingId,
    method: 'delete'
  })
}
