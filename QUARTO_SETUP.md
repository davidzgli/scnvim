# Quarto-nvim Setup Guide

## Installation Complete

The quarto-nvim plugin has been successfully installed and configured for R data analysis workflows.

## Initial Setup Steps

After opening Neovim, you need to:

1. **Install the plugins** (if not already done):
   ```
   :Lazy sync
   ```

2. **Install Language Servers via Mason**:
   ```
   :Mason
   ```
   Then install:
   - `r-languageserver` (press `i` when cursor is on it)
   - `pyright` (for Python support in Quarto docs)

3. **Install R packages** (in R console):
   ```r
   install.packages("languageserver")
   install.packages("lintr")
   ```

## Key Bindings

### Code Execution (localleader = `,`)
- `,rc` - Run current code cell
- `,ra` - Run cell and all above  
- `,rA` - Run all cells
- `,rl` - Run current line
- `,r` (visual mode) - Run selected lines

### Quarto Commands (leader = `space`)
- `<space>qp` - Preview document
- `<space>qr` - Render document
- `<space>qq` - Close preview
- `<space>qe` - Activate Quarto for current file

### Navigation
- `,]` - Jump to next code chunk
- `,[` - Jump to previous code chunk  
- `gn` - Go to next code chunk (alternative)
- `gp` - Go to previous code chunk (alternative)

### Insert Code Chunks
- `,ci` - Insert R code chunk
- `,cp` - Insert Python code chunk

## Using with vim-slime

Your existing vim-slime keybindings still work:
- `,mc` - Configure TMUX target pane
- `,m{motion}` - Send motion to TMUX (e.g., `,m5j`)
- `,mp` - Send paragraph
- `,ml` - Send line

## Working with .qmd Files

1. Open a `.qmd` file
2. Start an R console in a TMUX pane
3. Configure vim-slime target with `,mc` (first time only)
4. Use the keybindings above to execute code

## Troubleshooting

### If LSP features aren't working:
1. Check that R language server is installed: `:LspInfo`
2. Ensure R packages are installed: `languageserver` and `lintr`
3. Check Mason status: `:Mason`

### If code execution isn't working:
1. Ensure TMUX is running
2. Configure target pane with `,mc`
3. Make sure R console is running in target pane

### To verify installation:
```vim
:checkhealth quarto
```

## Example Workflow

1. Open `example_analysis.qmd`
2. Split TMUX and start R in new pane
3. In Neovim, press `,mc` to set target pane
4. Navigate to a code chunk
5. Press `,rc` to run the current chunk
6. Press `<space>qp` to preview the rendered document

## File Types

The following file extensions are recognized:
- `.qmd` - Quarto markdown documents
- `.Rmd` - R Markdown documents (also supported)

## Additional Resources

- [Quarto Documentation](https://quarto.org/docs/get-started/)
- [Quarto Neovim Guide](https://quarto.org/docs/tools/neovim.html)
- [R Language Server](https://github.com/REditorSupport/languageserver)