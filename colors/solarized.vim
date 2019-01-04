" Name:     Solarized vim colorscheme
" Author:   Ethan Schoonover <es@ethanschoonover.com>
" URL:      http://ethanschoonover.com/solarized
"           (see this url for latest release & screenshots)
" License:  OSI approved MIT license (see end of this file)
" Created:  In the middle of the night
" Modified: 2011 May 05
"
" Usage
"
" ---------------------------------------------------------------------
" ABOUT:
" ---------------------------------------------------------------------
" Solarized is a carefully designed selective contrast colorscheme with dual
" light and dark modes that runs in both GUI, 256 and 16 color modes.
"
" See the homepage above for screenshots and details.
"
" ---------------------------------------------------------------------
" OPTIONS:
" ---------------------------------------------------------------------
" See the "solarized.txt" help file included with this colorscheme (in the
" "doc" subdirectory) for information on options, usage, the Toggle Background
" function and more. If you have already installed Solarized, this is available
" from the Solarized menu and command line as ":help solarized"
"
" ---------------------------------------------------------------------
" INSTALLATION:
" ---------------------------------------------------------------------
" Two options for installation: manual or pathogen
"
" MANUAL INSTALLATION OPTION:
" ---------------------------------------------------------------------
"
" 1.  Download the solarized distribution (available on the homepage above)
"     and unarchive the file.
" 2.  Move `solarized.vim` to your `.vim/colors` directory.
" 3.  Move each of the files in each subdirectories to the corresponding .vim
"     subdirectory (e.g. autoload/togglebg.vim goes into your .vim/autoload
"     directory as .vim/autoload/togglebg.vim).
"
" RECOMMENDED PATHOGEN INSTALLATION OPTION:
" ---------------------------------------------------------------------
"
" 1.  Download and install Tim Pope's Pathogen from:
"     https://github.com/tpope/vim-pathogen
"
" 2.  Next, move or clone the `vim-colors-solarized` directory so that it is
"     a subdirectory of the `.vim/bundle` directory.
"
"     a. **clone with git:**
"
"       $ cd ~/.vim/bundle
"       $ git clone git://github.com/altercation/vim-colors-solarized.git
"
"     b. **or move manually into the pathogen bundle directory:**
"         In the parent directory of vim-colors-solarized:
"
"         $ mv vim-colors-solarized ~/.vim/bundle/
"
" MODIFY VIMRC:
"
" After either Option 1 or Option 2 above, put the following two lines in your
" .vimrc:
"
"     syntax enable
"     set background=dark
"     colorscheme solarized
"
" or, for the light background mode of Solarized:
"
"     syntax enable
"     set background=light
"     colorscheme solarized
"
" I like to have a different background in GUI and terminal modes, so I can use
" the following if-then. However, I find vim's background autodetection to be
" pretty good and, at least with MacVim, I can leave this background value
" assignment out entirely and get the same results.
"
"     if has('gui_running')
"       set background=light
"     else
"       set background=dark
"     endif
"
" See the Solarized homepage at http://ethanschoonover.com/solarized for
" screenshots which will help you select either the light or dark background.
"
" ---------------------------------------------------------------------
" COLOR VALUES
" ---------------------------------------------------------------------
" Download palettes and files from: http://ethanschoonover.com/solarized
"
" L\*a\*b values are canonicall (White D65, Reference D50), other values are
" matched in sRGB space.
"
" SOLARIZED HEX     16/8 TERMCOL  XTERM/HEX   L*A*B      sRGB        HSB
" --------- ------- ---- -------  ----------- ---------- ----------- -----------
" base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
" base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
" base01    #586e75 10/7 brgreen  240 #4e4e4e 45 -07 -07  88 110 117 194  25  46
" base00    #657b83 11/7 bryellow 241 #585858 50 -07 -07 101 123 131 195  23  51
" base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
" base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
" base2     #eee8d5  7/7 white    254 #d7d7af 92 -00  10 238 232 213  44  11  93
" base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
" yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
" orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
" red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
" magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
" violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
" blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
" cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
" green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60
"
" ---------------------------------------------------------------------
" COLORSCHEME HACKING
" ---------------------------------------------------------------------
"
" Useful commands for testing colorschemes:
" :source $VIMRUNTIME/syntax/hitest.vim
" :help highlight-groups
" :help cterm-colors
" :help group-name
"
" Useful links for developing colorschemes:
" http://www.vim.org/scripts/script.php?script_id=2937
" http://vimcasts.org/episodes/creating-colorschemes-for-vim/
" http://www.frexx.de/xterm-256-notes/"
" Colorscheme initialization
" ---------------------------------------------------------------------

hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "solarized"

" GUI & CSApprox hexadecimal palettes
" ---------------------------------------------------------------------
"
" Set both gui and terminal color values in separate conditional statements
" Due to possibility that CSApprox is running (though I suppose we could just
" leave the hex values out entirely in that case and include only cterm colors)
" We also check to see if user has set solarized (force use of the
" neutral gray monotone palette component)

let s:c = {
    \ "NONE": "NONE",
    \ "back": "NONE",
    \ "base03": "#002b36",
    \ "base02": "#073642",
    \ "base01": "#586e75",
    \ "base00": "#657b83",
    \ "base0": "#839496",
    \ "base1": "#93a1a1",
    \ "base2": "#eee8d5",
    \ "base3": "#fdf6e3",
    \ "yellow": "#b58900",
    \ "orange": "#cb4b16",
    \ "red": "#dc322f",
    \ "magenta": "#d33682",
    \ "violet": "#6c71c4",
    \ "blue": "#268bd2",
    \ "cyan": "#2aa198",
    \ "green": "#859900",
\}

" Alternate light scheme
" ---------------------------------------------------------------------
if &background == "light"
    let s:temp03      = s:c.base03
    let s:temp02      = s:c.base02
    let s:temp01      = s:c.base01
    let s:temp00      = s:c.base00
    let s:c.base03      = s:c.base3
    let s:c.base02      = s:c.base2
    let s:c.base01      = s:c.base1
    let s:c.base00      = s:c.base0
    let s:c.base0       = s:temp00
    let s:c.base1       = s:temp01
    let s:c.base2       = s:temp02
    let s:c.base3       = s:temp03
    if (s:c.back != 'NONE')
        let s:c.back = s:c.base03
    endif
endif

fu! Hl(group, args)
    if has('gui_running') || &termguicolors
        if has_key(a:args, 'gui')
            let a:args.gui = join(a:args.gui, ',')
        endif
    else
        if has_key(a:args, 'cterm')
            let l:args.cterm = join(a:args.cterm, ',')
        endif
    endif
    let l:args = map(items(a:args), {i, v -> join(v, '=')})
    exe join(["hi!", a:group] + l:args, ' ')
endfu

" Highlighting primitives
" ---------------------------------------------------------------------

" Basic highlighting
" ---------------------------------------------------------------------
" note that link syntax to avoid duplicate configuration doesn't work with the
" exe compiled formats

call Hl('Normal', {'gui': ['NONE'], 'guifg': s:c.base0, 'guibg': s:c.base03})

call Hl('Comment', {'gui': ['italic'], 'guifg': s:c.base01, 'guibg': 'NONE'})
"       *Comment         any comment

call Hl('Constant', {'gui': ['NONE'], 'guifg': s:c.cyan, 'guibg': 'NONE'})
"       *Constant        any constant
"        String          a string constant: "this is a string"
"        Character       a character constant: 'c', '\n'
"        Number          a number constant: 234, 0xff
"        Boolean         a boolean constant: TRUE, false
"        Float           a floating point constant: 2.3e10

call Hl('Identifier', {'gui': ['NONE'], 'guifg': s:c.blue, 'guibg': 'NONE'})
"       *Identifier      any variable name
"        Function        function name (also: methods for classes)
"
call Hl('Statement', {'gui': ['NONE'], 'guifg': s:c.green, 'guibg': 'NONE'})
"       *Statement       any statement
"        Conditional     if, then, else, endif, switch, etc.
"        Repeat          for, do, while, etc.
"        Label           case, default, etc.
"        Operator        "sizeof", "+", "*", etc.
"        Keyword         any other keyword
"        Exception       try, catch, throw

call Hl('PreProc', {'gui': ['NONE'], 'guifg': s:c.orange, 'guibg': 'NONE'})
"       *PreProc         generic Preprocessor
"        Include         preprocessor #include
"        Define          preprocessor #define
"        Macro           same as Define
"        PreCondit       preprocessor #if, #else, #endif, etc.

