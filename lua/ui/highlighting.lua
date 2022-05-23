return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = function()
		local vim = _G["vim"]

		local treesitter_found, treesitter = pcall(require, "nvim-treesitter.configs")
		if not treesitter_found then
			vim.notify("Failed to configure syntax highlighting")
			return
		end

		treesitter.setup({
			ensure_installed = "all",
			highlight = {
				enable = true
			}
		})
	end
}
