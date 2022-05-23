return {
	"windwp/nvim-ts-autotag",
	config = function()
		local vim = _G["vim"]

		local autotag_found, autotag = pcall(require, "nvim-ts-autotag")
		if not autotag_found then
			vim.notify("Failed to configure autotags")
			return
		end

		autotag.setup({})
	end
}
