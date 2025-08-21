return {
  { -- Gruvbox colorscheme
    -- A retro groove color scheme for Vim
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'morhetz/gruvbox',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      -- Configure Gruvbox options before loading the colorscheme
      vim.g.gruvbox_contrast_dark = 'medium' -- Options: 'soft', 'medium', 'hard'
      vim.g.gruvbox_contrast_light = 'medium'
      vim.g.gruvbox_italic = 0 -- Disable italics to match your tokyonight config
      vim.g.gruvbox_bold = 1
      vim.g.gruvbox_underline = 1
      vim.g.gruvbox_undercurl = 1
      vim.g.gruvbox_invert_selection = 0

      -- Load the colorscheme here.
      -- You can switch between 'gruvbox' for dark mode or set
      -- vim.o.background = 'light' before loading for light mode
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et