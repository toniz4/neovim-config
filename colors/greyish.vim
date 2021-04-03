highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'greyish'

function! s:Hi(group, fg_name, bg_name, attr)
	let fg = a:fg_name == 'NONE' ? a:fg_name : s:colors[a:fg_name]
	let bg = a:bg_name == 'NONE' ? a:bg_name : s:colors[a:bg_name]
	let gui = empty(a:attr) ? 'NONE' : a:attr

	exe 'hi ' . a:group . ' guifg=' . fg . ' guibg=' . bg . ' gui=' . gui
endfunction

command! -nargs=+ Hi call s:Hi(<f-args>)

let s:colors = {
\  'black': '#0B0A07',
\  'red': '#780606',
\  'green': '#1A381E',
\  'yellow': '#755814',
\  'blue': '#192A51',
\  'magenta': '#6D466B',
\  'cyan': '#4C6472',
\  'white': '#DFDFDF',
\  'lgrey1': '#D6D6D6',
\  'lgrey2': '#C2C2C2',
\  'lgrey3': '#B8B8B8',
\  'grey': '#757575'
\ }

"  GROUP FG BG ATTR
Hi Normal black white NONE
Hi NormalFloat black lgrey1 NONE
Hi Type blue NONE bold
Hi Comment grey NONE NONE
Hi String green NONE NONE
Hi Special magenta NONE NONE
Hi Underlined NONE NONE underline
Hi Error red NONE NONE 
Hi Todo magenta NONE bold
Hi MatchParen cyan NONE bold
Hi Constant NONE NONE NONE
Hi Identifier NONE NONE NONE
Hi Ignore NONE NONE NONE
Hi Statement NONE NONE NONE
Hi PreProc NONE NONE NONE
Hi Delimiter NONE NONE NONE

hi! link NormalNC Normal
hi! link SpecialComment Special

" UI
"  GROUP FG BG ATTR
Hi NonText grey lgrey1 NONE
Hi EndOfBuffer NONE NONE bold
Hi SpecialKey cyan lgrey1 bold
Hi LineNr NONE lgrey1 NONE
Hi CursorLineNr NONE lgrey1 bold
Hi ErrorMsg red NONE bold
Hi MoreMsg black NONE NONE
Hi Title magenta NONE NONE
Hi WarningMsg yellow NONE bold
Hi Cursor white black NONE
Hi TermCursorNC white lgrey3 NONE
Hi Visual NONE lgrey2 NONE
Hi VisualNOS NONE lgrey2 underline
Hi TabLine NONE lgrey1 NONE
Hi TabLineSel NONE lgrey3 NONE
Hi TabLineFill NONE lgrey1 NONE
Hi ColorColumn NONE lgrey3 NONE
Hi CursorColumn NONE lgrey2 NONE
Hi CursorLine NONE lgrey2 NONE
Hi VertSplit lgrey3 lgrey3 NONE
Hi StatusLine NONE lgrey3 NONE
Hi StatusLineNC NONE lgrey1 NONE
Hi WildMenu NONE lgrey1 NONE
Hi Search NONE lgrey2 bold
Hi IncSearch NONE NONE reverse
Hi Directory blue NONE NONE
Hi DiffAdd green NONE NONE
Hi DiffDelete red NONE NONE
Hi DiffChange magenta NONE NONE
Hi DiffText blue NONE bold
Hi Folded NONE lgrey1 NONE
Hi Pmenu NONE lgrey1 NONE
Hi PmenuSel NONE lgrey3 bold
Hi PmenuSbar NONE lgrey1 bold
Hi PmenuThumb NONE grey bold
Hi SpellBad red NONE underline
Hi SpellCap blue NONE underline
Hi QuickFixLine NONE NONE underline

hi! link Conceal Normal
hi! link ModeMsg MoreMsg
hi! link Question MoreMsg
hi! link lCursor Cursor
hi! link TermCursor Cursor
hi! link diffAdded DiffAdd
hi! link diffRemoved DiffDelete
hi! link FoldColumn Folded
hi! link SignColumn Folded
hi! link SpellRare SpellCap
hi! link SpellLocal SpellCap

Hi User1 white blue NONE
Hi User2 white green NONE
Hi User3 white yellow NONE
Hi User4 white magenta NONE
Hi User6 white cyan NONE
Hi User7 black lgrey3 NONE
Hi User8 black grey NONE
Hi User9 white red NONE
