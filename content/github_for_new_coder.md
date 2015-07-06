编程新人 Github 教程
======================

Git 是 linux 之父 linus 开发的一个软件, 用于代码的版本管理.
后来, 几个人基于这个软件, 做了一个网站, 名字叫 Github.
现在, Github 已经成了码农社区的代名词.

学习的核心思路:

    先以最拙劣的方式用起来, 然后再考虑如何用的更优雅.

#### 学习目标 -- __耗时 1h__

1. 注册 github 帐号
2. 安装 github 客户端
3. 能够把自己的最新代码上传至 github
4. 使用 Github Issue 提高沟通效率


#### 为什么要使用 Github?

只求能够说服使用, 不做全面介绍.

1. 新人都希望大神帮忙看下自己的代码. 如何把代码发给大神呢?

    邮箱? QQ? 别逗了, 点击这个链接体验下: [人人网爬虫代码](https://github.com/JackonYang/renren)

2. 怒写 2 天代码, 发现思路错了, 怎么办?

    当然是退出去. 问题是, 如何退回去?

    学生写论文时的做法: 保存很多文件 -- 最新版, 最新新版, 最新不再修改版!

    感受下用了 Github 以后的效果: [代码历史记录](https://github.com/JackonYang/renren/commits/master)

3. 写代码不是一个人的事情

    有了小伙伴以后, 协作是必须的, 代码的协作必要要用版本管理工具.
    早些年 SVN 一统天下. 现在越来越多的人拥抱 Git.

#### 新手的 Github 教程

1. [github.com](github.com) 注册一个帐号.

    学渣请注意: Sign up 是注册, Sign in 是登录.

2. 安装一个客户端.

    众多选择: [http://git-scm.com/downloads](http://git-scm.com/downloads)

    新人一般使用 windows / Mac 系统, 建议下载个傻瓜式的客户端即可.

    - MAC: https://mac.github.com/
    - Windows: https://windows.github.com/

    注: 如果 windows 如果不能正常登录, 手动重新安装 .net 4.0 或者 .net 4.5

3. 配置客户端:

    ![config github client](/images/github/option.png)
    ![config github client](/images/github/config.png)

    黄色标注的地方, 建议关注并配置下.

    特别注意: clone path 就是本地存放代码源文件的位置. 直接在这个目录下编辑 / 调试代码即可.

4. 代码的提交与同步

    - 修改了 clone path 下的代码以后, 在 github 客户端里可以看到文件有变更.

    - 本地代码有了变更以后, 提交到 git 软件里, 此时其他人看不到.

        ![commit local changes](/images/github/commit.png)

    - 本地的提交同步到 github 网站上, 其他人可以看到并使用最新的代码.

        同样, 也可以把其他人的提交同步到本地.

        ![sync commits](/images/github/sync.png)

5. 使用 Github Iusse 提问

    每个项目, 都有一个 issue 页面. 方便大家沟通.

    如何学习中有任何疑问, 或者建议, 也可以到本项目的 Iusse 页面提问.

    [github issue](https://github.com/JackonYang/IOut.me/issues) `New issue` 即可
