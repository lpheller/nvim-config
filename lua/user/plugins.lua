local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require("packer").reset()
require("packer").init {
    compile_path = vim.fn.stdpath "data" .. "/site/plugin/packer_compiled.lua",
    display = {
        open_fn = function()
            return require("packer.util").float { border = "solid" }
        end,
    },
}

local use = require("packer").use

-- Packer can manage itself.
use "wbthomason/packer.nvim"

use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
        require("catppuccin").setup {
            flavour = "macchiato", -- latte, frappe, macchiato, mocha
        }
        vim.cmd "colorscheme catppuccin"
    end,
}

use {
    "olimorris/onedarkpro.nvim",
    config = function()
        require "user/plugins/onedarkpro"
        -- vim.cmd("colorscheme onedarkpro")
    end,
}

-- Improve startup time.
use { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }
use {
    "akinsho/toggleterm.nvim",
    commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda",
    config = function()
        require "user/plugins/toggleterm"
    end,
}
-- Commenting support.
use "tpope/vim-commentary"

-- Add, change, and delete surrounding text.
use "tpope/vim-surround"

-- Indent autodetection with editorconfig support.
use "tpope/vim-sleuth"

-- Allow plugins to enable repeating of commands.
-- use("tpope/vim-repeat")

-- Navigate seamlessly between Vim windows and Tmux panes.
use {
    "alexghergh/nvim-tmux-navigation",
    config = function()
        require "user/plugins/tmux-navigation"
    end,
}

-- Jump to the last location when opening a file.
-- This is really great!
use "farmergreg/vim-lastplace"

-- Enable * searching with visually selected text.
-- Select a word or have the courser on a word and press * to search for it.
-- use # to search backwards.
use "nelstrom/vim-visual-star-search"

-- Automatically create parent dirs when saving.
use "jessarcher/vim-heritage"

-- Text objects for HTML attributes.
use {
    "whatyouhide/vim-textobj-xmlattr",
    requires = "kana/vim-textobj-user",
}

-- Automatically set the working directory to the project root.
use {
    "airblade/vim-rooter",
    setup = function()
        -- Instead of this running every time we open a file, we'll just run it once when Vim starts.
        -- vim.g.rooter_manual_only = 1
    end,
    config = function()
        vim.cmd "Rooter"
    end,
}

-- Automatically add closing brackets, quotes, etc.
use {
    "windwp/nvim-autopairs",
    config = function()
        require "user/plugins/autopairs"
    end,
}

-- Add smooth scrolling to avoid jarring jumps
use {
    "karb94/neoscroll.nvim",
    config = function()
        require("neoscroll").setup()
    end,
}

-- All closing buffers without closing the split window.
use {
    "famiu/bufdelete.nvim",
    config = function()
        vim.keymap.set("n", "<Leader>q", ":Bdelete<CR>")
    end,
}

-- Split arrays and methods onto multiple lines, or join them back up.
use {
    "AndrewRadev/splitjoin.vim",
    config = function()
        vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
        vim.g.splitjoin_trailing_comma = 1
        vim.g.splitjoin_php_method_chain_full = 1
    end,
}

-- Automatically fix indentation when pasting code.
use {
    "sickill/vim-pasta",
    config = function()
        vim.g.pasta_disabled_filetypes = { "fugitive" }
    end,
}

-- Fuzzy finder
use {
    "nvim-telescope/telescope.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        "nvim-telescope/telescope-live-grep-args.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function()
        require "user/plugins/telescope"
    end,
}

-- File tree sidebar
use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require "user/plugins/nvim-tree"
    end,
}

-- A Status line.
use {
    "nvim-lualine/lualine.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require "user/plugins/lualine"
    end,
}

-- Display buffers as tabs.
use {
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    -- after = "onedark.nvim",
    config = function()
        require "user/plugins/bufferline"
    end,
}

-- Display indentation lines.
use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require "user/plugins/indent-blankline"
    end,
}

