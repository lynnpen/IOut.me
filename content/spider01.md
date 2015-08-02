垂直爬虫教程 01 - 写一个最简单的爬虫
====================================


爬虫目标:

    大众点评上的一个店铺, 评论中有多少人是刷好评的托.


## 爬虫的基本概念

通俗的说, 爬虫本质就是, 从别人的信息(数据)里提取出自己需要的部分.

比如,

- qq 空间相册爬虫. 批量下载 qq 空间某个相册的照片.

    如果能把大量女生的真相爬取出来, 一个新的 FaceMash 就诞生了.

- 人人网好友列表爬虫, 爬取一个人的人人网所有好友.

    获取好友列表, 是很多专业数据分析的基础.
    
    好友列表, 本质是社交网络的网络结构, 很难造假, 而且大众防范意识低.
    网络结构可以较为准确的分析出大量的个人行为习惯, 并且能够帮助甄别其他数据的真实性.


#### 爬虫工作的基本流程:

1. 下载.

    提到下载, 小白用户首先想到的可能是迅雷等下载工具, 或者浏览器内置的下载器.

    其实, 浏览器本身就可以理解为一个超级下载器. 不仅能下载 html 网页, 还能直接漂亮的展示 html 页面.

    爬虫要下载的内容, 主要是网页, 一般由 html / js / css 三类文件构成.
    一般来说, 我们需要的数据都存储在 html 文件里, 偶尔会在 js 文件里.

    网址 url 直接对应的一般是 html 文件, html 文件里会声明自己依赖的 js 和 css 文件.

    当我们在浏览器里可以看到一个完整页面的时候,
    浏览器已经下载了页面的 html 文件, 分析出依赖的 js 和 css, 并全部下载了下来. 然后通过一些计算在界面上显示了一个漂亮的网页.

    爬虫, 只下载自己需要的部分 html / js 即可.

2. 解析.

    对方的数据格式, 与自己需要的往往不一样. 所以需要提取出自己需要的信息.

    解析的方法比较多, 每个人习惯不一样. 我只用正则表达式.

3. 保存.

    解析得到的数据, 一般会保存在文件 / 数据库里, 方便自己以后使用.


#### 爬虫工作的实际流程


实际工作的爬虫, 一般不会严格按照 `开始->下载->解析->保存->结束` 的流程工作.
但一定是这三个基本环节的组合.

比如, 我想知道大众点评上的一个店铺, 评论中有多少人是刷好评的托.

我们假定, 是刷好评的用户, 评论数一般少于 3 条.

- `下载` http://www.dianping.com/shop/18664537 所有评论页面
- `解析` 出评论过该店铺的所有用户 ID
- `下载` 每一个用户的个人主页
- `解析` 出每个用户的评论总数
- `保存` 每个用户的评论总数. -- 分析下个店铺时, 如果有重复的用户, 不需要重复抓取.

至此, 爬虫的工作结束. 过滤出评论数少于 3 条的用户, 然后人工分析下即可.


## 动手写最简单的爬虫

#### 下载

下载的流程是:

- 我们发一个 request, 请求一个页面.
- 对方返回一个 response, 一般是我们需要的页面.

request 与 response 就像两个人说话一样.
需要有一个双方都理解的语言(协议), 这个语言(协议)就是 HTTP.

深入的了解这个过程, 需要学习 HTTP 协议. 其中详细规定了各种场景下的各种语法细节.

下载的过程, 就是模拟 http 协议的过程. python 推荐使用 httplib2, google 提供的一个库, 需要手动安装.

功能代码如下:

```python
# -*- Encoding: utf-8 -*-
from httplib2 import Http

url = 'http://www.dianping.com/shop/18664537'

h = Http()  # 初始化一个实例, 相当于浏览器的一个标签页
rsp, content = h.request(url)  # 请求一个网页, 打开一个网页

with open('dianping.html', 'w') as f:
    f.write(content)  # html 页面

print rsp  # http 协议规定的 消息头, 新手可以忽略
```

代码文件命名为 dp.py, 执行命令后, 当前目录下增加 'dianping.html' 文件, 输出的 rsp 如下

```shell
$ python dp.py
{'status': '200', 'content-length': '211424', 'content-location': 'http://www.dianping.com/shop/18664537', 'content-language': 'zh-CN', 'transfer-encoding': 'chunked', 'set-cookie': 'PHOENIX_ID=0a016740-14eee7fda7a-708dde; Domain=.dianping.com; Path=/, JSESSIONID=B6618569A24E9B0AE7147F21F2F4C542; Path=/, aburl=1; Domain=.dianping.com; Expires=Mon, 01-Aug-2016 13:00:33 GMT; Path=/, cy=17; Domain=.dianping.com; Expires=Mon, 01-Aug-2016 13:00:33 GMT; Path=/, cye=xian; Domain=.dianping.com; Expires=Mon, 01-Aug-2016 13:00:33 GMT; Path=/', 'vary': 'Accept-Encoding', 'keep-alive': 'timeout=5', 'server': 'DPweb', 'connection': 'keep-alive', '-content-encoding': 'gzip', 'pragma': 'no-cache', 'cache-control': 'no-cache', 'date': 'Sun, 02 Aug 2015 13:00:33 GMT', 'content-type': 'text/html;charset=UTF-8'}
```

浏览器中打开 'dianping.html', 显示如下:

![html-page](/images/crawler/html-page.png)

这个页面, 根据浏览器里直接打开网址时看到的不一样, 原因如下:

1. 一次 request, 只下载对应的一个文件, 此处是 html.
2. 一个页面通常包含一个 html, 多个 js, css 文件.
3. 浏览器请求一个页面时, 得到 html 文件以后, 会解析出需要的 js, css 文件, 然后再发多个 request, 一个 request 下载一个 js 或者 css 文件.
