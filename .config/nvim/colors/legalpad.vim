" colors/legalpad.vim
hi clear
if exists("syntax_on")
  syntax reset
endif

set background=light
let g:colors_name = "legalpad"

" Special
hi Normal       guifg=#8b8198 guibg=#fff9e5
hi Cursor       guifg=#fff9e5 guibg=#8b8198
hi CursorLine   guibg=#f2f1dc
hi CursorColumn guibg=#f2f1dc
hi LineNr       guifg=#bfb9c6 guibg=#fff9e5
hi VertSplit    guifg=#d8d1c1 guibg=#fff9e5
hi StatusLine   guifg=#fff9e5 guibg=#8b8198
hi StatusLineNC guifg=#bfb9c6 guibg=#e9e5d3
hi Visual       guibg=#e4dec0
hi MatchParen   guifg=#000000 guibg=#DCB16C gui=bold

" Syntax
hi Comment      guifg=#bfb9c6 gui=italic
hi Constant     guifg=#D57E85
hi String       guifg=#A3B367
hi Character    guifg=#A3B367
hi Number       guifg=#D57E85
hi Boolean      guifg=#D57E85
hi Float        guifg=#D57E85

hi Identifier   guifg=#69A9A7
hi Function     guifg=#7297B9

hi Statement    guifg=#BB99B4
hi Conditional  guifg=#BB99B4
hi Repeat       guifg=#BB99B4
hi Label        guifg=#BB99B4
hi Operator     guifg=#585062
hi Keyword      guifg=#BB99B4
hi Exception    guifg=#D57E85

hi PreProc      guifg=#DCB16C
hi Include      guifg=#DCB16C
hi Define       guifg=#DCB16C
hi Macro        guifg=#DCB16C
hi PreCondit    guifg=#DCB16C

hi Type         guifg=#A3B367
hi StorageClass guifg=#A3B367
hi Structure    guifg=#A3B367
hi Typedef      guifg=#A3B367

hi Special      guifg=#BB99B4
hi SpecialChar  guifg=#BB99B4
hi Tag          guifg=#BB99B4
hi Delimiter    guifg=#BB99B4
hi SpecialComment guifg=#bfb9c6
hi Debug        guifg=#D57E85

hi Underlined   gui=underline guifg=#7297B9
hi Ignore       guifg=#fff9e5
hi Error        guifg=#fff9e5 guibg=#D57E85
hi Todo         guifg=#fff9e5 guibg=#A3B367 gui=bold

