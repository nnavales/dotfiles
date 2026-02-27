set background=dark
hi clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name='paragon'
set t_Co=256

let s:magenta = "#D78CF0"
let s:green = "#8FCF7A"
let s:orange = "#E9A96E"
let s:yellow = "#D9CC58"
let s:cyan = "#A5E9F5"
let s:teal = "#46C2A8"
let s:red = "#E0617A"
let s:fg = "#E9F2F2"
let s:bg = "#181A1C"
let s:highlight_low = "#1B1E20"
let s:highlight_med = "#202325"
let s:highlight_high = "#33383C"
let s:surface = "#1F2225"
let s:overlay = "#272C2F"
let s:bg_dim = "#131618"
let s:fg_dim = "#6E797E"
let s:float_dim = "#879297"
let s:syntax_dim = "#7A878A"
let s:muted = "#8B9C9F"
let s:semantic = "#BFD6D8"

let s:diff_add = "#1F2B22"
let s:diff_change = "#1c212b"
let s:diff_delete = "#2a1c1e"
let s:diff_text = "#2a3a4a"

function! s:hi(group, guisp, guifg, guibg, gui, cterm)
  let cmd = ""
  if a:guisp != ""
    let cmd = cmd . " guisp=" . a:guisp
  endif
  if a:guifg != ""
    let cmd = cmd . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    let cmd = cmd . " guibg=" . a:guibg
  endif
  if a:gui != ""
    let cmd = cmd . " gui=" . a:gui
  endif
  if a:cterm != ""
    let cmd = cmd . " cterm=" . a:cterm
  endif
  if cmd != ""
    exec "hi " . a:group . cmd
  endif
endfunction

call s:hi("Statement", "NONE", s:magenta, "NONE", "NONE", "NONE")
call s:hi("Conditional", "NONE", s:magenta, "NONE", "NONE", "NONE")
call s:hi("Repeat", "NONE", s:magenta, "NONE", "NONE", "NONE")
call s:hi("Label", "NONE", s:magenta, "NONE", "NONE", "NONE")
call s:hi("Keyword", "NONE", s:magenta, "NONE", "NONE", "NONE")
call s:hi("Exception", "NONE", s:magenta, "NONE", "NONE", "NONE")
call s:hi("Include", "NONE", s:magenta, "NONE", "NONE", "NONE")
call s:hi("StorageClass", "NONE", s:magenta, "NONE", "NONE", "NONE")
call s:hi("Structure", "NONE", s:magenta, "NONE", "NONE", "NONE")

call s:hi("PreProc", "NONE", s:orange, "NONE", "NONE", "NONE")
call s:hi("Define", "NONE", s:orange, "NONE", "NONE", "NONE")
call s:hi("Macro", "NONE", s:orange, "NONE", "NONE", "NONE")
call s:hi("PreCondit", "NONE", s:orange, "NONE", "NONE", "NONE")

call s:hi("String", "NONE", s:green, "NONE", "NONE", "NONE")

call s:hi("Constant", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("Number", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("Float", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("Boolean", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("Character", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("Special", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("SpecialChar", "NONE", s:yellow, "NONE", "NONE", "NONE")

call s:hi("Function", "NONE", s:teal, "NONE", "NONE", "NONE")
call s:hi("Directory", "NONE", s:cyan, "NONE", "NONE", "NONE")
call s:hi("Identifier", "NONE", s:fg, "NONE", "NONE", "NONE")

call s:hi("Type", "NONE", s:cyan, "NONE", "NONE", "NONE")
call s:hi("Typedef", "NONE", s:cyan, "NONE", "NONE", "NONE")

call s:hi("Operator", "NONE", s:syntax_dim, "NONE", "NONE", "NONE")
call s:hi("Delimiter", "NONE", s:syntax_dim, "NONE", "NONE", "NONE")

call s:hi("Comment", "NONE", s:muted, "NONE", "NONE", "NONE")
call s:hi("SpecialComment", "NONE", s:muted, "NONE", "NONE", "NONE")

call s:hi("Error", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("Debug", "NONE", s:cyan, "NONE", "NONE", "NONE")
call s:hi("Todo", "NONE", s:magenta, "NONE", "NONE", "NONE")

call s:hi("Normal", "NONE", s:fg, s:bg, "NONE", "NONE")
call s:hi("NormalNC", "NONE", s:fg, s:bg, "NONE", "NONE")
call s:hi("NormalSB", "NONE", s:fg, s:bg_dim, "NONE", "NONE")
call s:hi("Conceal", "NONE", s:fg_dim, "NONE", "NONE", "NONE")
call s:hi("NonText", "NONE", s:fg_dim, "NONE", "NONE", "NONE")
call s:hi("SpecialKey", "NONE", s:fg_dim, "NONE", "NONE", "NONE")
call s:hi("Whitespace", "NONE", s:fg_dim, "NONE", "NONE", "NONE")
call s:hi("EndOfBuffer", "NONE", s:fg_dim, "NONE", "NONE", "NONE")

call s:hi("Cursor", "NONE", s:bg, s:fg, "NONE", "NONE")
call s:hi("lCursor", "NONE", s:bg, s:fg, "NONE", "NONE")
call s:hi("CursorIM", "NONE", s:bg, s:fg, "NONE", "NONE")
call s:hi("CursorLine", "NONE", "NONE", s:highlight_low, "NONE", "NONE")
call s:hi("CursorColumn", "NONE", "NONE", s:highlight_low, "NONE", "NONE")
call s:hi("ColorColumn", "NONE", "NONE", s:highlight_low, "NONE", "NONE")

call s:hi("LineNr", "NONE", s:fg_dim, "NONE", "NONE", "NONE")
call s:hi("LineNrAbove", "NONE", s:fg_dim, "NONE", "NONE", "NONE")
call s:hi("LineNrBelow", "NONE", s:fg_dim, "NONE", "NONE", "NONE")
call s:hi("CursorLineNr", "NONE", s:fg, "NONE", "bold", "bold")

call s:hi("SignColumn", "NONE", s:fg_dim, s:bg, "NONE", "NONE")
call s:hi("SignColumnSB", "NONE", s:fg_dim, s:bg, "NONE", "NONE")
call s:hi("Folded", "NONE", s:magenta, s:bg, "NONE", "NONE")
call s:hi("FoldColumn", "NONE", s:fg_dim, s:bg, "NONE", "NONE")

call s:hi("VertSplit", "NONE", s:overlay, "NONE", "NONE", "NONE")
call s:hi("WinSeparator", "NONE", s:overlay, "NONE", "NONE", "NONE")

call s:hi("NormalFloat", "NONE", s:fg, s:surface, "NONE", "NONE")
call s:hi("FloatBorder", "NONE", s:overlay, s:surface, "NONE", "NONE")
call s:hi("FloatTitle", "NONE", s:cyan, s:overlay, "NONE", "NONE")

call s:hi("Pmenu", "NONE", s:float_dim, s:surface, "NONE", "NONE")
call s:hi("PmenuSel", "NONE", "NONE", s:highlight_high, "NONE", "NONE")
call s:hi("PmenuSbar", "NONE", "NONE", s:overlay, "NONE", "NONE")
call s:hi("PmenuThumb", "NONE", "NONE", s:float_dim, "NONE", "NONE")
call s:hi("WildMenu", "NONE", s:float_dim, s:surface, "NONE", "NONE")

call s:hi("StatusLine", "NONE", s:fg, s:surface, "NONE", "NONE")
call s:hi("StatusLineNC", "NONE", s:fg_dim, s:surface, "NONE", "NONE")
call s:hi("StatusLineTerm", "NONE", s:fg, s:surface, "NONE", "NONE")
call s:hi("StatusLineTermNC", "NONE", s:fg_dim, s:surface, "NONE", "NONE")

call s:hi("TabLine", "NONE", s:fg_dim, s:surface, "NONE", "NONE")
call s:hi("TabLineFill", "NONE", "NONE", s:surface, "NONE", "NONE")
call s:hi("TabLineSel", "NONE", s:cyan, s:bg, "NONE", "NONE")
call s:hi("Title", "NONE", s:cyan, "NONE", "bold", "bold")

call s:hi("Search", "NONE", s:yellow, s:highlight_med, "bold", "bold")
call s:hi("IncSearch", "NONE", s:bg, s:yellow, "NONE", "NONE")
call s:hi("CurSearch", "NONE", s:bg, s:yellow, "NONE", "NONE")
call s:hi("Substitute", "NONE", s:bg, s:orange, "NONE", "NONE")
call s:hi("MatchParen", "NONE", s:cyan, s:highlight_med, "bold,underline", "bold,underline")

call s:hi("Visual", "NONE", "NONE", s:highlight_high, "NONE", "NONE")
call s:hi("VisualNOS", "NONE", "NONE", s:highlight_high, "bold", "bold")

call s:hi("DiffAdd", "NONE", "NONE", s:diff_add, "NONE", "NONE")
call s:hi("DiffChange", "NONE", "NONE", s:diff_change, "NONE", "NONE")
call s:hi("DiffDelete", "NONE", s:red, s:diff_delete, "NONE", "NONE")
call s:hi("DiffText", "NONE", "NONE", s:diff_text, "NONE", "NONE")
call s:hi("diffAdded", "NONE", s:green, "NONE", "NONE", "NONE")
call s:hi("diffRemoved", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("diffChanged", "NONE", s:cyan, "NONE", "NONE", "NONE")
call s:hi("diffOldFile", "NONE", s:fg_dim, s:diff_delete, "NONE", "NONE")
call s:hi("diffNewFile", "NONE", s:fg_dim, s:diff_add, "NONE", "NONE")
call s:hi("diffLine", "NONE", s:muted, "NONE", "NONE", "NONE")
call s:hi("diffFile", "NONE", s:cyan, "NONE", "NONE", "NONE")
call s:hi("diffIndexLine", "NONE", s:yellow, "NONE", "NONE", "NONE")

call s:hi("ModeMsg", "NONE", s:fg, "NONE", "bold", "bold")
call s:hi("MsgArea", "NONE", s:fg, s:bg, "NONE", "NONE")
call s:hi("MoreMsg", "NONE", s:cyan, "NONE", "NONE", "NONE")
call s:hi("Question", "NONE", s:magenta, "NONE", "NONE", "NONE")
call s:hi("ErrorMsg", "NONE", s:red, "NONE", "bold,italic", "bold,italic")
call s:hi("WarningMsg", "NONE", s:orange, "NONE", "NONE", "NONE")

call s:hi("Underlined", "NONE", s:fg, "NONE", "underline", "underline")
call s:hi("Bold", "NONE", s:fg, "NONE", "bold", "bold")
call s:hi("Italic", "NONE", s:fg, "NONE", "italic", "italic")

" QuickFix
call s:hi("qfFileName", "NONE", s:cyan, "NONE", "NONE", "NONE")
call s:hi("qfLineNr", "NONE", s:fg_dim, "NONE", "NONE", "NONE")
call s:hi("QuickFixLine", "NONE", s:fg, s:highlight_med, "bold", "bold")

" Health
call s:hi("healthError", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("healthSuccess", "NONE", s:green, "NONE", "NONE", "NONE")
call s:hi("healthWarning", "NONE", s:orange, "NONE", "NONE", "NONE")

" WinBar
call s:hi("WinBar", "NONE", s:fg, s:surface, "NONE", "NONE")
call s:hi("WinBarNC", "NONE", s:fg_dim, s:surface, "NONE", "NONE")

hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc
hi link SpecialChar Special
hi link Tag Special
hi link SpecialComment Special
hi link Exception Error
hi link StatusLineTerm StatusLine
hi link StatusLineTermNC StatusLineNC
hi link Terminal Normal
hi link Ignore Comment

let g:terminal_ansi_colors = [s:bg, s:red, s:green, s:yellow, s:cyan, s:magenta, s:teal, s:fg, s:highlight_high, "#F1738D", "#9FDC8A", "#E6D667", "#B7F2FC", "#E39AF8", "#5FD3BA", "#F5FAFA"]
