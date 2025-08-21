return {
  'easymotion/vim-easymotion',
  config = function()
    -- Disable default mappings
    vim.g.EasyMotion_do_mapping = 0

    -- Use smartcase (type `l` and match `l`&`L`)
    vim.g.EasyMotion_smartcase = 1

    -- Keep cursor column when using JK motions
    vim.g.EasyMotion_startofline = 0

    -- Common easymotion mappings
    -- Two-character search motion
    vim.keymap.set('n', 's', '<Plug>(easymotion-s2)', { desc = 'EasyMotion 2-char search' })
    vim.keymap.set('n', '<leader>s', '<Plug>(easymotion-s)', { desc = 'EasyMotion 1-char search' })

    -- Line motions
    vim.keymap.set('n', '<leader>j', '<Plug>(easymotion-j)', { desc = 'EasyMotion line down' })
    vim.keymap.set('n', '<leader>k', '<Plug>(easymotion-k)', { desc = 'EasyMotion line up' })

    -- Word motions
    vim.keymap.set('n', '<leader>w', '<Plug>(easymotion-w)', { desc = 'EasyMotion word forward' })
    vim.keymap.set('n', '<leader>b', '<Plug>(easymotion-b)', { desc = 'EasyMotion word backward' })
    vim.keymap.set('n', '<leader>e', '<Plug>(easymotion-e)', { desc = 'EasyMotion word end forward' })

    -- Enhanced f/F/t/T motions
    vim.keymap.set('n', 'f', '<Plug>(easymotion-fl)', { desc = 'EasyMotion find char forward' })
    vim.keymap.set('n', 'F', '<Plug>(easymotion-Fl)', { desc = 'EasyMotion find char backward' })
    vim.keymap.set('n', 't', '<Plug>(easymotion-tl)', { desc = 'EasyMotion till char forward' })
    vim.keymap.set('n', 'T', '<Plug>(easymotion-Tl)', { desc = 'EasyMotion till char backward' })

    -- Search motion
    vim.keymap.set('n', '<leader>/', '<Plug>(easymotion-sn)', { desc = 'EasyMotion search n-chars' })

    -- Repeat last motion
    vim.keymap.set('n', '<leader>.', '<Plug>(easymotion-repeat)', { desc = 'EasyMotion repeat' })
  end,
}

-- vim: ts=2 sts=2 sw=2 et