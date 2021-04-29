highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'solitary'

function! s:Hi(group, fg_name, bg_name, attr)
	let fg = a:fg_name == 'NONE' ? a:fg_name : s:colors[a:fg_name]
	let bg = a:bg_name == 'NONE' ? a:bg_name : s:colors[a:bg_name]
	let gui = empty(a:attr) ? 'NONE' : a:attr

	exe 'hi ' . a:group . ' guifg=' . fg . ' guibg=' . bg . ' gui=' . gui
endfunction

command! -nargs=+ Hi call s:Hi(<f-args>)

let s:colors = {
\  'black': '#0D0D0D',
\  'red': '#821717',
\  'green': '#306938',
\  'yellow': '#b96e2d',
\  'blue': '#233c76',
\  'magenta': '#6D466B',
\  'cyan': '#4C6472',
\  'white': '#DFDFDF',
\  'grey1': '#404040',
\  'grey2': '#8C8C8C',
\  'grey3': '#B8B8B8',
\ }

"  Vim UI
"  GROUP      FG    BG    GUI
Hi Normal        white   black NONE
Hi Cursor        black   white NONE
Hi CursorLine    NONE    grey1 NONE
Hi LineNr        grey1   NONE  NONE
Hi StatusLine    yellow  NONE  NONE
Hi StatusLineNC  grey1   NONE  NONE
Hi WildMenu      NONE    grey1 NONE
Hi Pmenu         NONE    NONE  NONE
Hi PmenuSel      NONE    cyan  NONE
Hi PmenuSbar     NONE    NONE  NONE
Hi PmenuThumb    NONE    NONE  NONE
Hi VertSplit     grey1   NONE  NONE
Hi TabLin        NONE    NONE  NONE
Hi TabLineSel    NONE    cyan  NONE
Hi TabLineFill   NONE    NONE  NONE
Hi Title         magenta NONE  NONE
Hi TermCursorNC  NONE    NONE  NONE
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
Hi NonText    black   black  NONE
Hi Search     black   yellow NONE
Hi SpecialKey magenta NONE   bold
Hi Todo       magenta NONE   bold
Hi Underlined NONE    NONE   underline
Hi Visual     NONE    grey1  NONE
Hi VisualNOS  NONE    grey1  underline
Hi WarningMsg yellow  NONE   bold

hi! link ErrorMsg Error
hi! link ModeMsg Normal
hi! link MoreMsg Normal

" GROUP       FG      BG    GUI
Hi Type       NONE    NONE  bold
if !exists('g:solitary_no_italic_comments')
	Hi Comment    grey1   NONE  italic
endif
Hi String     grey2   NONE  NONE
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
