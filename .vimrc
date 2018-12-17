" Global things to set
    set nocompatible
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set smartindent
    set number
    set colorcolumn=121
    set backspace=indent,eol,start
    set cmdheight=2
    set wildmenu
    set relativenumber
    set so=999
    " set autochdir
    set cursorline
    set cursorcolumn
    set ruler
    set pastetoggle=<F3>
    set foldmethod=indent
    set visualbell
    filetype on
    filetype plugin on
    autocmd FileType * setlocal foldenable foldlevel=20
    chdir ./

" Plugins (nerd tree/supertab get set up weirdly. Should reorganize a bit)
    call plug#begin('~/.vim/plugged')
        Plug 'morhetz/gruvbox'
        Plug 'elixir-lang/vim-elixir'
        " Plug 'YouCompleteMe'
        Plug 'pangloss/vim-javascript'
        Plug 'scrooloose/syntastic'
        Plug 'scrooloose/nerdcommenter'
        Plug 'scrooloose/nerdtree'
        Plug 'ervandew/supertab'
        Plug 'plasticboy/vim-markdown'
        Plug 'KeitaNakamura/neodark.vim'
        Plug 'vim-scripts/LanguageTool'
        " Plug 'vimproc.vim'
        " Plug 'vimshell.vim'
    call plug#end()

    " Colorscheme stuff
        " gruvbox
            colorscheme gruvbox
            set background=dark
        " neodark
            " colorscheme neodark
        " General stuff
            syntax on
            hi Normal ctermbg=none
            highlight ErrorMsg ctermbg=Red
            " Highlight trailing whitespace
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
        let g:syntastic_c_compiler_options='-I/usr/lib/openmpi/include -std=gnu99 -pedantic -Wall -Werror -Wextra -Wstrict-prototypes -Wold-style-definition'
        let g:syntastic_cpp_compiler_options='-I/usr/lib/openmpi/include -std=c++11 -pedantic -Wall -Werror -Wextra'
        " Disable syntastic for java files
        let g:loaded_syntastic_java_javac_checker = 1

    " Nerd Commenter Stuff
        let g:NERDSpaceDelims = 1

    " Nerd Tree Stuff
        let g:NERDTreeDirArrows='>'

    " LanguageTool Stuff
    :let g:languagetool_jar='$HOME/Downloads/LanguageTool-4.2/languagetool-commandline.jar'
    :let g:languagetool_lang='fr'

" Skeleton Files
    autocmd BufNewFile *.java 0r ~/.vim/skeleton/skeleton.java|exec "%s/{filename}/" . expand('%:t:r') . "/g"|exec "%s/{date}/" . strftime('%m\/%d\/%y') . "/g"

" Indentation rules (The elixir plugin deals with elixir stuff)
    autocmd FileType html,css,ruby,scala :setlocal shiftwidth=2 tabstop=2

" Editor configurations (excluding mappings)
    " C files
        autocmd FileType c,h :set colorcolumn=81

" Mappings
    " Global mappings
        map <F2> <ESC>:NERDTree<CR>

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
        nnoremap \\ :b#<CR>
        nnoremap <Right> >>
        nnoremap <Left> <<
        nnoremap m 15j
        nnoremap , 15k

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
        imap :<CR> <ESC>A:<Right><CR>
        imap .<CR> <ESC>A.<Right><CR>
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

    " Markdown accents for french
        autocmd FileType markdown :imap e' é
        autocmd FileType markdown :imap E' É
        autocmd FileType markdown :imap e` è
        autocmd FileType markdown :imap E` È
        autocmd FileType markdown :imap e^ ê
        autocmd FileType markdown :imap E^ Ê
        autocmd FileType markdown :imap a` à
        autocmd FileType markdown :imap A` À
        autocmd FileType markdown :imap a^ â
        autocmd FileType markdown :imap A^ Â
        autocmd FileType markdown :imap o^ ô
        autocmd FileType markdown :imap O^ Ô
        autocmd FileType markdown :imap u` ù
        autocmd FileType markdown :imap U` Ù
        autocmd FileType markdown :imap u^ û
        autocmd FileType markdown :imap U^ Û
        autocmd FileType markdown :imap oe œ
        autocmd FileType markdown :imap i^ î
        autocmd FileType markdown :imap ~;  ;
        autocmd FileType markdown :imap ~!  !
        autocmd FileType markdown :imap ~?  ?
