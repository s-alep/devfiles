-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'mfussenegger/nvim-dap-python',
  },

  cond = not vim.g.vscode,
  keys = {
    {
      '<leader>dd',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<leader>dt',
      function()
        require('dap').terminate()
      end,
      desc = 'Debug: Terminate',
    },
    {
      '<leader>dj',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<leader>dl',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<leader>dk',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>dh',
      function()
        require('dapui').eval(nil, { enter = true })
      end,
      desc = 'Debug: View Hover',
    },
    {
      '<leader>b',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>B',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',
    },
    {
      '<leader>db',
      ':DapClearBreakpoints<cr>',
      desc = 'Debug: Clear Breakpoints',
    },

    {
      '<leader>du',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: Toggle dapui',
    },
    {
      '<leader>dw',
      function()
        require('dapui').float_element('watches', { width = 100, height = 35, enter = true, position = 'center' })
      end,
      desc = 'Debug: View Watches',
    },
    {
      '<leader>dv',
      function()
        require('dapui').float_element('scopes', { width = 100, height = 35, enter = true, position = 'center' })
      end,
      desc = 'Debug: View Scope',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        'debugpy',
        'php-debug-adapter',
      },
    }

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
      layouts = {
        {
          elements = {
            {
              id = 'repl',
              size = 0.25,
            },
            {
              id = 'console',
              size = 0.25,
            },
            {
              id = 'breakpoints',
              size = 0.25,
            },
            {
              id = 'stack',
              size = 0.25,
            },
          },
          position = 'bottom',
          size = 10,
        },
        {
          elements = {
            {
              id = 'scopes',
              size = 0.5,
            },
            {
              id = 'watches',
              size = 0.5,
            },
          },
          position = 'right',
          size = 40,
        },
      },
    }

    -- Change breakpoint icons
    vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
    local breakpoint_icons = vim.g.have_nerd_font
        and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
      or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
    for type, icon in pairs(breakpoint_icons) do
      local tp = 'Dap' .. type
      local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
      vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    end

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
    require('dap-python').setup 'python3'
    dap.adapters.php = {
      type = 'executable',
      command = 'php-debug-adapter', -- or full path to it
      args = {},
    }

    dap.adapters.lldb = {
      type = 'executable',
      command = 'codelldb', -- adjust as needed
      name = 'lldb',
    }
    local path = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    dap.configurations.rust = {
      {
        name = 'rust',
        type = 'lldb',
        request = 'launch',
        program = function()
          return vim.fn.getcwd() .. '/target/debug/' .. path
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }
    dap.configurations.php = {
      {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9003,
        pathMappings = {
          ['/var/www/html'] = '${workspaceFolder}', -- DDEV web root
          ['/var/www/html/web'] = '${workspaceFolder}/web', -- DDEV web root
        },
      },
    }
    dap.configurations.python = {
      {
        name = 'Python Flask',
        type = 'python',
        request = 'launch',
        module = 'flask',
        args = {
          'run',
        },
        jinja = 'true',
      },
      {
        name = 'Uvicorn setup',
        type = 'python',
        request = 'launch',
        module = 'uvicorn',
        args = {
          'app.main:app', -- Adjust if needed
          '--host',
          '0.0.0.0',
          '--port',
          '8000',
          '--reload',
        },
      },
    }
  end,
}
