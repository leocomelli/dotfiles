vim.opt.list = true

-- import indent_blankline plugin safely
local setup, blankline = pcall(require, "ibl")
if not setup then
	return
end

blankline.setup({
	indent = { char = "┊" },
})
