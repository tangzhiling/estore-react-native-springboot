import request from '@/utils/request'

// 查询优惠卷管理列表
export function listProcoupon(query) {
  return request({
    url: '/project/procoupon/list',
    method: 'get',
    params: query
  })
}

// 查询优惠卷管理详细
export function getProcoupon(id) {
  return request({
    url: '/project/procoupon/' + id,
    method: 'get'
  })
}

// 新增优惠卷管理
export function addProcoupon(data) {
  return request({
    url: '/project/procoupon',
    method: 'post',
    data: data
  })
}

// 修改优惠卷管理
export function updateProcoupon(data) {
  return request({
    url: '/project/procoupon',
    method: 'put',
    data: data
  })
}

// 删除优惠卷管理
export function delProcoupon(id) {
  return request({
    url: '/project/procoupon/' + id,
    method: 'delete'
  })
}

// 查询用户列表
export function listProUser(query) {
  return request({
    url: '/project/prouser/list',
    method: 'get',
    params: query
  })
}


// 查询商品管理列表
export function listProproduct(query) {
  return request({
    url: '/project/proproduct/list',
    method: 'get',
    params: query
  })
}