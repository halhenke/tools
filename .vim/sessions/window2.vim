" ~/.vim/sessions/window2.vim: Vim session script.
" Created by session.vim 1.5 on 31 August 2012 at 10:30:30.
" Open this file in Vim and run :source % to restore your session.

set guioptions=egmrLt
silent! set guifont=Menlo\ Regular:h25
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
cd ~/Sites
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +5 MemeQuery_HalHenke.php
badd +0 MemeQuery.py
badd +0 ~/Code/Python/Memoticon\ Helper/MemeHelper.py
badd +351 /opt/local/var/macports/logs/_opt_local_var_macports_sources_rsync.macports.org_release_ports_www_mod_wsgi/mod_wsgi/main.log
badd +35 /opt/local/etc/macports/macports.conf
badd +20 /opt/local/etc/macports/sources.conf
badd +42 /opt/local/var/macports/sources/rsync.macports.org/release/ports/www/mod_wsgi/Portfile
badd +1 /opt/local/bin/python2.7
badd +453 /private/etc/apache2/httpd.conf
badd +382 /private/etc/apache2/magic
badd +355 /private/etc/apache2/original/httpd.conf
badd +1 /private/etc/apache2/users/Noches.conf
badd +0 /private/var/log/apache2/error_log
badd +1 foo.php
badd +34 /opt/local/apache2/include/httpd.h
badd +25 /opt/local/include/apr-1/apr_tables.h
badd +37 /opt/local/apache2/include/ap_config.h
badd +1 /opt/local/include/apr-1/apr_hooks.h
badd +90 /opt/local/include/apr-1/apr.h
badd +37 ~/Code/Packages/apr-1.4.6_1.darwin_10.x86_64/opt/local/bin/apr-1-config
badd +27 /opt/local/var/macports/sources/rsync.macports.org/release/ports/devel/apr/files/apr_h_patch.diff
badd +58 /opt/local/include/apr-1/apr_env.h
badd +49 ~/Code/Packages/apr-1.4.6_1.darwin_10.x86_64/opt/local/include/apr-1/apr.h
badd +1 ~/Code/Packages/apr-1.4.6_1.darwin_10.x86_64/opt/local/include/apr-1/apr_lib.h
badd +1 ~/Code/Packages/apr-1.4.6_1.darwin_10.x86_64/opt/local/include/apr-1/apr_strings.h
badd +1 ~/Code/Packages/apr-1.4.6_1.darwin_10.x86_64/opt/local/include/apr-1/apr_tables.h
badd +41 /opt/local/bin/apr-1-config
badd +31 /opt/local/var/macports/sources/rsync.macports.org/release/ports/devel/apr/Portfile
badd +37 /opt/local/var/macports/sources/rsync.macports.org/release/ports/www/apache2/Portfile
badd +1 /opt/local/var/macports/sources/rsync.macports.org/release/ports/devel/apr0/Portfile
badd +0 MemeQuery2.php
badd +34 samplePythonCGIerror.html
badd +3 .meme_conf
badd +0 readyForUpload/MemeQuery.py
silent! argdel *
set lines=47 columns=158
edit MemeQuery2.php
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
let s:l = 60 - ((7 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
60
normal! 0
tabedit /opt/local/var/macports/logs/_opt_local_var_macports_sources_rsync.macports.org_release_ports_www_mod_wsgi/mod_wsgi/main.log
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
let s:l = 350 - ((6 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
350
normal! 07l
tabedit MemeQuery.py
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
let s:l = 60 - ((7 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
60
normal! 014l
tabedit /opt/local/include/apr-1/apr.h
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
let s:l = 90 - ((35 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
90
normal! 0
tabedit /private/var/log/apache2/error_log
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
let s:l = 12868 - ((37 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
12868
normal! 0114l
tabedit ~/Code/Python/Memoticon\ Helper/MemeHelper.py
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
let s:l = 108 - ((7 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
108
normal! 0
tabedit readyForUpload/MemeQuery.py
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
let s:l = 1 - ((0 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 015l
tabnext 6
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
tabnext 6
1wincmd w

" vim: ft=vim ro nowrap smc=128
