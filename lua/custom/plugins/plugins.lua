return {
  {-- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
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
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {'nvim-tree/nvim-web-devicons'},
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      }
    }
  },
  -- { 'folke/which-key.nvim', opts = {} },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        window = {
          border = "single", -- none, single, double, shadow
          position = "bottom", -- bottom, top
          margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
          padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
          winblend = 0,
        },
        layout = {
          height = { min = 4, max = 25 }, -- min and max height of the columns
          width = { min = 20, max = 50 }, -- min and max width of the columns
          spacing = 3, -- spacing between columns
          align = "left", -- align columns left, center or right
        },
        mappings = {
          -- [";"] = { "<cmd>Alpha<CR>", "Dashboard" },
          -- ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
          -- ["f"] = {
          --   function()
          --     require("lvim.core.telescope.custom-finders").find_project_files { previewer = false }
          --   end,
          --   "Find File",
          -- },
          ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
          b = {
            name = "Buffers",
            j = { "<cmd>BufferLinePick<cr>", "Jump" },
            f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
            b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
            n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
            e = {
              "<cmd>BufferLinePickClose<cr>",
              "Pick which buffer to close",
            },
            h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
            l = {
              "<cmd>BufferLineCloseRight<cr>",
              "Close all to the right",
            },
            D = {
              "<cmd>BufferLineSortByDirectory<cr>",
              "Sort by directory",
            },
            L = {
              "<cmd>BufferLineSortByExtension<cr>",
              "Sort by language",
            },
          },
        }
      }
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async'
  },
  {'akinsho/bufferline.nvim', version="*", dependencies="nvim-tree/nvim-web-devicons"}
}
