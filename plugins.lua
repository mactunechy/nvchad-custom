local plugins = {
  { "prisma/vim-prisma", ft = { "prisma" } },
  { "tpope/vim-rails",   ft = { "ruby" } },
  {"github/copilot.vim", lazy = false },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "prettierd",
        "tailwindcss-language-server",
        "typescript-language-server",
        "prisma-language-server",
        "solargraph",
        "rubocop"
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "ruby"
      }
      return opts
    end,
  },
  {
    "nathom/filetype.nvim",
    lazy = false,
    config = function()
      require("filetype").setup({
        overrides = {
          extensions = {
            slim = "slim"
          }
        }
      })
    end
  },
  {
    "slim-template/vim-slim",
    ft = "slim",
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function ()
      require("auto-session").setup({
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
        session_lens = {
          buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
      })
      vim.keymap.set("n", "<leader>as", require("auto-session.session-lens").search_session, {
        noremap = true,
      })
    end
  },
  {
    "almo7aya/openingh.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>og", "<cmd>OpenInGHFileLines<cr>", desc = "Open in Github" },
    },
  },
}
return plugins
