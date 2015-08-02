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
{'status': '200', 'content-length': '211424', 
'content-location': 'http://www.dianping.com/shop/18664537',
'content-language': 'zh-CN',
'transfer-encoding': 'chunked',
'set-cookie': 'PHOENIX_ID=0a016740-14eee7fda7a-708dde; Domain=.dianping.com;
    Path=/, JSESSIONID=B6618569A24E9B0AE7147F21F2F4C542; Path=/, aburl=1;
    Domain=.dianping.com; Expires=Mon, 01-Aug-2016 13:00:33 GMT; Path=/, cy=17;
    Domain=.dianping.com; Expires=Mon, 01-Aug-2016 13:00:33 GMT; Path=/, cye=xian;
    Domain=.dianping.com; Expires=Mon, 01-Aug-2016 13:00:33 GMT; Path=/',
'vary': 'Accept-Encoding', 'keep-alive': 'timeout=5',
'server': 'DPweb', 'connection': 'keep-alive', '-content-encoding': 'gzip',
'pragma': 'no-cache', 'cache-control': 'no-cache',
'date': 'Sun, 02 Aug 2015 13:00:33 GMT',
'content-type': 'text/html;charset=UTF-8'}
```

浏览器中打开 'dianping.html', 显示如下:

<img width="480px" src="/images/crawler/html-page.png" alt="html-page">

这个页面, 与浏览器里直接打开网址时看到的不一样, 原因如下:

1. 一次 request, 只下载对应的一个文件, 此处是 html.
2. 一个页面通常包含一个 html, 多个 js / css 文件.
3. 浏览器请求一个页面时, 得到 html 文件以后, 会解析出需要的 js / css 文件, 然后再发多个 request, 一个 request 下载一个 js 或者 css 文件.

#### 解析


不同的页面, 内容的细节上会有差异.
解析, 就是一个反复调试的过程.

避免访问网站太频繁被屏蔽.
建议先把网页的内容存到本地的文件里, 解析阶段从本地文件里读取出内容.

调试 ok 以后, 再边下载边解析

编写正则表达式时, 需要特别注意:

1. 匹配规则尽可能独特, 恰好能够精确匹配到目标内容, 不重不漏.
2. 匹配规则, 尽可能通用. 在空格 / 回车符等的处理上, 尽可能支持各种可能.

    不同的页面, 可能是不同的程序员写的, 大家敲回车和空格的习惯略有差异.
3. 任何一个网站, 都是可能有 bug 的. 比如曾经的人人网某页面.
4. 尽可能从用户可以看到的文本里提取信息, 这种信息变更的可能性偏低.

比如, 要从下面提取地址信息

```
<span class="item" itemprop="street-address" title="南关正街89号成都银行3楼（与上岛咖啡同层）">
    南关正街89号成都银行3楼（与上岛咖啡同层）
</span>
```

1. 不要从 title 里提取.

    title 是一种用户体验优化的产物, 很多类别的商铺里是没有 title 属性的.

    </span> 前的地址, 是用户可见的, 属于基本功能. 只要有地址的页面, 就要显示出来.

2. 地址前后的空格和回车符个数不确定, 优先考虑使用 \s* 来适配.
3. 为了保证匹配的精确性, 关键属性是 `itemprop="street-address"`, 这个一定要出现在正则中.
4. itemprop 前后的其他属性(class, title), 就变的没有什么意义了, 可以使用 .*? 来适配.

    为了让匹配更加精准, 比如避免跨越很多标签后匹配成功, 可以使用 [^>]*?

__匹配规则的选择, 主要靠经验积累. 不必追求一蹴而就.__


```python
import re

# 读取刚刚下载的文件, 文件内容赋值给 content
with open('dianping.html', 'r') as f:
    content = ','.join(f.readlines())

review_item_ptn = re.compile(r'href="/member/(\d+)"')  # 声明一个匹配用户 ID 的正则
res = review_item_ptn.findall(content)  # 找出 content 中所有匹配的内容, 即用户 ID

print res  # 匹配到的全部 ID
print len(res)  # 用户 ID 的个数
```


#### 下载并解析用户 ID

下载与解析合并后代码如下:

```python
import re
from httplib2 import Http

url = 'http://www.dianping.com/shop/18664537'

h = Http()  # 初始化一个实例, 相当于浏览器的一个标签页
rsp, content = h.request(url)  # 请求一个网页, 打开一个网页

