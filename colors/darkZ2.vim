" 本配色方案由 gui2term.py 程序增加彩色终端支持。
"/*******************************************************************************
" * Author          :Honker.y
" * Email           :Honker.ying@gmail.com
" * Last modified   :2011-05-29 22:55
" * Filename        :darkZ.vim
" * version         :
 "*******************************************************************************/
" Vim color file
" Create by Andy
" QQ24375048

set background=dark
if version > 580
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="darkZ2"

hi Normal	guifg=#DFD6C1 guibg=gray14 gui=none ctermfg=187 ctermbg=235 cterm=none

" highlight groups
hi Cursor       guifg=black          guibg=yellow		gui=none ctermfg=16 ctermbg=226 cterm=none
hi ErrorMsg     guifg=white          guibg=red			gui=none ctermfg=231 ctermbg=196 cterm=none
hi VertSplit    guifg=gray40         guibg=gray40		gui=none ctermfg=241 ctermbg=241 cterm=none
hi Folded       guifg=DarkSlateGray3 guibg=grey30		gui=none ctermfg=116 ctermbg=239 cterm=none
hi FoldColumn   guifg=tan            guibg=grey30		gui=none ctermfg=180 ctermbg=239 cterm=none
hi IncSearch    guifg=#b0ffff        guibg=#2050d0 ctermfg=159 ctermbg=26 cterm=none
hi LineNr       guifg=burlywood3     gui=none ctermfg=180 ctermbg=235 cterm=none
hi ModeMsg      guifg=SkyBlue        gui=none ctermfg=117 ctermbg=235 cterm=none
hi MoreMsg      guifg=SeaGreen       gui=none ctermfg=72 ctermbg=235 cterm=none
hi NonText      guifg=cyan           gui=none ctermfg=51 ctermbg=235 cterm=none
hi Question     guifg=springgreen    gui=none ctermfg=48 ctermbg=235 cterm=none
hi Search       guifg=gray80         guibg=#445599		gui=none ctermfg=252 ctermbg=61 cterm=none
hi SpecialKey   guifg=cyan           gui=none ctermfg=51 ctermbg=235 cterm=none
hi StatusLine   guifg=black          guibg=Pink		gui=bold ctermfg=16 ctermbg=218 cterm=bold
hi StatusLineNC guifg=grey           guibg=gray40		gui=none ctermfg=250 ctermbg=241 cterm=none
hi Title        guifg=#ff4400        gui=none			gui=bold ctermfg=202 ctermbg=235 cterm=none
hi Visual       guifg=gray17         guibg=tan1			gui=none ctermfg=235 ctermbg=215 cterm=none
hi WarningMsg   guifg=salmon         gui=none ctermfg=210 ctermbg=235 cterm=none
hi Pmenu        guifg=white          guibg=#445599		gui=none ctermfg=231 ctermbg=61 cterm=none
hi PmenuSel     guifg=#445599        guibg=gray ctermfg=61 ctermbg=250 cterm=none
hi WildMenu     guifg=gray           guibg=gray17		gui=none ctermfg=250 ctermbg=235 cterm=none
hi MatchParen	guifg=cyan           guibg=#6C6C6C		gui=bold ctermfg=51 ctermbg=242 cterm=bold
hi DiffAdd      guifg=black          guibg=wheat1 ctermfg=16 ctermbg=223 cterm=none
hi DiffChange   guifg=black          guibg=skyblue1 ctermfg=16 ctermbg=117 cterm=none
hi DiffText     guifg=black          guibg=hotpink1		gui=none ctermfg=16 ctermbg=205 cterm=none
hi DiffDelete   guibg=gray45         guifg=black		gui=none ctermfg=16 ctermbg=243 cterm=none

" syntax highlighting groups
hi Comment      guifg=gray50         gui=italic ctermfg=244 ctermbg=235 cterm=NONE
hi Constant     guifg=#FF77FF        gui=none ctermfg=213 ctermbg=235 cterm=none
hi Identifier   guifg=#6FDEF8        gui=none ctermfg=81 ctermbg=235 cterm=none
hi Function     guifg=#82EF2A        gui=none ctermfg=82 ctermbg=235 cterm=none
hi Statement    guifg=#FCFC63        gui=none ctermfg=227 ctermbg=235 cterm=none
hi PreProc      guifg=#82EF2A        gui=none ctermfg=82 ctermbg=235 cterm=none
hi Type         guifg=#33AFF3        gui=none ctermfg=81 ctermbg=235 cterm=none
hi Special      guifg=orange          gui=none ctermfg=214 ctermbg=235 cterm=none
hi Ignore       guifg=red            gui=none ctermfg=196 ctermbg=235 cterm=none
hi Todo         guifg=red            guibg=yellow2     gui=none ctermfg=196 ctermbg=226 cterm=none
