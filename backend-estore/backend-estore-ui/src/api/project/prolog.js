import request from '@/utils/request'

// 查询日志管理列表
export function listProlog(query) {
  return request({
    url: '/project/prolog/list',
    method: 'get',
    params: query
  })
}

// 查询日志管理详细
export function getProlog(logId) {
  return request({
    url: '/project/prolog/' + logId,
    method: 'get'
  })
}

// 新增日志管理
export function addProlog(data) {
  return request({
    url: '/project/prolog',
    method: 'post',
    data: data
  })
}

// 修改日志管理
export function updateProlog(data) {
  return request({
    url: '/project/prolog',
    method: 'put',
    data: data
  })
}

// 删除日志管理
export function delProlog(logId) {
  return request({
    url: '/project/prolog/' + logId,
    method: 'delete'
  })
}
