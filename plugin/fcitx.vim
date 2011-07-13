"*******************************************************************************
" * Author          :Honker.y
" * Email           :Honker.ying@gmail.com
" * Last modified   :2011-05-31 15:33
" * Filename        :fcitx.vim
" * version         :1.1
" * Description		：本插件实现vim从插入模式按<Esc>退出时将fcitx暂时退出
" * Use             :将本插件置于你vim的plugin目录下
" * Rrequire		:fcitx版本为4.0或者更高
" * Note			:设置vim退出时的弹性，用户可以修改<Esc>为任意键退出
"*******************************************************************************/
" fcitx.vim  记住插入模式小企鹅输入法的状态
" ---------------------------------------------------------------------
" Load Once:
if (has("win32") || has("win95") || has("win64") || has("win16"))
  " Windows 下不要载入
  finish
endif
if !exists('$DISPLAY')
  " 没有 X，不要载入
  finish
endif
if &cp || exists("g:loaded_fcitx") || !executable("fcitx-remote")
  finish
endif
let s:keepcpo = &cpo
let g:loaded_fcitx = 1
set cpo&vim
" ---------------------------------------------------------------------
" Functions:
function Fcitx2en()
  let inputstatus = system("fcitx-remote")
  if inputstatus == 2
    let b:inputtoggle = 1
    call system("fcitx-remote -c")
  endif
endfunction
function Fcitx2zh()
  try
    if b:inputtoggle == 1
      call system("fcitx-remote -o")
      let b:inputtoggle = 0
    endif
  catch /inputtoggle/
    let b:inputtoggle = 0
  endtry
endfunction
" ---------------------------------------------------------------------
" Autocmds:
au InsertLeave * call Fcitx2en()
au InsertEnter * call Fcitx2zh()
" ---------------------------------------------------------------------
"  Restoration And Modelines:
let &cpo=s:keepcpo
unlet s:keepcpo
" vim:fdm=expr:fde=getline(v\:lnum-1)=~'\\v"\\s*-{20,}'?'>1'\:1
