# 官方文档

- 注释
  - //，/* */，!-- --？？<!-- -->


# 项目里
- pages文件夹
- app.json：项目配置文件
  - "pages":[]，所有页面，其中第一个界面即为默认启动页面


# pages里
- 一个pages里的xx文件夹下
  - xx.json：类似配置？
  - xx.js：类似js
  - xx.wxml：类似html，在wxml中 bindtap（绑定）or调用的 事件 ，其对象？函数？写在 .js 中
  - xx.wxss：类似css，界面长啥样在这里写


xx.wxml中组件？控件？标签？：
<text>作用同span</text>

<view>作用同div</view>

image

button

textarea

input

<navigator url="链接?参数名=具体参数">作用同a</navigator>


wx.navigateTo({}) 只能跳转到 非tabBar的页面
  - tabBar：在 app.json中配置，启动小程序后，可以直接在底端切换的页面们
wx.navigateBack({delta:数字}) 返回上一级or上多级页面
var pages = getCurrentPages() 获取当前页面栈

console.log(pages) 打印变量


rpx：可以根据屏幕宽度进行自适应。


生命周期函数 onLoad() 只在第一次打开页面时会执行，onReady同
每次打开执行的：onShow

小程序运行过程中的全局变量、函数：app.js中App，globaData
存储在用户本地的全局缓存，不清可一直存在：Storage相关，setStorage getStorage等


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


属性 bindinput，输入变化，函数就会被触发
<!--XX.wxml-->
<input value="message" bindinput="bindTxt"> </input>

<!--XX.js-->
bindTxt:function(e){
  console.log(1222);
  temp = e.detail.value; //前端变化的值
  console.log(temp);
}


- 关键字
var，let，const，
xxx:function(){}


- 双向绑定
指南：https://developers.weixin.qq.com/miniprogram/dev/framework/custom-component/placeholder.html#%E9%85%8D%E7%BD%AE
<input value="{{myValue}}" /> 添加“model:”
<input model:value="{{myValue}}" />
 <!-- value前加 model: 双向绑定，后端的数据绑定到前端，即value="{{inviCode}}"将前端input中的value设置为后端 inveCode 的值,bindinput将前端实时输入绑定到后端调用函数-->


- 打开授权配置



- 请求网络组件？？api？？：wx.request()
  - 开发工具中，直接打 request 将补全所有参数，打wx.request只补“url”参数


- 提示框


绑定微信号、邀请者？，必填昵称、姓名、学号、手机号、密码、邀请码，附件一卡通信息面照片，选填学校、学院、专业

注册传到后端的
{
  "openid": "OPENID",  //微信唯一标识
  "inviCode": "12345",  //邀请码
  "stdName": "XXX", //姓名
  "stdID": "12345"  //学号
}

后端返回
{
  "result": "0", //结果
  "message": "注册成功" //结果对应的消息
}


登录传到后端的
{
  "openid": "OPENID",  //微信唯一标识
}

后端返回
{
  "result": "0",
  "message": "登录成功",
  "stdName": "XXX", //姓名，登录失败则为空
  "stdID": "12345"  //学号
}