call Hl('Type', {'gui': ['NONE'], 'guifg': s:c.yellow, 'guibg': 'NONE'})
"       *Type            int, long, char, etc.
"        StorageClass    static, register, volatile, etc.
"        Structure       struct, union, enum, etc.
"        Typedef         A typedef

call Hl('Special', {'gui': ['NONE'], 'guifg': s:c.red, 'guibg': 'NONE'})
"       *Special         any special symbol
"        SpecialChar     special character in a constant
"        Tag             you can use CTRL-] on this
"        Delimiter       character that needs attention
"        SpecialComment  special things inside a comment
"        Debug           debugging statements

call Hl('Underlined', {'gui': ['underline'], 'guibg': 'NONE', 'guifg': s:c.violet})
"       *Underlined      text that stands out, HTML links

call Hl('Ignore', {'gui': ['NONE'], 'guifg': 'NONE', 'guibg': 'NONE'})
"       *Ignore          left blank, hidden  |hl-Ignore|

call Hl('Error', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.red})
"       *Error           any erroneous construct

call Hl('Todo', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.magenta})
"       *Todo            anything that needs extra attention; mostly the
"                        keywords TODO FIXME and XXX
"
" Extended highlighting
" ---------------------------------------------------------------------
call Hl('SpecialKey', {'gui': ['bold'], 'guibg': s:c.base02, 'guifg': s:c.base00})
call Hl('NonText', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.base00})
call Hl('StatusLine', {'gui': ['reverse', 'none'], 'guibg': s:c.base02, 'guifg': s:c.base1})
call Hl('StatusLineNC', {'gui': ['reverse', 'none'], 'guibg': s:c.base02, 'guifg': s:c.base00})
call Hl('Visual', {'gui': ['reverse', 'none'], 'guibg': s:c.base03, 'guifg': s:c.base01})
call Hl('Directory', {'gui': ['NONE'], 'guifg': s:c.blue, 'guibg': 'NONE'})
call Hl('ErrorMsg', {'gui': ['reverse'], 'guibg': 'NONE', 'guifg': s:c.red})
call Hl('IncSearch', {'gui': ['reverse'], 'guibg': 'NONE', 'guifg': s:c.orange})
call Hl('Search', {'gui': ['reverse'], 'guibg': 'NONE', 'guifg': s:c.yellow})
call Hl('MoreMsg', {'gui': ['NONE'], 'guifg': s:c.blue, 'guibg': 'NONE'})
call Hl('ModeMsg', {'gui': ['NONE'], 'guifg': s:c.blue, 'guibg': 'NONE'})
call Hl('LineNr', {'gui': ['NONE'], 'guifg': s:c.base01, 'guibg': s:c.base02})
call Hl('Question', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.cyan})
call Hl('VertSplit', {'gui': ['NONE'], 'guifg': s:c.base00, 'guibg': s:c.base00})
call Hl('Title', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.orange})
call Hl('VisualNOS', {'gui': ['reverse', 'none'], 'guibg': s:c.base02, 'guifg': 'NONE'})
call Hl('WarningMsg', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.red})
call Hl('WildMenu', {'gui': ['reverse', 'none'], 'guibg': s:c.base02, 'guifg': s:c.base2})
call Hl('Folded', {'gui': ['underline', 'bold'], 'guisp': s:c.base03, 'guibg': s:c.base02, 'guifg': s:c.base0})
call Hl('FoldColumn', {'gui': ['NONE'], 'guifg': s:c.base0, 'guibg': s:c.base02})
call Hl('DiffAdd', {'gui': ['reverse'], 'guifg': s:c.green, 'guibg': 'NONE'})
call Hl('DiffChange', {'guibg': 'NONE'})
call Hl('DiffDelete', {'guifg': s:c.red,'guibg': s:c.red})
call Hl('DiffText', {'gui': ['reverse'], 'guifg': s:c.green,'guibg': 'NONE'})
call Hl('SignColumn', {'gui': ['NONE'], 'guifg': s:c.base0, 'guibg': s:c.base02})
call Hl('Conceal', {'gui': ['NONE'], 'guifg': s:c.blue, 'guibg': 'NONE'})
call Hl('SpellBad', {'gui': ['undercurl'], 'guisp': s:c.red, 'guibg': 'NONE', 'guifg': 'NONE'})
call Hl('SpellCap', {'gui': ['undercurl'], 'guisp': s:c.violet, 'guibg': 'NONE', 'guifg': 'NONE'})
call Hl('SpellRare', {'gui': ['undercurl'], 'guisp': s:c.cyan, 'guibg': 'NONE', 'guifg': 'NONE'})
call Hl('SpellLocall', {'gui': ['undercurl'], 'guisp': s:c.yellow, 'guibg': 'NONE', 'guifg': 'NONE'})
call Hl('Pmenu', {'gui': ['reverse', 'none'], 'guibg': s:c.base02, 'guifg': s:c.base0})
call Hl('PmenuSel', {'gui': ['reverse', 'none'], 'guibg': s:c.base2, 'guifg': s:c.base01})
call Hl('PmenuSbar', {'gui': ['reverse', 'none'], 'guibg': s:c.base0, 'guifg': s:c.base2})
call Hl('PmenuThumb', {'gui': ['reverse', 'none'], 'guibg': s:c.base03, 'guifg': s:c.base0})
call Hl('TabLine', {'gui': ['underline'], 'guisp': s:c.base0, 'guibg': s:c.base02, 'guifg': s:c.base0})
call Hl('TabLineFill', {'gui': ['underline'], 'guisp': s:c.base0, 'guibg': s:c.base02, 'guifg': s:c.base0})
call Hl('TabLineSel', {'gui': ['reverse', 'underline'], 'guisp': s:c.base0, 'guibg': s:c.base2, 'guifg': s:c.base01})
call Hl('CursorColumn', {'gui': ['NONE'], 'guifg': 'NONE', 'guibg': s:c.base02})
call Hl('CursorLine', {'gui': ['NONE'], 'guisp': s:c.base1, 'guibg': s:c.base02, 'guifg': 'NONE'})
call Hl('CursorLineNr', {'gui': ['NONE'], 'guisp': s:c.base1, 'guibg': s:c.base03, 'guifg': s:c.base01})
call Hl('ColorColumn', {'gui': ['NONE'], 'guifg': 'NONE', 'guibg': s:c.base02})
call Hl('Cursor', {'gui': ['NONE'], 'guifg': s:c.base03, 'guibg': s:c.base0})
hi! link lCursor Cursor
call Hl('MatchParen', {'gui': ['bold'], 'guibg': s:c.base01, 'guifg': s:c.red})

