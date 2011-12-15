"                      {/ ． ．\}
"                      ( (oo)   )
"+-------------oOOo---︶︶︶︶---oOOo-------------+
"
"
"
"
"
"
"
"                Last modified   :2011-03-19 00:21
"                version         :1.8.2
"
"                                    Lazy.monkey™
"                           honker.ying@gmail.com
"
" +---------------------------------Oooo-----------+
"Lazy.monkey™'s Vim settings, plugins...

"you can get my settings from github,like this :
"$ git clone git@git.com:Lazymonkey/vimrc.git
"set dictionary+=/usr/share/dict/words
"{{{基本设置
set nocompatible            " 关闭 vi 兼容模式
"setlocal spell spelllang=en "开启拼写检查
set mouse=a					"让vim支持鼠标
syntax on                   " 自动语法高亮
set number                  " 显示行号
set nocursorline            " 不突出显示当前行
set ruler                   " 打开状态栏标尺
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set nobackup                " 覆盖文件时不备份
set autochdir               " 自动切换当前目录为当前文件所在的目录
filetype plugin indent on   " 开启插件
set backupcopy=yes          " 设置备份时的行为为覆盖
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2           " 短暂跳转到匹配括号的时间
set magic                   " 设置魔术
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
"set guioptions-=T          " 隐藏工具栏
"set guioptions-=m          " 隐藏菜单栏
"set smartindent             " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
                            " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
"set foldenable             " 开始折叠
"set foldmethod=syntax      " 设置语法折叠
"set foldcolumn=0           " 设置折叠区域的宽度
"setlocal foldlevel=1       " 设置折叠层数为
autocmd Filetype c :set equalprg=indent
							"如果是c文件调用GNU indet 进行排版
"autocmd Filetype python :set equalprg=pydent
                            "如果是python文件调用pydent进行排版
"set guifont=Consolas\ \ Italic\ 14	"设置字体
"set guifont=Consolas\ \ Regular\ 14"设置字体
set guifont=Monaco\ \ Regular\ 14"设置字体
"set guifont=Monaco \\ Regular\ 14
set gfw=Consolas\ \ Regular\ 11	"设置中文字体
"exe
"startinsert
							"启动vim默认为插入模式
set cursorline
hi cursorline guibg=NONE gui=underline
							"设置光标所在行，下划线
set cmdheight=1		        " 命令行高度
set t_Co=256				" 指定配色方案是256色
"set background=dark		"设置背景为黑色
"colo darkZ2
"colo desert2562			" 使用desert2562 调色板，当然这是自定义的
color ir_black
"highlight Normal guibg=black guifg=grey
"highlight Normal guibg=black guifg=grey
set bsdir=buffer			" 设定文件浏览器目录为当前目录
filetype plugin on			" 文件类型检查打开
"set fileencodings=cp936,gbk,gb2132,ucs-bom,utf-8
"set fileencodings=utf-8,gbk,cp936,gb2132,ucs-bom
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
							" 让vim按照gbk，utf-8（没有头），utf-8的顺序识别
set directory=~/.tmp		"让swap文件保存在~/.tmp目录下
set noswapfile				"不生成swap文件
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
							" 在插入模式中使用Ctrl+v粘贴全局剪贴板内容
vnoremap <C-c> "+y
							" 在Visual模式中使用Ctrl+c复制内容到全局剪贴板
vnoremap <C-x> "+x			" 在Visual模式中使用Ctrl+x剪切内容到全局剪贴板
set comments=s1:/*,mb:*,ex0:/
							"修正自动C式样注释功能 <2005/07/16>
set tags=./tags,./../tags,./**/tags,~/workspace/geekos-0.3.0/src/project2/include/geekos/tags
							" 增强检索功能
set syntax=txt
							"设置txt文件高亮显示
set fileformats=unix,dos    " 保存文件格式
set statusline=%k%F[%{&ff}:%{&fenc}]%m%r%h%w\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %=[%{GitBranch()}]\ %=[%l,%c,%p%%]
							"状态栏信息