review_item_ptn = re.compile(r'href="/member/(\d+)"')  # 声明一个匹配用户 ID 的正则
res = review_item_ptn.findall(content)  # 找出 content 中所有匹配的内容, 即用户 ID

print res  # 匹配到的全部 ID
print len(res)  # 用户 ID 的个数
```

#### 分页数据的抓取

每页呈现 20 条点评, 大多数店铺有很多页点评, 如何全部抓取是一个问题.

点评页面 url 规律如下:

`http://www.dianping.com/shop/18664537/review_more?pageno=1`

shop 后的数字是店铺 id, pageno 后的数字是 页数.

大众点评的评论页面从第 1 页开始. 第 0 页与第 1 页内容相同. 有的网站从第 0 页开始.


抓取技巧:

1. 数据不一定要完整抓取.

    我一般最多抓取 100 页数据. 所以, 代码逻辑是:

    for 循环 1-100 页, 如果第 n 页解析出 0 条数据, break.

    根据二八定律, 有的热门店铺/个人, 可能集中了几万甚至几十万的点评, 2000 条点评足以反应问题了.

    与其长期时间抓一个大店铺, 不如先抓几十个中小店铺.

2. 正则尽可能简单一点. 用其他方法擦屁股.

    这个极其简单粗暴的正则, 在这个页面总是会匹配到重复的数据. 每个用户 ID 都出现 2 遍.

    除了把正则改复杂, 也可以 list 转 set 去重一下就好. 爬虫不必须追求速度, 速度快了, 一会还要 sleep.

3. 连续访问的时候, 注意 sleep

    如果不加以控制, 程序连续访问速度是非常快的, 大多数网站都会非常容易的检测出是爬虫, 然后屏蔽掉.

    所以, 处理完一个页面, 就 sleep 一会.

    如果每次 sleep 的时间都一样, 比如 1 秒, 连续访问 1 小时, 很多大网站也会发现并屏蔽.

    sleep 的时间, 最好是随即数字. 如果连续爬取少量页面. 1-3 秒就足够.

    很多网站的反爬虫策略, 最基本的一个检测就是每小时的访问数, 很多人习惯设置在 1000 左右.

    长时间爬取, 一般每小时 700-800 次以下就可以认为绝对安全了.

```python
# -*- Encoding: utf-8 -*-
import re
from httplib2 import Http

import time
import random


user_ids = set()

for page in range(1, 100):
    url_ptn = 'http://www.dianping.com/shop/18664537/review_more?pageno={}'

    h = Http()  # 初始化一个实例, 相当于浏览器的一个标签页
    rsp, content = h.request(url_ptn.format(page))  # 请求一个网页, 打开一个网页

    review_item_ptn = re.compile(r'href="/member/(\d+)"')  # 声明一个匹配用户 ID 的正则
    res = set(review_item_ptn.findall(content))  # 找出 content 中所有匹配的内容, 即用户 ID

    if len(res) == 0:  # 评论的最后一页
        break

    print '{} user ID in page {}'.format(len(res), page)

    user_ids.update(res)

    t_delay = random.uniform(2, 5)  # 2, 5 之间的随机数
    time.sleep(t_delay)  # 休息一会再爬, 避免连续快速访问太多页面被屏蔽.

print '{} user ID in all'.format(len(user_ids))
```

运行输出:

```shell
$ python dp.py
20 user ID in page 1
20 user ID in page 2
20 user ID in page 3
20 user ID in page 4
20 user ID in page 5
20 user ID in page 6
20 user ID in page 7
20 user ID in page 8
20 user ID in page 9
20 user ID in page 10
20 user ID in page 11
20 user ID in page 12
20 user ID in page 13
20 user ID in page 14
20 user ID in page 15
20 user ID in page 16
20 user ID in page 17
20 user ID in page 18
20 user ID in page 19
20 user ID in page 20
20 user ID in page 21
20 user ID in page 22
20 user ID in page 23
20 user ID in page 24
20 user ID in page 25
20 user ID in page 26
20 user ID in page 27
20 user ID in page 28
20 user ID in page 29
20 user ID in page 30
20 user ID in page 31
20 user ID in page 32
20 user ID in page 33
20 user ID in page 34
20 user ID in page 35
20 user ID in page 36
20 user ID in page 37
20 user ID in page 38
20 user ID in page 39
20 user ID in page 40
11 user ID in page 41
811 user ID in all
```


#### 完成功能: 评论中有多少人是刷好评的托.

模仿抓取店铺的所有评论, 抓取个人所有评论, 统计个数.
对所有用户 ID 循环一下即可.

尝试自己实现一下功能.
