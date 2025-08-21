# Neovim Configuration Notes

## Overview
This is a Kickstart.nvim-based configuration with custom plugins separated from the preset plugins.

## Directory Structure
- **Kickstart plugins**: `lua/kickstart/plugins/` - Default Kickstart.nvim plugins
- **Custom plugins**: `lua/custom/plugins/` - User's custom plugins (separated from kickstart)
- **Core modules**: `lua/` - Contains options.lua, keymaps.lua, lazy-plugins.lua, lazy-bootstrap.lua

## Plugin Management
- **Manager**: Lazy.nvim
- **Plugin storage**: `~/.local/share/nvim/lazy/`
- **Lock file**: `lazy-lock.json` (tracks plugin versions)

## Custom Plugins
- **Gruvbox colorscheme**: `lua/custom/plugins/gruvbox.lua` - Main colorscheme in use
- **EasyMotion**: `lua/custom/plugins/easymotion.lua` - Enhanced cursor movement and jumping
- **vim-slime**: `lua/custom/plugins/slime.lua` - Send code to TMUX panes for REPL workflows

## Key Mappings
- **Leader key**: Space
- **Local Leader key**: Comma (`,`) - Used for plugin-specific mappings
- **Buffer switching**: `<space><space>` - Telescope buffer picker
- **Window navigation**: `Ctrl+h/j/k/l` - Move between splits
- **Git operations**: `<leader>h` prefix (when in git-tracked files)

### EasyMotion Navigation
- `s` - Jump to any 2 characters (most commonly used)
- `f/F/t/T` - Enhanced character motions
- `<leader>j/k/w/b/e` - Line and word motions
- `<leader>.` - Repeat last motion

### TMUX Integration (vim-slime)
- **Primary operator**: `,m` + motion (e.g., `,m5j`, `,m}`, `,map`)
- **Quick actions**: `,ml` (line), `,mp` (paragraph), `,mm` (double-tap line)
- **File operations**: `,mf` (entire file), `,me` (to end), `,mb` (from beginning)
- **Configuration**: `,mc` - Set target TMUX pane

## Important Commands
- **Update plugins**: `:Lazy sync`
- **View plugin status**: `:Lazy`
- **List buffers**: `:ls` or `<space><space>`
- **Switch colorscheme**: `:Telescope colorscheme`

## Configuration Style
- Uses modular approach with `require` for individual plugin configs
- Custom plugins use `import` to auto-load all files from `custom/plugins/`
- Maintains 2-space indentation (ts=2 sts=2 sw=2 et)
- Avoids italic comments (configured in themes)
- Uses operator-pending mode for flexible vim-slime mappings

## Documentation
- **README.md**: Complete usage guide with all keybindings (user-focused, not installation)
- **This file**: Technical notes for development and configuration understanding

## Usage Notes
- EasyMotion `s` is the most efficient for quick jumps
- vim-slime supports unlimited counts: `,m20j` sends 20 lines
- First-time vim-slime usage requires `,mc` to configure target TMUX pane
- Target pane format: `:0.1` (session:window.pane) or `{last}` for last active

## Testing/Linting Commands
<!-- Add project-specific commands when discovered -->
<!-- Example: npm run lint, npm run typecheck, etc. -->