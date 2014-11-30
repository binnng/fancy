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

```