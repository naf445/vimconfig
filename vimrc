"There is one rule you must follow when crafting your own .vimrc.
" Don't put any lines in your vimrc that you don't understand.
" The absolute worst way to make your environment better is to copy it wholesale from others."
" - https://github.com/dougblack/dougblack.io/blob/master/markdown/a-good-vimrc.md

" turns syntax highlighting on
syntax on

" Activate monokai color scheme
colorscheme monokai

" turns on numbers on the left side
set number

" tells the location of the cursor in the bottom right.
set ruler

" Used in insert mode, makes it so every time you click tab it expands some amount of spaces
set expandtab

" insert tabs on the start of a line according to shiftwidth, not tabstop 
set smarttab

" controls the amount that text is shifted left and right
set shiftwidth=4

" when Vim opens a file and *reads* a <TAB> character, it uses that many spaces to visually show the <TAB> 
set tabstop=4 

" the number of spaces that is inserted when you hit <TAB> and also the number of spaces that are removed when you backspace
set softtabstop=4

let mapleader = ","
let maplocalleader="\\"

" Turn off arrow key/keys usability totally
" The way mapping work in general is map 'this' to 'that'.
" We use noremap instead of map is to avoid recursive mappings.
nnoremap <Down> <NOP>
nnoremap <Up> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
inoremap <Down> <NOP>
inoremap <Up> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
vnoremap <Down> <NOP>
vnoremap <Up> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>

set cursorline " draws a horizontal highlight or underline on the line your cursor is currently on

set wildmenu " Provides a graphical menu of all the matches you can cycle through when auto-completing

set showmatch "When your cursor moves over a parenthesis-like character, the matching one will be highlighted as well

set hlsearch            " highlight matches

" Adding a vim-plug section to my vimrc
" This part downloads and installs vim-plug, I guess my preferred plugin manager!
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" To install plugins do the following:
" Begin the section with call plug#begin()
" List the plugins with Plug commands
" call plug#end() to update &runtimepath and initialize plugin system

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/vimplugs')

Plug 'jupyter-vim/jupyter-vim'
Plug 'tpope/vim-fugitive'
"http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/

call plug#end() " end plugin installation section

" Reload .vimrc and run :PlugInstall to install plugins

" I am telling Vim to always use the same virtualenv for vim, regardless of what Python
" environment is loaded in the shell from which vim is launched
" Just to give myself a little more context, vim-jupyter I use to be able to
" send stuff from my vim session editing a .py file to an already existing
" jupyter console (jupyter console also known as iPython). This step here
" makes it so that upon opening vim, a specifically created and designated
" virtual environment is opened. This environment is running the *exact*
" version of python which vim was compiled on. This is necessary for the
" vim-jupyter plugin to run correctly. However you can start the jupyter
" console session from any environment and still connect to it and send it
" code from Vim.

" For work/linux computer
let g:vim_virtualenv_path = '/home/sodflo/virtualenvs/vim_virtualenv'
" For home/mac computer
"let g:vim_virtualenv_path = '/Users/nathanfranklin/virtualenvs/vim_virtualenv'
if exists('g:vim_virtualenv_path')
    pythonx import os; import vim
    pythonx activate_this = os.path.join(vim.eval('g:vim_virtualenv_path'), 'bin/activate_this.py')
    pythonx with open(activate_this) as f: exec(f.read(), {'__file__': activate_this})
endif

" Following the learn the vimscript the hard way tutorial, so adding some
" things below here which are exercises in the book.
echom "Hey Nate, good coding today! - vimCat (>^.^<)"

" Set it so long lines wthis is mty test rap around and don't disappear into the ether off the
" right side of the screen
set wrap

" Set this so when I shift it automatically rounds to a multiple of my indent
" width.
set shiftround

" Maps - to mean take this line and move it down
noremap - Vyddp 

" Maps _ to mean take this line and move it up
noremap _ Vyddkkp

" In insert mode, when I click control-d, delete line
inoremap <c-d> <esc>0Di

" Create mappings to autocomplete some chars and place my cursor inside
inoremap <leader>( ()<esc>i
inoremap <leader>< <><esc>i
inoremap <leader>{ {}<esc>i
inoremap <leader>[ []<esc>i
inoremap <leader>' ''<esc>i
inoremap <leader>" ""<esc>i

" maps 'up' to switch to visual mode, then highlight the rest of the inner
" word, then switch to the other end of the word, then upper case
nnoremap <leader>up viwoU

" Make it easy to open and edit my vimrc file (the <cr> stands for carriage
" return, or enter colloquially!)
nnoremap <leader>evrc :vsplit ~/.vim/vimrc<cr>

" Make it easy to source my vimrc file, even from another file
nnoremap <leader>svrc :source ~/.vim/vimrc<cr>

" Can set abbreviations (words that will change if they precede a non_keyword
" character. No keyword characters include anything that's not a number,
" letter, or underscore.) These can be useful for correcting typos, or other
" auto expanding text you want.
" Abbreviation to put my email
iabbrev @@ NathanAriFranklin@gmail.com
" Abbreviation to put todays date
iabbrev DD <C-R>=strftime("%d %b %Y")<CR> 

" Mapping to allow me to wrap quotation marks or one of many other symbols
" around a word. It works by visually selecting the word, exiting visual mode
" to go to the last character, inserting symbol afterwords, move to beginning
" of word, insert mode before first character, insert symbol, go to end.
nnoremap <leader><leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader><leader>< viw<esc>a><esc>bi<<esc>lel
nnoremap <leader><leader>{ viw<esc>a}<esc>bi{<esc>lel
nnoremap <leader><leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader><leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader><leader>" viw<esc>a"<esc>bi"<esc>lel

" Mapping to allow me to wrap quotation marks or one of many other symbols
" around selected text in visual mode. 
vnoremap <leader><leader>( <esc>`>a)<esc>`<i(<esc>`<lv`>l
vnoremap <leader><leader>< <esc>`>a><esc>`<i<<esc>`<lv`>l
vnoremap <leader><leader>{ <esc>`>a}<esc>`<i{<esc>`<lv`>l
vnoremap <leader><leader>[ <esc>`>a]<esc>`<i[<esc>`<lv`>l
vnoremap <leader><leader>' <esc>`>a'<esc>`<i'<esc>`<lv`>l
vnoremap <leader><leader>" <esc>`>a"<esc>`<i"<esc>`<lv`>l

" Maps H in normal mode to go to the beginning of the current line. Since h moves left you can think of H as a "stronger" h
nnoremap H 0
" Maps L in normal mode to go to the end of the current line. Since l moves right you can think of L as a "stronger" l
nnoremap L $

" Save some wear and tear on our left hand by making escaping a bit more
" fluid! Also disable the old way to force me!
inoremap jk <esc>
inoremap <esc> <nop>

