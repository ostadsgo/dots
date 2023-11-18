local telescope = require("telescope")
local builtin = require('telescope.builtin')
local keymap = vim.keymap.set
telescope.load_extension('fzf')

-- Key maps
keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fg', builtin.live_grep, {})
keymap('n', '<leader>fb', builtin.buffers, {})
keymap('n', '<leader>fd', builtin.diagnostics, {})
keymap('n', '<leader>fs', builtin.current_buffer_fuzzy_find, {})

local actions = require "telescope.actions"
local pickers_opts = {
    theme = "dropdown",
    previewer = false,
}
telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
        }
    },
    pickers = {
        find_files = pickers_opts,
        live_grep = pickers_opts,
    },
})
