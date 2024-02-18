local overrides = require "custom.configs.overrides"

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "RRethy/vim-illuminate",
      "github/copilot.vim",
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lsp"
    end, -- Override to setup mason-lspconfig
  },

  {
    "mfussenegger/nvim-lint",
    dependencies = {
      "folke/trouble.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "custom.configs.lsp.nvim-lint"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "custom.configs.lsp.conform"
    end,
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

  "nvim-telescope/telescope-ui-select.nvim",

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
    lazy = false,
  },

  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      require("telescope").setup()
      require("telescope").load_extension "fzf"
      require("telescope").load_extension "ui-select"
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },

  -- Additional plugins

  -- escape using key combo (currently set to jk)
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require "custom.configs.betterescape"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
    },
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      automatic_installation = {
        exclude = { "cppdbg" },
      },
    },
  },

  -- better bdelete, close buffers without closing windows
  {
    "ojroques/nvim-bufdel",
    lazy = false,
  },

  {
    "nvim-lua/plenary.nvim",
  },

  {
    "vimwiki/vimwiki",
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = overrides.noice,
    config = function()
      require("noice").setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git" },
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "RRethy/vim-illuminate",
    config = function()
      require "illuminate"
    end,
  },

  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    virtual_text = true,
    opts = {},
  },
}
