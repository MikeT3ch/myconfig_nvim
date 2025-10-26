return {
  --
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        window = {
          border = "single",        -- none, single, double, shadow
          position = "bottom",      -- bottom, top
          margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
          padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
          winblend = 0,
        },
        layout = {
          height = { min = 4, max = 25 }, -- min and max height of the columns
          width = { min = 20, max = 50 }, -- min and max width of the columns
          spacing = 3,                    -- spacing between columns
          align = "left",                 -- align columns left, center or right
        },
      }
    end
  },
  -- Git related plugins
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' },

  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
    config = function()
      local hl_name_list = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterBlue',
        'RainbowDelimiterCyan',
        'RainbowDelimiterViolet',
      }
      require('ibl').setup({
        scope = {
          enabled = true,
          show_start = false,
          highlight = hl_name_list
        }
      })
      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },

  {
    'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
    config = function()
      local colors = {
        Red = '#EF6D6D',
        Orange = '#FFA645',
        Yellow = '#EDEF56',
        Green = '#6AEF6F',
        Cyan = '#78E6EF',
        Blue = '#70A4FF',
        Violet = '#BDB2EF',
      }
      require('core.themepy').set_rainbow_colors('RainbowDelimiter', colors) -- just a helper function that sets the highlights with the given prefix
      local rainbow_delimiters = require('rainbow-delimiters')

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterBlue',
          'RainbowDelimiterCyan',
          'RainbowDelimiterViolet',
        },
      }
    end
  },

  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    'kevinhwang91/nvim-ufo',
    dependencies = { "kevinhwang91/promise-async" },
  },

  {
    'echasnovski/mini.pairs',
    event = "VeryLazy",
    lazy = true,
    version = false,
    config = function()
      require('mini.pairs').setup()
    end,
  },

  {
    "folke/flash.nvim",
    lazy = true,
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },

  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
    }
  },
  {
    "OlegGulevskyy/better-ts-errors.nvim",
    event = "VeryLazy",
    lazy = true,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      keymap = "<leader>dd"
    }
  },
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    lazy = true,
    event = "VeryLazy"
  },

  { "wuelnerdotexe/vim-astro" },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "echasnovski/mini.icons",
    version = false
  },
  {
    'nvim-java/nvim-java'
  },
  {
    "Myzel394/easytables.nvim",
    config = function()
      require("easytables").setup {}
    end,
  },

  {
    'jakemason/ouroboros',
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup {}
    end,
  },
}
