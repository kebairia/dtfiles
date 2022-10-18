" GENERAL {{{
"
let mapleader =','
setlocal foldmethod=marker
set number                      " Set numberline
set termguicolors
set cursorline                  " Highlight current line
set mouse=a                     " Enable mouse in all in all modes
set gdefault                    " By default add g flag to search/replace. Add g to toggle
set ignorecase
set noshowmode                  " Don't show the current mode (airline.vim takes care of us)
set tabstop=4                   " insert 4 spaces for a tab "
set shiftwidth=4                "change the number of space characters inserted for indentation
set expandtab                   "insert space characters whenever the tab key is pressed
set showtabline=2              " Always show tab bar
set undofile                    " Save undos after file closes
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo
set wildmode=longest,list,full  " enable auto completion

set spell spelllang=en_us       "set the spell checking to US-English
"let python_highlight_all=1


"disable automatic commenting on newline
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
""}}}
"KEY BINDINGS {{{
map <leader>o :setlocal spell! spelllang=en_us<CR> "" spell checking
map <leader>g :Neogit<CR>
autocmd BufWritePost ~/dox/latex/cv/cv.tex !cd ~/dox/latex/cv ; xelatex -shell-escape -pdf -f cv.tex && cp cv.pdf ~/CV_Zakaria_Kebairia_2022.pdf && cp cv.pdf ~/dox/blog/content/files/
autocmd BufWritePost ~/dox/jobs/umaitek/zimbra_scripts/archiving/archive.sh !scp ~/dox/jobs/umaitek/zimbra_scripts/archiving/archive.sh root@192.168.2.91:/root
" for Ansible
autocmd FileType yaml setlocal ai ts=2 sw=2 et
"}}}
" PASTE - CLIPBOARD SUPPORT {{{
set clipboard=unnamed
noremap y "*y
noremap p "*p
noremap <Leader>y "+y
noremap <Leader>p "+p
"}}}
"THEME {{{
filetype plugin indent on
set t_Co=256
set encoding=utf-8
"" Gruvbox Colorscheme
colorscheme gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_bold = 1
let g:gruvbox_underline = 1
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_italicize_comments = "1"
let g:gruvbox_italicize_strings = "1"
let g:gruvbox_termcolors=16
let g:gruvbox_termtrans =1
let g:gruvbox_degrade =1
let g:gruvbox_hls_cursor = "red"
let g:gruvbox_invert_selection="0" 
set background=dark
" }}}
" PLUGINS {{{
"
"" Packer
lua << EOF
local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'      -- Package manager
  use 'neovim/nvim-lspconfig'       -- Configurations for Nvim LSP
  use 'hrsh7th/nvim-cmp'            -- autocompletion
  use 'jiangmiao/auto-pairs'        -- auto-pairs
  use 'nvim-lualine/lualine.nvim'   -- statusline
end)
EOF
" }}}

" PLUGINS CONFIGURATION {{{
" LUALINE {{{2
lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'zk-theme',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype', 'encoding'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
    {'buffers',
      show_filename_only = true,   -- Shows shortened relative path when set to false.
      show_modified_status = true, -- Shows indicator when the buffer is modified.

      mode = 0, -- 0: Shows buffer name
                -- 1: Shows buffer index (bufnr)
                -- 2: Shows buffer name + buffer index (bufnr)
    buffers_color = {
        -- Same values as the general color option can be used here.
        active = 'lualine_a_visual',
        inactive = 'lualine_c_normal',
        },     -- Color for active buffer.
        }},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
        {'tabs',

        mode = 0,
        tabs_color = {
        -- Same values as the general color option can be used here.
        active = 'lualine_a_visual',
        inactive = 'lualine_c_normal',
        },     -- Color for active buffer.
        }
        }
      },
  extensions = {}
}

END
"2}}}
" }}}
