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

" Turn off arrow key usability totally
map <Down> <NOP>
map <Up> <NOP>
map <Left> <NOP>
map <Right> <NOP>

set cursorline " draws a horizontal highlight or underline on the line your cursor is currently on

set wildmenu " Provides a graphical menu of all the matches you can cycle through when auto-completing

set showmatch "When your cursor moves over a parenthesis-like character, the matching one will be highlighted as well

set hlsearch            " highlight matches







