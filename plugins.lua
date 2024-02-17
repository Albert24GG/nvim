local overrides = require("custom.configs.overrides")

return {

	{
		"neovim/nvim-lspconfig",
    dependencies = {
      "RRethy/vim-illuminate",
    },
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lsp")
		end, -- Override to setup mason-lspconfig
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		virtual_text = true,
		opts = {},
	},

	{
		"mfussenegger/nvim-lint",
    dependencies = {
      "folke/trouble.nvim",
    },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("custom.configs.lsp.nvim-lint")
		end,
	},

	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("custom.configs.lsp.conform")
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
		"nvim-telescope/telescope.nvim",
		opts = overrides.telescope,
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			lazy = false,
			config = function()
				require("telescope").load_extension("fzf")
				require("telescope").load_extension("ui-select")
			end,
		},
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
			require("custom.configs.betterescape")
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup()
		end,
		requires = { "mfussenegger/nvim-dap" },
	},

	{
		"mfussenegger/nvim-dap",
		config = function()
			require("custom.configs.dap")
		end,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		requires = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			-- handlers = {},
			automatic_installation = {
				exclude = { "cppdbg" },
			},
		},
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
		requires = { "mfussenegger/nvim-dap" },
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
		"github/copilot.vim",
		lazy = false,
		config = function()
			-- Mapping tab is already used by NvChad
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
			--vim.g.copilot_tab_fallback = ""
			-- The mapping is set to other key, see custom/lua/mappings
			-- or run <leader>ch to see copilot mapping section
		end,
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
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate")
		end,
	},

	{
		"tpope/vim-fugitive",
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
}
