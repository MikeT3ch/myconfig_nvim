return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    {
      'williamboman/mason.nvim',
      config = true
    },
    -- 'nvim-java/nvim-java',
    'williamboman/mason-lspconfig.nvim',

    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`

    {
      'j-hui/fidget.nvim',
      tag = 'legacy',
      opts = {}
    },

    'folke/neodev.nvim',

  },
}
