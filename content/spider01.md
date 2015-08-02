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