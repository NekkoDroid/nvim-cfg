return {
	"nvim-lualine/lualine.nvim",
	requires = "kyazdani42/nvim-web-devicons",
	config = function()
		local vim = _G["vim"]

		local lualine_found, lualine = pcall(require, "lualine")
		if not lualine_found then
			vim.notify("Failed to configure statusline")
			return
		end

		lualine.setup({
			options = {
				theme = "vscode",
				globalstatus = true
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { "diagnostics" },
				lualine_x = { },
				lualine_y = { "encoding", "filetype" },
				lualine_z = { "progress", "location" },
			}
		})
	end
}
