" file:~/.vimrc docs at the end
" everything after a double quote is a comment.
" enable syntax hightlighting

" recursive file search by typing :file <<str-in-file-name>>
set path +=**

" display all the matthing files
set wildmenu

" adjust the backspace behaviour 
set backspace=indent,eol,start

" allways show status line
set ls=2

" set the default windows height to 92
set winheight=92

" set the brightest possible colorscheme
colorscheme elflord
" colorscheme Tomorrow-Night-Blue

" v1.1.9
" the num of spaces for a tab - 4 is too much , 2 is too little
" convert tabs into spaces
set tabstop=3
set shiftwidth=3
set expandtab
" how-to see the tabs ?!
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< 
" but hei how-to unset the visible tabs ?!
" :set nolist
" display always the row number on the left 
set number

" ignore case when searching
set ignorecase

" show the title in the console title bar
" set title                   " Show the filename in the window title bar.

" smooth changes
set ttyfast


" autoindent by default
set noautoindent

" set the default shift width
set sw=3


" set the number of columns
set co=120

" set wrapping by default
set wrap

" how-to search recursively under the current dir for the files of type js and java but omit the
" node_modules file paths
":g/console.log/ | :vimgrep /console.log/ `find . -type f -name '*.js' -o -name '*.java' -not -path '*node_modules/*'`
" reminder open the quick fix window by :copen 20
" reminder close the quick fix window by :ccl

" highlight the searched items
set hlsearch
" start custom mappings
" =======================================================
" f4 would go to the next buffer
map <F3> :bn!<CR>

" f3 would go to the previous bugger
map <F2> :bp!<CR>

" :vimgrep /$to-srch/ `find . -type f -name '*.pm' -o -name '*.pl'`
" F5 should find the next occurrence after vimgrep
map <F5> :cp!<CR>

" F6 should find the previous occurrence after vimgrep
map <F6> :cn!<CR>

" F8 search for word under the cursor recursively , :copen , to close -> :ccl
nnoremap <F8> :grep! "\<<cword>\>" . -r<CR>:copen 22<CR>
" :g/srch/| :vimgrep /srch/ `find . -type f \| grep -v .git \| grep -v .log`

"do not search globally 
set wildignore+=**/node_modules/**

"stop custoq mappings
" =======================================================

" show additional info for the current buffer - line, char number
set ruler

" set the syntax by default
syntax on

" enable filetype plugin
filetype plugin on

" v1.1.4 http://stackoverflow.com/a/1588848/65706 - delete the annoying .swp
" files handling behaviour 
set shortmess+=A

" v1.1.5
" src: https://github.com/colbycheeze/dotfiles/blob/master/vimrc
set backspace=2   " Backspace deletes like most programs in insert mode

" Automatically :write before running commands
set autowrite     

" Reload files changed outside vim
set autoread      

" highlight the current line
set cursorline    

" Make it obvious where 100 characters is
set textwidth=100

"v1.1.6
" search as characters are entered
set incsearch           

" highlight matches
set hlsearch            

" src: https://gist.github.com/millermedeiros/1262085
" Local dirs (centralize everything)
"
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

set spelllang=en_us         " spell checking
set encoding=utf-8 nobomb   " BOM often causes trouble, UTF-8 is awsum.


" --- history / file handling ---
set history=999             " Increase history (default = 20)
set undolevels=999          " Moar undo (default=100)
set autoread                " reload files if changed externally
"
"
" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile

" src: http://andrewradev.com/2011/05/08/vim-regexes/
noremap / /\v

" avoid mistyping commands
command! W w
command! Wq wq
command! Bd bd

" src: https://www.youtube.com/watch?v=XA2WjJbmmoM
filetype plugin on
         
nnoremap ,html-page :1read $HOME/.vim/docs/code-snippets/html/html-page.html<CR>3wfa
nnoremap ,scala-for-loop :1read $HOME/.vim/docs/code-snippets/scala/scala-for-loop.scala<CR>


" some cheats
" to-upper-case in visual mode ~
"
" Purpose:
" ---------------------------------------------------------
" provide the defaults for the vim on the hostname host
" credits and sources : 
" http://phuzz.org/vimrc.html
" http://dougblack.io/words/a-good-vimrc.html#search
" https://www.fprintf.net/vimCheatSheet.html
"
" Usage:
" ---------------------------------------------------------
" :so %
" :so ~/.vimrc
" ---------------------------------------------------------
"
" how-to search for func implentation
" :grep! "\<<cword>\>" . -r
" :copen
" how-to search for file / dir names starting with SomeStr
" :fin SomeStr , tab , tab
" todo: 
" folding: http://vimcasts.org/episodes/how-to-fold/
" how-to yank the second or n-th latest yank 
" in normal mode type: "1p or "np
" how-to open all files bellow the root folder matching a file pattern
" how-to set marks globally - in normal mode mA , mB  
" how-to jump to marks globally - in normal - 'A , 'B
" how-to set marks in the current file - in normal mode mA , mB  
" how-to jump to marks in the current file - in normal - 'A , 'B
" how-to delete all the marks
" :delm! | delm A-Z0-9
" how-to open a filename somewhere under the current root
" :args **/*file-name*
" "
" VersionHistory
" ---------------------------------------------------------
" export version=1.2.1
"
" 1.2.1 --- 2017-02-02 23:28:38 --- ysg --- search recursively in files of types example
" 1.2.0 --- 2016-12-16 13:34:28 --- ysg --- F5 for recursive word under cursor srch
" 1.1.9 --- 2016-12-07 15:58:49 --- ysg --- tabs into spaces ... 
" 1.1.7 --- 2016-11-01 05:00:09 --- ysg --- various optimizations
" 1.1.7 --- 2016-10-31 09:59:57 --- ysg --- added recursive file search
" 1.1.6 --- 2016-08-22 09:36:14 --- ysg --- highlight the search line always
" 1.1.5 --- 2016-08-19 14:17:42 --- ysg --- highlight the current line
" 1.1.4 --- 2016-07-22 08:43:04 --- ysg --- removed annoying swap file msg
" 1.1.3 --- 2013-04-24 14:18:12 --- ysg --- added the filetype plugin on
" 1.1.2 --- 2012-12-26 11:42:26 --- ysg --- re-formatting
" 1.1.0 --- 2012-12-25 10:56:12 --- ysg --- to vim syntax, new settings
" 1.0.0 --- 2012-12-24 14:22:52 --- ysg --- Initial creation from source
"
" eof file: ~/.vimrc
