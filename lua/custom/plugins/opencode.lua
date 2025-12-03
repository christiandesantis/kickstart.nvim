return {
  "sudo-tee/opencode.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        anti_conceal = { enabled = false },
        file_types = { 'markdown', 'opencode_output' },
      },
      ft = { 'markdown', 'Avante', 'copilot-chat', 'opencode_output' },
    },
    -- Optional, for file mentions and commands completion
    'saghen/blink.cmp',
    -- Optional, for file mentions picker
    'folke/snacks.nvim',
  },
  config = function()
    require("opencode").setup({
      preferred_picker = 'snacks',
      preferred_completion = 'blink',
      default_mode = 'build',

      -- Configure keybindings using OpenCode's keymap system
      keymap = {
        editor = {
          -- Main interface controls (using <leader>a + letter)
          ['<leader>ao'] = { 'toggle', desc = 'Toggle OpenCode' },
          ['<leader>ai'] = { 'open_input', desc = 'OpenCode Input' },
          ['<leader>ap'] = { 'open_output', desc = 'OpenCode Output Panel' },
          ['<leader>af'] = { 'toggle_focus', desc = 'Toggle OpenCode Focus' },
          ['<leader>aq'] = { 'close', desc = 'Close OpenCode' },

          -- Session management
          ['<leader>aO'] = { 'open_input_new_session', desc = 'OpenCode New Session' },
          ['<leader>as'] = { 'select_session', desc = 'OpenCode Select Session' },
          ['<leader>av'] = { 'configure_provider', desc = 'OpenCode Configure Provider' },

          -- Diff management
          ['<leader>ad'] = { 'diff_open', desc = 'OpenCode View Diffs' },
          ['<leader>dn'] = { 'diff_next', desc = 'OpenCode Next Diff' },
          ['<leader>dp'] = { 'diff_prev', desc = 'OpenCode Prev Diff' },
          ['<leader>dq'] = { 'diff_close', desc = 'OpenCode Close Diff' },
          ['<leader>aA'] = { 'diff_revert_all_last_prompt', desc = 'OpenCode Revert All' },
          ['<leader>ar'] = { 'diff_revert_this_last_prompt', desc = 'OpenCode Revert This' },
        },

        input_window = {
          -- Submit and control
          ['<cr>'] = { 'submit_input_prompt', mode = { 'n', 'i' } },
          ['<C-c>'] = { 'cancel' },
          ['<esc>'] = { 'close' },

          -- Mentions and context (insert mode)
          ['~'] = { 'mention_file', mode = 'i' },
          ['@'] = { 'mention', mode = 'i' },
          ['/'] = { 'slash_commands', mode = 'i' },
          ['#'] = { 'context_items', mode = 'i' },

          -- History navigation
          ['<C-p>'] = { 'prev_prompt_history', mode = 'i' },
          ['<C-n>'] = { 'next_prompt_history', mode = 'i' },
        },

        output_window = {
          ['<esc>'] = { 'close' },
          ['<C-c>'] = { 'cancel' },
          [']]'] = { 'next_message' },
          ['[['] = { 'prev_message' },
        },
      },

      ui = {
        position = 'right',
        window_width = 0.40,
      },
    })
  end,
}
