return {
	"rcarriga/nvim-notify",
	config = function()
		local vim = _G["vim"]

		local notify_found, notify = pcall(require, "notify")
		if not notify_found then
			vim.notify("Failed to configure notifications")
			return
		end

		notify.setup({
			stages = "fade",
			timeout = 3000
		})

		-- Override default vim notifications
		vim.notify = notify
	end
}
