return {
  'jpalardy/vim-slime',
  config = function()
    -- Configure vim-slime for tmux
    -- Note: All mappings use <localleader> (comma by default) instead of <leader>
    vim.g.slime_target = 'tmux'
    vim.g.slime_default_config = {
      socket_name = 'default',
      target_pane = '{last}', -- Use {last} for last active pane, or specify like :0.1
    }
    vim.g.slime_dont_ask_default = 1
    vim.g.slime_no_mappings = 1 -- Disable default mappings, we'll create our own

    -- Basic keymaps
    vim.keymap.set('x', '<localleader>ms', '<Plug>SlimeRegionSend', { desc = 'Send selected region to tmux' })
    vim.keymap.set('n', '<localleader>mp', '<Plug>SlimeParagraphSend', { desc = 'Send paragraph to tmux' })
    vim.keymap.set('n', '<localleader>mc', '<Plug>SlimeConfig', { desc = 'Configure tmux target pane' })

    -- Send current line
    vim.keymap.set('n', '<localleader>ml', function()
      local cur_line = vim.fn.line '.'
      vim.cmd(cur_line .. ',' .. cur_line .. 'SlimeSend')
      vim.cmd 'normal! j' -- Move to next line after sending
    end, { desc = 'Send current line to tmux' })

    -- Send current line and stay on same line
    vim.keymap.set('n', '<localleader>mL', function()
      local cur_line = vim.fn.line '.'
      vim.cmd(cur_line .. ',' .. cur_line .. 'SlimeSend')
    end, { desc = 'Send current line (stay in place)' })

    -- Operator-pending mappings for flexible motion-based sending
    -- This allows <localleader>m{motion} where motion can be any vim motion
    -- Examples: <localleader>m5j, <localleader>m10k, <localleader>m}, <localleader>map, <localleader>mG

    -- Function to handle the operator
    local function slime_operator(type)
      local start_line, end_line

      if type == 'line' then
        start_line = vim.fn.line "'["
        end_line = vim.fn.line "']"
      elseif type == 'char' then
        start_line = vim.fn.line "'["
        end_line = vim.fn.line "']"
      elseif type == 'block' then
        start_line = vim.fn.line "'["
        end_line = vim.fn.line "']"
      else
        -- Visual mode
        start_line = vim.fn.line "'<"
        end_line = vim.fn.line "'>"
      end

      vim.cmd(start_line .. ',' .. end_line .. 'SlimeSend')
    end

    -- Store the operator function globally so it persists
    _G.slime_operator = slime_operator

    -- Set up the operator mapping
    vim.keymap.set('n', '<localleader>m', function()
      vim.o.operatorfunc = 'v:lua.slime_operator'
      return 'g@'
    end, { expr = true, desc = 'Send motion to tmux' })

    -- Visual mode mapping
    vim.keymap.set('x', '<localleader>m', function()
      local start_line = vim.fn.line "'<"
      local end_line = vim.fn.line "'>"
      vim.cmd(start_line .. ',' .. end_line .. 'SlimeSend')
    end, { desc = 'Send visual selection to tmux' })

    -- Convenience double-tap to send current line
    vim.keymap.set('n', '<localleader>mm', function()
      local cur_line = vim.fn.line '.'
      vim.cmd(cur_line .. ',' .. cur_line .. 'SlimeSend')
      vim.cmd 'normal! j'
    end, { desc = 'Send current line to tmux' })

    -- Send from current line to end of file
    vim.keymap.set('n', '<localleader>me', function()
      local cur_line = vim.fn.line '.'
      vim.cmd(cur_line .. ',$SlimeSend')
    end, { desc = 'Send from current line to EOF to tmux' })

    -- Send from beginning of file to current line
    vim.keymap.set('n', '<localleader>mb', function()
      local cur_line = vim.fn.line '.'
      vim.cmd('1,' .. cur_line .. 'SlimeSend')
    end, { desc = 'Send from BOF to current line to tmux' })

    -- Send entire file
    vim.keymap.set('n', '<localleader>mf', function()
      vim.cmd '%SlimeSend'
    end, { desc = 'Send entire file to tmux' })

    -- Send visual selection and re-select
    vim.keymap.set('x', '<localleader>mr', function()
      vim.cmd 'normal! <Plug>SlimeRegionSend'
      vim.cmd 'normal! gv' -- Re-select the visual selection
    end, { desc = 'Send selection and re-select' })

    -- Alternative operator using vim-slime's built-in motion send
    -- Usage: <localleader>mo followed by any motion (e.g., <localleader>moiw sends inner word)
    vim.keymap.set('n', '<localleader>mo', '<Plug>SlimeMotionSend', { desc = 'Send motion to tmux (vim-slime builtin)' })
  end,
}

-- vim: ts=2 sts=2 sw=2 et

