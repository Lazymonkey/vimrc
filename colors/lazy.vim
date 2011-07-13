""*******************************************************************************
" * Author          :Honker.y
" * Email           :Honker.ying@gmail.com
" * Last modified   : 2011-06-01 18:33
" * Filename        : lazy.vim
" * version         : 1.0
" * Description     : A color theme file for VIM or GVIM, which make the VIM
"					  bright with colors. It looks very cool!really?I like
"					  the happy time!
" * Use             : Please put it to your VIM or GVIM files directry like
"					  this : ~/.vim/colors/
"*******************************************************************************
if !has("gui_running")
    runtime! colors/default.vim
    finish
endif

set background=dark

hi clear

" Version control
if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let colors_name = "lazy"

" Common
hi Normal           guifg=#00ff00   guibg=#000000   gui=NONE
hi Visual           guibg=#ff0000                   gui=NONE
hi Cursor           guifg=#ff0000   guibg=#2f4f4f   gui=NONE
hi Cursorline       guibg=#7f7f7f
hi lCursor          guifg=#000000   guibg=#ffffff   gui=NONE
"显示行号颜色设置
hi LineNr           guifg=#29ff00   guibg=NONE	    gui=NONE
"hi NonText			guifg=LightBlue guibg=grey30
hi Title            guifg=#ff0000   guibg=NONE      gui=bold
"buffer中目录颜色
hi Directory		guifg=#0032c9   guibg=NONE		gui=NONE
hi Underlined       guifg=#aa00ff   guibg=NONE      gui=underline
"hi Underlined
hi Ignore			guifg=#ff00e9

" Split
hi StatusLine       guifg=#000000   guibg=#00ff00   gui=bold
hi StatusLineNC     guifg=#f5deb3   guibg=#2f4f4f   gui=NONE
hi VertSplit        guifg=#aa00ff   guibg=#2f4f4f   gui=NONE

" Folder
hi Folded           guifg=#ff4c00   guibg=#e0e0e0   gui=NONE
"hi FoldColumn		guibg=none		guifg=#004ac2

" Syntax
hi Define           guifg=#ff0000   guibg=NONE      gui=bold
hi Comment          guifg=#1e90ff   guibg=NONE      gui=NONE
hi Constant         guifg=#ffff00   guibg=NONE      gui=NONE
hi String           guifg=#ff0000   guibg=NONE      gui=NONE
hi Number           guifg=#ff0000   guibg=NONE      gui=NONE
hi Statement        guifg=#ff7f00   guibg=NONE      gui=bold
hi Type				guifg=#fffa00
"C++类名高亮显示
hi Identifier	    guifg=#9100ae	 gui=bold

" Others
hi PreProc          guifg=#0004ff    guibg=NONE     gui=NONE
hi Error            guifg=#ff0000    guibg=#ffffff  gui=bold,underline
hi Todo             guifg=#ff4c00    guibg=NONE     gui=bold,underline
hi Special          guifg=#0004ff    guibg=NONE     gui=NONE
hi SpecialKey       guifg=#ff4c00    guibg=#e8e8e8  gui=NONE
"hi Type				guifg=#0000a8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim:tabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
