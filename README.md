fancy
=====

活动弹框

## 安装

```
npm install m-fancy --save
```

## 示例
```javascript

var fancy = require("fancy");
var myFancy = fancy({
  title: "弹框标题",
  content: "弹框内容",
  name: "name-of-fancy",
  // 支持传一个按钮或两个按钮,
  btns: ["左边", "右边"],
  // 没有关闭按钮
  noX: true,
  fns: [function() {
      alert("点了左边");
    }, function() {
      alert("点了右边");
    }, function() {
      alert("点了关闭");
    }]
});

# 显示
myFancy.show()

# 隐藏
myFancy.hide()

```

1. content: 弹框内的内容，可以是html标签
2. name: 弹框的名字 会在`wallet-fancy`这个外层标签上加上`name="my-fancy"属性`，便于css控制，也会加上`name-my-fancy`的className
3. title: 弹框标题
4. btns: 弹框需要的按钮，数组
5. onConfirm: 点左边按钮回调，如果只传了一个按钮，只用传这个回调
6. onCancel: 点右边按钮回调

## confirm封装

```
var fancy = require("fancy");
var confirm = fancy.confirm;

var myComfirm = confirm({
  title: "弹框标题",
  content: "弹框内容",
  name: "name-of-fancy",
  // 支持传一个按钮或两个按钮,
  btns: ["左边", "右边"],
  fns: [function() {
      alert("点了左边");
    }, function() {
      alert("点了右边");
    }]
});
```
