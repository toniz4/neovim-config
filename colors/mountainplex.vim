" Initialization: {{{
"
highlight clear
if exists('syntax_on')
  syntax reset
endif
set background=dark

let g:colors_name = 'mountainplex'
" }}}
" Configuration: {{{
" let s:configuration = {}
" let s:configuration.palette = get(g:, 'mountaineer_palette', 'soft')
" let s:configuration.transparent_background = get(g:, 'mountaineer_transparent_background', 0)
" let s:configuration.disable_italic_comment = get(g:, 'mountaineer_disable_italic_comment', 0)
" let s:configuration.enable_italic = get(g:, 'mountaineer_enable_italic', 0)
" let s:configuration.cursor = get(g:, 'mountaineer_cursor', 'auto')
" let s:configuration.current_word = get(g:, 'mountaineer_current_word', get(g:, 'mountaineer_transparent_background', 0) == 0 ? 'grey background' : 'bold')
" }}}
" Palette: {{{
let s:palette = {
      \ 'bg0':        '#050505',
      \ 'bg1':        '#0F0F0F',
      \ 'fg':         '#F0F0F0',
      \ 'grey':       '#363636',
      \ 'lgrey':      '#2F4243',
      \ 'red':        '#C37474',
      \ 'yellow':     '#D28846',
      \ 'green':      '#8AAC8B',
      \ 'cyan':       '#8AABAC',
      \ 'blue':       '#8F8AAC',
      \ 'lblue':      '#2F4243',
      \ 'purple':     '#AC8AAC',
      \ 'none':       'NONE',   
      \ }
" }}}
" Function: {{{

function! s:Hi(group, fg_name, bg_name, attr)
	let fg = a:fg_name == 'NONE' ? a:fg_name : s:palette[a:fg_name]
	let bg = a:bg_name == 'NONE' ? a:bg_name : s:palette[a:bg_name]
	let gui = empty(a:attr) ? 'NONE' : a:attr

	exe 'hi ' . a:group . ' guifg=' . fg . ' guibg=' . bg . ' gui=' . gui
endfunction

command! -nargs=+ Hi call s:Hi(<f-args>)
" }}} 

"  Vim UI:{{{
"  GROUP      FG    BG    GUI
Hi Normal       fg     bg0   NONE
Hi Cursor       bg0    fg    NONE
Hi CursorLine   NONE   grey  NONE
Hi LineNr       grey   NONE  NONE
Hi StatusLine   yellow NONE  NONE
Hi StatusLineNC grey   bg1   NONE
Hi WildMenu     NONE   grey  NONE
Hi Pmenu        fg     bg1   NONE
Hi PmenuSel     fg     grey  NONE
Hi PmenuSbar    NONE   NONE  NONE
Hi PmenuThumb   NONE   NONE  NONE
Hi VertSplit    grey   NONE  NONE
Hi TabLin       NONE   NONE  NONE
Hi TabLineSel   NONE   cyan  NONE
Hi TabLineFill  NONE   NONE  NONE
Hi Title        blue   NONE  NONE
Hi TermCursorNC NONE   NONE  NONE
Hi ColorColumn  NONE   grey  NONE

hi! link CursorColumn CursorLine
hi! link CursorLineNr LineNr
hi! link NormalNC Normal
hi! link NormalFloat Normal
hi! link TermCursor Cursor

" Vim Text highlight
"  GROUP      FG    BG    GUI
Hi Directory  blue   NONE   NONE
Hi Error      red    NONE   bold
Hi Folded     grey   NONE   NONE
Hi IncSearch  bg0    yellow NONE
Hi MatchParen yellow bg1    bold
Hi NonText    bg0    bg0    NONE
Hi Search     bg0    yellow NONE
Hi SpecialKey purple NONE   bold
Hi Todo       purple NONE   bold
Hi Underlined NONE   NONE   underline
Hi Visual     NONE   lblue  NONE
Hi VisualNOS  NONE   bg1    underline
Hi WarningMsg yellow NONE   bold

hi! link ErrorMsg Error
hi! link ModeMsg Normal
hi! link MoreMsg Normal

" GROUP       FG      BG    GUI
Hi Type       NONE    NONE  bold
Hi Comment    grey    NONE  italic
Hi String     green   NONE  NONE
Hi Special    purple  NONE  NONE
Hi Constant   NONE    NONE  NONE
Hi Identifier NONE    NONE  NONE
Hi Ignore     NONE    NONE  NONE
Hi Statement  NONE    NONE  NONE
Hi PreProc    NONE    NONE  NONE
Hi Delimiter  NONE    NONE  NONE

" User colors
hi! link User1 StatusLine
hi! link User2 StatusLine
hi! link User3 StatusLine
hi! link User4 StatusLine
hi! link User5 StatusLine
hi! link User6 StatusLine
hi! link User7 StatusLine
hi! link User8 StatusLine
hi! link User9 StatusLine
" }}}
" Tweaks: {{{
" Shell: {{{
Hi shOption  blue NONE NONE
" }}}
" LaTex: {{{
Hi texOnlyMath blue NONE NONE
" }}}
" Diff: {{{
Hi diffAdded green NONE NONE
Hi diffRemoved red NONE NONE
Hi diffChanged blue NONE NONE
Hi diffFile cyan NONE NONE
Hi diffIndexLine purple NONE NONE

highlight! link diffOldFile diffRemoved
highlight! link diffNewFile diffAdded
highlight! link diffLine Comment
" }}}
" Help: {{{
Hi helpHyperTextJump yellow NONE NONE
Hi helpCommand cyan NONE NONE
Hi helpExample green NONE NONE
Hi helpSpecial blue NONE NONE
Hi helpSectionDelim grey NONE NONE
" }}}
" Lua: {{{
Hi luaTable NONE NONE NONE
" }}}
" Go: {{{
highlight! link goDirective Special
" }}}
" Spell: {{{
Hi SpellBad red NONE underline
Hi SpellCap blue NONE underline
Hi QuickFixLine NONE NONE underline

hi! link SignColumn Folded
hi! link SpellRare SpellCap
hi! link SpellLocal SpellCap
" }}}
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
