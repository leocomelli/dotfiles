-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	print("failed to load null-ls plugin")
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		formatting.stylua,
		formatting.eslint_d,
		formatting.eslint,
		formatting.black,
		formatting.shfmt,
		formatting.goimports,
		formatting.gofmt,
		formatting.rustfmt,
		formatting.lua_format,
		formatting.prettier,
		formatting.terraform_fmt.with({
			filetypes = { "terraform", "tf", "hcl" },
		}),
		formatting.prettier.with({
			filetypes = { "json", "yaml", "markdown" },
		}),
		diagnostics.eslint_d.with({ -- js/ts linter
			-- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
			end,
		}),
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
