# YunPianSMS SDK
http://www.yunpian.com/ SMS sdk

# Install
```sh
npm install YunPianSMs
```

# Usage
```coffeescript
# CoffeeScript
YunPianSMS = require('YunPianSMS')

# get user info
sms = new YunPianSMS(yourAppKey)
sms.getUserInfo (error, ret)->
  console.log(error)
  console.log(ret)

# send sms
sms.send '1388888888', 'hello world!', (error, ret)->
  console.log(error)
  console.log(ret)

# send by template
sms.sendTpl '1388888888', '"#code#=1234&#company#=云片网"', (error, ret)->
  console.log(error)
  console.log(ret)
```
