return {
	"hrsh7th/nvim-cmp",
	requires = {
		"hrsh7th/vim-vsnip",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-path",
		"onsails/lspkind-nvim"
	},
	config = function()
		local vim = _G["vim"]

		local cmp_found, cmp = pcall(require, "cmp")
		if not cmp_found then
			vim.notify("Failed to configure completion")
			return
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered()
			},
			mapping = {
				["<C-Up>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), {
					"i",
					"c"
				}),
				["<C-Down>"] = cmp.mapping(cmp.mapping.scroll_docs(1), {
					"i",
					"c"
				}),
				["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), {
					"i",
					"c"
				}),
				["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), {
					"i",
					"c"
				}),
				["<CR>"] = cmp.mapping.confirm({
					select = true,
				}),
				["<Esc>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				})
			},
			sources = {
				{ name = "vsnip" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "path" }
			},
			formatting = {
				format = require("lspkind").cmp_format()
			}
		})
	end
}
