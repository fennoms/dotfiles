-- Change this file to change the color scheme of nvim
-- note: I use darkman in order to automatically switch
-- from light to dark theme.
--
-- Note: Considering I use i3 WM and Arch linux, some changes have to be made
-- in order to make the light/dark mode switching actually work.
-- Credits to: https://www.reddit.com/r/archlinux/comments/17bkz58/dark_mode_darkman_and_xdgdesktopportal_driving_me/
--
-- Add to ~/.config/xdg-desktop-portal/portals.conf:
-- [preferred]
-- default=gtk
-- org.freedesktop.impl.portal.Settings=darkman
--
-- Add to ~/.config/systemd/user/xdg-desktop-portal.service.d/override.conf:
-- [Service]
-- Environment="XDG_CURRENT_DESKTOP=GNOME"
return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.opt.termguicolors = true
		vim.cmd("colorscheme gruvbox") -- This line must be after all setups
	end,
}
