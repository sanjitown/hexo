title: 极路由openwrt折腾记
author: aDiao
abbrlink: f87b
date: 2018-02-12 18:23:21
tags:
---
**背景：** 寝室的路由器是极路由一代，连接校园网后很不稳定，要不了半个钟头就无法上网，而校园网又是在线的，遂决定给路由器换系统。

## 1、长背景。
大概一个月前想起要买一个路由器，搜索了一下知道openwrt的路由用mentohust是可以连接锐捷校园网的，也看到很多智能路由支持这个功能，在闲鱼逛了一圈后买了一个极路由，型号HC6361。买回来就能用，还可以连接校园网，彻底告别了用笔记本分享网络这个既耗电又麻烦 的操作。而且开启了双栈协议后意外发现win10笔记本可以直接连接IPv6网站，chrome浏览器成为完整的chrome（虽然之前已经弄好了shadowsocks）。
但是这个路由器老是会无法上网，只能重启。直到昨天实在忍受不了，怒换openwrt。参考资料是MaxZing写的：[极路由1、1s等机型刷OpenWrt--成为真正的极客](https://www.jianshu.com/p/196a43b79c24)。

<!-- more -->
# 2、U-boot写入。
在ssh登录后先是更换了U-boot（也可以用breed），这个貌似是用来管理路由器系统的，在安装系统失败后路由器会变砖，这个U-boot允许再安装系统，而原厂的boot应该是不允许的，或者无法操作，命令为：
```
cd /tmp
wget http://rssn.cn/roms/uboot/HC6361-uboot.bin
mtd write HC5661-uboot.bin u-boot
```
过程大概就是把u-boot文件下载到tmp文件夹，将u-boot文件写入 u-boot分区，下载地址是http://rssn.cn/ 这个网盘里放了很多文件，选对应版本下载即可。
写入之后建议备份原系统文件，否则当下一次安回原系统的时候可能会不可使用。我没有备份。
# 3、安装openwrt系统。
接下来就是安装openwrt，这是一个为路由器设计的微型Linux系统，也是在上边那个网址找到对应版本，命令为：
```
＃下载bin包
wget http://rssn.cn/roms/openwrt-ar71xx-generic-hiwifi-hc6361-squashfs-sysupgrade.bin
#写入OpenWrt
sysupgrade -F -n openwrt-ar71xx-generic-hiwifi-hc6361-squashfs-sysupgrade.bin
```
几分钟等待后路由启动完成，搜索WiFi会发现一个叫OPENWRT的没有密码的WiFi，连接，浏览器进192.168.1.1设置密码并允许ssh登录。这时路由器已经是一个普通路由器了，但是还无法连接校园网。
# 4、安装使用mentohust。
mentohust是我科一位学长当年写出来锐捷认证软件，详见[https://code.google.com/archive/p/mentohust](https://code.google.com/archive/p/mentohust)。GitHub镜像地址[https://github.com/HustLion/mentohust](https://github.com/HustLion/mentohust)
在我这个路由器里安装需要两个文件，一个是mentohust for openwrt， 另一个是libiconv库，此刻我忘记了当时是从哪里下载的（想起来再更新），先安装libiconv，再安装mentohust。**然后一定去看看wan口用的是哪个网卡！** （我就是默认用了eth0导致一直找不到服务器，把网线插在lan口又可以认证但无法上网，在这里折腾了几个小时，都准备换系统了）。再启动mentohust，命令为mentohust，填入相关信息即可。

***
2018/02/12 更新
# 5、屏蔽视频广告
看腾讯体育的NBA录像，广告很长，用adbyby屏蔽后可以去除。
步骤：
```
opkg update 
opkg install http://cdn.mivm.cn/OpenWrt/adbyby/adbyby_2.7_ar71xx.ipk
opkg install http://cdn.mivm.cn/OpenWrt/adbyby/luci-app-adbyby_2016-01-27_all.ipk
```
第一条命令是升级opkg，第二条安装adbyby程序，第三条安装adbyby图形化界面，感谢原作者的贡献（虽然不清楚是谁）
参考：[OpenWrt 路由器过滤广告的N种方法](https://www.mivm.cn/openwrt-kill-ad/)

对其他视频网站也应该适用，爱奇艺安卓端好像会偶尔出现播放失败


我妈说家里的网不行了，看视频刷K歌都卡，我怀疑是路由器老化了，家里10M的电信网看视频应该是可以的。寒假回家把极路由带回去了，一对比发现原来的TP-link的看腾讯体育的视频都卡，就弃用了。回学校重新淘个，也就30块就能在闲鱼买到。