" vim syntax highlighting
" ---------------------------------------------------------------------
"call Hl('vimLineComment', {'gui': ['italic'], 'guibg': 'NONE', 'guifg': s:c.base01})
"hi! link vimComment Comment
"hi! link vimLineComment Comment
hi! link vimVar Identifier
hi! link vimFunc Function
hi! link vimUserFunc Function
hi! link helpSpecial Special
hi! link vimSet Normal
hi! link vimSetEqual Normal
call Hl('vimCommentString', {'gui': ['NONE'], 'guifg': s:c.violet, 'guibg': 'NONE'})
call Hl('vimCommand', {'gui': ['NONE'], 'guifg': s:c.yellow, 'guibg': 'NONE'})
call Hl('vimCmdSep', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('helpExample', {'gui': ['NONE'], 'guifg': s:c.base1, 'guibg': 'NONE'})
call Hl('helpOption', {'gui': ['NONE'], 'guifg': s:c.cyan, 'guibg': 'NONE'})
call Hl('helpNote', {'gui': ['NONE'], 'guifg': s:c.magenta, 'guibg': 'NONE'})
call Hl('helpVim', {'gui': ['NONE'], 'guifg': s:c.magenta, 'guibg': 'NONE'})
call Hl('helpHyperTextJump', {'gui': ['underline'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('helpHyperTextEntry', {'gui': ['NONE'], 'guifg': s:c.green, 'guibg': 'NONE'})
call Hl('vimIsCommand', {'gui': ['NONE'], 'guifg': s:c.base00, 'guibg': 'NONE'})
call Hl('vimSynMtchOpt', {'gui': ['NONE'], 'guifg': s:c.yellow, 'guibg': 'NONE'})
call Hl('vimSynType', {'gui': ['NONE'], 'guifg': s:c.cyan, 'guibg': 'NONE'})
call Hl('vimHiLink', {'gui': ['NONE'], 'guifg': s:c.blue, 'guibg': 'NONE'})
call Hl('vimHiGroup', {'gui': ['NONE'], 'guifg': s:c.blue, 'guibg': 'NONE'})
call Hl('vimGroup', {'gui': ['underline', 'bold'], 'guibg': 'NONE', 'guifg': s:c.blue})
" diff highlighting
" ---------------------------------------------------------------------
hi! link diffAdded Statement
hi! link diffLine Identifier
" git & gitcommit highlighting
"git
"exe "hi! gitDateHeader"
"exe "hi! gitIdentityHeader"
"exe "hi! gitIdentityKeyword"
"exe "hi! gitNotesHeader"
"exe "hi! gitReflogHeader"
"exe "hi! gitKeyword"
"exe "hi! gitIdentity"
"exe "hi! gitEmailDelimiter"
"exe "hi! gitEmail"
"exe "hi! gitDate"
"exe "hi! gitMode"
"exe "hi! gitHashAbbrev"
"exe "hi! gitHash"
"exe "hi! gitReflogMiddle"
"exe "hi! gitReference"
"exe "hi! gitStage"
"exe "hi! gitType"
"exe "hi! gitDiffAdded"
"exe "hi! gitDiffRemoved"
"gitcommit
"exe "hi! gitcommitSummary"
call Hl('gitcommitComment', {'gui': ['italic'], 'guifg': s:c.base01, 'guibg': 'NONE'})
hi! link gitcommitUntracked gitcommitComment
hi! link gitcommitDiscarded gitcommitComment
hi! link gitcommitSelected  gitcommitComment
call Hl('gitcommitUnmerged', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.green})
call Hl('gitcommitOnBranch', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.base01})
call Hl('gitcommitBranch', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.magenta})
hi! link gitcommitNoBranch gitcommitBranch
call Hl('gitcommitDiscardedType', {'gui': ['NONE'], 'guifg': s:c.red, 'guibg': 'NONE'})
call Hl('gitcommitSelectedType', {'gui': ['NONE'], 'guifg': s:c.green, 'guibg': 'NONE'})
"exe "hi! gitcommitUnmergedType"
"exe "hi! gitcommitType"
"exe "hi! gitcommitNoChanges"
"exe "hi! gitcommitHeader"
call Hl('gitcommitHeader', {'gui': ['NONE'], 'guifg': s:c.base01, 'guibg': 'NONE'})
call Hl('gitcommitUntrackedFile', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.cyan})
call Hl('gitcommitDiscardedFile', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.red})
call Hl('gitcommitSelectedFile', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.green})
call Hl('gitcommitUnmergedFile', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.yellow})
call Hl('gitcommitFile', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.base0})
hi! link gitcommitDiscardedArrow gitcommitDiscardedFile
hi! link gitcommitSelectedArrow  gitcommitSelectedFile
hi! link gitcommitUnmergedArrow  gitcommitUnmergedFile
"exe "hi! gitcommitArrow"
"exe "hi! gitcommitOverflow"
"exe "hi! gitcommitBlank"
" }}}
" html highlighting
" ---------------------------------------------------------------------
call Hl('htmlTag', {'gui': ['NONE'], 'guifg': s:c.base01, 'guibg': 'NONE'})
call Hl('htmlEndTag', {'gui': ['NONE'], 'guifg': s:c.base01, 'guibg': 'NONE'})
call Hl('htmlTagN', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.base1})
call Hl('htmlTagName', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('htmlSpecialTagName', {'gui': ['italic'], 'guifg': s:c.blue, 'guibg': 'NONE'})
call Hl('htmlArg', {'gui': ['NONE'], 'guifg': s:c.base00, 'guibg': 'NONE'})
call Hl('javaScript', {'gui': ['NONE'], 'guifg': s:c.yellow, 'guibg': 'NONE'})
" perl highlighting
" ---------------------------------------------------------------------
call Hl('perlHereDoc', {'gui': ['NONE'], 'guibg': s:c.base03, 'guifg': s:c.base1})
call Hl('perlVarPlain', {'gui': ['NONE'], 'guibg': s:c.base03, 'guifg': s:c.yellow})
call Hl('perlStatementFileDesc', {'gui': ['NONE'], 'guibg': s:c.base03, 'guifg': s:c.cyan})

" tex highlighting
" ---------------------------------------------------------------------
call Hl('texStatement', {'gui': ['NONE'], 'guibg': s:c.base03, 'guifg': s:c.cyan})
call Hl('texMathZoneX', {'gui': ['NONE'], 'guibg': s:c.base03, 'guifg': s:c.yellow})
call Hl('texMathMatcher', {'gui': ['NONE'], 'guibg': s:c.base03, 'guifg': s:c.yellow})
call Hl('texMathMatcher', {'gui': ['NONE'], 'guibg': s:c.base03, 'guifg': s:c.yellow})
call Hl('texRefLabel', {'gui': ['NONE'], 'guibg': s:c.base03, 'guifg': s:c.yellow})
" ruby highlighting
" ---------------------------------------------------------------------
call Hl('rubyDefine', {'gui': ['bold'], 'guibg': s:c.base03, 'guifg': s:c.base1})
"rubyInclude
"rubySharpBang
"rubyAccess
"rubyPredefinedVariable
"rubyBoolean
"rubyClassVariable
"rubyBeginEnd
"rubyRepeatModifier
"hi! link rubyArrayDelimiter    Special  " [ , , ]
"rubyCurlyBlock  { , , }

"hi! link rubyClass             Keyword
"hi! link rubyModule            Keyword
"hi! link rubyKeyword           Keyword
"hi! link rubyOperator          Operator
"hi! link rubyIdentifier        Identifier
"hi! link rubyInstanceVariable  Identifier
"hi! link rubyGlobalVariable    Identifier
"hi! link rubyClassVariable     Identifier
"hi! link rubyConstant          Type
" haskell syntax highlighting
" ---------------------------------------------------------------------
" For use with syntax/haskell.vim : Haskell Syntax File
" http://www.vim.org/scripts/script.php?script_id=3034
" See also Steffen Siering's github repository:
" http://github.com/urso/dotrc/blob/master/vim/syntax/haskell.vim
" ---------------------------------------------------------------------
"
" Treat True and False specially, see the plugin referenced above
let hs_highlight_boolean=1
" highlight delims, see the plugin referenced above
let hs_highlight_delimiters=1

call Hl('cPreCondit', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.orange})

