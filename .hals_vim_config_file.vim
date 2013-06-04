"--------------------------------------------
" This is one of my old .vimrcs 
"--------------------------------------------
""My Stuff"
":set tabstop=4
":set number
":set hlsearch

""Stuff from the internet
"syntax on
"set hls
"set expandtab
"set textwidth=0
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set autoindent
"set backspace=indent,eol,start
"set incsearch
"set ignorecase
"set number
"set ruler
"set wildmenu
"set smarttab
"filetype indent on
"filetype on
"filetype plugin on
"--------------------------------------------


"--------------------------------------------
" Newer Stuff
"--------------------------------------------
"Lets have some fricking line numbers no?
set number 

"On gvim, you may want to try using Tab and Shift-Tab instead:
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
" unmap <C-j>
" unmap <C-k>



"--------------------------------------------
" This is what I had at the end of my old .vimrc on BigMac
" - prob the best stuff is here
"--------------------------------------------

"--------------------------------------------------------------
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => HAL 2012 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------------------
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stuff to remap switching between buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"non graphical vim i guess - i dont like these commands
":nnoremap <C-n> :bnext<CR>
":nnoremap <C-p> :bprevious<CR>

"On gvim, you may want to try using Tab and Shift-Tab instead:
"nnoremap <Tab> :bnext<CR>
"nnoremap <S-Tab> :bprevious<CR>

"List all the buffers
"nnoremap <C-Tab> :files<CR>
"
"This noly works on MAc in iTerm 2
"nnoremap <C-Tab> :buffers<CR>:buffers!fer<Space>
"nnoremap <C-E>> $
"nnoremap <C-A> ^
"nnoremap f <C-Right>>
"nnoremap b <C-Left>>


"A list of your buffers can be shown after switching by using the following maps:
"nnoremap <C-Tab> :bnext<CR>:redraw<CR>:ls<CR>
"nnoremap <C-S-Tab> :bprevious<CR>:redraw<CR>:ls<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This sets up a plugin called pathogen that manages my other plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call pathogen#infect()
"Now any plugins you wish to install can be extracted to a subdirectory under ~/.vim/bundle, and they will be added to the 'runtimepath'. Observe:
"$cd ~/.vim/bundle
"$git clone git://github.com/tpope/vim-fugitive.git
"Now fugitive.vim is installed.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This sets up the NERDTree plugin so that it shows hidden files/folders
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"New Stuff
" This is where i am adding my post-merge 2013 stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif
