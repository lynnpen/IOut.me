编程新人 Github 教程
======================

Git 是 linux 之父 linus 开发的一个软件, 用于代码的版本管理.
后来, 几个人基于这个软件, 做了一个网站, 名字叫 Github.
现在, Github 已经成了码农社区的代名词.

建议:

    编程新人从熟悉 Github 做起, 在使用中, 逐渐加深对 Git 的理解与掌握.


#### 为什么要使用 Github?

我试图用最少的理由说服编程新人使用 Github,
而不是全面介绍 Git / Github 的优势

1. 新人都希望大神帮忙看下自己的代码. 大神去哪里获取代码呢?

    邮箱? QQ? 别逗了, 点击这个链接体验下: [人人网爬虫代码](https://github.com/JackonYang/renren)

2. 写了一段时间以后, 发现自己的思路错了, 想要回到 2 天前.

    写论文 / 写代码, 这种情况不能更常见.

    如何退回去? 保存很多文件: 最新版, 最新新版, 最新不再修改版!

    感受下用了 Github 以后的效果: [代码修改的历史记录](https://github.com/JackonYang/renren/commits/master)

3. 写代码不是一个人的事情

    有了小伙伴以后, 版本管理工具是必须的.
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

    特别注意: clone path 就是本地存放代码源文件的位置. 直接在这个目录下编辑 / 调试代码即可.

4. 代码的提交与同步

    - 本地代码有了变更以后, 提交到 git 软件里, 此时其他人看不到.

        ![commit local changes](/images/github/commit.png)

    - 本地的提交同步到 github 网站上, 其他人可以看到并使用最新的代码.

        同样, 也可以把其他人的提交同步到本地.

        ![sync commits](/images/github/sync.png)

5. 提问!

    [github issue](https://github.com/JackonYang/IOut.me/issues) `New issue` 即可
