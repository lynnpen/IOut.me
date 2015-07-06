我的 Vim 全局通用配置
=====================

我的 vim 配置备份: https://github.com/JackonYang/vimrc

linux 与 windows 下主题略有差别。

windows 下效果:

![vim on windows](/images/vim/vim_windows.png)

linux 下效果:

![vim on linux](/images/vim/vim_linux.png)


#### 必要配置

大多数插件依赖于这几个配置，通常要放在 vimrc 文件的头部.

```vim
" put these settings at the head of vimrc
set nocompatible  " Use Vim defaults instead of 100% vi compatibility

if has("syntax")
    syntax on
endif

if has("autocmd")
    filetype plugin indent on
endif
```

解释:

- nocompatible 不兼容 vi.

    vim 可以兼容 vi, 但一些新特性是 vi 不支持的. 所以要用 noncompatiable.

- syntax on 代码语法高亮.

    若不开, 则通篇一个颜色.

- filetype plugin indent on

    打开了三个特性: 自动检测文件类型, 基于文件类型的插件生效, 智能缩进.

    跟文件类型 / 编程语言有关的设置, 基本都依赖于前两个.

    indent 的作用没这么基础, 但也是要设置的, 放在这里, 整齐.

#### 主题

```vim
if has('unix')
    set t_Co=256
    colorscheme molokai
elseif has('win32')
    colorscheme desert
endif
```

#### 键盘鼠标

###### Backspace

value | effect
----- | ------
indent | allow backspacing over autoindent
eol | allow backspacing over line breaks (join lines)
start | allow backspacing over the start of insert. CTRL-W and CTRL-U stop once at the start of insert.

When the value is empty, Vi compatible backspacing is used.

backspace and cursor keys wrap to previous/next line

```vim
set backspace=indent,eol,start whichwrap+=<,>,[,]
```

###### 鼠标

如果当前 vim 支持鼠标，那么，启用鼠标。a 可以理解为所有模式(all).

严格说来，不是 all，因为不包括几个一般用户不关心的模式.

```vim
if has('mouse')
    set mouse=a
endif
```

#### 剪切板与快捷键

鼠标选中，无需按住 shift，支持键盘 C-x C-c 剪切复制

C-v 在当前鼠标所在字符之前粘贴内容.

command mode 下也支持粘贴。

```vim
vnoremap <C-x> "+x  " cut
vnoremap <C-c> "+y  " copy
map <C-v> "+gP   " paste in normal/insert/command mode
imap <C-v> <C-R>+
cmap <C-v> <C-R>+
```

#### 状态提示栏

```vim
" format, by default, vim does not show the status line at all.
set statusline=%F%m%r%h%w\[FORMAT=%{&ff}]\[TYPE=%Y]\[POS=%04l,%04v][%p%%]\[LEN=%L] 
" always shown, shown as the second last line in the editor window
set laststatus=2
```

#### 字符编码

```vim
" encoding
set fileencodings=utf-8,gb18030,gbk " open file with
" set encoding=utf-8  " vim cache encoding
" set fileencoding=utf-8 " save file with
```

#### Tab

```vim
" tabs
set tabstop=4 " tab width 
set shiftwidth=4 " width of nested tabs
set expandtab " input spaces instead of tab when typing a tab
set softtabstop=4 " 1. space deleted when typing <BackSpace>
" show tabs
set listchars=tab:>.
set list
```

#### 高亮显示当前行

两个作用：

1. 清楚的看到空行/行尾是否有空格, 有几个.
2. 定位光标位置方便。

使用`highlight_current_line.vim`插件, 修改为当前行 darkgray 背景色

默认是加粗字体，但编辑 markdown 时总有当前行设置了加粗的错觉.

没找到简单的配置方法，直接改了插件里面的颜色值.


#### 自动补全

使用 supertab.vim 插件, Tab 自动补全.
