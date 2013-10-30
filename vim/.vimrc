" Travis' vimrc file.
"
"
" Table of Contents:
"    Move the cursor over a section name and press * to jump to that section,
"    then press 'n' to jump back to table of contents.
"
" Temporary_Settings
" Command_Shortcuts
" Behavior_Shortcuts
" Mode_Shortcuts
" Appearance_Settings
" Navigation_Settings
" Tabstop_Settings
" Search_Settings
" Window_Tab_Settings
" Paste_Settings
" Terminal_Mode_Settings
" Fold_Settings
"

" Temporary_Settings
    " Hack to disable audio bell and visual bell in macvim 
    " (since macvim has no visual bell.)
    set visualbell

    " Equal split-pane sizes.
    set equalalways

    " For vim pathogen / runtime path manipulation
    call pathogen#infect()

    " For Google Go.
    set t_Co=256
    filetype plugin indent on

    " Do not create .swp files and litter directories with them.
    set noswapfile

" Command_Shortcuts

    " Abbreviations for turning line numbers on and off.
    " ':Num' to turn numbers on, ':Nonum' to turn off.
    :command! Num set number
    :command! Nonum set nonumber

    " Start a bash shell with ConqueTerm.
    :command! Bash ConqueTerm bash --rcfile ~/.bash_profile

" Behavior_Shortcuts

    " Automatically change directory to the opened file.
    set autochdir

" Mode_Shortcuts

    " An important history lesson:
    "
    " vi was written on and for an ADM-3A terminal:
    "    http://en.wikipedia.org/wiki/File:KB_Terminal_ADM3A.svg
    "
    " The keyboard had some important differences from modern keyboards:
    "    - Escape key was in place of Tab key.
    "    - There was no Tab key or Caps lock key
    "    - There were no arrow keys - instead, little arrows were drawn on h, j, k, and l.
    "    - The semi-colon had its own key, next to the 0 key.
    "
    " In short, when you use vim on a modern keyboard, You're Doing it Wrong.
    " Try the below remappings, and you'll be spending less effort at something you do all day.

    " Change Tab to act as Escape in order to switch modes as Bill Joy intended.
    " Use 'Ctrl+t' to add tabs in insert mode. Use >> or << keys in normal or visual mode.
    "inoremap <tab> <esc>
    "vnoremap <tab> <esc>

    " Because other people driving my computer get pissed when they can't use the tab key...
    inoremap hh <esc>
    
    " When pressing Enter in normal mode, insert a blank line below the cursor.
    nnoremap <enter> o<esc>

    " Space is not used for anything in normal or visual  mode, so use it to enter command mode.
    " Do your pinkes a favor and hit the space bar instead of typing shift+semicolon all the time.
    nnoremap <Space> :
    vmap     <Space> :


" Appearance_Settings

    " Always show filename at the bottom of file.
    set ls=2

    " Set Font for Mac.
    set guifont=Monaco:h12

    " Show linenumbers.
    set number

    " Enable syntax highlighting.
    syntax on



    " Set the preferred color scheme.
    " http://www.vim.org/scripts/script.php?script_id=1488 
    if has('gui_running')
       " Use a specific color scheme in file diff mode.
        if &diff
            colorscheme neon
        else
            "colorscheme zenburn
            "colorscheme neon
            "colorscheme dawn
            colorscheme matrix
        endif
    else
        "colorscheme zenburn
        "hi Normal ctermbg=None
        "hi Statement ctermbg=232
        "highlight Search cterm=NONE ctermfg=grey ctermbg=blue
        colors ir_black
        hi Normal ctermbg=None
    end

    " Underlines the current line that the cursor is on. Useful for searching.
    "set cursorline
    
    " Only underline the cursorline in GUI mode instead of shadowing the background.
    hi clear cursorline
    hi cursorline gui=underline

    " Show the cursor position at all times.
    set ruler

    " This is supposed to show what you're typing as a command. I'm not sure if it works.
    set showcmd

    " Highlights matching parenthesis, 7 is color gray. Type ':help ctermbg' for color list.
    highlight MatchParen ctermbg=7

    " Highlights text that exceeds column position 80.
    highlight OverLength ctermfg=white ctermbg=black guibg=#000000 guifg=#FFFFFF
    match OverLength /\%>80v.\+/

    " Set line number and comment colors
    highlight lineNr ctermfg=gray
    highlight Comment ctermfg=gray


" Navigation_Settings

    " This causes the cursor line to always be in the center of the screen, when possible.
    " This is useful for always seeing the text that is around your current location
    "  and is useful for when searching text.
    " This setting is currently disabled because it gets annoying when combined with mouse.
    "set scrolloff=50


" Tabstop_Settings

    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    au BufRead,BufNewFile *.go set noet ts=4 sw=4
    set noexpandtab 

    " I'm not entirely sure what this does.
    set smarttab

    " Automatically indents based on the line you were on when you went into insert mode
    set cindent


" Search_Settings

    " Required for smartcase.
    set ignorecase

    " Ignore case when we search with all lowercase letters.
    set smartcase

    " Search for things as we've typed so far.
    " This is like the incremental search feature in most web browsers.
    set incsearch

    " Highlight things we've found so far.
    set hlsearch


" Window_Tab_Settings

    " These only work when you're in normal mode.

    " Next Tab - shift + l
    nnoremap <silent> <S-l> :tabnext<CR>

    " Previous Tab - shift + h
    nnoremap <silent> <S-h> :tabprevious<CR>

    " New Tab - shift + t
    nnoremap <silent> <S-t> :tabnew<CR>

    " Removes the buffer when the tab is closed.
    set nohidden


" Paste_Settings

    " Toggle paste mode with the <F12> key while in insert mode.
    nnoremap <silent> <F10> :call Paste_on_off()<CR>
    set pastetoggle=<F10>

    " This is a variable for toggling paste mode.
    let paste_mode = 0 " 0 = normal, 1 = paste

    " This is a function to toggle the value of the paste_mode variable.
	func! Paste_on_off()
		if g:paste_mode == 0
			set paste
			let g:paste_mode = 1
		else
			set nopaste
			let g:paste_mode = 0
		endif
		return
	endfunc


" Terminal_Mode_Settings

    " This enables mouse usage for all modes when vim is used on the command line.
    " This will work for x-terms, but not OS X Terminal.app.
    set mouse=a

" Fold_Settings
    
    " Folds based off of indentation level, so function signatures remain
    " above the fold.
    set foldmethod=indent

    " Only have 10 levels of depth for sub-folds.
    set foldnestmax=10

    " Do not automatically fold files when we open them.
    set nofoldenable

    set foldlevel=1
