import request from '@/utils/request'

// 查询活动管理列表
export function listProevents(query) {
  return request({
    url: '/project/proevents/list',
    method: 'get',
    params: query
  })
}

// 查询活动管理详细
export function getProevents(eventsId) {
  return request({
    url: '/project/proevents/' + eventsId,
    method: 'get'
  })
}

// 新增活动管理
export function addProevents(data) {
  return request({
    url: '/project/proevents',
    method: 'post',
    data: data
  })
}

// 修改活动管理
export function updateProevents(data) {
  return request({
    url: '/project/proevents',
    method: 'put',
    data: data
  })
}

// 删除活动管理
export function delProevents(eventsId) {
  return request({
    url: '/project/proevents/' + eventsId,
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