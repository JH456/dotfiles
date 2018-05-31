" Global things to set
    set nocompatible
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set smartindent
    set number
    set colorcolumn=81
    set backspace=indent,eol,start
    set cmdheight=2
    set wildmenu
    set relativenumber
    set so=999
    set autochdir
    set cursorline
    set cursorcolumn
    set ruler
    set pastetoggle=<F3>
    set foldmethod=indent
    filetype on
    filetype plugin on
    autocmd FileType * setlocal foldenable foldlevel=20
    chdir ./

" Plugins (nerd tree/supertab get set up weirdly. Should reorganize a bit)
    call plug#begin('~/.vim/plugged')
        Plug 'morhetz/gruvbox'
        Plug 'vim-elixir'
        " Plug 'YouCompleteMe'
        Plug 'vim-javascript'
        Plug 'syntastic'
        Plug 'nerdcommenter'
        Plug 'nerdtree'
        Plug 'supertab'
        " Plug 'vimproc.vim'
        " Plug 'vimshell.vim'
    call plug#end()

    " Colorscheme stuff
        " gruvbox
            colorscheme gruvbox
            set background=dark
        " General stuff
            syntax on
            hi Normal ctermbg=none
            highlight ErrorMsg ctermbg=Red
            match ErrorMsg '\s\+$'


    " Syntastic Stuff
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_quiet_messages = { "type": "style" }
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
        let g:syntastic_python_checkers = ['flake8']
        let g:syntastic_javascript_checkers= ['jshint']
        let g:syntastic_c_compiler_options='-I/usr/lib/openmpi/include -std=gnu99 -pedantic -Wall -Werror -Wextra'
        let g:syntastic_cpp_compiler_options='-I/usr/lib/openmpi/include -std=c++11 -pedantic -Wall -Werror -Wextra'
        let g:NERDTreeDirArrows='>'

    " Nerd Commenter Stuff
        let g:NERDSpaceDelims = 1

" Skeleton Files
    autocmd BufNewFile *.java 0r ~/.vim/skeleton/skeleton.java|exec "%s/{filename}/" . expand('%:t:r') . "/g"|exec "%s/{date}/" . strftime('%m\/%d\/%y') . "/g"

" Indentation rules (The elixir plugin deals with elixir stuff)
    autocmd FileType html,css,ruby,scala :setlocal shiftwidth=2 tabstop=2

" Mappings
    " Global mappings
        map <F2> <ESC>:NERDTree<CR>
        " map <Down> <Esc>ddp
        " map <Up> <Esc>k<Down>k
        " map <Right> >>
        " map <Left> <<
        "
    " Global normal mode mappings
        nmap <S-h> ^
        nmap <S-l> $
        nmap ( ?(<CR>
        nmap ) /)<CR>
        nmap { ?{<CR>
        nmap } /}<CR>
        nnoremap + :+0,+
        nnoremap <Space> za
        nnoremap t :lnext<CR>
        nnoremap T :lprevious<CR>

    " Global visual mode mappings
        vmap <S-h> ^
        vmap <S-l> $
        vmap ( ?(<CR>
        vmap ) /)<CR>

    " Global insert mode mappings
        " imap <Right> <Esc>>>
        " imap <Left> <Esc><<
        " imap <Down> <Esc>ddp
        " imap <Up> <Esc>k<Down>k
        imap "" ""<ESC>i
        imap '' ''<ESC>i
        imap () ()<ESC>i
        imap <> <><ESC>i
        imap [] []<ESC>i
        imap {} {}<ESC>i
        imap ;; <ESC>A;
        imap ;<CR> <ESC>A;<Right><CR>
        imap {<CR> <ESC>A<Space>{<Right><CR>}<ESC><Up>o

    " General C like language insert mode mappings
        autocmd FileType c,h,cpp,hpp,java,javascript :imap if<Space> if ()
        autocmd FileType c,h,cpp,hpp,java,javascript :imap while<Space> while ()
        autocmd FileType c,h,cpp,hpp,java,javascript :imap for<Space> for ()

    " C specific insert mode mappins
        autocmd FileType c,cpp :imap ~im int main()int argc, const char **argv<Right> {<ESC>oreturn 0;<CR>}
        autocmd FileType c,cpp :imap ~p printf()<Right>;<Left><Left>

    " Java specific insert mode mappings
        autocmd FileType java :imap ~sopl System.out.println()<Right>;<Left><Left>
        autocmd FileType java :imap ~psvm public static void main(String[]<Right> args) {<CR>

    " JavaScript specific insert mode mappings
        autocmd FileType javascript :imap ~iefe ()()<ESC>i~func
        autocmd FileType javascript :imap ~cl console.log()
        autocmd FileType javascript :imap ~func function()<Right> {}<CR><ESC>(a
        autocmd FileType javascript :imap ~funo function()<Right> {}<CR><ESC>ko
        autocmd FileType javascript :imap ~arr ()<Right> => {}<CR><ESC>(a
        autocmd FileType javascript :imap ~aro ()<Right> => {}<CR><ESC>ko
        autocmd FileType javascript :imap ==<Space> <Space><Left>===<Right>
        " autocmd FileType javascript :imap ;<CR> <ESC>A<Right><CR>
        autocmd FileType javascript :inoremap ,<CR> <ESC>A,<CR>

    " Elixir specific insert mode mappings
        autocmd FileType elixir :inoremap {<CR> <ESC>A<space>do<CR>end<ESC><Up>o
        autocmd FileType elixir :imap ~ip IO.puts()<Right>;<Left><Left>
        autocmd FileType elixir :imap ~fnn fn()<Right> -> <CR>end<ESC>(a
        autocmd FileType elixir :imap ~fno fn()<Right> -> <CR>end<ESC>ko

    " Python specific insert mode mappings
        autocmd FileType python :imap :: <ESC>A:
        autocmd FileType python :imap :<CR> <ESC>A:<Right><CR>
        autocmd FileType python :imap ~p print()
        autocmd FileType python :imap ;<CR> <ESC>A<Right><CR>
