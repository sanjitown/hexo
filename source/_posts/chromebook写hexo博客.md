title: chromebook写hexo博客
author: aDiao
abbrlink: '4550'
date: 2018-02-12 18:27:06
tags:
---
始 2018 1 19 16:55
***
前天接触了和hexo，觉得这东西挺不错，看起来比WordPress搭博客要好玩一些，于是就在我的黑苹果系统里试用了hexo客户端，一个下午的时间成功让博客跑了起来。

***
但是我并不喜欢在寝室里写东西，虽然我那个垃圾机械键盘打字特爽，还是教室和图书馆暖气舒服些。于是我尝试着在我的VPS上搭建了hexo客户端，还成功了，正常使用。但是这个行为特傻，在一台远程Linux主机上渲染好hexo网页文件再通过git把远程主机上的网页文件推送到github page，反正我觉得傻。而且远程编辑对网络要求比较严格，延迟高一点写起来不要太爽。
<!-- more -->
***
于是想起来在我的chromebook上搭hexo客户端，昨晚弄开发者模式，清除数据，重新激活，完蛋。上次激活用的方法不行了，大半夜，2点，用手机开热点给win10电脑，电脑用上anyconnect的VPN，再开WiFi给Chromebook，不行！开不了，于是放弃。今早上（11点）起来尝试在电脑上用shadowsocks全局代理，允许来自局域网连接，Chromebook和电脑连上同一路由器，设置Chromebook代理为手动HTTP，地址就是电脑ip(192.168.xxx.xxx)，端口1080，因为shadowsocks代理的端口是1080。然后就成了。
***
之前有备份本地文件，因为首次打开开发者模式会删除所有数据，进系统后所有软件、插件和设置都从云端恢复，为Google打电话！
尝试在开发者模式搭建node.js 和git，多次无果。果断用crouton安装了一个Debian子系统（2018-2-8 换为Ubuntu 16.04），然后在子系统里搭建hexo成功！子系统大概用了1.6G空间。
***