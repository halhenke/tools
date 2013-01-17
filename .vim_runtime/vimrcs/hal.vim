"---------------------------------------------------------------------------------------------------------------------------------
" This is where I, Hal Henke, wish to keep my configuration settings that are apparently not considered ultimate enough to be 
" included by default in the vim ultimate configuration tool... ~_~
"
" for more awesomness see:
" https://github.com/amix/vimrc
"--------------------------------------------------------------------------------------------------------------------------------

"================================================================================
" " How to switch from mode to mode
"		           TO mode						    
"		           Normal	Visual	Select	Insert	  Replace   Cmd-line  Ex
" FROM mode								 
" Normal		    	    v V ^V	  *4	 *1	       R gR     : / ? !   Q
" Visual		    *2		          ^G	 c C	    --	      :       --
" Select		    *5	    ^O ^G	         *6	        --	      --      --
" Insert		    <Esc>	  --	  --		      <Insert>    --      --
" Replace		    <Esc>	  --	  --	<Insert>	          --      --
" Command-line	    *3	      --	  --	 :start	    --		          --
" Ex		        :vi	      --	  --	 --	        --	      --
"
"
" " Map modes and remap commands
" :no[remap]  {lhs} {rhs}         mapmode-nvo             :no  :noremap
" :nn[oremap] {lhs} {rhs}         mapmode-n               :nn  :nnoremap
" :vn[oremap] {lhs} {rhs}         mapmode-v               :vn  :vnoremap
" :xn[oremap] {lhs} {rhs}         mapmode-x               :xn  :xnoremap
" :snor[emap] {lhs} {rhs}         mapmode-s               :snor :snoremap
" :ono[remap] {lhs} {rhs}         mapmode-o               :ono :onoremap
" :no[remap]! {lhs} {rhs}         mapmode-ic              :no! :noremap!
" :ino[remap] {lhs} {rhs}         mapmode-i               :ino :inoremap
" :ln[oremap] {lhs} {rhs}         mapmode-l               :ln  :lnoremap
" :cno[remap] {lhs} {rhs}         mapmode-c               :cno :cnoremap
" 
" " Unmap commands for modes
" :unm[ap]  {lhs}			|mapmode-nvo|		*:unm*  *:unmap*
" :nun[map] {lhs}			|mapmode-n|		*:nun*  *:nunmap*
" :vu[nmap] {lhs}			|mapmode-v|		*:vu*   *:vunmap*
" :xu[nmap] {lhs}			|mapmode-x|		*:xu*   *:xunmap*
" :sunm[ap] {lhs}			|mapmode-s|		*:sunm* *:sunmap*
" :ou[nmap] {lhs}			|mapmode-o|		*:ou*   *:ounmap*
" :unm[ap]! {lhs}			|mapmode-ic|		*:unm!* *:unmap!*
" :iu[nmap] {lhs}			|mapmode-i|		*:iu*   *:iunmap*
" :lu[nmap] {lhs}			|mapmode-l|		*:lu*   *:lunmap*
" :cu[nmap] {lhs}			|mapmode-c|		*:cu*   *:cunmap*

"Lets have some fricking line numbers no?
set number 

"On gvim, you may want to try using Tab and Shift-Tab instead:
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
" unmap <C-j>
" unmap <C-k>












