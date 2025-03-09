" ===========================

" ===========================
call plug#begin()  " Между этих строк добавлять плагины для установки.

" Подключаем плагин NERDTree для управления файлами
Plug 'preservim/nerdtree'
Plug 'arrufat/vala.vim'
Plug 'flazz/vim-colorschemes'
Plug 'prabirshrestha/vim-lsp' " vim-lsp
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'neovim/nvim-lsp'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Or build from source code by using npm
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}

Plug 'prabirshrestha/vim-lsp' " vim-lsp
Plug 'autozimu/LanguageClient-neovim'

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'mattn/vim-lsp-settings'


call plug#end()   

" ===========================
" Клавиши
" ===========================
" Сочетание клавиш для переключения NERDTree
nnoremap <C-b> :NERDTreeToggle<CR>

" Сочетание клавиш для копирования в системный буфер обмена
nnoremap <C-y> "+y
vnoremap <C-y> "+y

" Сочетание клавиш для отключения подсветки поиска
nnoremap <Esc> :nohlsearch<CR>

" Отключение стрелок для навигации
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

noremap! <Up> <NOP>
noremap! <Down> <NOP>
noremap! <Left> <NOP>
noremap! <Right> <NOP>

" Прокрутка + центрирование
nnoremap <C-D> <C-D>zz
nnoremap <C-U> <C-U>zz


" ===========================
" Основные настройки
" ===========================
" Кодировка
set encoding=utf-8             " Устанавливаем кодировку UTF-8
set fileencodings=utf-8        " Поддержка кодировки UTF-8 для файлов
set runtimepath+=~/.vim-plugins/LanguageClient-neovim
set nocompatible               " Отключаем совместимость с vi
filetype plugin indent on      " Включаем поддержку плагинов 

" ===========================
" Настройки отображения
" ===========================
set relativenumber             " Включаем относительную нумерацию строк
set number                     " Включаем абсолютную нумерацию для текущей строки
set numberwidth=1              " Ширина номера строки

highlight LineNr ctermfg=NONE guifg=NONE  " Отключаем цвет для номеров строк
highlight CursorLineNr ctermfg=NONE guifg=NONE  " Отключаем цвет для текущего номера строки

packadd! doki-theme
"set path=/usr/include/gtk-4.0/gtk
"set path=/usr/include/pango-1.0
"set path=/usr/include/cairo
syntax enable
colorscheme monokai-phoenix
"let g:clang_include_dirs = ['/usr/include/gtk-4.0', '/usr/include/pango-1.0', '/usr/include/cairo']

set scrolloff=5                " Отступ от края экрана при прокрутке
set background=dark            " Тёмная тема

" ===========================
" Настройки табуляции
" ===========================
set expandtab                  " Заменяем табуляции на пробелы
set tabstop=4                  " Количество пробелов для табуляции
set shiftwidth=4               " Количество пробелов при автодобавлении отступов
set softtabstop=4              " Количество пробелов при автотабуляции

set smarttab                   " Умное поведение табуляции
set smartindent                " Умное выравнивание для кода

" ===========================
" Языковые настройки
" ===========================
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" Поддержка русской раскладки для команд

" ===========================
" Безопасность
" ===========================
set modelines=0     " Отключаем CVE-2007-2438 уязвимость


" ===========================
" Производительность
" ===========================
set backspace=indent,eol,start " Больше возможностей для удаления текста
set nowrap                     " Отключаем перенос строк
set ruler                      " Показывать текущие координаты курсора
set mouse=a                    " Включаем поддержку мыши
" ===========================
" Автокоманды
" ===========================
" Не создавать резервные копии для crontab и chpass
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
au BufWrite /private/etc/pw.* set nowritebackup nobackup


" ===========================
" Поиск
" ===========================
set hlsearch                   " Включаем подсветку поиска
set incsearch                  " Поиск по мере ввода
set ic                         " Игнорировать регистр при поиске
set smartcase                  " Игнорировать регистр, если нет заглавных букв
"AIRLINE"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:lsp_cxx_hl_use_text_props = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1
let c_no_curly_error=1

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]
" Required for operations modifying multiple buffers like rename.
set hidden

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
 " nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>""
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

