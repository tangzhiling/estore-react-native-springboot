import request from '@/utils/request'

// 查询地址管理列表
export function listProaddress(query) {
  return request({
    url: '/project/proaddress/list',
    method: 'get',
    params: query
  })
}

// 查询地址管理详细
export function getProaddress(addressId) {
  return request({
    url: '/project/proaddress/' + addressId,
    method: 'get'
  })
}

// 新增地址管理
export function addProaddress(data) {
  return request({
    url: '/project/proaddress',
    method: 'post',
    data: data
  })
}

// 修改地址管理
export function updateProaddress(data) {
  return request({
    url: '/project/proaddress',
    method: 'put',
    data: data
  })
}

// 删除地址管理
export function delProaddress(addressId) {
  return request({
    url: '/project/proaddress/' + addressId,
    method: 'delete'
  })
}
