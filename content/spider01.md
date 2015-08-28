从 0 写一个垂直爬虫
===================


爬虫目标:

    大众点评上的一个店铺, 评论中有多少人是刷好评的托.


## 爬虫的基本概念


通俗的说, 爬虫就是: 从别人的网站上提取出自己需要的信息(数据).

[能利用爬虫技术做到哪些很酷很有趣很有用的事情？](http://www.zhihu.com/question/27621722)

爬虫是不是违法的?
案例: [大众点评网反击爱帮网：称其垂直搜索是爬虫](http://www.chinaz.com/news/2009/0928/93333.shtml)

判决书要点:

1. 该技术本身并不具有违法性。
2. 垂直搜索网站对特定行业网站信息的使用，不得对该网站造成市场替代的后果.

    对于点评类网站而言，如果垂直搜索网站使用了该点评类网站中较大比例的信息，
    且上述使用使得网络用户无须到达被链接的点评类网站即可获得基本内容，则此种使用具有构成市场替代作用的可能性。


## 爬虫工作的基本流程:


网页, 主要由 html / js / css 三类文件构成.

需要下载的数据一般存储在 html 或 js 文件里. 看网站开发人员的心情.

基本的工作流程是:

1. 下载 html / js 文件
2. 解析出数据. 熟悉正则表达式的, 推荐正则. 新手可以考虑 xpath 等 html 文件解析工具.
3. 保存数据. 保存到文件 / 数据库里, 避免丢失.


#### 爬虫工作的实际流程


不同的网站, 不同的抓取目标, 实际的工作流程很难完全一致.
核心思路是不变的.

案例: 大众点评上的一个店铺, 评论中有多少人是刷好评的托.

我们假定, 是刷好评的用户, 评论数少于 3 条.

- 给定一个店铺: http://www.dianping.com/shop/18664537.

    浏览器中打开网址, 查看页面源码(快捷键 Ctrl+u)

    搜索一下可以在 html 文件中找到评论内容. -- 数据在 html 文件中.
- `下载:` 从店铺的第一页循环至最后一页评论, 下载所有评论页面的 html 文件
- `解析:` 从下载的 html 文件中提取用户 ID, 即评论过该店铺的用户.
- `下载:` 循环用户 ID 列表, 下载每一个用户的个人主页.
- `解析:` 从个人主页提取出每个用户的评论总数.
- `保存:` 评论过该店铺的用户 / 每个用户的评论总数, 保存至文件 / 数据库中. 方便后续使用.

至此, 爬虫的工作结束. 过滤出评论数少于 3 条的用户, 然后人工分析下即可.


从这个案例, 我们可以看到:

爬虫难以独立解决实际问题, 更多的是一个辅助工具. 但可以有效提高工作效率.


## 动手写最简单的爬虫


#### 下载

下载的流程是:

- 给网站发一个 request, 请求一个 url 对应的页面
- 网站返回一个 response, 一般是我们需要的页面.  二般情况是, 网站发现我们是爬虫, 回复验证码页面.

request 与 response 就像两个人说话一样.
需要有一个双方都理解的语言(协议), 这个语言(协议)就是 HTTP.

下载的过程, 就是模拟 http 协议的过程.
有一些工具, 可以让不熟悉 http 的人也能正常处理 HTTP 消息.

python 推荐使用 httplib2, 需要手动安装 `pip install httplib2`


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

1. 一个页面通常包含 1 个 html, 多个 js / css 文件.
2. 一次 request, 只下载对应的一个文件, 此处是 html.
3. 浏览器打开一个页面时, 会发多个 request, 下载所需的全部 html / js / css 文件.


#### 解析


解析, 就是一个反复调试的过程.

我们使用正则表达式 -- 个人习惯

正则的基本语法和用法, 参考: [Python正则表达式指南](http://www.cnblogs.com/huxi/archive/2010/07/04/1771073.html)

__编写正则表达式时, 需要特别注意:__

1. 匹配规则尽可能独特, 恰好能够精确匹配到目标内容, 不重不漏.
2. 匹配规则, 尽可能通用. 在空格 / 回车符等的处理上, 尽可能支持各种可能.

    不同的页面, 可能是不同的程序员写的, 大家敲回车和空格的习惯略有差异.
3. 任何一个网站, 都是可能有 bug 的. 匹配异常时, 先看是不是网页比较特殊, 或者改版了.
4. 尽可能从用户可以看到的文本里提取信息, 改版时变更的可能性偏低.
5. 调试解析时, 把文件保存在本地测试, 不要频繁访问网站, 避免被屏蔽.
6. 调试 ok 以后, 再边下载边解析


例如, 要从下面提取地址信息

```
<span class="item" itemprop="street-address" title="南关正街89号成都银行3楼（与上岛咖啡同层）">
    南关正街89号成都银行3楼（与上岛咖啡同层）
</span>
```

具体来说:

1. 不要从 title 里提取.

    title 是一种用户体验优化的产物, 很多类别的商铺里是没有 title 属性的.

    </span> 前的地址, 是用户可见的, 属于基本功能. 只要有地址的页面, 就要显示出来.

2. 地址前后的空格和回车符个数不确定, 优先考虑使用 \s* 来适配.
3. 为了保证匹配的精确性, 关键属性是 `itemprop="street-address"`, 这个一定要出现在正则中.
4. itemprop 前后的其他属性(class, title), 意义不大, 可以使用 `.*?` 来适配.

    为了让匹配更加精准, 比如避免跨越很多标签后匹配成功, 可以使用 `[^>]*?`


匹配规则的选择, 主要靠经验积累. 不必追求一蹴而就.

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

1. 循环抓取 1-100 页, 如果第 n 页解析出 0 条数据, break.

    我一般最多抓取 100 页数据.

    根据二八定律, 有的热门店铺/个人, 可能集中了几万甚至几十万的点评, 2000 条点评足以反应问题了.

    与其长期时间抓一个大店铺, 不如先抓几十个中小店铺.

2. 连续访问的时候, 注意 sleep

    如果不加以控制, 程序连续访问速度是非常快的, 大多数网站都会非常容易的检测出是爬虫, 然后屏蔽掉.

    所以, 处理完一个页面, 就 sleep(等待) 一会.

    sleep 的时间, 最好是随即数字. 如果每次访问网站的频率太固定, 也容易被发现并屏蔽.

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

    t_delay = random.uniform(2, 5)  # 2, 5 之间的随机数. sleep 时间, 单位 s
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

循环 user_ids, 下载个人主页并解析出评论总数即可.

尝试自己实现一下功能.
