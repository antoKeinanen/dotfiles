-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.colorscheme = "catppuccin-mocha"

lvim.plugins = {
  { "catppuccin/nvim", name = "catppuccin" },
  {
    'testaustime/testaustime.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local secrets = require("secrets");
      require('testaustime').setup({
        token = secrets.testaustime_token, -- Required
        ignored_filetypes = { "packer", "netrw", "help", "qf", "TelescopePrompt", "gitcommit", "NvimTree", "Lir" },
        editor_name = "LunarVim",
      })
    end
  }
}
