vim.opt.list = true

-- import indent_blankline plugin safely
local setup, blankline = pcall(require, "indent_blankline")
if not setup then
	return
end

blankline.setup({
	space_char_blankline = " ",
	char = "┊",
	show_trailing_blankline_indent = false,
	show_end_of_line = true,
})
