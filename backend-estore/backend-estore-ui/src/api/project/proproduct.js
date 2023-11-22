import request from '@/utils/request'

// 查询商品管理列表
export function listProproduct(query) {
  return request({
    url: '/project/proproduct/list',
    method: 'get',
    params: query
  })
}

// 查询商品管理详细
export function getProproduct(productId) {
  return request({
    url: '/project/proproduct/' + productId,
    method: 'get'
  })
}

// 新增商品管理
export function addProproduct(data) {
  return request({
    url: '/project/proproduct',
    method: 'post',
    data: data
  })
}

// 修改商品管理
export function updateProproduct(data) {
  return request({
    url: '/project/proproduct',
    method: 'put',
    data: data
  })
}

// 删除商品管理
export function delProproduct(productId) {
  return request({
    url: '/project/proproduct/' + productId,
    method: 'delete'
  })
}

// 查询商品分类列表
export function listProclassify(query) {
  return request({
    url: '/project/proclassify/list',
    method: 'get',
    params: query
  })
}
