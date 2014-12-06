fancy
=====

活动弹框

```coffeescript

Fancy = require "wallet/fancy"

myFancy = Fancy
	content: "弹框的内容" 
	name: "my-fancy"
	time: 10 

# 显示
myFancy.show()

# 隐藏
myFancy.hide()

```

1. content: 弹框内的内容，可以是html标签
2. name: 弹框的名字 会在`wallet-fancy`这个外层标签上加上`name="my-fancy"属性`
3. time: 弹框动画的时间