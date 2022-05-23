"" Configuration file for nvim GUIs ""
""""""""""""""""""""""""""""""""""""""

" Set Font Options
if exists(':GuiFont')
	GuiFont! SauceCodePro NF:h17:sb
endif

" Disable Font Linespace
if exists(':GuiLinespace')
	GuiLinespace 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
	GuiPopupmenu 0
endif

" Disable GUI Scrollbar
if exists(':GuiScrollbar')
	GuiScrollbar 0
endif

" Disable GUI Tabline
if exists(':GuiTabline')
	GuiTabline 0
endif
