local v = require("utils")

v.opt.encoding = "UTF-8"

-- set leader to <space>
vim.g.mapleader = " "

-- Required for operations modifying multiple buffers like rename.
v.opt.hidden = true

-- mouse disable
v.opt.mouse = ""

-- turn on syntax highlighting
v.cmd.syntax("on")


v.opt.shell="/bin/zsh"                        -- Setting shell to zsh
v.opt.number = true                           -- Line numbers on
v.opt.showmode = true                         -- Always show mode
v.opt.textwidth=120                           -- Text width is 120 characters
v.opt.cmdheight=1                             -- Command line height
v.opt.pumheight=10                            -- Completion window max size
v.opt.timeoutlen=300                          -- ESC timeout
v.opt.hidden = true                           -- Enables to switch between unsaved buffers and keep undo history
v.opt.clipboard = v.opt.clipboard .. "unnamed"                      -- Allow to use system clipboard
v.opt.lazyredraw = true                              -- Don't redraw while executing macros (better performance)
v.opt.showmatch = true                               -- Show matching brackets when text indicator is over them
v.opt.matchtime = 2                             -- How many tenths of a second to blink when matching brackets
v.opt.virtualedit = "block"                       -- To be able to select past EOL in visual block mode
v.opt.scrolloff= 5                             -- Scroll when closing to top or bottom of the screen
v.opt.updatetime= 1000                         -- Update time used to create swap file or other things
v.opt.cursorline = true
v.opt.cursorcolumn = true

-- incremental subnstitute + preview
v.opt.inccommand = "split"


v.opt.termguicolors = true
v.v.g.t_Co = 256 -- Support 256 colors
vim.cmd("colorscheme base16-material")


-- indentation
v.opt.autoindent = true
v.opt.smartindent = true
v.opt.smarttab = true
v.opt.shiftwidth=4
v.opt.softtabstop=4
v.opt.tabstop=4
v.opt.expandtab = true

--Wrap lines at convenient points
v.opt.linebreak = true

-- enable window title
v.opt.title = true

-- Set completeopt to have a better completion experience
v.opt.completeopt = "menuone,noinsert,noselect"

-- give more space displaying messages in the command line
v.opt.cmdheight = 2

-- Avoid showing message extra message when using completion
v.opt.shortmess = v.opt.shortmess .. "c"

v.opt.signcolumn = "yes:2"

v.opt.updatetime = 100

-- spell checking dictionaries, enable/disable with: set [no]spell
v.opt.spelllang = { "en_us" }

-- Persistent undo
v.opt.undofile = true

-- SWAP
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wb = false

-- SCROLLING
vim.opt.scrolloff=8         --Start scrolling when we're 8 lines away from margins
vim.opt.sidescrolloff=15
vim.opt.sidescroll=1

-- ================ Search ===========================

vim.opt.incsearch = true       -- Find the next match as we type the search
vim.opt.hlsearch = false
vim.opt.ignorecase = true      -- Ignore case when searching...
vim.opt.smartcase = true       -- ...unless we type a capital
