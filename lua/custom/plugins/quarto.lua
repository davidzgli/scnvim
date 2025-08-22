return {
  {
    'quarto-dev/quarto-nvim',
    dependencies = {
      'jmbuhr/otter.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    ft = { 'quarto', 'markdown' },
    config = function()
      local quarto = require 'quarto'
      quarto.setup {
        lspFeatures = {
          enabled = true,
          languages = { 'r', 'python', 'julia', 'bash', 'lua', 'html', 'javascript' },
          diagnostics = {
            enabled = true,
            triggers = { 'BufWritePost' },
          },
          completion = {
            enabled = true,
          },
        },
        codeRunner = {
          enabled = true,
          default_method = 'slime', -- Use existing vim-slime setup
          never_run = { 'yaml' }, -- Don't run yaml code blocks
        },
        keymap = {
          -- Set to false to disable default keymaps
          hover = 'K',
          definition = 'gd',
          type_definition = 'gD',
          rename = '<leader>rn',
          format = '<leader>f',
          references = 'gr',
          document_symbols = 'gS',
        },
      }

      -- Quarto-specific keymaps
      -- Use pcall to safely load runner functions
      local ok, runner = pcall(require, 'quarto.runner')
      if ok then
        if runner.run_cell then
          vim.keymap.set('n', '<localleader>rc', runner.run_cell, { desc = 'Run current code cell' })
        end
        if runner.run_above then
          vim.keymap.set('n', '<localleader>ra', runner.run_above, { desc = 'Run cell and all above' })
        end
        if runner.run_all then
          vim.keymap.set('n', '<localleader>rA', runner.run_all, { desc = 'Run all cells' })
        end
        if runner.run_line then
          vim.keymap.set('n', '<localleader>rl', runner.run_line, { desc = 'Run current line' })
        end
        if runner.run_range then
          vim.keymap.set('v', '<localleader>r', runner.run_range, { desc = 'Run selected lines' })
        end
      end

      -- Alternative code execution using QuartoSend commands
      -- vim.keymap.set('n', '<localleader>rc', ':QuartoSendBelow<cr>', { desc = 'Run current code cell', silent = true })
      -- vim.keymap.set('n', '<localleader>ra', ':QuartoSendAbove<cr>', { desc = 'Run cell and all above', silent = true })
      -- vim.keymap.set('n', '<localleader>rA', ':QuartoSendAll<cr>', { desc = 'Run all cells', silent = true })

      -- Quarto preview and render
      vim.keymap.set('n', '<leader>qp', ':QuartoPreview<cr>', { desc = 'Quarto preview' })
      vim.keymap.set('n', '<leader>qr', ':QuartoRender<cr>', { desc = 'Quarto render' })
      vim.keymap.set('n', '<leader>qq', ':QuartoClosePreview<cr>', { desc = 'Close Quarto preview' })
      vim.keymap.set('n', '<leader>qh', ':QuartoHelp ', { desc = 'Quarto help' })
      vim.keymap.set('n', '<leader>qe', ':QuartoActivate<cr>', { desc = 'Activate Quarto for current file' })

      -- Navigate between code chunks using pattern search
      -- Use localleader for code chunk navigation to avoid conflicts with default Vim motions
      vim.keymap.set('n', '<localleader>]', function()
        -- Search for next code chunk (R, Python, or any language)
        vim.fn.search('^```{', 'W')
      end, { desc = 'Jump to next code chunk' })
      
      vim.keymap.set('n', '<localleader>[', function()
        -- Search for previous code chunk
        vim.fn.search('^```{', 'bW')
      end, { desc = 'Jump to previous code chunk' })

      -- Alternative mappings using gn and gp (go next/previous)
      vim.keymap.set('n', 'gn', function()
        vim.fn.search('^```{', 'W')
      end, { desc = 'Go to next code chunk' })
      
      vim.keymap.set('n', 'gp', function()
        vim.fn.search('^```{', 'bW')
      end, { desc = 'Go to previous code chunk' })
      
      -- Jump to next/previous code chunk and enter insert mode at the end of first line
      vim.keymap.set('n', '<localleader>}', function()
        vim.fn.search('^```{', 'W')
        vim.cmd('normal! $')
      end, { desc = 'Jump to next code chunk and position cursor' })
      
      vim.keymap.set('n', '<localleader>{', function()
        vim.fn.search('^```{', 'bW')
        vim.cmd('normal! $')
      end, { desc = 'Jump to previous code chunk and position cursor' })

      -- Insert code chunks
      local function insert_r_chunk()
        vim.api.nvim_put({ '```{r}', '', '```' }, 'l', true, false)
        vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1] - 1, 0 })
      end

      local function insert_python_chunk()
        vim.api.nvim_put({ '```{python}', '', '```' }, 'l', true, false)
        vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1] - 1, 0 })
      end

      vim.keymap.set('n', '<localleader>ci', insert_r_chunk, { desc = 'Insert R code chunk' })
      vim.keymap.set('n', '<localleader>cp', insert_python_chunk, { desc = 'Insert Python code chunk' })

      -- Set up file type detection for .qmd files
      vim.filetype.add {
        extension = {
          qmd = 'quarto',
        },
      }

      -- Auto commands for Quarto files
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'quarto', 'markdown' },
        callback = function()
          -- Enable word wrap for better document editing
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true
          -- Set conceallevel to 0 to always show code fence markers
          -- (0 = show all, 1 = hide some, 2 = hide more, 3 = hide most)
          vim.opt_local.conceallevel = 0
          -- Alternative: use conceallevel = 1 for partial concealing
          -- vim.opt_local.conceallevel = 1
        end,
      })
    end,
  },
  {
    -- Otter provides LSP features and code completion in code chunks
    'jmbuhr/otter.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      buffers = {
        -- set_filetype is deprecated and removed
        write_to_disk = false,
      },
      handle_leading_whitespace = true,
      strip_wrapping_quote_characters = { "'", '"', '`' },
      completion = {
        enabled = true,
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
