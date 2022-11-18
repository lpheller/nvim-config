require("indent_blankline").setup({
	-- char = "▏",
	show_trailing_blankline_indent = false,
	show_first_indent_level = true,
	use_treesitter = true,
	show_current_context = true,
	filetype_exclude = {
		"help",
		"terminal",
		"dashboard",
		"packer",
		"lspinfo",
		"TelescopePrompt",
		"TelescopeResults",
		"alpha",
	},
	buftype_exclude = {
		"terminal",
		"NvimTree",
	},
})
