vim.cmd.source(vim.fn.stdpath("config") .. "/plugins.vim")

-- 
-- -- Global mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>q', vim.diagnostic.setqflist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>qf', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config('eslint', {
  on_attach = function(client, bufnr)
    base_on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "LspEslintFixAll",
    })
  end,
})
-- vim.lsp.enable('eslint')
vim.lsp.config('oxlint', {
  settings = {
    ["oxlint"] = {
      typeCheck = false
    }
  },
})
vim.lsp.enable('oxlint')

vim.lsp.config('rust_analyzer', {
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy"
      },
      cargo = {
        features = "all",
        buildScripts = {
          enable = true
        }
      }
    }
  },
})
vim.lsp.enable('rust_analyzer')
vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = buffer,
    callback = function()
        vim.lsp.buf.format {
	  async = false,
	  filter = function(client) return client.name ~= "tsgo" end
	}
    end
})

-- vim.lsp.config('tsgo', {
--   settings = {
--     typescript = {
--       tsserver = { maxTsServerMemory = 16184 }
--     },
--     javascript = {
--       tsserver = { maxTsServerMemory = 16184 }
--     }
--   }
-- })
vim.lsp.enable('tsgo')

local servers = { 'clangd', 'pyright', 'tailwindcss'}
for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end

require('nvim-treesitter').install({
  "c", "lua", "vim", "vimdoc", "query", "typescript", "tsx", "javascript", "rust"
})

require('nvim-highlight-colors').setup({

    	---Highlight short hex colors e.g. '#fff'
	enable_short_hex = true,

	---Highlight rgb colors, e.g. 'rgb(0 0 0)'
	enable_rgb = true,

	---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
	enable_hsl = true,
	
	---Highlight ansi colors, e.g '\033[0;34m'
	enable_ansi = true,

	---Highlight xterm 256 (8bit) colors, e.g '\033[38;5;118m'
	enable_xterm256 = true,

	---Highlight xterm True Color (24bit) colors, e.g '\033[38;2;118;64;90m'
	enable_xtermTrueColor = true,

  -- Highlight hsl colors without function, e.g. '--foreground: 0 69% 69%;'
  enable_hsl_without_function = true,

	---Highlight CSS variables, e.g. 'var(--testing-color)'
	enable_var_usage = true,

	---Highlight named colors, e.g. 'green'
	enable_named_colors = true,

	---Highlight tailwind colors, e.g. 'bg-blue-500'
	enable_tailwind = false,
})