call Hl('VarId', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('ConId', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.yellow})
call Hl('hsImport', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.magenta})
call Hl('hsString', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.base00})

call Hl('hsStructure', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.cyan})
call Hl('hs_hlFunctionName', {'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('hsStatement', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.cyan})
call Hl('hsImportLabel', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.cyan})
call Hl('hs_OpFunctionName', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.yellow})
call Hl('hs_DeclareFunction', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.orange})
call Hl('hsVarSym', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.cyan})
call Hl('hsType', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.yellow})
call Hl('hsTypedef', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.cyan})
call Hl('hsModuleName', {'gui': ['underline'], 'guibg': 'NONE', 'guifg': s:c.green})
call Hl('hsModuleStartLabel', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.magenta})
hi! link hsImportParams      Delimiter
hi! link hsDelimTypeExport   Delimiter
hi! link hsModuleStartLabel  hsStructure
hi! link hsModuleWhereLabel  hsModuleStartLabel

" following is for the haskell-conceal plugin
" the first two items don't have an impact, but better safe
call Hl('hsNiceOperator', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.cyan})
call Hl('hsniceoperator', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.cyan})

" pandoc markdown syntax highlighting
" ---------------------------------------------------------------------

"PandocHiLink pandocNormalBlock
call Hl('pandocTitleBlock', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocTitleBlockTitle', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocTitleComment', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocComment', {'gui': ['italic'], 'guibg': 'NONE', 'guifg': s:c.base01})
call Hl('pandocVerbatimBlock', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.yellow})
hi! link pandocVerbatimBlockDeep         pandocVerbatimBlock
hi! link pandocCodeBlock                 pandocVerbatimBlock
hi! link pandocCodeBlockDelim            pandocVerbatimBlock
call Hl('pandocBlockQuote', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocBlockQuoteLeader1', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocBlockQuoteLeader2', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.cyan})
call Hl('pandocBlockQuoteLeader3', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.yellow})
call Hl('pandocBlockQuoteLeader4', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.red})
call Hl('pandocBlockQuoteLeader5', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.base0})
call Hl('pandocBlockQuoteLeader6', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.base01})
call Hl('pandocListMarker', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.magenta})
call Hl('pandocListReference', {'gui': ['underline'], 'guibg': 'NONE', 'guifg': s:c.magenta})

