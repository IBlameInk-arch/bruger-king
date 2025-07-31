" ___      ___ ___  _____ ______   ________  ________     
"|\  \    /  /|\  \|\   _ \  _   \|\   __  \|\   ____\    
"\ \  \  /  / | \  \ \  \\\__\ \  \ \  \|\  \ \  \___|    
" \ \  \/  / / \ \  \ \  \\|__| \  \ \   _  _\ \  \       
"  \ \    / /   \ \  \ \  \    \ \  \ \  \\  \\ \  \____  
"   \ \__/ /     \ \__\ \__\    \ \__\ \__\\ _\\ \_______\
"    \|__|/       \|__|\|__|     \|__|\|__|\|__|\|_______|
"[----------------------------------------------------------]
" -> General Settings	: Lines 19-23
" -> Keybindings		: Lines 'N/A'
" -> Plugins			: Lines 28-49
" -> Plugin Settings	: Lines 90-109
" -> Themes	/ UI		: Lines	56-85
                                                         

"[================================]
"		General Settings
"[================================]
set number
set tabstop=4
syntax on
set nocompatible
set background=dark
let g:startify_disable_at_vimenter = 0

"[================================]
"		    Keybindings
"[================================]

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F1> :Startify<CR>

"[================================]
"			Plugins
"[================================]
call plug#begin('~/.vim/plugged')

	"-> Plugins - File Nav
	Plug('preservim/nerdtree')
	
	"-> Plugins - Interface
	Plug ('mhinz/vim-startify')
	Plug('vim-airline/vim-airline')
	Plug('vim-airline/vim-airline-themes')
	Plug ('bignimbus/pop-punk.vim')

		
	Plug('dense-analysis/ale') 

	"-> Plugins - Themes
	Plug('franbach/miramare') 
	Plug('JarrodCTaylor/spartan')
	Plug('NLKNguyen/papercolor-theme')
	Plug ('jnurmine/Zenburn')
	Plug ('joshdick/onedark.vim')
	Plug ('romainl/Apprentice')

	"-> Plguins - Writing
	Plug ('junegunn/goyo.vim')
	Plug ('preservim/vim-pencil')
	
	"-> Plguins - Note Taking	
	Plug ('jceb/vim-orgmode')
	Plug ('tpope/vim-speeddating')

call plug#end()

"[================================]
"		   Themes / UI
"[================================]

"colorscheme PaperColor
colorscheme pop-punk

"		   <Airline>	
let g:airline_theme= 'pop_punk'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
	" unicode symbols
	let g:airline_left_sep = '»'
	let g:airline_left_sep = '▶'
	let g:airline_right_sep = '«'
	let g:airline_right_sep = '◀'
	let g:airline_symbols.linenr = '␊'
	let g:airline_symbols.linenr = '␤'
	let g:airline_symbols.linenr = '¶'
	let g:airline_symbols.branch = '⎇'
	let g:airline_symbols.paste = 'ρ'
	let g:airline_symbols.paste = 'Þ'
	let g:airline_symbols.paste = '∥'
	let g:airline_symbols.whitespace = 'Ξ'

	" airline symbols
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.branch = ''
	let g:airline_symbols.readonly = ''
	let g:airline_symbols.linenr = '  '

"[=================================]
"	      Plugin Settings
"[=================================]
" Enable ALE
let g:ale_linters_explicit = 1  " Only use linters you specify

" Show errors as virtual text
let g:ale_virtualtext_cursor = 1

" Use signs to show errors (gutter)
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" Show messages in the status line
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


let g:ale_linters = {
\   'cpp': ['g++', 'clangd'],
\}

"[=================================]
"			Startify SHit
"[=================================]
let g:startify_align_center = 1
let g:startify_padding_left = 127
let g:startify_custom_header =
             \ startify#pad(readfile('/home/ink/cool/cool2.txt'))

" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2- ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']}
        \]

let g:startify_lists = [
      \ { 'type': 'files', 'footer': ['   Recent Files'] },
      \ ]

let g:startify_bookmarks = [
      \ expand('~/.vimrc'),
	  \ expand('~/c++work/pomotimer/main.cpp'),
	  \ expand('~/.config/hypr/hyprland.conf'),
	  \ expand('~/Documents/Notes/Networking/net.org'),
	  \ expand('~/Documents/Notes/main.org'),
      \ ]

let g:startify_commands = [
      \ { 'c': ['~/.vimrc', 'Edit vimrc'] },
      \ { 'q': [':qa',         'Quit Vim'] },
      \ ]


let g:startify_lists = [
     \ { 'type': 'bookmarks', 'header': ['   																																		Bookmarks'] },
     \ { 'type': 'files',     'header': ['   																																		Recent Files'] },
	 \{ 'type': 'commands', 'header': ['     																																	Commands'] }, 
	 \ ]



