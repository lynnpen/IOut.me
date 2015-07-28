编程新人 Github 教程
======================

Git 是 linux 之父 linus 开发的一个软件, 用于代码的版本管理.

后来, 几个人基于这个软件, 做了一个网站, 名字叫 Github.

现在, Github 已经成了码农社区的代名词.

学习的核心思路:

    先用起来, 不管有多拙劣. 熟悉了以后再考虑如何优雅.

#### 学习目标

1. 注册 github 帐号, 安装 github 客户端
2. git 上传 / 下载代码
3. Github Issues

__耗时 1h__


#### 为什么使用 Github?

试图用几个案例来帮助我表达观点.

1. 新人都希望大神帮忙看下自己的代码. 如何把代码发给大神呢?

    邮箱? QQ? 别逗了, 点击这个链接体验下: [人人网爬虫代码](https://github.com/JackonYang/renren)

2. 怒写 2 天代码, 发现思路错了, 怎么退回去?

    学生写论文时的做法: 保存很多文件 -- 最新版, 最最新版, 最最新不再修改版!

    Github 上的效果: [代码历史记录](https://github.com/JackonYang/renren/commits/master)

3. 写代码不是一个人的事情

    有了小伙伴以后, 协作是必须的, 代码的协作通常使用版本管理工具.

    早些年 SVN 一统天下. 现在越来越多的人拥抱 Git.

#### 编程新人的 Github 教程

1. [github.com](github.com) 注册一个帐号.

    学渣请注意: Sign up 是注册, Sign in 是登录.

2. 安装一个客户端.

    众多选择: [http://git-scm.com/downloads](http://git-scm.com/downloads)

    新人一般使用 windows / Mac 系统, 建议下载个傻瓜式的客户端即可.

    - MAC: https://mac.github.com/
    - Windows: https://windows.github.com/

    注: windows 下安装后如果不能正常登录, 手动重新安装 .net 4.0 或者 .net 4.5 再尝试登录.

3. 配置客户端:

    <p><img width="360px" src="/images/github/option.png" alt="config github client"></p>

    ![config github client](/images/github/config.png)

    黄色标注的地方, 请特别关注或配置下.

    特别注意: `clone path` 就是本地存放代码源文件的位置.

4. 代码的提交与同步

    - 修改了 clone path 下的代码以后, github 客户端会自动识别出文件的变更内容.

        如下图的 `3 changes`

        ![commit local changes](/images/github/commit.png)

    - 代码提交

        勾选变更的文件, 下方填写关于变更的说明, 点击 `commit to master` 即可.

        此时, 代码在本地的 git 仓库里, 没有上传, 其他人看不到最新的代码.

    - 与 github 网站上的代码进行同步.

        ![sync commits](/images/github/sync.png)

        所谓的同步, 就是上传自己的变更, 下载别人提交的内容.

        一般, github 可以把多个人修改后的内容自动合并成一个最新的版本. 非常方便. 遇到不能自动合并的情况, 会提示需要手动合并.

5. 使用 Github Iusses 提问

    每个项目, 都有一个 issues 页面. 方便大家沟通.

    如何学习中有任何疑问, 或者建议, 也可以到本项目的 Iusse 页面提问.

    [github issue](https://github.com/JackonYang/IOut.me/issues) 点击 `New issue` 创建新问题即可

    跟论坛差不多.
