set hlsearch " 검색어 하이라이팅
set nu " 줄번호
set autoindent " 자동 들여쓰기
set scrolloff=2
set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1 " 스크롤바 너비
set autowrite " 다른 파일로 넘어갈 때 자동 저장
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set cindent " C언어 자동 들여쓰기
set bs=eol,start,indent
set history=256
set laststatus=2 " 상태바 표시 항상
set paste " 붙여넣기 계단현상 없애기
set shiftwidth=4 " 자동 들여쓰기 너비 설정
set showmatch " 일치하는 괄호 하이라이팅
set smartcase " 검색시 대소문자 구별
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
set ruler " 현재 커서 위치 표시
set incsearch
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
 
	if has("syntax")
	syntax on
	endif
 
	set wrap
	set nowrapscan
	set fencs=ucs-bom,utf-8,euc-kr.latin1
	set fileencoding=euc-kr
	set nobackup
	set encoding=utf-8
 
	let Tlist_Use_Right_Window=1
 
	map <F5> :BufExplorer<CR>
 
 
	map ,1 :b!1<CR>
	map ,2 :b!2<CR>
	map ,3 :b!3<CR>
	map ,4 :b!4<CR>
	map ,5 :b!5<CR>
	map ,6 :b!6<CR>
	map ,7 :b!7<CR>
	map ,8 :b!8<CR>
	map ,9 :b!9<CR>
	map ,0 :b!0<CR>
	map ,w :bw<CR>
 
	syntax on
	set ai
	set si
	set tabstop=4
	set hlsearch
	set bg=dark
	set ts=4
	au Bufenter *.\(c\|cpp\|h\|sh\|pl\|php\|html\) set et
 
	"--------------"
	"ctags database path
	"--------------"
	set tags=./tags,tags;/
 
	"---------------------"
	"cscope database path"
	"---------------------"
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
 
	"--------------
	"cscope DB path
	"--------------
	if filereadable("./cscope.out")
	cs add cscope.out
	else
	cs add /usr/src/linux/cscope.out
	endif
	set csverb
 
	"-----------------------
	"Tag list Configuration
	"-----------------------
	filetype on
	nmap <F7> :TlistToggle<CR>
	let Tlist_Ctags_Cmd = '/usr/bin/ctags'
	let Tlist_Inc_Winwidth = 0
	let Tlist_Exit_OnlyWindow = 0
 
	let Tlist_Auto_Open = 0
	let Tlist_Use_Right_Window = 1
 
	nmap <F8> :SrcExplToggle<CR>
	nmap <C-H> <C-W>h
	nmap <C-J> <C-W>j
	nmap <C-K> <C-W>k
	nmap <C-L> <C-W>l
 
	let g:SrcExpl_winHeight = 8
	let g:SrcExpl_refreshTime = 100
	let g:SrcExpl_jumpKey = '<ENTER>'
	let g:SrcExpl_gobackKey = '<SPACE>'
	let g:SrcExpl_isUpdateTags = 0
 
	"-------------------------------
	"NERD Tree Configuration Setting
	"-------------------------------
 
	let NERDTreeWinPos = 'left'
	nmap <F9> :NERDTreeToggle<CR>
 
	if exists('loaded_trailing_whitespace_plugin') | finish | endif
	let loaded_trailing_whitespace_plugin = 1
 
	if !exists('g:extra_whitespace_ignored_filetypes')
	let g:extra_whitespace_ignored_filetypes = []
	endif
 
function! ShouldMatchWhitespace()
	for ft in g:extra_whitespace_ignored_filetypes
	if ft ==# &filetype | return 0 | endif
	endfor
	return 1
	endfunction
 
	function! s:FixWhitespace(line1,line2)
	let l:save_cursor = getpos(".")
	silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
	call setpos('.', l:save_cursor)
	endfunction
 
	" Run :FixWhitespace to remove end of line white space
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)
 
	"============== CSCOPE ==============
 
func! Sts()
	let st = expand("<cword>")
	exe "sts ".st
	endfunc
	nmap    ,st :call Sts()<cr>
 
func! Tj()
	let st = expand("<cword>")
	exe "tj ".st
	endfunc
	nmap    ,tj :call Tj()<cr>
 
func! Css()
	let css = expand("<cword>")
	new
	exe "cs find s ".css
	if getline(1)==" "
	exe "q!"
	endif
	endfunc
	nmap    ,css :call Css()<cr>
 
func! Csd()
	let csd = expand("<cword>")
	new
	exe "cs find d ".csd
	if getline(1)==" "
	exe "q!"
	endif
	endfunc
	nmap    ,csd :call Csd()<cr>
 
func! Csc()
	let csc = expand("<cword>")
	new
	exe "cs find c ".csc
	if getline(1)==" "
	exe "q!"
	endif
	endfunc
	nmap    ,csc :call Csc()<cr>
 
func! Csg()
	let csg = expand("<cword>")
	new
	exe "cs find g ".csg
	if getline(1)==" "
	exe "q!"
	endif
	endfunc
	nmap    ,csg :call Csg()<cr>
 
func! Man()
	let sm = expand("<cword>")
	exe "!man -S 2:3:4:5:6:7:8:9:tc1:n:l:p:o ".sm
	endfunc
	nmap    ,ma :call Man()<cr>
 
	"============== 주석 매크로 ==============
 
	func! CmtOn()    "주석 on
	exe "'<,'>norm i//"
	endfunc
 
 
	func! CmtOff()    "주석 off
	exe "'<,'>norm 2x"
endfunc
 
 
vmap <c-c> <esc>:call CmtOn() <cr>
vmap <c-x> <esc>:call CmtOff() <cr>
nmap <c-c> <esc>v:call CmtOn() <cr>\
nmap <c-x> <esc>v:call CmtOff() <cr>
 
set clipboard=unnamed
nnoremap <F3> "+y
nnoremap <F4> "+gP
vnoremap <F3> "+y
vnoremap <F4> "+gP
inoremap <F3> <esc>"+Yi 
inoremap <F4> <esc>"-gPa
 
set encoding=utf-8
set fileencodings=utf-8,cp949
au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda
