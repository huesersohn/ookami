if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=dark

if exists("syntax_on")
    syntax reset
endif

let colors_name = "ookami"

let s:ocp = {}

let s:ocp.plain = ['f8f6f2', 15] " #f8f6f2
let s:ocp.snow = ['ffffff', 15] " #ffffff
let s:ocp.coal = ['000000', 16] " #000000

let s:ocp.brightgravel   = ['d9cec3', 252] " #d9cec3
let s:ocp.lightgravel    = ['998f84', 245] " #998f84
let s:ocp.gravel         = ['857f78', 243] " #857f78
let s:ocp.mediumgravel   = ['666462', 241] " #666462
let s:ocp.deepgravel     = ['45413b', 238] " #45413b
let s:ocp.deepergravel   = ['35322d', 236] " #35322d
let s:ocp.darkgravel     = ['242321', 235] " #242321
let s:ocp.blackgravel    = ['1c1b1a', 233] " #1c1b1a
let s:ocp.blackestgravel = ['141413', 232] " #141413

let s:ocp.dalespale = ['fade3e', 221]       " #fade3e
let s:ocp.dirtyblonde = ['f4cf86', 222]     " #f4cf86
let s:ocp.taffy = ['ff2c4b', 196]           " #ff2c4b
let s:ocp.saltwatertaffy = ['8cffba', 121]  " #8cffba
let s:ocp.tardis = ['0a9dff', 39]           " #0a9dff
let s:ocp.orange = ['ffa724', 214]          " #ffa724
let s:ocp.lime = ['aeee00', 154]            " #aeee00
let s:ocp.dress = ['ff9eb8', 211]           " #ff9eb8
let s:ocp.toffee = ['b88853', 137]          " #b88853
let s:ocp.coffee    = ['c7915b', 173]       " #c7915b
let s:ocp.darkroast = ['88633f', 95]        " #88633f

let s:ocp.red    = ['fb4934', 167]          " #fb4934 #d75f5f #ff5f00
let s:ocp.green  = ['b8bb26', 142]          " #b8bb26
let s:ocp.yellow = ['fabd2f', 214]          " #fabd2f
let s:ocp.blue   = ['83a598', 109]          " #83a598
let s:ocp.purple = ['d3869b', 175]          " #d3869b
let s:ocp.aqua   = ['8ec07c', 108]          " #8ec07c

function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:ocp, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:ocp, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:ocp, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction
" }}}

let s:gutter = 'blackgravel'
let s:tabline = 'blackgravel'

call s:HL('Normal', 'plain', 'blackgravel')

call s:HL('Folded', 'mediumgravel', 'bg', 'none')

call s:HL('VertSplit', 'lightgravel', 'bg', 'none')

call s:HL('CursorLine',   '', 'darkgravel', 'none')
call s:HL('CursorColumn', '', 'darkgravel')
call s:HL('ColorColumn',  '', 'darkgravel')

call s:HL('TabLine', 'plain', s:tabline, 'none')
call s:HL('TabLineFill', 'plain', s:tabline, 'none')
call s:HL('TabLineSel', 'coal', 'tardis', 'none')

call s:HL('MatchParen', 'dalespale', 'darkgravel', 'bold')

call s:HL('NonText',    'deepgravel', 'bg')
call s:HL('SpecialKey', 'deepgravel', 'bg')

call s:HL('Visual',    '',  'mediumgravel')
call s:HL('VisualNOS', '',  'deepgravel')

call s:HL('Search',    'coal', 'dalespale', 'bold')
call s:HL('IncSearch', 'coal', 'tardis',    'bold')

call s:HL('Underlined', 'fg', '', 'underline')

call s:HL('Directory', 'dirtyblonde', '', 'bold')

call s:HL('Title', 'lime')

