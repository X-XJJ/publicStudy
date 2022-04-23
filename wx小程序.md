# 官方文档




# pages里
- 一个pages里的xx文件夹下
xx.js：类似js
xx.json：类似配置？
xx.wxml：类似html
xx.wxss：类似css


xx.wxml中：
<text>作用同span</text>

<view>作用同div</view>

<navigator url="链接?参数名=具体参数">作用同a</navigator>


wx.navigateTo([]) 只能跳转到 非tabBar的页面

console.log(某变量) 打印变量


rpx：可以根据屏幕宽度进行自适应。


- 数据绑定
在html里显示变量的 相对不麻烦的方法
小程序、vue、很多框架里，使用 双大括号，{{变量名}}
小程序里的 初始变量值 只能写在每个page组的.js的 Page({data:{}}) 里，即 data:{}里，是页面的初始数据
函数里获取变量，使用 this.data.变量名
仅后端修改变量，使用 this.data.变量名 = 新值
前后端一起修改变量，使用 this.setData({ 变量名:"新值" })

如
<div>{{name}}</div>
<script>var name="姓名啊"</script>


