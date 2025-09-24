return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  priority = 1500, -- Load before lualine (which has priority 1000)
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    -- Ensure signs exist right before nvim-tree setup
    local function ensure_signs_exist()
      local signs = {
        { name = 'NvimTreeDiagnosticErrorIcon', text = '●', hl = 'ErrorMsg' },
        { name = 'NvimTreeDiagnosticWarnIcon', text = '●', hl = 'WarningMsg' },
        { name = 'NvimTreeDiagnosticInfoIcon', text = '●', hl = 'Directory' },
        { name = 'NvimTreeDiagnosticHintIcon', text = '●', hl = 'Comment' },
      }

      for _, sign in ipairs(signs) do
        -- Force redefine the sign
        pcall(vim.fn.sign_undefine, sign.name)
        vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.hl })
      end
    end

    -- Ensure signs exist before setup
    ensure_signs_exist()

    require('nvim-tree').setup {
      -- Auto-sync with current buffer
      update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
      },
      -- Show relative paths
      view = {
        relativenumber = false,
        number = false,
        width = 30,
      },
      renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = "name",
        root_folder_label = ":~:s?$?/..?",
        indent_markers = {
          enable = false,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            none = " ",
          },
        },
        icons = {
          webdev_colors = true,
          git_placement = "before",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      -- Enable diagnostics to show file errors/warnings in tree
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        debounce_delay = 50,
        icons = {
          hint = '●',
          info = '●',
          warning = '●',
          error = '●',
        },
      },
      filters = {
        dotfiles = false,
        custom = { "^.git$" },
      },
      git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        timeout = 400,
      },
    }
  end,
}
