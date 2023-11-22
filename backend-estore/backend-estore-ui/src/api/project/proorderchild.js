import request from '@/utils/request'

// 查询订单子集列表
export function listProorderchild(query) {
  return request({
    url: '/project/proorderchild/list',
    method: 'get',
    params: query
  })
}

// 查询订单子集详细
export function getProorderchild(childId) {
  return request({
    url: '/project/proorderchild/' + childId,
    method: 'get'
  })
}

// 新增订单子集
export function addProorderchild(data) {
  return request({
    url: '/project/proorderchild',
    method: 'post',
    data: data
  })
}

// 修改订单子集
export function updateProorderchild(data) {
  return request({
    url: '/project/proorderchild',
    method: 'put',
    data: data
  })
}

// 删除订单子集
export function delProorderchild(childId) {
  return request({
    url: '/project/proorderchild/' + childId,
    method: 'delete'
  })
}
