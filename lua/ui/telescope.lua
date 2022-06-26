return {
	"nvim-telescope/telescope.nvim",
	requires = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-fzy-native.nvim",
		"kdheepak/lazygit.nvim"
	},
	config = function()
		local vim = _G["vim"]

		local telescope_found, telescope = pcall(require, "telescope")
		if not telescope_found then
			vim.notify("Failed to configure telescope")
			return
		end

		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<esc>"] = actions.close
					}
				}
			},
			extensions = {
				file_browser = {
					grouped = true,
					hidden = true,
					hijack_netrw = true
				},
				fzy_native = {
					override_generic_sorter = true,
					override_file_sorter = true
				}
			}
		})

		telescope.load_extension("file_browser")
		telescope.load_extension("fzy_native")
		telescope.load_extension("lazygit")
	end
}