call s:HL('ErrorMsg',   'taffy',       'bg', 'bold')
call s:HL('MoreMsg',    'dalespale',   '',   'bold')
call s:HL('ModeMsg',    'dirtyblonde', '',   'bold')
call s:HL('Question',   'dirtyblonde', '',   'bold')
call s:HL('WarningMsg', 'dress',       '',   'bold')

call s:HL('LineNr',     'mediumgravel', s:gutter)
call s:HL('SignColumn', '',             s:gutter)
call s:HL('FoldColumn', 'mediumgravel', s:gutter)

call s:HL('StatusLine',   'plain', 'deepgravel', 'bold')
call s:HL('StatusLineNC', 'snow',  'deepgravel', 'bold')
call s:HL('WildMenu'  , 'blackgravel', 'plain')

call s:HL('Cursor',  'coal', 'tardis', 'bold')
call s:HL('vCursor', 'coal', 'tardis', 'bold')
call s:HL('iCursor', 'coal', 'tardis', 'none')

call s:HL('Special', 'plain')

call s:HL('Comment',        'gravel')
call s:HL('Todo',           'snow', 'bg', 'bold')
call s:HL('SpecialComment', 'snow', 'bg', 'bold')

call s:HL('String', 'dirtyblonde')

call s:HL('Statement',   'taffy', '', 'bold')
call s:HL('Keyword',     'taffy', '', 'bold')
call s:HL('Conditional', 'taffy', '', 'bold')
call s:HL('Operator',    'taffy', '', 'none')
call s:HL('Label',       'taffy', '', 'none')
call s:HL('Repeat',      'taffy', '', 'none')

call s:HL('Identifier', 'orange', '', 'none')
call s:HL('Function',   'orange', '', 'none')

call s:HL('PreProc',   'lime', '', 'none')
call s:HL('Macro',     'lime', '', 'none')
call s:HL('Define',    'lime', '', 'none')
call s:HL('PreCondit', 'lime', '', 'bold')

call s:HL('Constant',  'toffee', '', 'bold')
call s:HL('Character', 'toffee', '', 'bold')
call s:HL('Boolean',   'toffee', '', 'bold')

call s:HL('Number', 'toffee', '', 'bold')
call s:HL('Float',  'toffee', '', 'bold')

call s:HL('SpecialChar', 'dress', '', 'bold')

call s:HL('Type', 'dress', '', 'none')
call s:HL('StorageClass', 'taffy', '', 'none')
call s:HL('Structure', 'taffy', '', 'none')
call s:HL('Typedef', 'taffy', '', 'bold')

call s:HL('Exception', 'lime', '', 'bold')

call s:HL('Error',  'snow',   'taffy', 'bold')
call s:HL('Debug',  'snow',   '',      'bold')
call s:HL('Ignore', 'gravel', '',      '')

call s:HL('Pmenu', 'plain', 'deepergravel')
call s:HL('PmenuSel', 'coal', 'tardis') " , 'bold')
call s:HL('PmenuSbar', '', 'deepergravel')
call s:HL('PmenuThumb', 'brightgravel')

call s:HL('DiffDelete', '', 'red')
call s:HL('DiffAdd',    '', 'green')
call s:HL('DiffChange', '', 'aqua')
call s:HL('DiffText',   '', 'red', 'bold')

if has("spell")
    call s:HL('SpellCap', 'dalespale', 'bg', 'undercurl,bold', 'red')
    call s:HL('SpellBad', '', 'bg', 'undercurl', 'red')
    call s:HL('SpellLocal', '', '', 'undercurl', 'red')
    call s:HL('SpellRare', '', '', 'undercurl', 'red')
endif

