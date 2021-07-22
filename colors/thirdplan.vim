highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'thirdplan'

function! s:Hi(group, fg_name, bg_name, attr)
	let fg = a:fg_name == 'NONE' ? a:fg_name : s:colors[a:fg_name]
	let bg = a:bg_name == 'NONE' ? a:bg_name : s:colors[a:bg_name]
	let gui = empty(a:attr) ? 'NONE' : a:attr

	exe 'hi ' . a:group . ' guifg=' . fg . ' guibg=' . bg . ' gui=' . gui
endfunction

command! -nargs=+ Hi call s:Hi(<f-args>)

let s:colors = {
\  'black': '#201f1c',
\  'red': '#9c1616',
\  'green': '#186826',
\  'yellow': '#f0de73',
\  'blue': '#1b36b1',
\  'magenta': '#983bab',
\  'cyan': '#70cfc5',
\  'white': '#f7f1e3',
\  'grey1': '#a09d92',
\  'grey2': '#c6eae6',
\ }

"  Vim UI
"  GROUP         FG      BG    GUI
Hi Normal        black   white NONE
Hi Cursor        white   black NONE
Hi CursorLine    NONE    grey1 NONE
Hi LineNr        grey1   NONE  NONE
Hi StatusLine    black 	 white NONE
Hi StatusLineNC  grey1   white NONE
Hi WildMenu      NONE    grey1 NONE
Hi Pmenu         NONE    grey2 NONE
Hi PmenuSel      black   cyan  NONE
Hi PmenuSbar     NONE    NONE  NONE
Hi PmenuThumb    NONE    NONE  NONE
Hi VertSplit     grey1   NONE  NONE
Hi TabLine       NONE    NONE  NONE
Hi TabLineSel    NONE    cyan  NONE
Hi TabLineFill   NONE    NONE  NONE
Hi Title         magenta NONE  NONE
Hi TermCursorNC  NONE    NONE  underline
Hi ColorColumn   NONE    grey1 NONE

hi! link CursorColumn CursorLine
hi! link CursorLineNr LineNr
hi! link NormalNC Normal
hi! link NormalFloat Normal
hi! link TermCursor Cursor


" Vim Text highlight
"  GROUP      FG    BG    GUI
Hi Directory  blue    NONE   NONE
Hi Error      red     NONE   bold
Hi Folded     grey1   NONE   NONE
Hi IncSearch  black   yellow NONE
Hi MatchParen yellow  grey1  bold
Hi NonText    white   white  NONE
Hi Search     black   yellow NONE
Hi SpecialKey magenta NONE   bold
Hi Todo       magenta NONE   bold
Hi Underlined NONE    NONE   underline
Hi Visual     NONE    yellow NONE
Hi VisualNOS  NONE    yellow underline
Hi WarningMsg yellow  NONE   bold

hi! link ErrorMsg Error
hi! link ModeMsg Normal
hi! link MoreMsg Normal

" GROUP       FG      BG    GUI
Hi Type       NONE    NONE  bold
Hi Comment    green   NONE  italic
Hi String     black   NONE  NONE
Hi Special    magenta NONE  NONE
Hi Constant   NONE    NONE  NONE
Hi Identifier NONE    NONE  NONE
Hi Ignore     NONE    NONE  NONE
Hi Statement  NONE    NONE  NONE
Hi PreProc    NONE    NONE  NONE
Hi Delimiter  NONE    NONE  NONE

hi! link SpecialComment Special

" Lsp messages
hi! link LspDiagnosticsDefaultError Error
hi! link LspDiagnosticsDefaultWarning WarningMsgError
hi! link LspDiagnosticsDefaultInformation Normal

" Diff
Hi DiffAdd green NONE NONE
Hi DiffDelete red NONE NONE
Hi DiffChange magenta NONE NONE
Hi DiffText blue NONE bold

hi! link diffAdded DiffAdd
hi! link diffRemoved DiffDelete

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

" Spell
"  GROUP FG BG ATTR
Hi SpellBad red NONE underline
Hi SpellCap blue NONE underline
Hi QuickFixLine NONE NONE underline

hi! link SignColumn Folded
hi! link SpellRare SpellCap
hi! link SpellLocal SpellCap