" Definitions
" ---------------------------------------------------------------------
call Hl('pandocDefinitionBlock', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.violet})
call Hl('pandocDefinitionTerm', {'gui': ['standout'], 'guibg': 'NONE', 'guifg': s:c.violet})
call Hl('pandocDefinitionIndctr', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.violet})
call Hl('pandocEmphasisDefinition', {'gui': ['italic'], 'guibg': 'NONE', 'guifg': s:c.violet})
call Hl('pandocEmphasisNestedDefinition', {'gui': ['bold', 'italic'], 'guibg': 'NONE', 'guifg': s:c.violet})
call Hl('pandocStrongEmphasisDefinition', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.violet})
call Hl('pandocStrongEmphasisNestedDefinition', {'gui': ['bold', 'italic'], 'guibg': 'NONE', 'guifg': s:c.violet})
call Hl('pandocStrongEmphasisEmphasisDefinition', {'gui': ['bold', 'italic'], 'guibg': 'NONE', 'guifg': s:c.violet})
call Hl('pandocStrikeoutDefinition', {'gui': ['reverse'], 'guibg': 'NONE', 'guifg': s:c.violet})
call Hl('pandocVerbatimInlineDefinition', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.violet})
call Hl('pandocSuperscriptDefinition', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.violet})
call Hl('pandocSubscriptDefinition', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.violet})

