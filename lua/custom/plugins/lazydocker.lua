return {
  -- Lazydocker integration plugin - Docker management TUI
  'crnvl96/lazydocker.nvim',
  lazy = true,
  config = function()
    require('lazydocker').setup({
      window = {
        settings = {
          width = 0.8,   -- 80% of editor width
          height = 0.8,  -- 80% of editor height
          border = 'rounded',
          relative = 'editor'
        }
      }
    })
  end,
  -- setting the keybinding for LazyDocker with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    {
      '<leader>ld',
      "<Cmd>lua require('lazydocker').toggle({ engine = 'docker' })<CR>",
      desc = 'LazyDocker (docker)'
    },
  },
}