"""}}}
"{{{设定<leader>取词功能
nmap <silent><leader>d :!sdcv <cword> <CR>
                            "设置字典（配合sdcv）
                            "安装：$sudo apt-get install sdcv
                            "下载 stardic 的本地字典即可。（~/.stardict/dic/）!
"}}}
"{{{打开文件时恢复上次编辑的位置
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal g'\"" |
                \ endif
endif
"}}}
"{{{补全功能
"自动补全
filetype plugin indent on
set completeopt=longest,menu
"自动补全命令时候使用菜单式匹配列表
set wildmenu
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complet

"}}}
"{{{代码折叠设置
set foldenable                  " enable folding
set foldcolumn=2                " add a fold column
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
								"使用space键为折叠开/关
set foldmethod=marker           " detect triple-{ style fold markers
"set foldmethod=syntax			"以程式语言语法作为折叠规则
set foldlevelstart=0            " start out with everything folded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
" which commands trigger auto-unfold
"}}}
"{{{默认隐藏菜单栏和工具栏，可以通过 <F11> 切换显示和隐藏
" @see http://liyanrui.is-programmer.com/articles/1791/gvim-menu-and-toolbar-toggle.html
set guioptions-=m
set guioptions-=T
map <silent> <F11> :if &guioptions =~# 'T' <Bar>
			\set guioptions-=T <Bar>
			\set guioptions-=m <bar>
			\else <Bar>
			\set guioptions+=T <Bar>
			\set guioptions+=m <Bar>
			\endif<CR>
"}}}
"{{{绑定一些快捷键
" Quick yanking to the end of the line
imap <C-]> <Esc>
imap <C-s> <Esc>:w<CR>
nmap CapsLock <Esc>
nmap Y y$
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk
inoremap <C-h> <left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
"自动补全括号和引号
"inoremap ( ()<Left>
inoremap ) <c-r>=ClosePair(')')<CR>
au filetype c inoremap { {<CR>}<ESC>O
au filetype cpp inoremap { {<CR>}<ESC>O
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<Left>
inoremap ' ''<ESC>i
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
"inoremap " ""<Left>
"inoremap ' ''<Left>
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>
"Normal-mode时，可以用Tab及Shift-Tab做缩排
nmap <c-tab> v>
nmap <s-tab> v<
vmap <c-tab> >gv
vmap <s-tab> <gv
" Yank/paste to the OS clipboard with ,y and ,p
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P
"在标签页间跳转
map <C-p> :tabp<CR>
map <C-b> :tabn<CR>
"}}}
"{{{一键编译单个源文件
imap <C-F5> <ESC>:call Do_OneFileMake()<CR>
map <F5> :call Do_OneFileMake()<CR>
function Do_OneFileMake()
	if expand("%:p:h")!=getcwd()
		echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
		return
	endif
	let sourcefileename=expand("%:t")
	if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
		echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
		return
	endif
	let deletedspacefilename=substitute(sourcefileename,' ','','g')
	if strlen(deletedspacefilename)!=strlen(sourcefileename)
		echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
		return
	endif
	if &filetype=="c"
		if g:iswindows==1
			set makeprg=gcc\ -o\ %<.exe\ %
		else
			set makeprg=gcc\ -o\ %<\ %
		endif
	elseif &filetype=="cpp"
		if g:iswindows==1
			set makeprg=g++\ -o\ %<.exe\ %
		else
			set makeprg=g++\ -o\ %<\ %
		endif
	elseif &filetype=="cs"
		set makeprg=csc\ \/nologo\ \/out:%<.exe\ %
	endif
	if(g:iswindows==1)
		let outfilename=substitute(sourcefileename,'\(\.[^.]*\)$','.exe','g')
		let toexename=outfilename
	else
		let outfilename=substitute(sourcefileename,'\(\.[^.]*\)$','','g')
		let toexename=outfilename
	endif

	if filereadable(outfilename)
		if(g:iswindows==1)
			let outdeletedsuccess=delete(getcwd()."\\".outfilename)
		else
			let outdeletedsuccess=delete("./".outfilename)
		endif
		if(outdeletedsuccess!=0)
			set makeprg=make
			echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
			return
		endif
	endif
	execute "silent make"
	set makeprg=make

	execute "normal :"
	if filereadable(outfilename)
		if(g:iswindows==1)
			execute "!".toexename
		else
			execute "!./".toexename
		endif
	endif
	execute "copen"
endfunction
"}}}
"{{{进行make的设置
map <F6> :call Do_make()<CR>
map <c-F6> :silent make clean<CR>
function Do_make()
	set makeprg=make
	execute "silent make"
	execute "copen"
endfunction
"}}}
"{{{让自动补全根据用户写的部分来慢慢减小补全的搜索范围
set completeopt=longest,menuone
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <c-n> pumvisible() ? "\<c-n>" : "\<c-n>\<c-r>=pumvisible() ? \"\\<down>\" : \"\\<cr>\""
inoremap <expr> <m-;> pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>\<c-n>\<c-p>\<c-r>=pumvisible() ? \"\\<down>\" : \"\\<cr>\""
"}}}
"{{{设置 gnome-terminal 的光标
"if &term == "xterm"
"   silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"   autocmd! InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"   autocmd! InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"   autocmd! VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape underline"
"endif
"}}}
"{{{ 显示Tab符
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"if has("autocmd")
"   autocmd filetype javascript,php,python set list
"   autocmd filetype javascript,php set list
"endif
"}}}
"{{{ 设置用于GUI图形用户界面的字体列表。
if has ("win323")
	set guifont=YaHei\ Consolas\ Hybrid:h12
endif
"}}}
"{{{进行版权声明的设置
"添加或更新头（插件AuthorInfo）
let g:vimrc_author='Lazy.monkey™'
let g:vimrc_email='lazymonkey.me@gmail.com'
let g:vimrc_homepage='NULL'
nmap <F4> :AuthorInfoDetect<cr>
"将键盘上的F8功能键映射为添加作者信息的快捷键
"map <F4> :call TitleDet()<cr>'s
"   function AddTitle()
"        call append(0,"/*******************************************************************************")
"        call append(1," * Author          :Honker.y")
"        call append(2," * Email           :Honker.ying@gmail.com")
"        call append(3," * Last modified   :".strftime("%Y-%m-%d %H:%M"))
"        call append(4," * Filename        :".expand("%:t"))
"        call append(5," * version         :")
"        call append(6," * Description     :")
"        call append(7," *Revision         :")
"        call append(8," * Compiler        :")
"        call append(9," * Install         :")
"        call append(10," * Use             :")
"        call append(11," *******************************************************************************/")
"           echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
"   endf
"更新最近修改时间和文件名
"   function UpdateTitle()
"       normal m'
"       execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
"       normal ''
"       normal mk
"       execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
"       execute "noh"
"       normal 'k
"       echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
"   endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
"   function TitleDet()
"       let n=1
    "默认为添加
"       while n < 10
"           let line = getline(n)
"           if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
"               call UpdateTitle()
"               return
"           endif
"           let n = n + 1
"       endwhile
"       call AddTitle()
"   endfunction
"}}}
"{{{窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
""nnoremap <C-h> <C-w>h
""nnoremap <C-j> <C-w>j
""nnoremap <C-k> <C-w>k
""nnoremap <C-l> <C-w>l
"}}}
"{{{窗口最大化
if(has("win32") || has("win95") || has("win64") || has("win16"))
    au  GUIEnter * simalt ~x
else
    function Maximize_Window()
        silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
    endfunction
endif
"}}}
"{{{删除^M
nmap <F9> :%s/\r<CR>
"}}}
"{{{自动除去多余的空白行
" From: Vigil
function RemoveTrailingWhitespace()
	if &ft != "diff"
		let b:curcol = col(".")
		let b:curline = line(".")
		silent! %s/\s\+$//
		silent! %s/\(\s*\n\)\+\%$//
		call cursor(b:curline, b:curcol)
	endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()
"}}}
"{{{简单的sign设置
sign define siv text=-> icon=/usr/share/pixmaps/vim-32.xpm texthl=SignColumn linehl=ModeMsg
"map <F7> :exe ":sign place 2 line=" . line('.') . " name=siv file=" . expand("%:p")<cr>
"sign define siv text=-> icon=/home/lazymonkey/latex/firefox-themes-ubuntu.xpm texthl=SignColumn linehl=ModeMsg
map <F7> :exe ":sign place 2 line=" . line('.') . " name=siv file=" . expand("%:p")<cr>
"sign settings
"hi SignColumn guifg=red guibg=darkgray
"sign define haha  text=>> texthl=SignColumn

"sign place {id} line={lnum} name={name} file={fname}
"map <F7> :exe ":sign place 2 line=" . line('.') . " name=haha file=" .  expand("%:p")<cr>
map <S-F7> :sign unplace *<cr>

"}}}
"{{{设置标尺
map <silent> <leader>cu :if &cursorcolumn =~# '0' <Bar>
            \set cursorcolumn <Bar>
            \else <Bar>
            \set nocursorcolumn <Bar>
            \endif<CR>
map <leader>c1 :set cc=+1 <cr>
map <leader>c2 :set cc= <cr>
"}}}
"{{{高亮列
autocmd CursorMoved * call s:HiC()

function! s:HiC()
    let l:c = getline('.')[col('.') - 1]
    if l:c == '{' || l:c == '}'
        set cuc
    else
        set nocuc
    endif
endf
"}}}
"{{{气泡提示
function! FoldSpellBalloon()
	let foldStart = foldclosed(v:beval_lnum )
	let foldEnd   = foldclosedend(v:beval_lnum)
	let lines = []
	" Detect if we are in a fold
	if foldStart < 0
		" Detect if we are on a misspelled word
		let lines = spellsuggest( spellbadword(v:beval_text)[ 0 ], 5, 0 )
	else
		" we are in a fold
		let numLines = foldEnd - foldStart + 1
		" if we have too many lines in fold, show only the first 14
		" and the last 14 lines
		if ( numLines > 31 )
			let lines = getline( foldStart, foldStart + 14 )
			let lines += [ '-- Snipped ' . ( numLines - 30 ) . ' lines --' ]
			let lines += getline( foldEnd - 14, foldEnd )
		else
			"less than 30 lines, lets show all of them
			let lines = getline( foldStart, foldEnd )
		endif
	endif
	" return result
	return join( lines, has( "balloon_multiline" ) ? "\n" : " " )
endfunction
set balloonexpr=FoldSpellBalloon()
set ballooneval
set balloondelay=100
"}}}
"{{{ vimwiki

"     是否在词条文件保存时就输出html  这个会让保存大词条比较慢
"所以我默认没有启用  有需要的话就把这一行复制到下面去
"     \ 'auto_export': 1,

" 多个维基项目的配置
let g:vimwiki_list = [{'path': '~/wiki/vimwiki_src/',
            \ 'path_html': '~/wiki/vimwiki_html/',
			\ 'html_header': '~/wiki/vimwiki_html/template/header.htm',
			\ 'html_footer': '~/wiki/vimwiki_html/template/footer.htm'}]
"			\ 'diary_link_count': 5}]
"            \{'path': ':\demo\qiuchi\wiki'}]

" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
let g:vimwiki_camel_case = 0

" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1

" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
let g:vimwiki_menu = ''

" 是否开启按语法折叠  会让文件比较慢
"let g:vimwiki_folding = 1

" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1

" 详见下文...
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'
"一键执行wiki文件
au filetype vimwiki map <S-F5> :call RunAllVimwikiFile()<cr>
"au filetype vimwiki map <F5> :Vimwiki2HTML<cr>
au filetype vimwiki map <F5> :call RunOneVimwikiFile()<CR>
func! RunOneVimwikiFile()
    exec "w"
    exec "Vimwiki2HTML"
    exec "!google-chrome ~/wiki/vimwiki_html/%<.html"
endfunction

func! RunAllVimwikiFile()
    exec "w"
    exec "VimwikiAll2HTML"
    exec "!google-chrome ~/wiki/vimwiki_html/*.html"
endfunction
"}}}
"{{{设置terminal光标颜色
if &term =~ "xterm\|rxvt"
    silent !echo -ne "\e]12;HotPink\007"
    let &t_SI="\e]12;RoyalBlue1\007"
    let &t_EI="\e]12;HotPink\007"
    autocmd VimLeave * :!echo -ne "\e]12;green\007"
endif
"}}}
"{{{-----------------------------------------Configure the plugin -taglist------------------------------------------
""	map <F4> :silent! Tlist<CR> " 按下F3呼出
	"nnoremap  :TlistToggle
        "let Tlist_Auto_Open=0 " Let the tag list open automatically
        "let Tlist_Auto_Update " Update the tag list automatically
        "let Tlist_Compact_Format=1 " Show small menu
        "let Tlist_Ctags_Cmd='ctags' " Location of ctags
        "let Tlist_Enable_Fold_Column=0 "do show folding tree
        "let Tlist_Process_File_Always=1 " Always process the source file
        "let Tlist_Show_One_File=1 " Only show the tag list of current file
        "let Tlist_Exist_OnlyWindow=1 " If you are the last, kill yourself
        "let Tlist_File_Fold_Auto_Close=0 " Fold closed other trees
        "let Tlist_Sort_Type="name" " Order by name
        "let Tlist_WinWidth=40 " Set the window 40 cols wide.
        "let Tlist_Close_On_Select=1 " Close the list when a item is selected
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动退出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=0 "不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0
"---------------------------------------end Configure the plugin -taglist----------------------------------------
"}}}
"{{{-----------------------------------------Configure the plugin -cscope------------------------------------------
"判断当前操作系统
if(has("win32") || has("win95") || has("win64") || has("win16"))
	let g:iswindows=1
else
	let g:iswindows=0
endif
autocmd BufEnter * lcd %:p:h
map <F12> :call Do_CsTag()<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
function Do_CsTag()
	autocmd BufEnter * lcd %:p:h

	let dir = getcwd()
	if filereadable("tags")
		if(g:iswindows==1)
			let tagsdeleted=delete(dir."\\"."tags")
		else
			let tagsdeleted=delete("./"."tags")
		endif
		if(tagsdeleted!=0)
			echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
			return
		endif
	endif
	if has("cscope")
		silent! execute "cs kill -1"
	endif
	if filereadable("cscope.files")
		if(g:iswindows==1)
			let csfilesdeleted=delete(dir."\\"."cscope.files")
		else
			let csfilesdeleted=delete("./"."cscope.files")
		endif
		if(csfilesdeleted!=0)
			echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
			return
		endif
	endif
	if filereadable("cscope.out")
		if(g:iswindows==1)
			let csoutdeleted=delete(dir."\\"."cscope.out")
		else
			let csoutdeleted=delete("./"."cscope.out")
		endif
		if(csoutdeleted!=0)
			echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
			return
		endif
	endif
	if(executable('ctags'))
		"silent! execute "!ctags -R --c-types=+p --fields=+S *"
		silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
	endif
	if(executable('cscope') && has("cscope") )
		if(g:iswindows!=1)
			silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
		else
			silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
		endif
		silent! execute "!cscope -b"
		execute "normal :"
		if filereadable("cscope.out")
			execute "cs add cscope.out"
		endif
	endif
endfunction

set tags+=~/.vim/systags "for library functions

"-----------------------------------------end Configure the plugin -cscope---------------------------------------
"}}}
"{{{-----------------------------------------Configure the plugin -NeoComplCache--------------------------------------
"let g:NeoComplCache_DisableAutoComplete = 1		"设置不自动弹出NeoComplCache自动补全列表
"let g:NeoComplCache_EnableAtStartup = 1			"激活ncc
"Ok ,I enjoy the time!
"------------------------------------------end Configure the plugin -NeoComplCache----------------------------------
"}}}
"{{{-----------------------------------------Configure the plugin -NERDTree -----------------------------------------------------------
"let NERDTreeWinPos = "left" "where NERD tree window is placed on the screen
"let NERDTreeWinSize = 31 "size of the NERD tree
"nmap <F8> <ESC>:NERDTreeToggle<RETURN>" Open and close the NERD_tree.vim separately
"--------------------------------------------------------------------------------------------------------------------------------------------
"}}}
"{{{-----------------------------------------Configure the plugin -winManager---------------------------------------------------------------
"设置界面分割
"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
"设置winmanager的宽度，默认为25
let g:winManagerWidth = 30
"定义打开关闭winmanager按键
nmap <silent> <F3> :WMToggle<cr>
"---------------------------------------------------------------------------------------------------------------------------------------------
"}}}
"{{{-----------------------------------------Configure the plugin -DoxygenToolkit ---------------------------------------------------------------
map fg : Dox<cr>
let g:DoxygenToolkit_authorName="Honker.y"
let g:DoxygenToolkit_licenseTag="My own license\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30
"---------------------------------------------------------------------------------------------------------------------------------------------
"}}}
"{{{-----------------------------------------Configure the plugin -TagBar ---------------------------------------------------------------------
nmap <silent> <F8> :TagbarToggle<CR>
""let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
"-----------------------------------------end Configure the plugin -DoxygenToolkit ------------------------------------------------------------
"}}}
"{{{-----------------------------------------Configure the plugin -python_pydiction------------------------------------------------------------
if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:pydiction_location = 'D:\Program Files\Vim\vimfiles\tools\pydiction\complete-dict'
else
    let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
endif
"defalut g:pydiction_menu_height == 15
"let g:pydiction_menu_height = 20
"--------------------------------------------end Configure plugin-python_pydiction-------------------------------------------------------------
"}}}
"{{{-----------------------------------------Configure the plugin -SnipMate------------------------------------------------------------
"au FileType python set ft=python.django
"au FileType html set ft=htmldjango.html
au FileType plaintex set ft=tex
"--------------------------------------------end Configure plugin-SnipMate-------------------------------------------------------------
"}}}
"{{{-----------------------------------------Configure the plugin -Vim-latex------------------------------------------------------------
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep/-nH/$*
" OPTIONAL: This enables automatic indentation as you type.
filetype indent on
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"}}}-----------------------------------------end Configure vim-latex------------------------------------------------------------
"{{{-----------------------------------------Configure the plugin -ropevim------------------------------------------
"from "http://sunliwen.com/2009/12/ropevim-rope-in-vim/"
let $PYTHONPATH .= ":~/.rope/rope:~/.rope/ropevim"
source /home/lazymonkey/.rope/ropevim/ropevim.vim
let ropevim_codeassist_maxfixes=10
let ropevim_guess_project=1
let ropevim_vim_completion=1
let ropevim_enable_autoimport=1
let ropevim_extended_complete=1
let ropevim_codeassist_maxfixes=10
let ropevim_guess_project=1
let ropevim_vim_completion=1
let ropevim_enable_autoimport=1
let ropevim_extended_complete=1

function! CustomCodeAssistInsertMode()
    call RopeCodeAssistInsertMode()
    if pumvisible()
        return "\<C-L>\<Down>"
    else
        return ''
    endif
endfunction

function! TabWrapperComplete()
    let cursyn = synID(line('.'), col('.') - 1, 1)
    if pumvisible()
        return "\<C-Y>"
    endif
    if strpart(getline('.'), 0, col('.')-1) =~ '^\s*$' || cursyn != 0
        return "\<Tab>"
    else
        return "\<C-R>=CustomCodeAssistInsertMode()\<CR>"
    endif
endfunction

au filetype python inoremap <buffer><silent><expr> <C-d> TabWrapperComplete()
"}}}-----------------------------------------end Configure -ropevim------------------------------------------
"{{{Congigure the plugin -Conkyrc.vim
au BufNewFile,BufRead *conkyrc set filetype=conkyrc
"}}}
"{{{-----------------------------------------python、php 和 shell 单个文件一键执行--------------------------------------------------------------------------------------
 "Run a PHP script
   function! ExecutePHPScript()
       if &filetype != 'php'
           echohl WarningMsg | echo 'This is not a PHP file !' | echohl None
           return
       endif
       setlocal makeprg=php\ -f\ %
       setlocal errorformat=%m\ in\ %f\ on\ line\ %l
       echohl WarningMsg | echo 'Execution output:' | echohl None
       if &modified == 1
           silent write
       endif
       silent make
       clist
   endfunction
   au filetype php map <F5> :call ExecutePHPScript()<CR>
   au filetype php imap <C-F5> <ESC>:call ExecutePHPScript()<CR>
" Run a python script
function! ExecutePythonScript()
   if &filetype != 'python'
       echohl WarningMsg | echo 'This is not a Python file !' | echohl None
       return
   endif
   setlocal makeprg=python\ -u\ %
   set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
   echohl WarningMsg | echo 'Execution output:' | echohl None
   if &modified == 1
       silent write
   endif
   silent make
   clist
endfunction
au filetype python map <F5> :call ExecutePythonScript()<CR>
au filetype python imap <C-F5> <ESC>:call ExecutePythonScript()<CR>
 "Run a SHELL script
au filetype sh map <F5> :!bash ./% <CR>
au filetype sh imap <C-F5> <ESC>:!bash ./% <CR>
au filetype tex map <F5> :call RunOneLaztexFile()<CR>
au filetype tex imap <C-F5> <ESC>:call RunOneLaztexFile()<CR>
func! RunOneLaztexFile()
    exec "w"
    exec "!pdflatex ./%"
    exec "!evince ./%<.pdf"
endfunction
au filetype html map <F5> :!google-chrome ./% <CR>
"}}}
"{{{python 调试
python << EOF
import time
import vim
def SetBreakpoint():
    nLine = int( vim.eval( 'line(".")'))
    strLine = vim.current.line
    i = 0
    strWhite = ""
    while strLine[i] == ' ' or strLine[i] == "\t":
        i += 1
        strWhite += strLine[i]
    vim.current.buffer.append(
       "%(space)spdb.set_trace() %(mark)s Breakpoint %(mark)s" %
         {'space':strWhite, 'mark': '#' * 30}, nLine - 1)
    for strLine in vim.current.buffer:
        if strLine == "import pdb":
            break
        else:
            vim.current.buffer.append( 'import pdb', 0)
            vim.command( 'normal j1')
            break
vim.command( 'map <C-F7> :py SetBreakpoint()<cr>')

def RemoveBreakpoints():
    nCurrentLine = int( vim.eval( 'line(".")'))
    nLines = []
    nLine = 1
    for strLine in vim.current.buffer:
        if strLine == 'import pdb' or strLine.lstrip()[:15] == 'pdb.set_trace()':
            nLines.append( nLine)
        nLine += 1
    nLines.reverse()
    for nLine in nLines:
        vim.command( 'normal %dG' % nLine)
        vim.command( 'normal dd')
        if nLine < nCurrentLine:
            nCurrentLine -= 1
    vim.command( 'normal %dG' % nCurrentLine)
vim.command( 'map <C-F8> :py RemoveBreakpoints()<cr>')
vim.command( 'map <S-F8> :!python %<cr>')
EOF
"}}}
"{{{专为python做的设置
" 允许退格键删除和tab操作
"set smartindent
"set smarttab
set expandtab
set tabstop=4
"set softtabstop=4
set shiftwidth=4
"set backspace=2
set textwidth=79
set listchars=tab:>-,trail:-
set list
"}}}
let g:omni_sql_no_default_maps = 1
