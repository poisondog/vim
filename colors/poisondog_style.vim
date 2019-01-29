" Vim color file - poisondog_style
" Generated by http://bytefluent.com/vivify 2018-12-17
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "poisondog_style"

"hi SignColumn -- no settings --
"hi TabLineSel -- no settings --
"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi PMenuSbar -- no settings --
"hi Normal guifg=#f0f0f0 guibg=#303030 guisp=#303030 gui=NONE ctermfg=255 ctermbg=236 cterm=NONE
hi Normal guifg=#f0f0f0 guibg=#303030 guisp=#303030 gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE
"hi CTagsImport -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
"hi Float -- no settings --
"hi CursorLine -- no settings --
"hi Union -- no settings --
"hi TabLineFill -- no settings --
"hi CursorColumn -- no settings --
"hi EnumerationName -- no settings --
"hi SpellCap -- no settings --
"hi SpellLocal -- no settings --
"hi DefinedName -- no settings --
"hi MatchParen -- no settings --
"hi LocalVariable -- no settings --
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
"hi TabLine -- no settings --
"hi clear -- no settings --
"hi texmath -- no settings --
hi IncSearch guifg=#80ffff guibg=#0060c0 guisp=#0060c0 gui=NONE ctermfg=123 ctermbg=4 cterm=NONE
hi WildMenu guifg=#000000 guibg=#ff80c0 guisp=#ff80c0 gui=NONE ctermfg=NONE ctermbg=212 cterm=NONE
hi SpecialComment guifg=#ffc890 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi Typedef guifg=#60f0a8 guibg=NONE guisp=NONE gui=NONE ctermfg=85 ctermbg=NONE cterm=NONE
hi Title guifg=#f0f0f0 guibg=NONE guisp=NONE gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi Folded guifg=#40f0f0 guibg=#006090 guisp=#006090 gui=NONE ctermfg=87 ctermbg=24 cterm=NONE
hi PreCondit guifg=#ffa8ff guibg=NONE guisp=NONE gui=NONE ctermfg=219 ctermbg=NONE cterm=NONE
hi Include guifg=#ffa8ff guibg=NONE guisp=NONE gui=NONE ctermfg=219 ctermbg=NONE cterm=NONE
hi StatusLineNC guifg=#707070 guibg=#c4c4c4 guisp=#c4c4c4 gui=NONE ctermfg=242 ctermbg=251 cterm=NONE
"hi NonText guifg=#d84070 guibg=#383838 guisp=#383838 gui=NONE ctermfg=168 ctermbg=237 cterm=NONE
hi NonText guifg=#d84070 guibg=#383838 guisp=#383838 gui=NONE ctermfg=168 ctermbg=NONE cterm=NONE
hi DiffText guifg=#ff78f0 guibg=#a02860 guisp=#a02860 gui=NONE ctermfg=213 ctermbg=125 cterm=NONE
hi ErrorMsg guifg=#ffa0ff guibg=NONE guisp=NONE gui=NONE ctermfg=219 ctermbg=NONE cterm=NONE
hi Ignore guifg=#303030 guibg=NONE guisp=NONE gui=NONE ctermfg=236 ctermbg=NONE cterm=NONE
hi Debug guifg=#ffc890 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi Identifier guifg=#40f8f8 guibg=NONE guisp=NONE gui=NONE ctermfg=87 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#ffc890 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi Conditional guifg=#60f0a8 guibg=NONE guisp=NONE gui=NONE ctermfg=85 ctermbg=NONE cterm=NONE
hi StorageClass guifg=#60f0a8 guibg=NONE guisp=NONE gui=NONE ctermfg=85 ctermbg=NONE cterm=NONE
hi Todo guifg=#ff80d0 guibg=NONE guisp=NONE gui=NONE ctermfg=212 ctermbg=NONE cterm=NONE
hi Special guifg=#ffc890 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi LineNr guifg=#707070 guibg=NONE guisp=NONE gui=NONE ctermfg=207 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#000000 guibg=#c4c4c4 guisp=#c4c4c4 gui=NONE ctermfg=NONE ctermbg=251 cterm=NONE
hi Label guifg=#60f0a8 guibg=NONE guisp=NONE gui=NONE ctermfg=85 ctermbg=NONE cterm=NONE
hi PMenuSel guifg=#000000 guibg=#c4c4c4 guisp=#c4c4c4 gui=NONE ctermfg=NONE ctermbg=251 cterm=NONE
hi Search guifg=#ffffa8 guibg=#808000 guisp=#808000 gui=NONE ctermfg=229 ctermbg=3 cterm=NONE
hi Delimiter guifg=#ffc890 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi Statement guifg=#dcdc78 guibg=NONE guisp=NONE gui=NONE ctermfg=186 ctermbg=NONE cterm=NONE
hi Comment guifg=#4c74b0 guibg=NONE guisp=NONE gui=bold,italic ctermfg=67 ctermbg=NONE cterm=bold
hi Character guifg=#92d4ff guibg=NONE guisp=NONE gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
hi Number guifg=#92d4ff guibg=NONE guisp=NONE gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
hi Boolean guifg=#dcdc78 guibg=NONE guisp=NONE gui=NONE ctermfg=186 ctermbg=NONE cterm=NONE
hi Operator guifg=#60f0a8 guibg=NONE guisp=NONE gui=NONE ctermfg=85 ctermbg=NONE cterm=NONE
hi Question guifg=#e8e800 guibg=NONE guisp=NONE gui=NONE ctermfg=184 ctermbg=NONE cterm=NONE
hi WarningMsg guifg=#ffa0ff guibg=NONE guisp=NONE gui=NONE ctermfg=219 ctermbg=NONE cterm=NONE
hi VisualNOS guifg=#ffe8c8 guibg=#c06800 guisp=#c06800 gui=NONE ctermfg=230 ctermbg=1 cterm=NONE
hi DiffDelete guifg=#a0d0ff guibg=#0020a0 guisp=#0020a0 gui=NONE ctermfg=153 ctermbg=19 cterm=NONE
hi ModeMsg guifg=#a0d0ff guibg=NONE guisp=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
hi Define guifg=#ffa8ff guibg=NONE guisp=NONE gui=NONE ctermfg=219 ctermbg=NONE cterm=NONE
hi Function guifg=#40f8f8 guibg=NONE guisp=NONE gui=NONE ctermfg=87 ctermbg=NONE cterm=NONE
hi FoldColumn guifg=#40c0ff guibg=#404040 guisp=#404040 gui=NONE ctermfg=81 ctermbg=238 cterm=NONE
hi PreProc guifg=#ffa8ff guibg=NONE guisp=NONE gui=NONE ctermfg=219 ctermbg=NONE cterm=NONE
hi Visual guifg=#b0ffb0 guibg=#008000 guisp=#008000 gui=NONE ctermfg=157 ctermbg=2 cterm=NONE
hi MoreMsg guifg=#70ffc0 guibg=#8040ff guisp=#8040ff gui=NONE ctermfg=85 ctermbg=13 cterm=NONE
hi VertSplit guifg=#707070 guibg=#c4c4c4 guisp=#c4c4c4 gui=NONE ctermfg=242 ctermbg=251 cterm=NONE
hi Exception guifg=#60f0a8 guibg=NONE guisp=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
hi Keyword guifg=#60f0a8 guibg=NONE guisp=NONE gui=NONE ctermfg=85 ctermbg=NONE cterm=NONE
hi Type guifg=#60f0a8 guibg=NONE guisp=NONE gui=NONE ctermfg=85 ctermbg=NONE cterm=NONE
hi DiffChange guifg=#e03870 guibg=#601830 guisp=#601830 gui=NONE ctermfg=168 ctermbg=52 cterm=NONE
hi Cursor guifg=#70ffc0 guibg=#8040ff guisp=#8040ff gui=NONE ctermfg=85 ctermbg=13 cterm=NONE
hi Error guifg=#ffffff guibg=#8000ff guisp=#8000ff gui=NONE ctermfg=15 ctermbg=93 cterm=NONE
hi PMenu guifg=#707070 guibg=#c4c4c4 guisp=#c4c4c4 gui=NONE ctermfg=242 ctermbg=251 cterm=NONE
hi SpecialKey guifg=#8888ff guibg=NONE guisp=NONE gui=NONE ctermfg=105 ctermbg=NONE cterm=NONE
hi Constant guifg=#92d4ff guibg=NONE guisp=NONE gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
hi Tag guifg=#ffc890 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi String guifg=#d1764b guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=NONE guibg=#707070 guisp=#707070 gui=NONE ctermfg=NONE ctermbg=242 cterm=NONE
hi Repeat guifg=#60f0a8 guibg=NONE guisp=NONE gui=NONE ctermfg=85 ctermbg=NONE cterm=NONE
"hi Directory guifg=#c8c8ff guibg=NONE guisp=NONE gui=NONE ctermfg=189 ctermbg=NONE cterm=NONE
hi Directory guifg=#FF0000 guibg=NONE guisp=NONE gui=NONE ctermfg=red ctermbg=NONE cterm=NONE
hi Structure guifg=#60f0a8 guibg=NONE guisp=NONE gui=NONE ctermfg=85 ctermbg=NONE cterm=NONE
hi Macro guifg=#ffa8ff guibg=NONE guisp=NONE gui=NONE ctermfg=219 ctermbg=NONE cterm=NONE
hi Underlined guifg=#f0f0f0 guibg=NONE guisp=NONE gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi DiffAdd guifg=#a0d0ff guibg=#0020a0 guisp=#0020a0 gui=NONE ctermfg=153 ctermbg=19 cterm=NONE
hi cursorim guifg=#ffffff guibg=#8800ff guisp=#8800ff gui=NONE ctermfg=15 ctermbg=93 cterm=NONE
hi pythonimport guifg=#009000 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
hi pythonexception guifg=#f00000 guibg=NONE guisp=NONE gui=NONE ctermfg=196 ctermbg=NONE cterm=NONE
hi pythonbuiltinfunction guifg=#009000 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
hi pythonoperator guifg=#7e8aa2 guibg=NONE guisp=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
hi pythonexclass guifg=#009000 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
hi vimoption guifg=#ffd700 guibg=NONE guisp=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
hi vimerror guifg=#ff0000 guibg=NONE guisp=NONE gui=bold ctermfg=196 ctermbg=NONE cterm=bold
hi cincluded guifg=#9acd32 guibg=NONE guisp=NONE gui=NONE ctermfg=149 ctermbg=NONE cterm=NONE
hi texsection guifg=#adff2f guibg=NONE guisp=NONE gui=NONE ctermfg=118 ctermbg=NONE cterm=NONE
hi texmatcher guifg=#9acd32 guibg=NONE guisp=NONE gui=NONE ctermfg=149 ctermbg=NONE cterm=NONE
hi htm guifg=#8f8f8f guibg=NONE guisp=NONE gui=NONE ctermfg=245 ctermbg=NONE cterm=NONE
hi js guifg=#cd5c5c guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
hi defined guifg=#e0ffff guibg=NONE guisp=NONE gui=bold ctermfg=195 ctermbg=NONE cterm=bold
hi lcursor guifg=#ffffff guibg=#8800ff guisp=#8800ff gui=NONE ctermfg=15 ctermbg=93 cterm=NONE
hi browsedirectory guifg=#660000 guibg=#ffffff guisp=#ffffff gui=NONE ctermfg=52 ctermbg=15 cterm=NONE
