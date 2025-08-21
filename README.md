# scnvim - Simple Configuration for Neovim

**scnvim** is a simple, practical Neovim configuration based on [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim). It includes tweaks and customizations specifically tailored for data science and system administration workflows.

## About

This configuration builds upon the excellent foundation provided by kickstart-modular.nvim, adding enhanced features for:
- **Data Science**: TMUX integration for REPL workflows, efficient code execution
- **System Administration**: Enhanced navigation, file management, and terminal integration
- **General Development**: Streamlined keybindings and modern plugin ecosystem

## Quick Start

### Installation
```bash
# Clone to ~/.config/nvim
git clone <your-repo> ~/.config/nvim

# Open Neovim and let Lazy install plugins
nvim
```

### Plugin Management
- `:Lazy` - Open plugin manager
- `:Lazy sync` - Update all plugins
- `:Lazy log` - View plugin update log

## Key Mappings

**Leader key:** `Space`  
**Local Leader key:** `,` (comma)

### Navigation

#### EasyMotion (Quick Jump)
- `s` - Jump to any 2 characters
- `<leader>s` - Jump to any 1 character
- `f` - Enhanced find character forward
- `F` - Enhanced find character backward
- `t` - Enhanced till character forward
- `T` - Enhanced till character backward
- `<leader>j` - Jump to lines below
- `<leader>k` - Jump to lines above
- `<leader>w` - Jump to word beginnings forward
- `<leader>b` - Jump to word beginnings backward
- `<leader>e` - Jump to word ends forward
- `<leader>/` - Jump with multi-character search
- `<leader>.` - Repeat last motion

#### Window Management
- `Ctrl+h` - Move to left window
- `Ctrl+l` - Move to right window
- `Ctrl+j` - Move to lower window
- `Ctrl+k` - Move to upper window

### File & Buffer Operations

#### Telescope (Fuzzy Finder)
- `<leader>sf` - Search files
- `<leader>sg` - Search by grep (live grep)
- `<leader>sw` - Search current word
- `<leader>sd` - Search diagnostics
- `<leader>sr` - Resume last search
- `<leader>s.` - Search recent files
- `<leader>sh` - Search help
- `<leader>sk` - Search keymaps
- `<leader>ss` - Search select (Telescope builtin)
- `<leader>sn` - Search Neovim config files
- `<leader><leader>` - Search open buffers
- `<leader>/` - Fuzzy search in current buffer

#### File Explorer
- `\` - Open/reveal NeoTree file explorer

### Code Editing

#### LSP (Language Server)
When LSP is attached:
- `gd` - Go to definition
- `gD` - Go to declaration
- `gr` - Go to references
- `gI` - Go to implementation
- `gy` - Go to type definition
- `<leader>D` - Go to type definition
- `<leader>ds` - Document symbols
- `<leader>ws` - Workspace symbols
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code action
- `K` - Hover documentation
- `Ctrl+k` - Signature help (insert mode)

#### Diagnostics
- `<leader>q` - Open diagnostic quickfix list
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>e` - Show diagnostic error messages
- `<leader>E` - Open diagnostic quickfix list

#### Git (Gitsigns)
When in a git-tracked file:
- `]c` - Next git change/hunk
- `[c` - Previous git change/hunk
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hS` - Stage buffer
- `<leader>hR` - Reset buffer
- `<leader>hu` - Undo stage hunk
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line
- `<leader>hB` - Toggle line blame
- `<leader>hd` - Diff this
- `<leader>hD` - Diff this ~
- `<leader>tb` - Toggle git blame (virtual text)
- `<leader>td` - Toggle deleted lines

#### Formatting & Comments
- `<leader>f` - Format buffer/selection
- `gcc` - Toggle line comment
- `gc` - Toggle comment (visual mode)
- `gbc` - Toggle block comment

#### Text Objects & Surround
Mini.nvim provides:
- `saiw)` - Surround add inner word with parentheses
- `sd'` - Surround delete quotes
- `sr)'` - Surround replace parentheses with quotes
- `va)` - Visually select around parentheses
- `yinq` - Yank inside next quote
- `ci'` - Change inside quotes

### Completion (Blink.cmp)
In insert mode:
- `Ctrl+n` - Next completion item
- `Ctrl+p` - Previous completion item
- `Enter` - Accept completion
- `Ctrl+b` - Scroll docs backward
- `Ctrl+f` - Scroll docs forward
- `Ctrl+Space` - Trigger completion
- `Ctrl+c` - Close completion
- `Ctrl+e` - Abort completion

### TMUX Integration (vim-slime)

Send code from Neovim to TMUX panes. All mappings use **localleader** (`,`):

#### Basic Operations
- `,ml` - Send current line (move to next)
- `,mL` - Send current line (stay in place)
- `,mp` - Send paragraph
- `,ms` - Send selection (visual mode)
- `,mc` - Configure target pane

#### Operator-pending Mode
Use `,m` followed by any vim motion for unlimited flexibility:
- `,m5j` - Send current + 5 lines below
- `,m10k` - Send 10 lines up through current
- `,m}` - Send to next paragraph
- `,map` - Send around paragraph
- `,mG` - Send from current to end of file
- `,mgg` - Send from current to beginning

#### Quick Actions
- `,mm` - Double-tap to send current line
- `,me` - Send from current line to end of file
- `,mb` - Send from beginning to current line
- `,mf` - Send entire file

#### Alternative
- `,mo` + motion - Use vim-slime's builtin motion operator

### Other Features

#### Colorscheme
- `:Telescope colorscheme` - Browse and switch colorschemes
- Current theme: Gruvbox (dark)

#### Terminal
- `:terminal` - Open terminal in Neovim
- `<Esc><Esc>` - Exit terminal mode

#### Session & UI
- `<Esc>` - Clear search highlights
- Automatic indent detection (guess-indent)
- Indent guides visible
- Git signs in gutter
- Statusline with file info
- Which-key popup for keybinding hints

## Custom Plugins Location
- Kickstart plugins: `lua/kickstart/plugins/`
- Custom plugins: `lua/custom/plugins/`

## Tips & Tricks

### Quick Navigation Examples
1. Jump to a function: Type `s` + first 2 chars of function name
2. Jump to next occurrence of 'error': `<leader>/` then type 'error'
3. Delete until next parenthesis: `dt(`
4. Change word and jump: `scw` + 2 chars to jump to word, then change

### Efficient Editing
- Use `s` (EasyMotion) instead of repeated `hjkl` movements
- Combine operators with EasyMotion: `ds` + target to delete to a location
- Use `<leader><leader>` to quickly switch between recent buffers

### Workspace Search
- `<leader>sg` to search across all files (ripgrep)
- `<leader>sw` to search for word under cursor globally
- `<leader>/` for fuzzy search in current file

### TMUX Integration
- Use `,m` + motion for flexible code sending to TMUX
- `,m20j` to send large code blocks efficiently
- `,mc` first time to configure target pane
- `,mm` for quick line-by-line code execution

## Troubleshooting
- Run `:checkhealth` to diagnose issues
- Run `:Lazy` to check plugin status
- Check `:LspInfo` for language server status
- Use `:messages` to see recent messages/errors