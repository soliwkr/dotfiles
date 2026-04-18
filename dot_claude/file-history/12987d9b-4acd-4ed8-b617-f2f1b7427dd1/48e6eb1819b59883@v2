-- Essential plugins for lazy god devops workflow

return {
  -- fzf-lua - Fast fuzzy finder (faster than telescope)
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")
      vim.keymap.set("n", "<leader>ff", fzf.files, { noremap = true })
      vim.keymap.set("n", "<leader>fw", fzf.live_grep, { noremap = true })
      vim.keymap.set("n", "<leader>fb", fzf.buffers, { noremap = true })
      vim.keymap.set("n", "<leader>fr", fzf.resume, { noremap = true })
      vim.keymap.set("n", "<leader>fh", fzf.help_tags, { noremap = true })
      vim.keymap.set("n", "<leader>fc", fzf.commands, { noremap = true })
    end,
  },

  -- Harpoon - Quick file navigation (god mode)
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { noremap = true })
      vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { noremap = true })
      vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { noremap = true })
      vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { noremap = true })
      vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { noremap = true })
      vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { noremap = true })
    end,
  },

  -- Trouble - Diagnostics list
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { noremap = true })
      vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { noremap = true })
      vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { noremap = true })
    end,
  },

  -- vim-fugitive - Git integration
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
  },

  -- vim-surround - Quoting/parenthesizing
  {
    "tpope/vim-surround",
  },

  -- Noice - Command line UI
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_list"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
        },
      })
    end,
  },

  -- Copilot integration (optional, lazy load)
  {
    "github/copilot.vim",
    lazy = true,
    event = "InsertEnter",
  },
}
