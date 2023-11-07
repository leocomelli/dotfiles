-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	print("failed to load mason plugin")
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	print("failed to load mason-lspconfig plugin")
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	print("failed to load mason-null-ls plugin")
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"emmet_ls",
		"tflint",
		"terraformls",
		"rust_analyzer",
		"ruby_ls",
		"rubocop",
		"helm_ls",
		"grammarly",
		"gopls",
		"elixirls",
		"dockerls",
		"docker_compose_language_service",
		"csharp_ls",
		"pyright",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
		"goimports", -- go formatter
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
