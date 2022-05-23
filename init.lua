local vim = _G["vim"]

--[[
	███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
	██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
	███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
	╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
	███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
	╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
]] --

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Linenumbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Indentation
vim.opt.expandtab = false
vim.opt.smarttab = true

vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- Highlighting
vim.opt.syntax = "on"
vim.opt.showmatch = true

-- Wrapping
vim.opt.wrap = false

-- Splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Cursorline
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

-- Edge padding
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 10

-- Sidegutter
vim.opt.numberwidth = 6
vim.opt.signcolumn = "yes:1"

-- Characters
vim.opt.list = true
vim.opt.listchars = {
	space = "·",
	tab = "→ "
}

-- Popupmenu
vim.opt.pumblend = 10
vim.opt.pumwidth = 30
vim.opt.pumheight = 15

-- Miscellaneous
vim.opt.mouse = "nvi"
vim.opt.completeopt = {
	"menuone",
	"noinsert",
	"noselect"
}

vim.opt.showmode = false
vim.opt.termguicolors = true

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = false

-- Variables
vim.g.mapleader = " "

--[[
	██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
	██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║██╔════╝
	██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║███████╗
	██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║╚════██║
	██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║███████║
	╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝
]]--

-- Bootstrap the package manager
local packer_root = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.isdirectory(packer_root) == 0 then
	vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", packer_root })
	vim.cmd("packadd packer.nvim")
end

local packer_found, packer = pcall(require, "packer")
if not packer_found then
	vim.notify("Failed to load the package manager")
	return
end

packer.init({
	disable_commands = true,
	display = {
		non_interactive = true
	}
})

packer.startup(function(use)
	-- Autoupdate package manager
	use("wbthomason/packer.nvim")

	-- Notifications
	use(require("plugins.notify"))

	-- Interface
	use(require("ui.colorscheme"))
	use(require("ui.highlighting"))
	use(require("ui.statusline"))
	use(require("ui.bufferline"))

	-- Completion
	use(require("lsp.completion"))
	use(require("lsp.configure"))

	-- Autoparens
	use(require("plugins.autopairs"))
	use(require("plugins.autotags"))

	-- Other
	use(require("plugins.gitsigns"))
	use(require("plugins.editorconfig"))

	if vim.fn.filereadable(packer.config.compile_path) == 0 then
		packer.sync()
	end
end)

--[[
	██╗  ██╗███████╗██╗   ██╗██████╗ ██╗███╗   ██╗██████╗ ███████╗
	██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔══██╗██║████╗  ██║██╔══██╗██╔════╝
	█████╔╝ █████╗   ╚████╔╝ ██████╔╝██║██╔██╗ ██║██║  ██║███████╗
	██╔═██╗ ██╔══╝    ╚██╔╝  ██╔══██╗██║██║╚██╗██║██║  ██║╚════██║
	██║  ██╗███████╗   ██║   ██████╔╝██║██║ ╚████║██████╔╝███████║
	╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝
]]--
