require("bufferline").setup({
	options = {
		indicator = {
			icon = " ",
		},
		show_close_icon = false,
		tab_size = 0,
		max_name_length = 25,
		offsets = {
			{
				filetype = "NvimTree",
				text = "  Files",
				highlight = "StatusLine",
				text_align = "left",
				padding = 1,
			},
		},
		separator_style = "thin",
		modified_icon = "",
		custom_areas = {
			-- left = function()
			--   return {
			--     { text = '    ', fg = '#8fff6d' },
			--   }
			-- end,
		},
	},
	highlights = {
		fill = {
			fg = { attribute = "fg", highlight = "#ff0000" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},

		background = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},

		buffer_visible = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},

		close_button = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},
		close_button_visible = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},

		tab_selected = {
			fg = { attribute = "fg", highlight = "Normal" },
			bg = { attribute = "bg", highlight = "Normal" },
		},

		tab = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},

		tab_close = {
			-- fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
			fg = { attribute = "fg", highlight = "TabLineSel" },
			bg = { attribute = "bg", highlight = "Normal" },
		},

		duplicate_selected = {
			fg = { attribute = "fg", highlight = "TabLineSel" },
			bg = { attribute = "bg", highlight = "TabLineSel" },
			italic = true,
		},

		duplicate_visible = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
			italic = true,
		},

		duplicate = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
			italic = true,
		},

		modified = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},

		modified_selected = {
			fg = { attribute = "fg", highlight = "Normal" },
			bg = { attribute = "bg", highlight = "Normal" },
		},

		modified_visible = {
			fg = { attribute = "fg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},

		separator = {
			fg = { attribute = "bg", highlight = "TabLine" },
			bg = { attribute = "bg", highlight = "TabLine" },
		},

		separator_selected = {
			fg = { attribute = "bg", highlight = "Normal" },
			bg = { attribute = "bg", highlight = "Normal" },
		},

		indicator_selected = {
			fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
			bg = { attribute = "bg", highlight = "Normal" },
		},
	},
})


-- vim.o.ls = 0
vim.o.ch = 0

-- -- Set the winbar to the statusline.
-- vim.o.wbr = "%#StatusLineNC#%=%#StatusLineInv# %f %#StatusLineNC#%="
-- vim.o.wbr = "%#StatusLineNC#%=%#StatusLineInv# %f "
-- --vim.o.wbr = vim.o.stl

-- -- With vertical splits, the statusline would still show up at the
-- -- bottom of the split. A quick fix is to just set the statusline
-- -- to empty whitespace (it can't be an empty string because then
-- -- it'll get replaced by the default stline).
-- vim.o.stl = " "

-- -- Highlight groups.
-- -- vim.cmd "highlight StatusLine    guifg=#FC56B1 guibg=#17171C"
-- -- vim.cmd "highlight StatusLineInv guifg=#17171C guibg=#FC56B1"
-- -- vim.cmd "highlight StatusLineNC  guifg=#FC56B1 guibg=#17171C"

-- -- vim.cmd "highlight TabLine      guifg=#FC56B1 guibg=#222430"
-- -- vim.cmd "highlight TabLineSel   guifg=#222430 guibg=#FC56B1"
-- -- vim.cmd "highlight TabLineFill  guifg=#FC56B1 guibg=#222430"

-- local M = {}

-- M.winbar_filetype_exclude = {
--   "help",
--   "startify",
--   "dashboard",
--   "packer",
--   "neogitstatus",
--   "neo-tree",
--   "Trouble",
--   "alpha",
--   "lir",
--   "Outline",
--   "spectre_panel",
--   "toggleterm",
--   "NvimTree"
-- }

-- local get_filename = function()
--   local filename = vim.fn.expand("%:t")
--   local extension = vim.fn.expand("%:e")
--   local f = require("utils")

--   if not f.isempty(filename) then
--     local file_icon, file_icon_color =
--       require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })

--     local hl_group = "FileIconColor" .. extension

--     vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
--     if f.isempty(file_icon) then
--       file_icon = ""
--       file_icon_color = ""
--     end

--     return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#LineNr#" .. filename .. "%*"
--   end
-- end

-- local get_gps = function()
--   local status_gps_ok, gps = pcall(require, "nvim-navic")
--   if not status_gps_ok then return "" end

--   local status_ok, gps_location = pcall(gps.get_location, {})
--   if not status_ok then return "" end

--   if not gps.is_available() or gps_location == "error" then return "" end

--   if not require("utils").isempty(gps_location) then
--     return require("config.icons").ui.ChevronRight .. " " .. gps_location
--   else
--     return ""
--   end
-- end

-- local excludes = function()
--   if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
--     vim.opt_local.winbar = nil
--     return true
--   end
--   return false
-- end

-- M.get_winbar = function()
--   if excludes() then return end
--   local f = require("utils")
--   local value = get_filename()

--   local gps_added = false
--   if not f.isempty(value) then
--     local gps_value = get_gps()
--     value = value .. " " .. gps_value
--     if not f.isempty(gps_value) then gps_added = true end
--   end

--   if not f.isempty(value) and f.get_buf_option("mod") then
--     local mod = "%#LineNr#" .. require("config.icons").ui.Circle .. "%*"
--     if gps_added then
--       value = value .. " " .. mod
--     else
--       value = value .. mod
--     end
--   end

--   local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
--   if not status_ok then return end
-- end

-- return M