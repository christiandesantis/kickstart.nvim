return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  config = function()
    require('claudecode').setup {
      diff_opts = {
        open_in_new_tab = true, -- Open diff in a new tab for full window space
        keep_terminal_focus = true, -- Keep cursor in the chat after diff opens
        layout = 'vertical', -- Keep vertical layout for better readability
      },
    }

    -- Add cleanup on Neovim exit to prevent zombie servers
    vim.api.nvim_create_autocmd('VimLeavePre', {
      callback = function()
        -- Stop Claude Code server cleanly
        local ok, claudecode = pcall(require, 'claudecode')
        if ok and claudecode.stop then
          pcall(claudecode.stop)
        end
      end,
      desc = 'Stop Claude Code server on exit',
    })
  end,
  keys = {
    { '<leader>a', nil, desc = 'AI/Claude Code' },
    { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
    { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
    { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
    { '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
    { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
    { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
    { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
    {
      '<leader>as',
      '<cmd>ClaudeCodeTreeAdd<cr>',
      desc = 'Add file',
      ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles' },
    },
    -- Diff management
    { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
    { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
  },
}
