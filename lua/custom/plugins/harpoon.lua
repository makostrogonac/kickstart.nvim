return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    opts = {},
    config = function()
      require('harpoon'):setup()
    end,
    keys = function()
      local harpoon = require 'harpoon'

      -- telescope integration
      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      return {
        {
          '<leader>a',
          function()
            harpoon:list():add()
          end,
          desc = 'Harpoon add file',
        },
        {
          '<C-e>',
          function()
            toggle_telescope(harpoon:list())
          end,
          desc = 'Harpoon telescope menu',
        },

        {
          '<C-h>',
          function()
            harpoon:list():select(1)
          end,
          desc = 'Harpoon select 1',
        },
        {
          '<C-t>',
          function()
            harpoon:list():select(2)
          end,
          desc = 'Harpoon select 2',
        },
        {
          '<C-n>',
          function()
            harpoon:list():select(3)
          end,
          desc = 'Harpoon select 3',
        },
        {
          '<C-s>',
          function()
            harpoon:list():select(4)
          end,
          desc = 'Harpoon select 4',
        },

        {
          '<C-S-P>',
          function()
            harpoon:list():prev()
          end,
          desc = 'Harpoon prev buffer',
        },
        {
          '<C-S-N>',
          function()
            harpoon:list():next()
          end,
          desc = 'Harpoon next buffer',
        },
      }
    end,
  },
}
