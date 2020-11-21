local M={}
local nvim_lsp = require'lspconfig'

local function on_attach(client)
  require'completion'.on_attach(client)

  local map = require('_utils').map
  map('i', '<c-space>',  'completion#trigger_completion()')
  -- map('n', 'K',          '<cmd>lua .show_doc()<CR>')
  map('n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>')
  map('n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n', 'gy',         '<cmd>lua vim.lsp.buf.type_definition()<CR>')

  if client.resolved_capabilities['document_highlight'] then
    vim.api.nvim_exec([[
    autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()
    autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()
      ]],{})
    map('n',']d','<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
    map('n','[d','<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    map('n','<leader>do','<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
  end

end

local lang_servers = {
  {lsp_name = "clangd"},
  {lsp_name = "texlab"},
  {lsp_name = "jedi_language_server"},
  {lsp_name = "sumneko_lua"},
  {lsp_name = "tsserver"},
  {lsp_name = "cmake"},
}

local function variableSet()
  vim.g.diagnostic_trimmed_virtual_text = "60"
  local sign_define = vim.fn.sign_define

  sign_define(
    "LspDiagnosticsErrorSign",
    {text = "❌", texthl = "LspDiagnosticsError"}
  )
  sign_define(
    "LspDiagnosticsWarningSign",
    {text = "", texthl = "LspDiagnosticsWarning"}
  )
  sign_define(
    "LspDiagnosticsInformationSign",
    {text = "", texthl = "LspDiagnosticsInformation"}
  )
  sign_define(
    "LspDiagnosticsHintSign",
    {text = "➤", texthl = "LspDiagnosticsHint"}
  )
end

local function diagnostic()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true;
      virtual_text = {
        spacing = 10;
        prefix = "";
      };
      signs = true;
      update_in_insert = false;
    }
  )
end

local function treeSitter()
  require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,              -- false will disable the whole extension
        use_languagetree = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = { -- mappings for incremental selection (visual mappings)
          init_selection = '<M-w>',    -- maps in normal mode to init the node/scope selection
          node_incremental = '<M-w>',  -- increment to the upper named parent
          scope_incremental = '<M-e>', -- increment to the upper scope (as defined in locals.scm)
          node_decremental = '<M-C-w>',  -- decrement to the previous node
        }
      },
      indent = { enable = true },
      refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = true },
      }
    }
end

function M.setup()
  for _,lsp_config in pairs(lang_servers)
    do
    nvim_lsp[lsp_config.lsp_name].setup({
      on_attach=on_attach,
    })
  end

  diagnostic()

  treeSitter()

  variableSet()
end

return M
