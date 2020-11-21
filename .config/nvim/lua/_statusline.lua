local M = {}
local g = vim.g

function M.setup()
  vim.api.nvim_exec([[
    function! Devicons_Filetype()"{{{
    " return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
    endfunction"}}}
    function! Devicons_Fileformat()"{{{
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
    endfunction"}}}
    ]],{})

  g.lightline = {
    separator = {
      left = " ",
      right = " "
    },
    subseparator = {
      left = " ",
      right = " "
    },
    tabline_separator = {
      left = " ",
      right = ""
    },
    tabline_subseparator = {
      left = " ",
      right = ""
    },
    colorscheme= require'_utils'.Lcolorscheme,
    active= {
      left= { { 'mode', 'paste' },
        { 'gitbranch' },{ 'readonly', 'absolutepath', 'modified' } },
      right= { {'lineinfo'},
        { 'percent' },
        { 'filetype', 'fileencoding'} } },
    inactive = {
      left= { { 'filename' , 'modified', 'fileformat' }},
      right= { { 'lineinfo' } }
    },
    tab = {
      active= { 'tabnum','separa', 'filename', 'modified' },
      inactive= { 'tabnum','filename', 'modified' }
    },
    tabline = {
      left= { { 'vim_logo', 'tabs' } },
    },
    component_function= {
      gitbranch= 'FugitiveHead',
      -- devicons_filetype= 'Devicons_Filetype',
    },
    component = {
      vim_logo= " ",
    },
    tab_component = {
      vim_logo= "",
      separa = " "
    },
    component_type= {
      tabs= 'tabsel',
      readonly= 'error',
      close= ''
    },
    enable = {
      statusline= 1,
      tabline= 1
    }
  }
end

return M
