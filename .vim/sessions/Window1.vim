" ~/.vim/sessions/Window1.vim: Vim session script.
" Created by session.vim 1.5 on 31 August 2012 at 10:31:02.
" Open this file in Vim and run :source % to restore your session.

set guioptions=egmrLt
silent! set guifont=Menlo\ Regular:h23
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'macvim' | colorscheme macvim | endif
call setqflist([])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Code/Python
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/Code/Ruby/Rails/blog/config.ru
badd +1 ~/Code/Ruby/Rails/blog/Gemfile
badd +1 ~/Code/Ruby/Rails/blog/config/routes.rb
badd +1 ~/Code/Ruby/Rails/blog/doc/README_FOR_APP
badd +1 ~/Code/Ruby/Rails/blog/app/models/post.rb
badd +1 /opt/local/bin/rails
badd +1 ~/Code/Ruby/Rails/blog/pwd
badd +5 ~/Code/Ruby/useMacPortsRuby.sh\ alias
badd +2 ~/Code/ShellScripting/useMacPortsRuby.sh
badd +26 ~/.profile
badd +1 opt/local/lib/ruby1.9/gems/1.9.1/doc/activerecord-3.2.7/rdoc/ActiveRecord
badd +1 /opt/local/lib/ruby1.9/gems/1.9.1/doc/activerecord-3.2.7/rdoc/ActiveRecord/Migration/CommandRecorder.html
badd +42 /opt/local/lib/ruby1.9/gems/1.9.1/gems/railties-3.2.7/lib/rails/paths.rb
badd +42 /opt/local/lib/ruby1.9/gems/1.9.1/gems/railties-3.2.7/lib/rails.rb
badd +42 /opt/local/lib/ruby1.9/gems/1.9.1/gems/railties-3.2.7/lib/rails/application.rb
badd +1 ~/Code/Ruby/Experiments/shit.rb
badd +1 Mucking\ About/call_by_test.py
badd +6 ~/Code/Ruby/Rails/blog/classesVsRuby.py
badd +1 Mucking\ About/classesVsRuby.py
badd +3 ~/Sites/foo.php
badd +22 ~/Sites/Error\ Pages/404\ File\ Not\ Found/file\ not\ found_files/accesslog_halhenke.net_8_17_2012
badd +1 /opt/local/lib/ruby1.9/gems/1.9.1/doc/activerecord-3.2.7/ri/ActiveRecord/Base/connection-i.ri
badd +42 /opt/local/lib/ruby1.9/gems/1.9.1/gems/activerecord-3.2.7/lib/active_record/validations.rb
badd +700 /opt/local/lib/ruby1.9/gems/1.9.1/gems/activerecord-3.2.7/lib/active_record/base.rb
badd +1 /opt/local/lib/ruby1.9/gems/1.9.1/gems/activerecord-3.2.7/lib/active_record/validations/associated.rb
badd +173 /opt/local/lib/ruby1.9/gems/1.9.1/gems/activerecord-3.2.7/lib/active_record/validations/uniqueness.rb
badd +6 ~/.bashrc
badd +366 /opt/local/bin/virtualenvwrapper.sh-2.7
badd +3 ~/.bash_profile
badd +9 /opt/local/bin/virtualenv-2.7
badd +1 /opt/local/bin/virtualenv-2.6
badd +42 /opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-tk/Tkinter.py
badd +467 ~/Code/Web/Web2Py\ Plugins/Layouts/web2py.plugin.layout_Frozenage.w2p.w2p
badd +42 ~/.virtualenvs/web2py_env/web2py/applications/SocialCircles/databases/sql.log
badd +638 ~/.vimrc
badd +1 ~/Code/Ruby/Rails/blog/NERD_tree_2
badd +109 ~/.vim/bundle/nerdtree/doc/NERD_tree.txt
badd +1 August\ 2012\ Python\ Setup.txt
badd +165 Memoticon\ Helper/MemeHelper.py
badd +42 ~/Sites/MemeQuery_HalHenke.php
badd +1 ~/Sites/MemeQuery.php
badd +1 ~/Sites/MemeQuery2.php
badd +114 LISP\ Interpreter/lis.py
badd +42 Economic/First\ Attempt/economnom.py
badd +1 Mucking\ About/GUI_prog_widgets_frames.py
badd +1 Memoticon\ Helper/CleanCode/MemeHelper.py
badd +6 ~/Code/ShellScripting/enviroSwitch.sh
badd +26 ~/Code/ShellScripting/SomeCoolCode.sh
badd +20 ~/Code/ShellScripting/setupMacPortsWithMySymlinks.sh
badd +59659 ~/Library/Caches/Firefox/Profiles/uof2f9qe.default/Cache/_CACHE_001_
silent! argdel *
set lines=52 columns=180
edit ~/Code/Ruby/Rails/blog/app/models/post.rb
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 4 - ((3 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 0
lcd ~/Code/Ruby/Rails/blog
tabedit /opt/local/bin/rails
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 8 - ((7 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
8
normal! 0
lcd ~/Code/Ruby/Rails/blog
tabedit /opt/local/bin/virtualenv-2.7
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 9 - ((8 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
9
normal! 08l
lcd ~/Code/Ruby/Rails/blog
tabedit /opt/local/lib/ruby1.9/gems/1.9.1/gems/activerecord-3.2.7/lib/active_record/base.rb
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 706 - ((41 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
706
normal! 04l
lcd ~/Code/Ruby/Rails/blog
tabedit ~/Code/Ruby/Experiments/shit.rb
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 86 - ((41 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
86
normal! 010l
lcd ~/Code/Ruby/Rails/blog
tabedit ~/Code/Python/Mucking\ About/classesVsRuby.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 34 - ((33 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
34
normal! 049l
lcd ~/Code/Ruby/Rails/blog
tabedit ~/Code/Python/August\ 2012\ Python\ Setup.txt
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 42 - ((41 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
42
normal! 066l
lcd ~/Code/Ruby/Rails/blog
tabedit ~/Code/Python/Memoticon\ Helper/CleanCode/MemeHelper.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 42 - ((41 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
42
normal! 05l
lcd ~/Code/Ruby/Rails/blog
tabedit ~/Sites/MemeQuery2.php
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 124 - ((0 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
124
normal! 0
lcd ~/Code/Ruby/Rails/blog
tabedit ~/Code/Python/Mucking\ About/GUI_prog_widgets_frames.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 42 - ((41 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
42
normal! 0
lcd ~/Code/Python/Mucking\ About
tabedit ~/.profile
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 25 - ((24 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
25
normal! 0
lcd ~/Code/ShellScripting
tabnext 11
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
tabnext 11
1wincmd w

" vim: ft=vim ro nowrap smc=128