" Tables
" ---------------------------------------------------------------------
call Hl('pandocTable', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocTableStructure', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.blue})
hi! link pandocTableStructureTop             pandocTableStructre
hi! link pandocTableStructureEnd             pandocTableStructre
call Hl('pandocTableZebraLight', {'gui': ['NONE'], 'guibg': s:c.base03, 'guifg': s:c.blue})
call Hl('pandocTableZebraDark', {'gui': ['NONE'], 'guibg': s:c.base02, 'guifg': s:c.blue})
call Hl('pandocEmphasisTable', {'gui': ['italic'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocEmphasisNestedTable', {'gui': ['bold', 'italic'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocStrongEmphasisTable', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocStrongEmphasisNestedTable', {'gui': ['bold', 'italic'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocStrongEmphasisEmphasisTable', {'gui': ['bold', 'italic'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocStrikeoutTable', {'gui': ['reverse'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocVerbatimInlineTable', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocSuperscriptTable', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocSubscriptTable', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.blue})

" Headings
" ---------------------------------------------------------------------
call Hl('pandocHeading', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.orange})
call Hl('pandocHeadingMarker', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.yellow})
call Hl('pandocEmphasisHeading', {'gui': ['bold', 'italic'], 'guibg': 'NONE', 'guifg': s:c.orange})
call Hl('pandocEmphasisNestedHeading', {'gui': ['bold', 'italic'], 'guibg': 'NONE', 'guifg': s:c.orange})
call Hl('pandocStrongEmphasisHeading', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.orange})
call Hl('pandocStrongEmphasisNestedHeading', {'gui': ['bold', 'italic'], 'guibg': 'NONE', 'guifg': s:c.orange})
call Hl('pandocStrongEmphasisEmphasisHeading', {'gui': ['bold', 'italic'], 'guibg': 'NONE', 'guifg': s:c.orange})
call Hl('pandocStrikeoutHeading', {'gui': ['reverse'], 'guibg': 'NONE', 'guifg': s:c.orange})
call Hl('pandocVerbatimInlineHeading', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.orange})
call Hl('pandocSuperscriptHeading', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.orange})
call Hl('pandocSubscriptHeading', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.orange})

" Links
" ---------------------------------------------------------------------
call Hl('pandocLinkDelim', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.base01})
call Hl('pandocLinkLabel', {'gui': ['underline'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocLinkText', {'gui': ['underline', 'bold'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocLinkURL', {'gui': ['underline'], 'guibg': 'NONE', 'guifg': s:c.base00})
call Hl('pandocLinkTitle', {'gui': ['underline', 'italic'], 'guibg': 'NONE', 'guifg': s:c.base00})
call Hl('pandocLinkTitleDelim', {'gui': ['underline', 'italic'], 'guisp': s:c.base00, 'guibg': 'NONE', 'guifg': s:c.base01})
call Hl('pandocLinkDefinition', {'gui': ['underline'], 'guisp': s:c.base00, 'guibg': 'NONE', 'guifg': s:c.cyan})
call Hl('pandocLinkDefinitionID', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocImageCaption', {'gui': ['underline', 'bold'], 'guibg': 'NONE', 'guifg': s:c.violet})
call Hl('pandocFootnoteLink', {'gui': ['underline'], 'guibg': 'NONE', 'guifg': s:c.green})
call Hl('pandocFootnoteDefLink', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.green})
call Hl('pandocFootnoteInline', {'gui': ['underline', 'bold'], 'guibg': 'NONE', 'guifg': s:c.green})
call Hl('pandocFootnote', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.green})
call Hl('pandocCitationDelim', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.magenta})
call Hl('pandocCitation', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.magenta})
call Hl('pandocCitationID', {'gui': ['underline'], 'guibg': 'NONE', 'guifg': s:c.magenta})
call Hl('pandocCitationRef', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.magenta})

" Main Styles
" ---------------------------------------------------------------------
call Hl('pandocStyleDelim', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.base01})
call Hl('pandocEmphasis', {'gui': ['italic'], 'guibg': 'NONE', 'guifg': s:c.base0})
call Hl('pandocEmphasisNested', {'gui': ['bold', 'italic'], 'guibg': 'NONE', 'guifg': s:c.base0})
call Hl('pandocStrongEmphasis', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.base0})
call Hl('pandocStrongEmphasisNested', {'gui': ['bold', 'italic'], 'guibg': 'NONE', 'guifg': s:c.base0})
call Hl('pandocStrongEmphasisEmphasis', {'gui': ['bold', 'italic'], 'guibg': 'NONE', 'guifg': s:c.base0})
call Hl('pandocStrikeout', {'gui': ['reverse'], 'guibg': 'NONE', 'guifg': s:c.base01})
call Hl('pandocVerbatimInline', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.yellow})
call Hl('pandocSuperscript', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.violet})
call Hl('pandocSubscript', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.violet})

call Hl('pandocRule', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocRuleLine', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocEscapePair', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.red})
call Hl('pandocCitationRef', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.magenta})
call Hl('pandocNonBreakingSpace', {'gui': ['reverse'], 'guibg': 'NONE', 'guifg': s:c.red})
hi! link pandocEscapedCharacter          pandocEscapePair
hi! link pandocLineBreak                 pandocEscapePair

" Embedded Code
" ---------------------------------------------------------------------
call Hl('pandocMetadataDelim', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.base01})
call Hl('pandocMetadata', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocMetadataKey', {'gui': ['NONE'], 'guibg': 'NONE', 'guifg': s:c.blue})
call Hl('pandocMetadata', {'gui': ['bold'], 'guibg': 'NONE', 'guifg': s:c.blue})
hi! link pandocMetadataTitle             pandocMetadata

let g:terminal_color_0 = s:c.base03
let g:terminal_color_1 = s:c.red
let g:terminal_color_2 = s:c.green
let g:terminal_color_3 = s:c.yellow
let g:terminal_color_4 = s:c.blue
let g:terminal_color_5 = s:c.magenta
let g:terminal_color_6 = s:c.cyan
let g:terminal_color_7 = s:c.base2
let g:terminal_color_8 = s:c.base02
let g:terminal_color_9 = s:c.orange
let g:terminal_color_10 = s:c.base01
let g:terminal_color_11 = s:c.base00
let g:terminal_color_12 = s:c.base0
let g:terminal_color_13 = s:c.violet
let g:terminal_color_14 = s:c.base1
let g:terminal_color_15 = s:c.base3

" License
" ---------------------------------------------------------------------
"
" Copyright (c) 2011 Ethan Schoonover
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
"
" vim:foldmethod=marker:foldlevel=0
