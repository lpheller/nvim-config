require("nvim-tree").setup({
	git = {
		ignore = false,
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	view = {		
		width = 45,
		side = "left",	
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	renderer = {
	  group_empty = true, -- collapse empty folders like on github
	  icons = {
	    show = {
	      folder_arrow = false, -- hide folder arrow
	    },
		glyphs = {
			default = "",
			symlink = "",
			folder = {
				arrow_open = "",
				arrow_closed = "",
				default = "",
				open = "",
				empty = "",
				empty_open = "",
				symlink = "",
				symlink_open = "",
			},
			git = {
				unstaged = "",
				staged = "S",
				unmerged = "",
				renamed = "➜",
				untracked = "U",
				deleted = "",
				ignored = "◌",
			},
		}
	  },
	  indent_markers = {
	    enable = true, -- show indent line markers when folders are open
	  },
	},
})

vim.keymap.set("n", "<Leader>e", ":NvimTreeFindFileToggle<CR>", { silent = true })
