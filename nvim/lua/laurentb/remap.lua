-- the leader is the space to type before most of the commands just because
vim.g.mapleader = " "

-- going back to the tree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- great to select and move up or down lines of text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- J will take the line below and append it to your current line keeping the cursor at the beginning
vim.keymap.set("n", "J", "mzJ`z")

-- these two keep the current position of the cursor in the page when doing C-u and C-d (move down and move up)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- similar to the above, allows search term to stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- leader p - dont loose your paste buffer when pasting
vim.keymap.set("x", "<leader>p", [["_dP]])

-- leader y copies to the system clipboard 
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Q is Ex mode, a line-oriented command mode which is less used  
vim.keymap.set("n", "Q", "<nop>")

-- move between repos! but in tmux only
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quick Fix list commands 
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- leader s to replace the word I was on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- leader x to make the file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/laurentb/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
vim.keymap.set("n", "<leader>gl", "<cmd>CellularAutomaton game_of_life<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