-- Switch between projects
use {
    "ahmedkhalf/project.nvim",
    config = function()
        require "user/plugins/project-nvim"
    end,
}

-- Git integration.
use {
    "lewis6991/gitsigns.nvim",
    config = function()
        require "user/plugins/gitsigns"
    end,
}

-- Git commands. (I don't use this anymore, but I'm keeping it here in case I want to use it again.)
use {
    "tpope/vim-fugitive",
    requires = "tpope/vim-rhubarb",
}

use {
    "tveskag/nvim-blame-line",
    config = function()
        -- while this is somehwat cool to have, it's not that different from "gb" from gitsigns
        vim.keymap.set("n", "<Leader>y", ":ToggleBlameLine<CR>") -- but Y ?
    end,
}

--- Floating terminal.
use {
    "voldikss/vim-floaterm",
    config = function()
        vim.g.floaterm_width = 0.8
        vim.g.floaterm_height = 0.8
        vim.keymap.set("n", "<F1>", ":FloatermToggle<CR>")
        vim.keymap.set("t", "<F1>", "<C-\\><C-n>:FloatermToggle<CR>")
        vim.cmd [[
      highlight link Floaterm CursorLine
      highlight link FloatermBorder CursorLineBg
    ]]
    end,
}

-- Improved syntax highlighting
use {
    "nvim-treesitter/nvim-treesitter",
    commit = "4cccb6f494eb255b32a290d37c35ca12584c74d0",
    run = function()
        require("nvim-treesitter.install").update { with_sync = true }
    end,
    requires = {
        "JoosepAlviste/nvim-ts-context-commentstring",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require "user/plugins/treesitter"
    end,
}

-- Language Server Protocol.
use {
    "neovim/nvim-lspconfig",
    requires = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "b0o/schemastore.nvim",
        "jose-elias-alvarez/null-ls.nvim",
        "jayp0521/mason-null-ls.nvim",
    },
}

require "user.lsp"

-- Completion
use {
    "hrsh7th/nvim-cmp",
    requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind-nvim",
    },
    config = function()
        require "user/plugins/cmp"
    end,
}

-- PHP Refactoring Tools
use {
    "phpactor/phpactor",
    ft = "php",
    run = "composer install --no-dev --optimize-autoloader",
    config = function()
        require "user/plugins/phpactor"
    end,
}

-- Project Configuration.
-- dont't really know if i need this
-- use({
-- 	"tpope/vim-projectionist",
-- 	requires = "tpope/vim-dispatch",
-- 	config = function()
-- 		require("user/plugins/projectionist")
-- 	end,
-- })

-- Testing helper
use {
    "vim-test/vim-test",
    config = function()
        require "user/plugins/vim-test"
    end,
}

use {
    "github/copilot.vim",
    config = function()
        -- imap <silent><script><expr> <C-C> copilot#Accept("\<CR>")
        vim.keymap.set("i", "<C-c>", "<cmd>copilot#Accept()<CR>")
        vim.g.copilot_no_tab_map = 0

        -- require("user/plugins/copilot")
    end,
}

use {
    "goolord/alpha-nvim",
    config = function()
        require "user/plugins/alpha"
    end,
}

use {
    "windwp/nvim-spectre",
    config = function()
        require "user/plugins/spectre"
    end,
}

-- use({
-- 	"folke/which-key.nvim",
-- 	config = function()
-- 		require("user/plugins/which-key")
-- 	end,
-- })

use {
    "folke/todo-comments.nvim",
    -- config = function()
    -- 	require("user/plugins/todo-comments")
    -- end,
}

use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
        require("todo-comments").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    end,
}

use { "mg979/vim-visual-multi" }

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require("packer").sync()
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    " autocmd BufWritePost plugins.lua source <afile> | PackerSync
	autocmd BufWritePost plugins.lua source <afile>
  augroup end
]]
