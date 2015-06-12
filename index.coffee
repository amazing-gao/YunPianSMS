request = require 'request'
Path = require 'path'
_ = require 'lodash'

class YunPianSMS
  constructor:(@apiKey, @version = 'v1')->
    throw new Error 'No apiKey' if !@apiKey
    @host = 'yunpian.com'

  post: (uri, data, cb)->
    if _.isFunction data
      cb = data
      data = {}

    data.apikey = @apiKey
    header =
      method: 'POST'
      uri: uri
      form: data

    request.post header, (error, resp, body)->
      cb error, body

  getApiUrl: (apiPath)->
    throw new Error 'No apiPath' if !apiPath
    return "http://#{Path.join @host, @version, apiPath}"

  getUserInfo:(cb)->
    @post @getApiUrl('user/get.json'), cb

  setUserInfo: (userInfo, cb)->
    @post @getApiUrl('user/set.json'), userInfo, cb

  send:(mobile, text, cb)->
    @post @getApiUrl('sms/send.json '), {mobile, text}, cb

  sendTpl:(mobile, tpl_id, tpl_value, cb)->
    @post @getApiUrl('sms/tpl_send.json'), {mobile, tpl_id, tpl_value}, cb

  getTpl: (tpl_id, cb)->
    @post @getApiUrl('tpl/get.json'), {tpl_id}, cb

  getDefaultTpl: (tpl_id, cb)->
    @post @getApiUrl('tpl/get_default.json'), {tpl_id}, cb

  addTpl: (tpl_content, cb)->
    @post @getApiUrl('tpl/add.json'), {tpl_content}, cb

  updateTpl: (tpl_id, tpl_content, cb)->
    @post @getApiUrl('tpl/update.json'), {tpl_id, tpl_content}, cb

  deleteTpl: (tpl_id, cb)->
    @post @getApiUrl('tpl/del.json'), {tpl_id}, cb

  pullStatus: (page_size, cb)->
    @post @getApiUrl('sms/pull_status.json'), {page_size}, cb

  pullReply:(page_size, cb)->
    @post @getApiUrl('sms/pull_reply.json'), {page_size}, cb

  getBlackWord:(text, cb)->
    @post @getApiUrl('sms/get_black_word.json'), {text}, cb

  getReply:(opts, cb)->
    @post @getApiUrl('sms/get_reply.json'), opts, cb