call s:HL('texStatement', 'tardis', '', 'none')
call s:HL('texMathZoneX', 'orange', '', 'none')
call s:HL('texMathZoneA', 'orange', '', 'none')
call s:HL('texMathZoneB', 'orange', '', 'none')
call s:HL('texMathZoneC', 'orange', '', 'none')
call s:HL('texMathZoneD', 'orange', '', 'none')
call s:HL('texMathZoneE', 'orange', '', 'none')
call s:HL('texMathZoneV', 'orange', '', 'none')
call s:HL('texMathZoneX', 'orange', '', 'none')
call s:HL('texMath', 'orange', '', 'none')
call s:HL('texMathMatcher', 'orange', '', 'none')
call s:HL('texRefLabel', 'dirtyblonde', '', 'none')
call s:HL('texRefZone', 'lime', '', 'none')
call s:HL('texComment', 'darkroast', '', 'none')
call s:HL('texDelimiter', 'orange', '', 'none')
call s:HL('texZone', 'brightgravel', '', 'none')

augroup ookami_tex
    au!

    au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END

call s:HL('cssColorProp', 'fg', '', 'none')
call s:HL('cssBoxProp', 'fg', '', 'none')
call s:HL('cssTextProp', 'fg', '', 'none')
call s:HL('cssRenderProp', 'fg', '', 'none')
call s:HL('cssGeneratedContentProp', 'fg', '', 'none')

call s:HL('cssValueLength', 'toffee', '', 'bold')
call s:HL('cssColor', 'toffee', '', 'bold')
call s:HL('cssBraces', 'lightgravel', '', 'none')
call s:HL('cssIdentifier', 'orange', '', 'bold')
call s:HL('cssClassName', 'orange', '', 'none')

call s:HL('htmlTag',    'darkroast', 'bg', 'none')
call s:HL('htmlEndTag', 'darkroast', 'bg', 'none')

call s:HL('htmlTagName',        'coffee', '', 'bold')
call s:HL('htmlSpecialTagName', 'coffee', '', 'bold')
call s:HL('htmlSpecialChar',    'lime',   '', 'none')

call s:HL('htmlArg', 'coffee', '', 'none')

call s:HL('htmlLink', 'lightgravel', '', 'none')

call s:HL('javaClassDecl', 'taffy', '', 'bold')
call s:HL('javaScopeDecl', 'taffy', '', 'bold')
call s:HL('javaCommentTitle', 'gravel', '')
call s:HL('javaDocTags', 'snow', '', 'none')
call s:HL('javaDocParam', 'dalespale', '', '')

call s:HL('markdownHeadingRule', 'lightgravel', '', 'bold')
call s:HL('markdownHeadingDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownOrderedListMarker', 'lightgravel', '', 'bold')
call s:HL('markdownListMarker', 'lightgravel', '', 'bold')
call s:HL('markdownItalic', 'snow', '', 'bold')
call s:HL('markdownBold', 'snow', '', 'bold')
call s:HL('markdownH1', 'orange', '', 'bold')
call s:HL('markdownH2', 'lime', '', 'bold')
call s:HL('markdownH3', 'lime', '', 'none')
call s:HL('markdownH4', 'lime', '', 'none')
call s:HL('markdownH5', 'lime', '', 'none')
call s:HL('markdownH6', 'lime', '', 'none')
call s:HL('markdownLinkText', 'toffee', '', 'underline')
call s:HL('markdownIdDeclaration', 'toffee')
call s:HL('markdownAutomaticLink', 'toffee', '', 'bold')
call s:HL('markdownUrl', 'toffee', '', 'bold')
call s:HL('markdownUrldelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownLinkDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownLinkTextDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownCodeDelimiter', 'dirtyblonde', '', 'bold')
call s:HL('markdownCode', 'dirtyblonde', '', 'none')
call s:HL('markdownCodeBlock', 'dirtyblonde', '', 'none')

call s:HL('VimCommentTitle', 'lightgravel', '', 'bold')

call s:HL('VimMapMod',    'dress', '', 'none')
call s:HL('VimMapModKey', 'dress', '', 'none')
call s:HL('VimNotation', 'dress', '', 'none')
call s:HL('VimBracket', 'dress', '', 'none')
