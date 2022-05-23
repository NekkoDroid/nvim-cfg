return {
	"windwp/nvim-autopairs",
	config = function()
		local vim = _G["vim"]

		local autopairs_found, autopairs = pcall(require, "nvim-autopairs")
		if not autopairs_found then
			vim.notify("Failed to configure autopairs")
			return
		end

		autopairs.setup({})
	end
}
