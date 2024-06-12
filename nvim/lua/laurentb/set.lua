-- Set the cursor style. An empty string means to use the terminal's default.
vim.opt.guicursor = ""

-- Enable line numbers.
vim.opt.nu = true

-- Enable relative line numbers.
vim.opt.relativenumber = true

-- Set the number of spaces that a <Tab> in the file counts for.
vim.opt.tabstop = 4

-- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
vim.opt.softtabstop = 4

-- Number of spaces to use for each step of (auto)indent. 
vim.opt.shiftwidth = 4

-- Convert tabs to spaces.
vim.opt.expandtab = true

-- Enable smart auto-indent.
vim.opt.smartindent = true

-- Disable line wrapping.
vim.opt.wrap = false

-- Disable creating a swapfile.
vim.opt.swapfile = false

-- Disable creating a backup before overwriting a file.
vim.opt.backup = false

-- Set the directory where undo files are stored.
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Enable persistent undo, which allows undoing changes after closing and reopening a file.
vim.opt.undofile = true

-- Disable highlighting of search matches.
vim.opt.hlsearch = false

-- Enable incremental search, which shows matches as you type.
vim.opt.incsearch = true

-- Enable true color support.
vim.opt.termguicolors = true

-- Keep at least 8 lines above/below the cursor when scrolling.
vim.opt.scrolloff = 8

-- Always show the signcolumn, necessary for showing things like git diff markers.
vim.opt.signcolumn = "yes"

-- Set the time in milliseconds that is waited for a mapped key sequence to complete.
vim.opt.updatetime = 50

-- Highlight the text past the 80th character.
vim.opt.colorcolumn = "80"
