local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", { noremap = true, silent = true })
keymap("n", "<C-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", { noremap = true, silent = true })
keymap("n", "<C-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", { noremap = true, silent = true })
keymap(
    "n",
    "<C-l>",
    ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>",
    { noremap = true, silent = true }
)
-- keymap("n", "<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", {noremap = true, silent = true})
keymap(
    "n",
    "<C-Space>",
    ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>",
    { noremap = true, silent = true }
)
