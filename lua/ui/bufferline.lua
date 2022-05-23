return {
	"akinsho/bufferline.nvim",
	requires = "kyazdani42/nvim-web-devicons",
	config = function()
		local vim = _G["vim"]

		local bufferline_found, bufferline = pcall(require, "bufferline")
		if not bufferline_found then
			vim.notify("Failed to configure bufferline")
			return
		end

		bufferline.setup({
			options = {
				show_close_icon = false,
				separator_style = "thick"
			}
		})
	end
}
