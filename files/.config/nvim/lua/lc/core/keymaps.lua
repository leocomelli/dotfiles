vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("i", "jk", "<ESC>")

-- plugin keymaps
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>ft", "<cmd>Telescope telescope-tabs list_tabs<cr>") -- list open tabs in current neovim instance

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- git messenger
keymap.set("n", "<leader>gm", ":GitMessenger<cr>", { desc = "[G]it [M]essenger", silent = true, noremap = true })
keymap.set("n", "<leader>gdv", ":DiffviewOpen<cr>", { desc = "[G]it [D]iff [V]iew", silent = true, noremap = true })

-- cellular automation
keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

-- trouble
keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end)
keymap.set("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end)
keymap.set("n", "<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end)
keymap.set("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end)
keymap.set("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end)
keymap.set("n", "gR", function()
	require("trouble").toggle("lsp_references")
end)
