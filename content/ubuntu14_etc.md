ubuntu 14.04 配置
=================

## 系统设置

#### 鼠标闪烁问题

系统设置--显示--__禁用__未知显示器

#### 修改目录名

home 目录下的目录名, 修改为: 英文, 首字母小写.

cd 切换目录时, 不习惯大写字母开头不习惯.

如果是中文安装 ubuntu, 默认文件名是中文的.
简单期间, 先批量的中文改英文, 命令如下

```shell
$ export LANG=en_US
$ xdg-user-dirs-gtk-update
$ export LANG=zh_CN
```

上述命令执行, 默认首字母大写.
手动修改 `~/.config/user-dirs.dirs` 的内容, 改为全部小写字母.

注意: 文件中的路径, 必须存在, 否则恢复默认值.

```shell
$ vim ~/.config/user-dirs.dirs
# This file is written by xdg-user-dirs-update
# If you want to change or add directories, just edit the line you are
# interested in. All local changes will be retained on the next run
# Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
# homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
# absolute path. No other format is supported.
# 
XDG_DESKTOP_DIR="$HOME/desktop"
XDG_DOWNLOAD_DIR="$HOME/downloads"
XDG_TEMPLATES_DIR="$HOME/templates"
XDG_PUBLICSHARE_DIR="$HOME/public"
XDG_DOCUMENTS_DIR="$HOME/documents"
XDG_MUSIC_DIR="$HOME/music"
XDG_PICTURES_DIR="$HOME/pictures"
XDG_VIDEOS_DIR="$HOME/videos"
```

## apt-get 源更新

```shell
$ sudo apt-get update
$ sudo apt-get upgrade
```

## git & Github

```shell
$ sudo apt-get install git-all xclip
$ git config --global user.name "Jackon Yang" 
$ git config --global user.email "jiekunyang@gmail.com"
```

添加 ssh 密钥，详细说明: https://help.github.com/articles/generating-ssh-keys

```shell
$ mkdir -p ~/.ssh && cd ~/.ssh
$ ssh-keygen -t rsa -C "jiekunyang@gmail.com"
$ xclip -sel clip < ~/.ssh/id_rsa.pub  # id_rsa.pub 中的密钥保存到剪切板中
$ ssh -T git@github.com  # test connection
# output
# Hi JackonYang! You have successfully authenticated, but GitHub does not provide shell access.
```

## vim

```shell
$ sudo apt-get install vim-gtk exuberant-ctags  # vim and ctags
$ git clone git@github.com:JackonYang/vimrc.git .vim
$ cd .vim
$ install.sh
```

## chrome

apt-get 安装的是 chromium-browser，与 chrome 不一样，关键不能设置代理。

下载 deb 包安装

- 32bit: https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
- 64bit: https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

## 磁盘挂载

开机自动挂载配置在 fstab 文件中.

- document 分区: 挂载到 ~/documents/, 用于个人文件存储. 所有者为 home 目录对应用户.
- www 分区: 挂载到 /var/www/, 用于 web 访问. 所有者为 apache2 用户 www-data. 安装apache2后自动创建该用户.

分区类型注意:

- NTFS 分区, 一般需要指定挂载后的权限等信息, umask / dmask 设置权限信息. uid是用户 id, gid 是用户组 id. 
- ext4 分区, 可以记录文件的权限信息, 无需手动指定. 若设置了 uid 等参数会报错.

```shell
$ sudo vim /etc/fstab
#  # document was on /dev/sda3
#  UUID=AAD8E019D8DFE19D           /home/jackon/documents    ntfs uid=1000,gid=1000,umask=002,dmask=022,utf8  1  2
#  # www was on /dev/sda2
#  UUID=445FF6A35AD8B921                   /var/www          ntfs uid=33,gid=1001,umask=002,dmask=022,utf8 0 0
$ sudo blkid  # get uuid of the partition
$ id www-data  # get uid
$ cat /etc/group|grep subversion
#  subversion:x:1001:www-data,jackonyang
$ sudo mount -a  # umount before mount
```

## daily APP

#### rar

下载地址：http://www.rarsoft.com/download.htm

```shell
$ tar -zxvf rarlinux-x64-5.1.0.tar.gz
$ cd rar
$ sudo make install
$ sudo ln -s /usr/local/bin/rar /usr/bin
```

#### zip 解压乱码

```shell
unzip -O CP936 xxx.zip  # -O set encodings
```

#### Vedio Player

```shell
sudo apt-get install smplayer
```

设为默认程序, 以下两种方法二选一.

1. system setting / Details / Default Applications 中设置
2. 选择视频文件，右键属性中更改默认程序。


#### 其他小程序

```shell
$ sudo apt-get install xchm shutter  # xchm 阅读器, shutter 截图
$ sudo apt-get install zathura  # pdf with vim shortcut
$ sudo apt-get install jq  # json
$ sudo apt-get install kiki  # 正则工具
```
