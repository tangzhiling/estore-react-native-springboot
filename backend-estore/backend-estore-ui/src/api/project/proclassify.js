import request from '@/utils/request'

// 查询商品分类列表
export function listProclassify(query) {
  return request({
    url: '/project/proclassify/list',
    method: 'get',
    params: query
  })
}

// 查询商品分类详细
export function getProclassify(classifyId) {
  return request({
    url: '/project/proclassify/' + classifyId,
    method: 'get'
  })
}

// 新增商品分类
export function addProclassify(data) {
  return request({
    url: '/project/proclassify',
    method: 'post',
    data: data
  })
}

// 修改商品分类
export function updateProclassify(data) {
  return request({
    url: '/project/proclassify',
    method: 'put',
    data: data
  })
}

// 删除商品分类
export function delProclassify(classifyId) {
  return request({
    url: '/project/proclassify/' + classifyId,
    method: 'delete'
  })
}
