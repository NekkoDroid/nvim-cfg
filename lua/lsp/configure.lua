return {
	"junnplus/nvim-lsp-setup",
	requires = {
		"neovim/nvim-lspconfig",
		"williamboman/nvim-lsp-installer"
	},
	config = function()
		local vim = _G["vim"]

		local lsp_setup_found, lsp_setup = pcall(require, "nvim-lsp-setup")
		if not lsp_setup_found then
			vim.notify("Failed to configure language servers")
			return
		end

		lsp_setup.setup({
			default_mappings = false,
			mappings = {
			},
			capabilities = vim.lsp.protocol.make_client_capabilities(),
			servers = {
			}
		})
	end
}
