set nocompatible              " be iMproved, required
source ~/.bundle.vim


if has("terminfo") && ! ((&term == 'screen-256color') || ( &term == 'xterm-256color' ))
	" your term is inadequate - this theme is your punishment
	set t_Co=16
	colorscheme delek
else
	" you have chosen wisely
	set t_Co=256
	colorscheme distinguished
endif
if has("gui_running") 
	" set guifont=consolas:h10
	set guifont=Menlo:h14
	try
		colorscheme solarized
		set background=light
	catch /^Vim\%((\a\+)\)\=:E185/
		colorscheme desert
	endtry
endif

function PluginConfig()
	if exists("g:loaded_syntastic_plugin")
		" syntastic settings
		let g:syntastic_check_on_open = 1
		let g:syntastic_enable_balloons = 1
		let g:syntastic_auto_loc_list = 1	
		noremap <leader>sm :SyntasticToggleMode<CR>
	endif 
	if exists("g:loaded_nerd_tree")
		" nerd tree settings
		noremap <leader>t :NERDTreeToggle<CR>
	endif 
	if exists("g:loaded_fugitive")
		" fugitive settings 
		noremap <leader>gb :Gblame<CR>
		noremap <leader>gs :Gstatus<CR>
		noremap <leader>gd :Gdiff<CR>
		noremap <leader>gl :Glog<CR>
		noremap <leader>gc :Gcommit<CR>
		noremap <leader>gp :Git push<CR>
	endif
	if exists("g:loaded_ctrlp")
		noremap <leader>p :CtrlPBuffer<CR>
	endif
endfunction

" Strongly recommended defaults
if has("autocmd")
    au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
	au VimEnter * call PluginConfig()
	au BufRead,BufNewFile *.jinja set syntax=jinja
endif


set hidden
set novisualbell
syntax on
set nocp
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set number
set backspace=indent,eol,start
set encoding=utf-8
set laststatus=2

let mapleader=';'

" close current buffer - fails with changed
noremap <leader>c :bd<CR>
noremap <leader>l :bn<CR>
noremap <leader>h :bp<CR>
noremap <leader>j ddp
noremap <leader>k kddpk
noremap <leader>m :set mouse=a<enter>
noremap <leader>M :set mouse=<enter>
noremap <leader>n :set number!<enter>
noremap <leader>b }v{
noremap <leader>B {v}
noremap <leader>[ :tabprevious<enter>
noremap <leader>] :tabnext<enter>
noremap <leader># :s/^/#/<enter>
noremap <leader>v :vs 

