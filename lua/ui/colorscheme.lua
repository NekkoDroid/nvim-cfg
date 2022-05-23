return {
	"mofiqul/vscode.nvim",
	config = function()
		local vim = _G["vim"]

		vim.g.vscode_style = "dark"
		vim.g.vscode_transparent = false
		vim.g.vscode_italic_comment = false

		if not pcall(vim.cmd, "colorscheme vscode") then
			vim.notify("Failed to configure colorscheme")
			return
		end
	end
}
