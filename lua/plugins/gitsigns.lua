return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local vim = _G["vim"]

		local gitsigns_found, gitsigns = pcall(require, "gitsigns")
		if not gitsigns_found then
			vim.notify("Failed to configure git integration")
			return
		end

		gitsigns.setup({
			signcolumn = false,
			numhl = true,
			linehl = false,
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text_pos = "right_align"
			}
		})
	end
}
