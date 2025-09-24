return {
  'nvim-lualine/lualine.nvim',
  event = 'UIEnter',
  priority = 1000,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'SmiteshP/nvim-navic',
  },
  config = function()
    local navic = require('nvim-navic')

    require('lualine').setup {
      options = {
        theme = 'nightfly',
        globalstatus = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      winbar = {
        lualine_a = {
          { 'filetype', icon_only = true },
          { 'filename',
            path = 1, -- Show relative path from cwd
            file_status = true,
            newfile_status = false,
            shorting_target = 40,
            symbols = {
              modified = '[+]',
              readonly = '[-]',
              unnamed = '[No Name]',
              newfile = '[New]',
            }
          },
        },
        lualine_b = {},
        lualine_c = {
          {
            function()
              return navic.get_location()
            end,
            cond = function()
              return navic.is_available()
            end
          }
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      inactive_winbar = {
        lualine_a = {
          { 'filetype', icon_only = true },
          { 'filename',
            path = 0, -- Show just filename for inactive windows
            file_status = true,
            symbols = {
              modified = '[+]',
              readonly = '[-]',
              unnamed = '[No Name]',
              newfile = '[New]',
            }
          },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
    }
  end,
}
