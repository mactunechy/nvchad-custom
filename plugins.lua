local plugins = {
  { "prisma/vim-prisma", ft = { "prisma" } },
  { "tpope/vim-rails",   ft = { "ruby" } },
  { "preservim/vimux",   event = 'VeryLazy' }, -- send test command in tmux pane
  { "github/copilot.vim" },
  {
    "mactunechy/rails-view-component-gd.nvim",
    ft = { 'slim', 'erb', 'rb' },
    keys = {
      { "<leader>gd", "<cmd>OpenViewComponentClass <CR>",    desc = "ViewComponent Class" },
      { "<leader>gk", "<cmd>OpenViewComponentTemplate <CR>", desc = "ViewComponent Template" },
      { "<leader>gs", "<cmd>OpenViewComponentSpec <CR>",     desc = "ViewComponent Spec" },
      { "<leader>gv", "<cmd>ToggleViewComponent <CR>",       desc = "Toggle ViewComponent ClassAndTemplate" },
    },
    config = function()
      require('rails-view-component-gd').setup()
    end
  },
  -- {
  --   'VonHeikemen/fine-cmdline.nvim',
  --   dependencies = { 'MunifTanjim/nui.nvim' },
  --   lazy = false,
  --   config = function ()
  --     vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
  --   end
  -- },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    "vim-test/vim-test",
    event = 'VeryLazy',
    keys = {
      { '<leader>tt', '<cmd>TestNearest -strategy=neovim<CR>', desc = "Test Nearest" },
      { '<leader>tl', '<cmd>TestLast -strategy=neovim<CR>',    desc = "Test Last" },
      { '<leader>tf', '<cmd>TestFile -strategy=neovim<CR>',    desc = "Test File" },
      { '<leader>ts', '<cmd>TestSuite -strategy=neovim<CR>',   desc = "Test Suite" },
    },
    config = function()
      vim.cmd([[ let test#ruby#rspec#executable = 'spring rspec' ]])
    end
  },
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "TroubleToggle",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "max397574/better-escape.nvim",
    lazy = false,
    config = function()
      require("better_escape").setup {
        mapping = { "jj" }, -- a table with mappings to use
        timeout = 200,      -- the time in which the keys must be hit in ms. clear_empty_lines = false, keys = '<ESC>', -- keys used for escaping
      }
    end
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
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
        "rubocop",
        "lua-language-server"
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
    config = function()
      require("auto-session").setup({
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
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
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  }
}
return plugins
